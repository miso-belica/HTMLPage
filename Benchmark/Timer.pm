# ========================================================================
# Benchmark::Timer - Perl code benchmarking tool
# Andrew Ho (andrew@zeuscat.com)
#
# This program contains embedded documentation in Perl POD (Plain Old
# Documentation) format. Search for the string "=head1" in this document
# to find documentation snippets, or use "perldoc" to read it; utilities
# like "pod2man" and "pod2html" can reformat as well.
#
# Copyright(c) 2000-2001 Andrew Ho.
#
# This library is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
# Last modified April 20, 2001
# ========================================================================

=head1 NAME

Benchmark::Timer - Perl code benchmarking tool

=head1 SYNOPSIS

    use Benchmark::Timer;
    $t = Benchmark::Timer->new(skip => 1);

    for(0 .. 1000) {
        $t->start('tag');
        &long_running_operation();
        $t->stop;
    }
    $t->report;

=head1 DESCRIPTION

The Benchmark::Timer class allows you to time portions of code
conveniently, as well as benchmark code by allowing timings of repeated
trials. It is perfect for when you need more precise information about the
running time of portions of your code than the Benchmark module will give
you, but don't want to go all out and profile your code.

The methodology is simple; create a Benchmark::Timer object, and wrap
portions of code that you want to benchmark with C<start()> and C<stop()>
method calls. You supply a unique tag, or event name, to those methods.
This allows one Benchmark::Timer object to benchmark many pieces of code.

When you have run your code (one time or over multiple trials), you can
obtain information about the running time by calling the C<results()>
method or print a descriptive benchmark report by calling C<report()>.

If you run your code over multiple trials, the average time is reported.
This is wonderful for benchmarking time-critical portions of code in a
rigorous way. You can also optionally choose to skip any number of initial
trials to cut down on initial case irregularities.

=head1 METHODS

=over 4

=cut


# ------------------------------------------------------------------------
# Package setup

package Benchmark::Timer;
require 5.005;
use strict;

use Carp;
use Time::HiRes qw( gettimeofday tv_interval );

use vars qw($VERSION);
$VERSION = 0.5;

use constant BEFORE    => 0;
use constant ELAPSED   => 1;
use constant LASTEVENT => 2;
use constant EVENTS    => 3;
use constant SKIP      => 4;
use constant SKIPCOUNT => 5;


# ------------------------------------------------------------------------
# Constructor

=item $t = Benchmark::Timer->new( [options] );

Constructor for the Benchmark::Timer object; returns a reference to a
timer object. Takes named arguments, of which right now there is only
one, skip, which is the number of trials (if any) to skip before
recording timing information.

=cut

sub new {
    my $class = shift;
    my $self = [];
    bless $self, $class;
    return $self->reset(@_);
}


# ------------------------------------------------------------------------
# Public methods

=item $t->reset;

Reset the timer object to the pristine state it started in.
Erase all memory of events and any previously accumulated timings.
Returns a reference to the timer object. It takes the same arguments
the constructor takes.

=cut

sub reset {
    my $self = shift;
    my %args = @_;

    $self->[BEFORE] = {};          # [ gettimeofday ] storage
    $self->[ELAPSED] = {};         # elapsed fractional seconds
    $self->[LASTEVENT] = undef;    # what the last event was
    $self->[EVENTS] = [];          # keep list of events in order seen
    $self->[SKIP] = 0;             # how many events to skip
    $self->[SKIPCOUNT] = {};       # trial skip storage

    if(exists $args{skip}) {
        croak 'argument skip must be a non-negative integer'
            unless defined $args{skip}
               and $args{skip} !~ /\D/
               and int $args{skip} == $args{skip};
        $self->[SKIP] = $args{skip};
        delete $args{skip};
    }
    if(%args) {
        carp 'skipping unknown arguments';
    }

    return $self;
}


=item $t->start($tag);

