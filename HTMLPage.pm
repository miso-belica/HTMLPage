#!/usr/bin/perl -w

use encoding 'utf8';

use strict;

package HTMLPage;
use base 'HTML::Parser';

use constant MAX_REPLACEMENTS => 3;



sub from_string {
  my ($class, $html) = @_;

  my $self = $class->SUPER::new();

  $self->{'html'} = $html;
  $self->{'parsed_html'} = '';
  $self->{'tags_stack'} = [];

  $self->{'word_replacements'} = [];
  $self->{'all_words'} = [];

  return $self;
}

sub replace {
  my ($self, $replacements, $scannes) = @_;

  $self->{'replacements'} = $replacements;
  $self->{'scanned_words_pattern'} = lc('(?:'.join(')|(?:', @{$scannes}).')');
  $self->{'keyword_pattern'} = lc('(?:'.join(')|(?:', keys(%{$replacements})).')');

  my $count = $self->get_replacements_count();

  $self->parse($self->{'html'});
  $self->eof();

  return $self->get_replacements_count() - $count;
}

sub get_replacement {
  my ($self, $text) = @_;

  # replace keywords
  if($text =~ /(?<!\.\s)\b(?:$self->{'keyword_pattern'})\b/i) {
    $text =~ s/(?<!\.\s)\b($self->{'keyword_pattern'})\b/$self->inject_word_into_replacement($1)/gie;
  }

  # search for potential words
  my @words = $text =~ /(?<!\.\s)\b($self->{'scanned_words_pattern'})\b/gi;
  foreach (@words) {
    my $word = lc($_);
    if($word ne '' && !grep(/^$word$/, @{$self->{'all_words'}})) {
      push(@{$self->{'all_words'}}, $word);
    }
  }

  return $text;
}

sub get_replacements_count {
  my ($self) = @_;

  return scalar @{$self->{'word_replacements'}}
}

sub inject_word_into_replacement {
  my ($self, $word) = @_;

  my $lower_cased_word = lc($word);

  # replace every word only one time
  if(grep(/^$lower_cased_word$/, @{$self->{'all_words'}})) {
    return $word;
  }
  push(@{$self->{'all_words'}}, $lower_cased_word);

  # replace max. "MAX_REPLACEMENTS" words
  if($self->get_replacements_count() >= MAX_REPLACEMENTS) {
    return $word;
  }

#   print STDERR "!!!$lower_cased_word!!!\n";
  my $replacement = $self->{'replacements'}{$lower_cased_word};
  if(!defined($replacement)) {
    return $word;
  }

  push(@{$self->{'word_replacements'}}, $lower_cased_word);
  $replacement =~ s/\{keyword\}/$word/;
  return $replacement;
}

sub get_html {
  my ($self) = @_;

  if($self->{'parsed_html'} ne '') {
    $self->{'html'} = $self->{'parsed_html'};
    $self->{'parsed_html'} = '';
  }

  return $self->{'html'};
}

sub push_tag {
  my ($self, $tag) = @_;

  push(@{$self->{'tags_stack'}}, $tag);
}

sub pop_tag {
  my ($self, $tag) = @_;

  # ignore end tags without start tag
  if(!grep(/^$tag$/i, @{$self->{'tags_stack'}})) {
    return;
  }

  my $removed_tag = pop(@{$self->{'tags_stack'}});
  while($removed_tag ne $tag) {
    $removed_tag = pop(@{$self->{'tags_stack'}});
  }
}

sub in_illegal_tag {
  my ($self) = @_;
  # print STDERR '--> ', join(' | ', @{$self->{'tags_stack'}}), "\n";

  # illegal tags: head, a, h#, script, option
  return grep(/^(?:head|a|h\d?|script|option)$/, @{$self->{'tags_stack'}});
}

sub process {
  my ($self, $processing_instruction) = @_;

  $self->{'parsed_html'} .= "<?$processing_instruction>";
}

sub declaration {
  my ($self, $declaration) = @_;

  $self->{'parsed_html'} .= "<!$declaration>";
}

sub comment {
  my ($self, $comment) = @_;

  $self->{'parsed_html'} .= "<!--$comment-->";
}

sub start {
  my ($self, $tag, $attr, $attrseq, $origtext) = @_;

  $self->push_tag($tag);
  $self->{'parsed_html'} .= $origtext;
}

sub text {
  my ($self, $text) = @_;

  if($self->in_illegal_tag()) {
    $self->{'parsed_html'} .= $text;
  }
  else {
    $self->{'parsed_html'} .= $self->get_replacement($text);
  }
}

sub end {
  my ($self, $tag, $origtext) = @_;

  $self->pop_tag($tag);
  $self->{'parsed_html'} .= $origtext;
}

1; # return true
