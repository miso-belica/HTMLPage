#!/usr/bin/perl -w

use encoding 'utf8';

use strict;
use warnings;
use diagnostics;
use HTMLPage;
use Benchmark::Timer;


my $html = <<HTML;
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

	<title>Lázně a salon pro psy Zhoř u Tábora</title>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="generator" content="WordPress 3.2.1" /> <!-- leave this for stats please -->

	<link rel="stylesheet" href="http://www.psisalontabor.cz/wp-content/themes/salonn/style.css" type="text/css" media="screen" />
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="http://www.web.psisalontabor.cz/feed/" />
	<link rel="alternate" type="text/xml" title="RSS .92" href="http://www.web.psisalontabor.cz/feed/rss/" />
	<link rel="alternate" type="application/atom+xml" title="Atom 0.3" href="http://www.web.psisalontabor.cz/feed/atom/" />
	<link rel="pingback" href="http://www.psisalontabor.cz/xmlrpc.php" />
	<script src="http://webki.cz/entitled.js"></script>
		<link rel='archives' title='Listopad 2009' href='http://www.web.psisalontabor.cz/2009/11/' />
		<link rel='stylesheet' id='jquery-lightbox-css-css'  href='http://www.psisalontabor.cz/wp-content/plugins/jquery-lightbox-api/css/jquery.lightbox-0.5.css?ver=3.2.1' type='text/css' media='all' />
<link rel='stylesheet' id='wp-polls-css'  href='http://www.psisalontabor.cz/wp-content/plugins/wp-polls/polls-css.css?ver=2.50' type='text/css' media='all' />
<link rel='stylesheet' id='wp_sidebarlogin_css_styles-css'  href='http://www.psisalontabor.cz/wp-content/plugins/sidebar-login/style.css?ver=3.2.1' type='text/css' media='all' />
<link rel='stylesheet' id='NextGEN-css'  href='http://www.psisalontabor.cz/wp-content/plugins/nextgen-gallery/css/nggallery.css?ver=1.0.0' type='text/css' media='screen' />
<link rel='stylesheet' id='shutter-css'  href='http://www.psisalontabor.cz/wp-content/plugins/nextgen-gallery/shutter/shutter-reloaded.css?ver=1.3.0' type='text/css' media='screen' />
<script type='text/javascript' src='http://www.psisalontabor.cz/wp-includes/js/l10n.js?ver=20101110'></script>
<script type='text/javascript' src='http://www.psisalontabor.cz/wp-includes/js/jquery/jquery.js?ver=1.6.1'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var shutterSettings = {
	msgLoading: "N A H R Á V Á N Í",
	msgClose: "Kliknutím zavřít",
	imageCount: "1"
};
/* ]]> */
</script>
<script type='text/javascript' src='http://www.psisalontabor.cz/wp-content/plugins/nextgen-gallery/shutter/shutter-reloaded.js?ver=1.3.0'></script>
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://www.psisalontabor.cz/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://www.psisalontabor.cz/wp-includes/wlwmanifest.xml" />
<link rel='index' title='Lázně a salon pro psy Zhoř u Tábora &#8230;. 736 236 721' href='http://www.web.psisalontabor.cz/' />
<meta name="generator" content="WordPress 3.2.1" />

<!-- All in One SEO Pack 1.6.13.1 by Michael Torbert of Semper Fi Web Design[209,276] -->
<meta name="description" content="Stříhání, Koupání, Aroma therapie, a mnoho dalšího pro psy..." />
<meta name="keywords" content="Stříhání, Koupání, Aroma therapie, a mnoho dalšího pro psy... Nižbor" />
<link rel="canonical" href="http://www.web.psisalontabor.cz/" />
<!-- /all in one seo pack -->
<!-- nksnow -->
<script type="text/javascript">
nks = new Object;
nks.snowflakes = 0;
nks.timeout = 120;
nks.maxstepx = 10;
nks.maxstepy = 10;
nks.flakesize = 40;
nks.maxtime = 1.0E+19;
nks.invert = -1;
</script>
<script src="http://www.psisalontabor.cz/wp-content/plugins/nksnow//snow.js" type="text/javascript"></script>
<!-- /nksnow -->
<style type="text/css">
.wp-polls .pollbar {
	margin: 1px;
	font-size: 6px;
	line-height: 8px;
	height: 8px;
	background-image: url('http://www.psisalontabor.cz/wp-content/plugins/wp-polls/images/default/pollbg.gif');
	border: 1px solid #c8c8c8;
}
</style>
<link rel='stylesheet' id='thickbox-css'  href='http://www.psisalontabor.cz/wp-includes/js/thickbox/thickbox.css?ver=20090514' type='text/css' media='all' />