Record the current time so that when C<stop()> is called, we can calculate
an elapsed time. Supply a $tag which is simply a string that is the
descriptive name of the event you are timing. If you do not supply a
$tag, the last event tag is used; if there is none, a "_default" tag
is used instead.

=cut

# In this routine we try hard to make the [ gettimeofday ] take place
# as late as possible to minimize Heisenberg problems. :)

sub start {
    my $self = shift;
    my $event = shift || $self->[LASTEVENT] || '_default';
    $self->[LASTEVENT] = $event;
    if(exists $self->[SKIPCOUNT]->{$event}) {
        if($self->[SKIPCOUNT]->{$event} > 1) {
            $self->[SKIPCOUNT]->{$event}--;
        } else {
            $self->[SKIPCOUNT]->{$event} = 0;
            push @{$self->[BEFORE]->{$event}}, [ gettimeofday ];
        }
    } else {
        push @{$self->[EVENTS]}, $event;
        $self->[SKIPCOUNT]->{$event} = $self->[SKIP] + 1;
        if($self->[SKIPCOUNT]->{$event} > 1) {
            $self->[SKIPCOUNT]->{$event}--;
        } else {
            $self->[SKIPCOUNT]->{$event} = 0;
            $self->[BEFORE]->{$event} = [ [ gettimeofday ] ]
        }
    }
}


=item $t->stop($tag);

