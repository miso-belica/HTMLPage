#!/usr/bin/perl -w

use encoding 'utf8';

use strict;
use warnings;
use diagnostics;

package HTMLPage;
use base 'HTML::Parser';



sub from_string {
  my ($self, $html) = @_;

  my $instance = $self->SUPER::new();

  $instance->{'html'} = $html;
  $instance->{'tags_stack'} = [];
  $instance->{'parsed_html'} = '';
  $instance->{'replacements_count'} = 0;

  return $instance;
}

sub from_file {
  my ($self, $file_path) = @_;

  open(FILE, $file_path);
  my $instance = $self->from_string(join('', <FILE>));
  close(FILE);

  return $instance;
}

sub replace {
  my ($self, $keyword, $replacement) = @_;

  $self->{'replacement'} = $replacement;
  $self->{'keyword'} = $keyword;

  $self->parse(Encode::decode_utf8($self->{'html'}));
  $self->eof();
}

sub get_replacement {
  my ($self, $text) = @_;

  my $keyword = $self->{'keyword'};
  if($text =~ /\b\Q$keyword\E\b/i) {
    my $replacements_count = $text =~ s/\b(\Q$keyword\E)\b/$self->inject_word_into_replacement($1)/gie;
    $self->{'replacements_count'} += $replacements_count;
  }

  return $text;
}

sub inject_word_into_replacement {
  my ($self, $word) = @_;

  my $replacement = $self->{'replacement'};
  $replacement =~ s/\{keyword\}/$word/;
  return $replacement;
}

sub get_html {
  my ($self) = @_;

  return $self->{'html'};
}

sub push_tag {
  my ($self, $tag) = @_;

  push(@{$self->{'tags_stack'}}, $tag);
}

sub pop_tag {
  my ($self, $tag) = @_;

  my $removed_tag = pop(@{$self->{'tags_stack'}});
  while($removed_tag ne $tag) {
    $removed_tag = pop(@{$self->{'tags_stack'}});
  }
}

sub in_illegal_tag {
  my ($self) = @_;
  # print STDERR '--> ', join(' | ', @{$self->{'tags_stack'}}), "\n";

  # illegal tags: head, a, h#, script
  return grep(/^(?:head|a|h\d?|script)$/, @{$self->{'tags_stack'}});
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

  # method "end_document" is not called (bug?)
  if($tag eq 'html') {
    $self->end_document();
  }
}

sub end_document {
  my ($self) = @_;

  $self->{'html'} = $self->{'parsed_html'};
  $self->{'parsed_html'} = '';
}

1; # return true