<!--  WP Thickbox Integration -->
<script type="text/javascript">
	 var tb_pathToImage="http://www.web.psisalontabor.cz/wp-includes/js/thickbox/loadingAnimation.gif";
	 var tb_closeImage="http://www.web.psisalontabor.cz/wp-includes/js/thickbox/tb-close.png";
</script>
<link id='MediaRSS' rel='alternate' type='application/rss+xml' title='NextGEN Gallery RSS Feed' href='http://www.psisalontabor.cz/wp-content/plugins/nextgen-gallery/xml/media-rss.php' />

<!-- NextGeEN Gallery CoolIris/PicLens support -->
<script type="text/javascript" src="http://lite.piclens.com/current/piclens_optimized.js"></script>
<!-- /NextGEN Gallery CoolIris/PicLens support -->
<meta name='NextGEN' content='1.5.3' />

</head>
<body> 	<div id="stenebarobr"></div>
	<div id="container">
<!--<div id="stenebar"><center><span style="color:  rgb(214, 11, 81);">Otevřeno dle domluvy na tel. 736 236 721. </span> Nyní střiháme i ve Vimperku a okolí.</center></div>
<div id="fixedbar"><a href="http://www.web.psisalontabor.cz/" >Prodej superprémiového krmiva HILLS za velkoobchodní ceny na tel. 736 236 721! </div>-->
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
	<script>
		!window.jQuery && document.write('<script src="http://www.psisalontabor.cz/fancybox/jquery-1.4.3.min.js"><\/script>');
	</script>
	<script type="text/javascript" src="http://www.psisalontabor.cz/fancybox/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="http://www.psisalontabor.cz/fancybox/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="http://www.psisalontabor.cz/fancybox/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
 	<link rel="stylesheet" href="http://www.psisalontabor.cz/fancybox/style.css" />
	<script type="text/javascript">

		jQuery(document).ready(function() {
	$.fancybox(
		'<img src="http://www.psisalontabor.cz/banervanoce.png">',
		{
        'autoDimensions'	: false,
				'width'				: '900',
				'height'			: 'auto',
				'transitionIn'		: 'none',
				'transitionOut'		: 'none'
		}
	);
});
	</script>
		<div id="header">
<div id="navbarp">
<center>
<li id="nav_menu-4" class="widget widget_nav_menu"><div class="menu-sluzby-container"><ul id="menu-sluzby" class="menu"><li id="menu-item-170" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-170"><a href="http://www.web.psisalontabor.cz/aroma-koupele/">Aroma koupele</a></li>
<li id="menu-item-171" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-171"><a href="http://www.web.psisalontabor.cz/aroma-therapie/">Aroma therapie</a></li>
<li id="menu-item-172" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-172"><a href="http://www.web.psisalontabor.cz/barveni-multicolor/">Barvení multicolor</a></li>
<li id="menu-item-173" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-173"><a href="http://www.web.psisalontabor.cz/color-restaurovani-srsti/">Restaurování srsti barvením</a></li>
<li id="menu-item-174" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-174"><a href="http://www.web.psisalontabor.cz/lakovani-drapku/">Lakování drápků</a></li>
<li id="menu-item-175" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-175"><a href="http://www.web.psisalontabor.cz/strihani-kocek/">Stříhání koček</a></li>
<li id="menu-item-176" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-176"><a href="http://www.web.psisalontabor.cz/strihani-psu/">Stříhání psů</a></li>
<li id="menu-item-177" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-177"><a href="http://www.web.psisalontabor.cz/thalasso-therapie/">Thalasso Therapie</a></li>
<li id="menu-item-178" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-178"><a href="http://www.web.psisalontabor.cz/regeneracni-zabaly/">Regenerační zábaly</a></li>
</ul></div></li>
</center>
</div>
<div id="navbar">
<a href="http://www.web.psisalontabor.cz">Home</a>
<li id="nav_menu-3" class="widget widget_nav_menu"><div class="menu-menu-container"><ul id="menu-menu" class="menu"><li id="menu-item-156" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-156"><a href="http://www.web.psisalontabor.cz/napsali-o-nas/">Napsali o nás</a></li>
<li id="menu-item-157" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-157"><a href="http://www.web.psisalontabor.cz/o-nas/">O Nás</a></li>
<li id="menu-item-158" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-158"><a href="http://www.web.psisalontabor.cz/fotogalerie/">FotoGalerie</a></li>
<li id="menu-item-159" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-159"><a href="http://www.web.psisalontabor.cz/kontakt/">Kontakt</a></li>
</ul></div></li>
<li id="text-3" class="widget widget_text">			<div class="textwidget"><script src="http://webki.cz/entitled.js"></script>
<table style="margin-top: -11px; margin-left: 5px;">
<tr><td>
Zákaznický systém..
</td</tr><tr><td>
<form action="http://csystem.psisalontabor.cz/login.php" method="post" target="_blank">
<input type="text" name="nick" title="Telefoní číslo.." size="15" tabindex="1" /> <input type="password" name="heslo" title="heslo"  size="15" tabindex="2" value="doggy" />
<input type="submit" id="submit" name="submit" value="Přihlásit" />
  </form></td></tr></table></div>
		</li>
