#!/usr/bin/perl -w

use encoding 'utf8';

use strict;
#use warnings;
#use diagnostics;

package HTMLPage;
use base 'HTML::Parser';



sub from_string {
  my ($self, $html) = @_;

  my $instance = $self->SUPER::new();

  $instance->{'html'} = $html;
  $instance->{'parsed_html'} = '';
  $instance->{'tags_stack'} = [];
  $instance->{'replacements_count'} = 0;
  $instance->{'word_replacements'} = [];

  return $instance;
}

sub replace {
  my ($self, $replacements) = @_;

  $self->{'replacements'} = $replacements;
  $self->{'keyword_pattern'} = lc(join('|', keys(%{$replacements})));

  my $count = scalar @{$self->{'word_replacements'}};

  $self->parse($self->{'html'});
  $self->eof();

  return scalar @{$self->{'word_replacements'}} - $count;
}

sub get_replacement {
  my ($self, $text) = @_;

  if($text =~ /(?<!\.\s)\b(?:$self->{'keyword_pattern'})\b/i) {
    $text =~ s/(?<!\.\s)\b($self->{'keyword_pattern'})\b/$self->inject_word_into_replacement($1)/gie;
  }

  return $text;
}

sub inject_word_into_replacement {
  my ($self, $word) = @_;

  my $lower_cased_word = lc($word);

  if(grep(/^$lower_cased_word$/, @{$self->{'word_replacements'}})) {
    return $word;
  }

  push(@{$self->{'word_replacements'}}, $lower_cased_word);

#  print STDERR "$lower_cased_word\n";
  my $replacement = $self->{'replacements'}{$lower_cased_word};
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
