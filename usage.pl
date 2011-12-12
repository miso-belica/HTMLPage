#!/usr/bin/perl -w

use encoding 'utf8';

use strict;
use warnings;
use diagnostics;
use HTMLPage;
use Benchmark::Timer;
use Encode;



open(FILE, 'input.html');
my $html = join('', <FILE>);
close(FILE);


my $replacements = {
  'video' => '<a href="test-nahrady.html">{keyword}</a>',
  'lze vůbec vybrat' => '<a href="test-nahrady.html">{keyword}</a>',
  'špatném utkání' => '<a href="test-nahrady.html">{keyword}</a>',
  'klubu však zabodl' => '<a href="test-nahrady.html">{keyword}</a>',
  'zázra\\w*' => '<a href="test-nahrady.html">{keyword}</a>',
  'komplet\\w* péč\\w*' => '<a href="test-nahrady.html">{keyword}</a>',
};

my $searches = [
  'video',
  'chelsea',
  'důkladn\\w* rozčešte'
];


binmode(STDERR, ":utf8");
my $timer = Benchmark::Timer->new();

$timer->start('creating page');
my $page = HTMLPage->from_string(Encode::decode_utf8($html));
$timer->stop;


$timer->start('parsing words');
$page->replace($replacements, $searches);
$timer->stop;
$timer->report;



print STDERR "---------- replacements -------\n";
foreach my $word (@{$page->{'word_replacements'}}) {
  print STDERR ">>$word<<\n";
}

print STDERR "---------- all found -------\n";
foreach my $word (@{$page->{'all_words'}}) {
  print STDERR ">>$word<<\n";
}


$html = $page->get_html();
print $html;