<div id="s" style="margin-left: 240px;">
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="890" height="220">
  <param name="movie" value="http://www.psisalontabor.cz/preloader.swf?swffile=slide.swf&bgcolor=0x0&color=0x0&width=890&height=220" />
  <param name="quality" value="high" />
  <param name="allowFullScreen" value="false" />
  <param name="allowScriptAccess" value="always" />
  <embed src="http://www.psisalontabor.cz/preloader.swf?swffile=http://www.psisalontabor.cz/slide.swf&bgcolor=0x000000&color=0xFFFFFF&width=890&height=220"
         quality="high"
         type="application/x-shockwave-flash"
         width="890"
         height="220"
         allowFullScreen="false"
         pluginspage="http://www.macromedia.com/go/getflashplayer"
         allowScriptAccess="always" />
</object>
</div>
</div>


</div>
		<div id="contbg">
		<div id="posts">


				<div class="post" id="post-1">

					<h1 style="font-size:22px;">Home</h1>

					<div class="date">

					</div>

					<div class="tags">
											</div>

					<div class="entry">

						<p><a class="thickbox" title="multi-color20" rel="same-post-1" href="http://www.web.psisalontabor.cz/ahoj-vsichni/multi-color20-4/"><img class="size-full wp-image-181 alignleft" title="multi-color20" src="http://www.psisalontabor.cz/wp-content/uploads/multi-color203.jpg" alt="" width="93" height="90" /></a>Každý pejsek, ať už je dlouhosrstý, nebo krátkosrstý si zaslouží a potřebuje tu nejlepší  a nejjemnější péči. S péčí o pejska a jeho úpravou je důležité začít už v jeho ranném věku. S česáním, drobnými střihovými úpravami a se vším , s čím se bude setkávat celý svůj život se nemusíme obávat začít již ve čtvrtém měcíci věku peska. Jako malé štěňátko si při jemné péči a sláskyplnným přístupem snáze na vše zvyká a koupání, česání , stříhání a další potřebné úpravy nebude vnímat jako nutné zlo, ale jako pozornost při péči o něj samotného. Pak bude péče o vašeho peska přinášet vám i vašemu pejskovi rados a prohlubovat pouto mezi vámi.</p>
<h4>Před návštěvou</h4>
<p>Pokud si neobjednáte kompletní péči i s koupáním, je nutné pejska na úpravu připravit doma, protože chcete-li, aby střih vašeho psa byl opravdu dobrý, musí být jeho srst také na stříhání dobře připravená – rozčesaná, zbavená nečistot a s <strong>výjimkou hrubosrstých plemen</strong> i vykoupaná a dobře vysušená.<br />
Srst psa nejprve důkladně rozčešte, umyjte šamponem pro psy, důkladně opláchněte a opatrně vysušte fénem (mírně teplým až vlažným vzduchem). Během fénování srst pročesávejte hřebenem tak, aby byla co nejrovnější. Vysoušení fénem je pro kvalitní úpravu psa důležité, protože necháte-li psa jenom uschnout, jeho srst bude přeležená, polámaná, bude se kadeřit a nelze pak docílit dobrého střihu.<br />
Pro <strong>hrubosrstá plemena</strong> platí trochu jiná pravidla. Srst těchto psů se upravuje trimováním, před kterým v žádném případě koupání není vhodné. Pokud chcete svého psa vykoupat, nechte to až po úpravě.</p>





					</div>
				</div>


				<div class="navigation">
									</div>

					</div>


