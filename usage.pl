#!/usr/bin/perl -w

use utf8;

use strict;
use warnings;
use diagnostics;
use HTMLPage;
use Benchmark::Timer;
use Encode;

use constant SEPARATOR => '&#&';



open(FILE, 'input.html');
my $html = join('', <FILE>);
close(FILE);


my $replacements = {
  'Nylofor' =>
    '<a class="replaced" href="test-nylofor-1.html">{keyword}</a>' . SEPARATOR .
    '<a class="replaced" href="test-nylofor-2.html">{keyword}</a>' . SEPARATOR .
    '<a class="replaced" href="test-nylofor-3.html">{keyword}</a>' . SEPARATOR .
    '<a class="replaced" href="test-nylofor-4.html">{keyword}</a>' . SEPARATOR .
    '<a class="replaced" href="test-nylofor-5.html">{keyword}</a>' . SEPARATOR .
    '<a class="replaced" href="test-nylofor-6.html">{keyword}</a>',
  'kontakt\\w*' =>
    '<a class="replaced" href="test-kontakt-1.html">{keyword}</a>' . SEPARATOR .
    '<a class="replaced" href="test-kontakt-2.html">{keyword}</a>' . SEPARATOR .
    '<a class="replaced" href="test-kontakt-3.html">{keyword}</a>' . SEPARATOR .
    '<a class="replaced" href="test-kontakt-4.html">{keyword}</a>',
  'video' => '<a class="replaced" href="test-video.html">{keyword}</a>',
  'lze vůbec vybrat' => '<a class="replaced" href="test-lze-vybrat.html">{keyword}</a>',
  'špatném utkání' => '<a class="replaced" href="test-spatnem-utkani.html">{keyword}</a>',
  'klubu však zabodl' => '<a class="replaced" href="test-klubu-zabodl.html">{keyword}</a>',
  'zázra\\w*' => '<a class="replaced" href="test-zazra.html">{keyword}</a>',
  'komplet\\w* péč\\w*' => '<a class="replaced" href="test-komplet-pec.html">{keyword}</a>',
  'dámsk\\w* mód\\w*' => '<a class="replaced" href="test-damsk-mod.html">{keyword}</a>',
  'oblečení' => '<a class="replaced" href="test-obleceni.html">{keyword}</a>',
  'křesl\\w*' => '<a class="replaced" href="test-kresl.html">{keyword}</a>',
  # 'nabíz\\w*' => '<a class="replaced" href="test-nabiz.html">{keyword}</a>',
  'nabíz\\w*' =>
    '<a class="replaced" href="test-nabiz-novy-ako-slak_priorita.html">{keyword}</a>' . SEPARATOR .
    '<a class="replaced" href="test-nabiz.html">{keyword}</a>',
  'hydin\\w*' =>
    '<a class="replaced" href="hydina-1">{keyword}</a>' . '####' .
    '<a class="replaced" href="hydina-2">{keyword}</a>'
};

my $searches = [
  'video',
  'chelsea',
  'důkladn\\w* rozčešte'
];


binmode(STDERR, ":utf8");
binmode(STDOUT, ":utf8");
my $timer = Benchmark::Timer->new();

$timer->start('creating page');
$html = Encode::decode_utf8($html);
my $page = HTMLPage->from_string($html);
$timer->stop;

eval {
  $timer->start('parsing words');
  $page->replace($replacements, $searches, SEPARATOR);
  $timer->stop;
};
if(my $e = $@) {
  print STDERR "Logging of unexpected exception: ", $e;
}
else {
  $html = $page->get_html();
}

$timer->report;
print $html;


print STDERR "---------- replacements -------\n";
my @replacements = @{$page->{'word_replacements'}};
my @snippets = @{$page->{'replaced_snippets'}};
for my $index (0 .. $page->get_replacements_count() - 1) {
  my $word = $replacements[$index];
  my $snippet = $snippets[$index];
  print STDERR "$word:   $snippet\n";
}

print STDERR "---------- all found -------\n";
foreach my $word (@{$page->{'all_words'}}) {
  print STDERR "$word\n";
}