Record timing information. The optional $tag is the event for which you
are timing, and defaults to the $tag supplied to the last C<start()> call.
If a $tag is supplied, it must correspond to one given to a previously
called C<start()> call. It returns the elapsed time in milliseconds.
C<stop()> throws an exception if the timer gets out of sync (e.g. the
number of C<start()>s does not match the number of C<stop()>s.

=cut

sub stop {
    my $after = [ gettimeofday ];    # minimize overhead
    my $self = shift;
    my $event = shift || $self->[LASTEVENT] || '_default';

    croak 'must call $t->start($event) before $t->stop($event)'
        unless exists $self->[SKIPCOUNT]->{$event};

    return if $self->[SKIPCOUNT]->{$event} > 0;

    my $i = exists $self->[ELAPSED]->{$event} ?
        scalar @{$self->[ELAPSED]->{$event}} : 0;
    my $before = $self->[BEFORE]->{$event}->[$i];
    croak 'timer out of sync' unless defined $before;

    my $elapsed = tv_interval($before, $after);
    if($i > 0) {
        push @{$self->[ELAPSED]->{$event}}, $elapsed;
    } else {
        $self->[ELAPSED]->{$event} = [ $elapsed ];
    }
    return $elapsed;
}


=item $t->report;

Print a simple report on the collected timings to STDERR. This report
prints the number of trials run, the total time taken, and, if more than
one trial was run, the average time needed to run one trial. It prints
the events out in the order they were C<start()>ed.

=cut

sub report {
    my $self = shift;
    foreach my $event (@{$self->[EVENTS]}) {
        unless(exists $self->[ELAPSED]->{$event}) {
            carp join ' ', 'event', $event, 'still running, skipping';
            last;
        }
        my @times = @{$self->[ELAPSED]->{$event}};
        my $n = scalar @times;
        my $total = 0; $total += $_ foreach @times;

        printf STDERR '%d trial%s of %s (%s total)',
            $n, $n == 1 ? '' : 's', $event, timestr($total);
        printf STDERR ', %s/trial', timestr($total / $n) if $n > 1;
        print STDERR "\n";
    }
    return;
}


=item $t->result($event);

Return the time it took for $event to elapse, or the mean time it took for
$event to elapse once, if $event happened more than once. C<result()>
will complain (via a warning) if an event is still active.

=cut

sub result {
    my $self = shift;
    my $event = shift || $self->[LASTEVENT] || '_default';
    unless(exists $self->[ELAPSED]->{$event}) {
        carp join ' ', 'event', $event, 'still running';
        return;
    }
    my @times = @{$self->[ELAPSED]->{$event}};
    my $total = 0; $total += $_ foreach @times;
    return $total / @times;
}


=item $t->results;

Returns the timing data as a hash keyed on event tags where each value is
the time it took to run that event, or the are the average time it took,
if that event ran more than once. In scalar context it returns a reference
to that hash. The return value is actually an array, so that the original
event order is preserved.

=cut

sub results {
    my $self = shift;
    my @results;
    foreach my $event (@{$self->[EVENTS]}) {
        push @results, $event;
        push @results, $self->result($event);
    }
    return wantarray ? @results : \@results;
}


=item $t->data($event), $t->data;

These methods are useful if you want to recover the full internal timing
data to roll your own reports.

If called with an $event, returns the raw timing data for that $event as
an array (or a reference to an array if called in scalar context). This is
useful for feeding to something like the Statistics::Descriptive package.

If called with no arguments, returns the raw timing data as a hash keyed
on event tags, where the values of the hash are lists of timings for that
event. In scalar context, it returns a reference to that hash. As with
C<results()>, the data is internally represented as an array so you can
recover the original event order by assigning to an array instead of a hash.

=cut

sub data {
    my $self = shift;
    my $event = shift;
    my @results;
    if($event) {
        if(exists $self->[ELAPSED]->{$event}) {
            @results = @{$self->[ELAPSED]->{$event}};
        } else {
            @results = ();
        }
    } else {
        @results = map { ( $_ => $self->[ELAPSED]->{$_} || [] ) }
                          @{$self->[EVENTS]};
    }
    return wantarray ? @results : \@results;
}


# ------------------------------------------------------------------------
# Internal utility subroutines

# timestr($sec) takes a floating-point number of seconds and formats
# it in a sensible way, commifying large numbers of seconds, and
# converting to milliseconds if it makes sense. Since Time::HiRes has
# at most microsecond resolution, no attempt is made to convert into
# anything below that. A unit string is appended to the number.

sub timestr {
    my $sec = shift;
    my $retstr;
    if($sec >= 1_000) {
        $retstr = commify(int $sec) . 's';
    } elsif($sec >= 1) {
        $retstr = sprintf $sec == int $sec ? '%ds' : '%0.3fs', $sec;
    } elsif($sec >= 0.001) {
        my $ms = $sec * 1_000;
        $retstr = sprintf $ms == int $ms ? '%dms' : '%0.3fms', $ms;
    } elsif($sec >= 0.000001) {
        $retstr = sprintf '%dus', $sec * 1_000_000;
    } else {
        # I'll have whatever real-time OS she's having
        $retstr = $sec . 's';
    }
    $retstr;
}


# commify($num) inserts a grouping comma according to en-US standards
# for numbers larger than 1000. For example, the integer 123456 would
# be written 123,456. Any fractional part is left untouched.

sub commify {
    my $num = shift;
    return unless $num =~ /\d/;
    return $num if $num < 1_000;

    my $ip  = int $num;
    my($fp) = ($num =~ /\.(\d+)/);

    $ip =~ s/(\d\d\d)$/,$1/;
    1 while $ip =~ s/(\d)(\d\d\d),/$1,$2,/;

    return $fp ? join '.', $ip, $fp : $ip;
}


# ------------------------------------------------------------------------
# Finish up the POD.

=back

=head1 BUGS

Benchmarking is an inherently futile activity, fraught with uncertainty
not dissimilar to that experienced in quantum mechanics.

=head1 SEE ALSO

L<Benchmark>, L<Time::HiRes>, L<Time::Stopwatch>, L<Statistics::Descriptive>

=head1 AUTHOR

Andrew Ho E<lt>andrew@zeuscat.comE<gt>

=head1 COPYRIGHT

Copyright(c) 2000-2001 Andrew Ho.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut


# ------------------------------------------------------------------------
# Return true for a valid Perl include

1;


# ========================================================================
__END__