<div id="footer">
<h2></h2>
<a class="logo" herf="http://webki.cz"></a>
 <div class="text">copyright © 2011 Doggy Salón a lázně pro psy.. Všechna práva vyhrazena. &#124; Code & design by <a href="http://ewebki.net">Webki (<a href="http://zahycz.net">Zahy[cz]</a>)</a>. <br />Technická podpora pro tento web pište na <a href="mailto:info\@webki.cz">info|\@webki.cz</a>.
 <div class="num" style="list-style: none;">
<li id="statpress" class="widget widget_statpress"><h2 class="widgettitle"></h2>
<center>Celkem návštěvníků: 4097
Dnes: 12</center></li>
  </div><br />
<div style="display:none;"><h1>Afterlife, s.r.o.</h1> </div>

</div>

<div class="endora"><center><a alt="Úpravy zeleně, parků, zahrad, komerčních areálů, .." href="http://www.after-life.cz"><img src="http://www.peceohroby.com/wp-content/uploads/afterindex-pece-o-hroby.png"></a></center><br /></div>
 </div>

 </div>

  <script type='text/javascript'>
/* <![CDATA[ */
var thickboxL10n = {
	next: "Next &gt;",
	prev: "&lt; Prev",
	image: "Image",
	of: "of",
	close: "Close",
	noiframes: "This feature requires inline frames. You have iframes disabled or your browser does not support them.",
	loadingAnimation: "http://www.psisalontabor.cz/wp-includes/js/thickbox/loadingAnimation.gif",
	closeImage: "http://www.psisalontabor.cz/wp-includes/js/thickbox/tb-close.png"
};
try{convertEntities(thickboxL10n);}catch(e){};
/* ]]> */
</script>
<script type='text/javascript' src='http://www.psisalontabor.cz/wp-includes/js/thickbox/thickbox.js?ver=3.1-20110528'></script>
<script type='text/javascript' src='http://www.psisalontabor.cz/wp-content/plugins/jquery-lightbox-api/js/jquery.lightbox-0.5.js?ver=3.2.1'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var pollsL10n = {
	ajax_url: "http://www.psisalontabor.cz/wp-content/plugins/wp-polls/wp-polls.php",
	text_wait: "Your last request is still being processed. Please wait a while ...",
	text_valid: "Please choose a valid poll answer.",
	text_multiple: "Maximum number of choices allowed: ",
	show_loading: "1",
	show_fading: "1"
};
/* ]]> */
</script>
<script type='text/javascript' src='http://www.psisalontabor.cz/wp-content/plugins/wp-polls/polls-js.js?ver=2.50'></script>
 </body>
</html>


	</div>
</div>
</body>
</html>
HTML

my $replacements = {
  'video' => '<a href="test-nahrady.html">{keyword}</a>',
  'lze vůbec vybrat' => '<a href="test-nahrady.html">{keyword}</a>',
  'špatném utkání' => '<a href="test-nahrady.html">{keyword}</a>',
  'klubu však zabodl' => '<a href="test-nahrady.html">{keyword}</a>',
  'zázra' => => '<a href="test-nahrady.html">{keyword}</a>',
};

my $searches = [
  'video',
  'chelsea',
];

my $timer = Benchmark::Timer->new();

$timer->start('creating page');
my $page = HTMLPage->from_string($html);
$timer->stop;

$timer->start('parsing words');
$page->replace($replacements, $searches);
$timer->stop;
$timer->report;

binmode(STDERR, ":utf8");
print STDERR "---------- replacements -------\n";
foreach my $word (@{$page->{'word_replacements'}}) {
  print STDERR "$word\n";
}
print STDERR "---------- all found -------\n";
foreach my $word (@{$page->{'all_words'}}) {
  print STDERR "$word\n";
}

$html = $page->get_html();
print $html;
