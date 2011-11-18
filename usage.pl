#!/usr/bin/perl -w

use encoding 'utf8';

use strict;
use warnings;
use diagnostics;
use HTMLPage;


my $html = <<HTML;
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<meta name="description" content="Strong Coffee Productions" />

	<title>Strong Coffee Productions</title>

	<link rel="stylesheet" media="screen,projection,tv" href="/_css/style.css" type="text/css" />
	<link rel="stylesheet" media="screen,projection,tv" href="/_css/jquery.fancybox-1.3.4.css" type="text/css" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />

    <!--[if IE]>
    <style type="text/css">
        .c4 input.searchBox { top: -5px; }
        .goButton { margin-left: 4px; }
        .c4 li { margin-right: 10px; }
    </style>
    <![endif]-->


</head>

<body>
    <div id="container">

      <div id="header">
        <h1><a href="/">Strong Coffee</a></h1>
        <h2>productions</h2>

        <ul id="mainMenu">
            <li><a href="/">úvod</a></li>
            <li><a href="http://en.wikipedia.org/wiki/Coffee">o kafi</a></li>
            <li><a href="http://www.facebook.com/event.php?eid=100601003375524">před námi</a></li>
            <li><a href="http://www.facebook.com/event.php?eid=203811606343494">za námi</a></li>
            <li><a href="http://www.facebook.com/pages/Strong-Coffee-Productions/248283318534967">press</a></li>
            <li><a href="mailto:michal&#64;strong-coffee.cz">kontakt</a></li>
                    </ul>
      </div><!-- end #header -->

      <div id="mainContent">

<div class="blog">

    <h2 class="blogTitle"><a href="#">Yellow Umbrella 7.12.2011 @ Rock Café Praha</a></h2>
    <h3 class="meta">posted by (legenda<a href="#">mikael</a> on tuesday, september 13, 2011 <img src="/_clip/bullet_w.gif" alt="" class="bullet" /> <a href="http://www.facebook.com/event.php?eid=100601003375524">facebook event</a></h3>
    <a href="/uploads/1.jpg" class="fancy" title="Yellow Umbrella 7.12.2011 @ Rock Café Praha">
        <img class="floatImgL" src="/uploads/cache/1-preview.jpg" alt="" />
    </a>

    <p>
        <strong>Drážďanská lEgeNda Yellow Umbrella opět roztančí Prahu</strong>
    </p>
    <p>
        PRAHA – V pátek (ľščťžýáíéééééíážťčšťľšýžť) legenda 9.prosince se kapela Yellow Umbrella, která českému publiku vešla ve známost především jako jeden z hlavních účinkujících festivalu United Islands 2009, opět ukáže v Praze - tentokrát v klubu Rock Café v rámci svého vánočního turné. Kapela byla založena v roce 1994 a od té doby vydala již devět řadových alb.
    </p>
    <blockquote>„... one moment they sound totally jamaican, the next moment totally gypsy. I can`t believe they are from Germany“</blockquote>
    <div class="cite">- Victor Rice, 2005</div>
    <p>
        Strong Coffee Productions o.s. (ve spolupráci s United Islands Reloaded) přináší unikátní vystoupení jedné z nejznámějších kapel evropské ska a reggae scény (což může dokazovat i to, že na jejich koncertě na Střeleckém ostrově bylo více než 2500 diváků!). Nejen, že budete moci vidět Yellow Umbrella ve vánočních kostýmech, ale také od nich uslyšíte ska covery nejznámějších vánočních hitů jako „Last Christmas, Winter Wonderland nebo Rudolph, the red-nosed reindeer“, dalším bodem vystoupení bude živá performance židovského komika Olivera Polaka a na samotný závěr přijde obří klezmer – ska masakr.
        Celou akci doplní čtyři české kapely: Basta Fidel, Discoballs, Green Smatroll a Dub Artillery.
    </p>

    <p>
        <a href="http://www.facebook.com/event.php?eid=100601003375524">Najdi si na Facebooku!</a>
    </p>

</div><!-- end .blog -->
          <br class="clear" />

                  </div><!-- end #mainContent -->

      <div id="footer">
        <p>Copyright &copy; 2011 Strong Coffee Productions o.s. <img src="/_clip/bullet_w.gif" alt="" class="bullet" /> Design by <a href="http://20pirates.com">Tony Pires</a></p>
        <p><div  ><div class="zoznam">Vyzkoušejte polymerovou bazénovou chemii, která nedráždí pokožku a je vhodná i pro alergiky. Tento druh chemie  není těkavý, díky čemuž déle vydrží v zásobníku bazénu - <a href="http://www.cisty-domov.com/" title="Bazénová chemie GUAA">bazénová chemie</a> GUAA. Značková bazénová chemie bez chlóru.</div></div> </p>
      </div><!-- end #footer -->

    </div><!-- end #container -->

	<script type="text/javascript" src="/_js/jquery-1.7.min.js"></script>
	<script type="text/javascript" src="/_js/netteForms.js"></script>
	<script type="text/javascript" src="/_js/jquery.fancybox-1.3.4.pack.js"></script>
    <script type="text/javascript">
        /* <![CDATA[ */
        (function($) {
            $(document).ready(function() {
                $('.fancy').fancybox({
                    opacity: true,
                    cyclic: true,
                    centerOnScroll: true,
                    overlayColor: '#000',
                    overlayOpacity: 0.7,
                    titlePosition: 'inside',
                    transitionIn: 'elastic',
                    transitionOut: 'elastic',
                    easingIn: 'swing',
                    easingOut: 'swing'
                });
            });

        })(jQuery);
        /* ]]> */
    </script>

    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-26241307-1']);
        _gaq.push(['_setDomainName', 'strong-coffee.cz']);
        _gaq.push(['_trackPageview']);

        (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
</body>
</html>
HTML

my %replacements = (
  'ľščťžýÁÍéééééíážťčšťľšýžť' => '<a href="pepekovo">{keyword}</a>',
  'pÁtek' => '<a href="den">{keyword}</a>',
  'nedráždí pokožku' => '<a href="pepekovo">{keyword}</a>',
  'jop' => '<a href="pepekovo">{keyword}</a>',
);

my $MAX_REPLACEMENTS_COUNT = 1;


my $word = '';
my $page = HTMLPage->from_string($html);
foreach $word (keys %replacements) {
  $page->replace($word, $replacements{$word});
  if($page->{'replacements_count'} >= $MAX_REPLACEMENTS_COUNT) {
    last;
  }
}
$html = $page->get_html();

print $html;
