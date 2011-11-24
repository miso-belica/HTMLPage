#!/usr/bin/perl -w

use encoding 'utf8';

use strict;
use warnings;
use diagnostics;
use HTMLPage;
use Benchmark::Timer;


my $html = <<HTML;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="cs-CZ">
<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>  Reportáž: Bayer Leverkusen 2:1 Chelsea + VIDEO! : Chelsea FC</title>

<!-- feeds & pingback -->
<link rel="alternate" type="application/rss+xml" title="Chelsea FC RSS Feed" href="http://www.chelseasite.cz/?feed=rss2" />
<link rel="alternate" type="application/atom+xml" title="Chelsea FC Atom Feed" href="http://www.chelseasite.cz/?feed=atom" />
<link rel="pingback" href="http://www.chelseasite.cz/xmlrpc.php" />

<!-- main stylesheet, favicon,  -->
<link rel="icon" type="image/png" href="http://www.chelseasite.cz/favicon.ico" />
<link rel="stylesheet" type="text/css" href="http://www.chelseasite.cz/wp-content/themes/quik/style.css" />
<link rel="stylesheet" type="text/css" href="http://www.chelseasite.cz/wp-content/themes/quik/css/blue.css" media="screen" />

<!-- Google Font -->
<link href='http://fonts.googleapis.com/css?family=Droid+Sans:regular,bold' rel='stylesheet' type='text/css'>
<style type="text/css">
h1,h2,h3,h4 { font-family: 'Droid Sans', arial, serif !important; }
</style>
<!-- wp head -->
<link rel="alternate" type="application/rss+xml" title="Chelsea FC &raquo; Reportáž: Bayer Leverkusen 2:1 Chelsea + VIDEO! RSS komentářů" href="http://www.chelseasite.cz/?feed=rss2&amp;p=5677" />

<style type='text/css'>
	table.leaguemanager th { background-color: #dddddd }
</style><link rel='stylesheet' id='meni-sprites-css'  href='http://www.chelseasite.cz/wp-content/plugins/mystique-extra-nav-icons/sprites/sprite.css?ver=3.0.4' type='text/css' media='all' />
<link rel='stylesheet' id='wp-polls-css'  href='http://www.chelseasite.cz/wp-content/plugins/wp-polls/polls-css.css?ver=2.50' type='text/css' media='all' />
<link rel='stylesheet' id='thickbox-css'  href='http://www.chelseasite.cz/wp-includes/js/thickbox/thickbox.css?ver=20090514' type='text/css' media='all' />
<link rel='stylesheet' id='leaguemanager-css'  href='http://www.chelseasite.cz/wp-content/plugins/leaguemanager/style.css?ver=1.0' type='text/css' media='screen' />
<link rel='stylesheet' id='wp-flickr-background-css'  href='http://www.chelseasite.cz/wp-content/plugins/wp-flickr-background/pub-style.css.php?ver=1.1.1&#038;h=f523eb748649438249c1136b73676829' type='text/css' media='all' />
<script type='text/javascript' src='http://www.chelseasite.cz/wp-includes/js/comment-reply.js?ver=20090102'></script>
<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js?ver=1.4.2'></script>
<script type='text/javascript' src='http://www.chelseasite.cz/wp-content/themes/quik/js/sliding_effect.js?ver=1.0'></script>
<script type='text/javascript' src='http://www.chelseasite.cz/wp-content/themes/quik/js/jquery.scrollTo-min.js?ver=1.4.2'></script>
<script type='text/javascript' src='http://www.chelseasite.cz/wp-content/themes/quik/js/jquery.localscroll-1.2.7-min.js?ver=1.4.2'></script>
<script type='text/javascript' src='http://www.chelseasite.cz/wp-content/themes/quik/js/superfish.js?ver=1.4.8'></script>
<script type='text/javascript' src='http://www.chelseasite.cz/wp-content/themes/quik/js/custom.js?ver=1.0'></script>
<script type='text/javascript' src='http://www.chelseasite.cz/wp-content/plugins/wp-flickr-background/pub-script.js.php?ver=1.1.1&#038;h=f523eb748649438249c1136b73676829'></script>
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://www.chelseasite.cz/xmlrpc.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://www.chelseasite.cz/wp-includes/wlwmanifest.xml" />
<link rel='index' title='Chelsea FC' href='http://www.chelseasite.cz' />
<link rel='start' title='Essien: Nikam neodchádzam' href='http://www.chelseasite.cz/?p=30' />
<link rel='prev' title='Sestavy: Bayer Leverkusen vs Chelsea' href='http://www.chelseasite.cz/?p=5673' />
<link rel='canonical' href='http://www.chelseasite.cz/?p=5677' />


<!-- Start Login-Box -->
<script type="text/javascript" src="http://www.chelseasite.cz/wp-content/plugins/login-box/login-box.php?script=widget"></script>
<link rel="stylesheet" href="http://www.chelseasite.cz/wp-content/plugins/login-box/login-box.php?style=widget" type="text/css" media="screen" />
<!-- End Login-Box -->




<!-- Google Fonts -->
<link href='http://fonts.googleapis.com/css?family=Arvo:regular,italic,bold,bolditalic' rel='stylesheet' type='text/css' /><link href='http://fonts.googleapis.com/css?family=' rel='stylesheet' type='text/css' /><link href='http://fonts.googleapis.com/css?family=' rel='stylesheet' type='text/css' /><link href='http://fonts.googleapis.com/css?family=' rel='stylesheet' type='text/css' /><link href='http://fonts.googleapis.com/css?family=' rel='stylesheet' type='text/css' /><link href='http://fonts.googleapis.com/css?family=' rel='stylesheet' type='text/css' />
<style type="text/css" media="screen">
ľ, š, č, ť, ž, ý, á, í, é, Č, Ň, Š, Ľ, ř, Ť, Ř,
</style>
<!-- fonts delivered by Wordpress Google Fonts, a plugin by Adrian3.com -->

<style type="text/css">
.wp-polls .pollbar {
	margin: 1px;
	font-size: 6px;
	line-height: 8px;
	height: 8px;
	background-image: url('http://www.chelseasite.cz/wp-content/plugins/wp-polls/images/default/pollbg.gif');
	border: 1px solid #d8e1eb;
}
</style>
<script type='text/javascript' src='http://www.chelseasite.cz/wp-includes/js/tw-sack.js?ver=1.6.1'></script>
<script type='text/javascript'>
/* <![CDATA[ */
var thickboxL10n = {
	next: "Následující &gt;",
	prev: "&lt; Předchozí",
	image: "Obrázek",
	of: "z celkem",
	close: "Zavřít",
	noiframes: "Tato funkce WordPressu vyžaduje použití vnitřních rámů (iframe), které však patrně nemáte povoleny nebo je váš prohlížeč vůbec nepodporuje."
};
try{convertEntities(thickboxL10n);}catch(e){};
/* ]]> */
</script>
<script type='text/javascript' src='http://www.chelseasite.cz/wp-includes/js/thickbox/thickbox.js?ver=3.1-20100407'></script>
<script type='text/javascript' src='http://www.chelseasite.cz/wp-content/plugins/leaguemanager/leaguemanager.js?ver=3.7'></script>
		<script type="text/javascript">
		//<![CDATA[
		LeagueManagerAjaxL10n = {
			blogUrl: "http://www.chelseasite.cz", pluginPath: "/home/users/acmilan/chelseasite.cz/web/wp-content/plugins/leaguemanager", pluginUrl: "http://www.chelseasite.cz/wp-content/plugins/leaguemanager", requestUrl: "http://www.chelseasite.cz/wp-content/plugins/leaguemanager/ajax.php", Edit: "Upravit", Post: "příspěvek", Save: "Uložit", Cancel: "Zrušit", pleaseWait: "Prosím čekejte...", Revisions: "Page Revisions", Time: "Vložit čas", Options: "Nastavení", Delete: "Smazat"
	 	}
		//]]>
		</script>
		<!-- All in one Favicon 3.1 | by Arne Franken, http://www.techotronic.de/ -->                        <link rel="icon" href="http://www.chelseasite.cz/wp-content/uploads/th_Chelsea_logo-copy.png" type="image/png"/><!-- All in one Favicon 3.1 | by Arne Franken, http://www.techotronic.de/ -->
<!-- homepage slider -->
<script type="text/javascript">
jQuery(function(\$){
	\$(window).load(function() {
	\$('#slider').nivoSlider({
		effect:'random',
		slices: 15,
		animSpeed: 500,
		pauseTime: 5000,
		directionNav: false,
		controlNav: true
	});
});
});
</script>


</head>
<body>
<div id="xs-wrap">
	<div id="xs-header">
    	<div id="xs-header-logo">
							<a href="http://www.chelseasite.cz" title="Chelsea FC" rel="home"><img src="http://www.chelseasite.cz/wp-content/themes/quik/images/anzi.png" alt="Chelsea FC" /></a>
			                                        </div><!-- /xs-header-logo -->
</div><!-- /xs-header -->
	<div id="xs-primary-menu">
		<div class="menu-menu-container"><ul id="menu-menu" class="sf-menu"><li id="menu-item-11" class="menu-item menu-item-type-custom menu-item-11"><a href="http://chelseasite.cz">Klub</a>
<ul class="sub-menu">
	<li id="menu-item-103" class="menu-item menu-item-type-custom menu-item-103"><a href="http://www.chelseasite.cz/?page_id=99">Info o klubu</a></li>
	<li id="menu-item-110" class="menu-item menu-item-type-custom menu-item-110"><a href="http://www.chelseasite.cz/?page_id=104">Vedení klubu</a></li>
	<li id="menu-item-1685" class="menu-item menu-item-type-custom menu-item-1685"><a href="http://www.chelseasite.cz/?page_id=1681">Chelsea Ladies</a></li>
</ul>
</li>
<li id="menu-item-12" class="menu-item menu-item-type-custom menu-item-12"><a href="http://chelseasite.cz">Sezóna</a>
<ul class="sub-menu">
	<li id="menu-item-120" class="menu-item menu-item-type-custom menu-item-120"><a href="http://www.chelseasite.cz/?page_id=145">Premier League</a></li>
	<li id="menu-item-121" class="menu-item menu-item-type-custom menu-item-121"><a href="http://www.chelseasite.cz/?page_id=124">FA Cup</a></li>
	<li id="menu-item-122" class="menu-item menu-item-type-custom menu-item-122"><a href="http://www.chelseasite.cz/?page_id=129">Carling Cup</a></li>
	<li id="menu-item-123" class="menu-item menu-item-type-custom menu-item-123"><a href="http://www.chelseasite.cz/?page_id=133">Champions League</a></li>
	<li id="menu-item-1463" class="menu-item menu-item-type-custom menu-item-1463"><a href="http://www.chelseasite.cz/?page_id=1457">Dresy</a></li>
</ul>
</li>
<li id="menu-item-1687" class="menu-item menu-item-type-custom menu-item-1687"><a href="http://chelseasite.cz">Stamford Bridge</a>
<ul class="sub-menu">
	<li id="menu-item-1694" class="menu-item menu-item-type-custom menu-item-1694"><a href="http://www.chelseasite.cz/?page_id=1688">Info o SB</a></li>
	<li id="menu-item-1698" class="menu-item menu-item-type-custom menu-item-1698"><a href="http://www.chelseasite.cz/?page_id=1695">Tribuny</a></li>
	<li id="menu-item-1719" class="menu-item menu-item-type-custom menu-item-1719"><a href="http://www.chelseasite.cz/?page_id=1713">Průměrná návštěvnost (v PL)</a></li>
	<li id="menu-item-1710" class="menu-item menu-item-type-custom menu-item-1710"><a href="http://www.chelseasite.cz/?page_id=1700">Ostatní</a></li>
</ul>
</li>
<li id="menu-item-13" class="menu-item menu-item-type-custom menu-item-13"><a href="http://chelseasite.cz">Historie</a>
<ul class="sub-menu">
	<li id="menu-item-90" class="menu-item menu-item-type-custom menu-item-90"><a href="http://www.chelseasite.cz/?page_id=85">Historie klubu</a></li>
	<li id="menu-item-1733" class="menu-item menu-item-type-custom menu-item-1733"><a href="http://www.chelseasite.cz/?page_id=1725">Historie znaků</a></li>
	<li id="menu-item-1620" class="menu-item menu-item-type-custom menu-item-1620"><a href="http://www.chelseasite.cz/?page_id=1608">Historie kapitánů</a></li>
	<li id="menu-item-1678" class="menu-item menu-item-type-custom menu-item-1678"><a href="http://www.chelseasite.cz/?page_id=1675">Hráči roku</a></li>
</ul>
</li>
<li id="menu-item-36" class="menu-item menu-item-type-custom menu-item-36"><a href="http://chelseasite.cz">Web</a>
<ul class="sub-menu">
	<li id="menu-item-340" class="menu-item menu-item-type-custom menu-item-340"><a href="http://www.chelseasite.cz/wp-login.php?action=register">Registrace</a></li>
	<li id="menu-item-60" class="menu-item menu-item-type-custom menu-item-60"><a href="http://www.chelseasite.cz/?page_id=51">Spolupráce</a></li>
	<li id="menu-item-239" class="menu-item menu-item-type-custom menu-item-239"><a href="http://www.chelseasite.cz/?page_id=236">Partneři</a></li>
	<li id="menu-item-82" class="menu-item menu-item-type-custom menu-item-82"><a href="http://www.chelseasite.cz/?page_id=74">O webu</a></li>
	<li id="menu-item-83" class="menu-item menu-item-type-custom menu-item-83"><a href="http://www.chelseasite.cz/?page_id=61">Pravidla webu</a></li>
</ul>
</li>
<li id="menu-item-15" class="menu-item menu-item-type-custom menu-item-15"><a href="http://chelseasite.cz">Kontakt</a>
<ul class="sub-menu">
	<li id="menu-item-50" class="menu-item menu-item-type-custom menu-item-50"><a href="http://www.chelseasite.cz/?page_id=37">Redakce</a></li>
</ul>
</li>
</ul></div>	<div class="clear"></div>
       		<div id="xs-search-wrap">
<form method="get" id="searchbar" action="http://www.chelseasite.cz/">
<input type="text" size="16" name="s" id="xs-search-input" value="Hledat..." onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;" />
<input type="submit" value="" id="xs-search-submit" />
</form>
</div><!-- /search-wrap -->    	</div><!-- /xs-primary-menu -->
<div id="xs-container">
	<div id="xs-main">
			<div id="xs-post">
						<h1>Reportáž: Bayer Leverkusen 2:1 Chelsea + VIDEO!</h1>
            	            	<div id="xs-post-meta">
					<span class="authorspan"><a href="http://www.chelseasite.cz/?author=2" title="Příspěvky od Zola25">Zola25</a></span><span class="datespan">Listopad 23rd, 2011</span><span class="commentspan"><a href="http://www.chelseasite.cz/?p=5677#respond" title="Komentáře k příspěvku Reportáž: Bayer Leverkusen 2:1 Chelsea + VIDEO!">0 Žádný komentář »</a></span>
        		</div><!-- /xs-post-meta -->
                		<p><a href="http://www.chelseasite.cz/wp-content/uploads/Andre+Villas+Boas+Chelsea+FC+v+Bayer+04+Leverkusen+6tQhmM6-wRsl.jpg"><img class="aligncenter size-full wp-image-3166" title="Andre+Villas+Boas+Chelsea+FC+v+Bayer+04+Leverkusen+6tQhmM6-wRsl" src="http://www.chelseasite.cz/wp-content/uploads/Andre+Villas+Boas+Chelsea+FC+v+Bayer+04+Leverkusen+6tQhmM6-wRsl.jpg" alt="" width="640" height="280" /></a>A další velmi nepovedený zápas. Chelsea opět prohrála a současná situace je dost kritická. Je totiž možné, že se v Lize Mistrů letos nedostaneme ani do osmifinále, což fanoušci téměř nepamatují.<span id="more-5677"></span></p>
<p>První branku vstřelil ve 49.minutě Didier Drogba, který se skvěle prosadil v pokutovém území. Dobře tak odpověděl těm, kteří o poločas hlásali &#8222;Drogba ven&#8220;. Přesto byl tento střelecký počin nečekaným, jelikož do té doby byl na hřišti pánem domácí celek. Michael Ballack dokonce ve 33.minutě nastřelil břevno.</p>
<p>Jenže po Drogbově gólu nedokázala Chelsea využít svých dalších jasných příležitostí a to se vymstilo. Po pětapadesáté minutě nastalo pro &#8216;Blues&#8217; peklo&#8230;</p>
<p>Nejprve v 58.minutě dokázal ještě Čech zázračně vyrazit Ballackovi dobré nůžky a dokonce i z následného rohu vyšel ze souboje Ballack vs Čech český gólman jako vítěz. To bylo ale všechno, český internacionál nás nemohl držet nad vodou věčně. V 73.minutě se Leverkusen dostal do přečíslení a hlavičující Derdiyok neměl problém dorazit míč do prázdné branky.</p>
<p>Kudlu do srdce modrého klubu však zabodl až v 91.minutě Friedrich, který se trefil z rohu a spustil neuvěřitelnou euforii v aréně Bayeru Leverkusenu. A oprávněně &#8211; vždyť komu se poštěstí porazit Chelsea? No upřímně, v současné době to není zrovna ten nejtěžší úkol&#8230;</p>
<p><em><strong><span style="color: #0000ff;"><span style="text-decoration: underline;">Bayer Leverkusen FC 2:1 Chelsea FC</span></span><br />
</strong></em></p>
<p><span style="text-decoration: underline;"><strong>Stadion:</strong></span> Bay Arena, Leverkusen<br />
<strong> <span style="text-decoration: underline;">Góly:</span></strong> 73&#8242; Derdiyok, 90&#8242;+ Friedrich &#8211; 49&#8242; Drogba<br />
<strong> <span style="text-decoration: underline;">VIDEO:</span></strong> <a href="http://footyroom.com/bayer-leverkusen-2-1-chelsea-2011-11/">ZDE !</a></p>
<p><span style="text-decoration: underline;"><strong>Muž zápasu:</strong></span> <em>Lze vůbec vybrat muže zápasu v takhle špatném utkání ?</em><br />
<strong> </strong><span style="text-decoration: underline;"><strong>Rozhodčí:</strong></span> Viktor Kassai<br />
<span style="text-decoration: underline;"><strong>Žluté karty:</strong></span><span style="color: #333333;"> Kiessling, Kadlec, Ballack &#8211; Ivanovič, Meireles </span><br />
<span style="text-decoration: underline;"><strong>Diváci:</strong></span> 29 285 <strong></strong></p>
        <div class="clear"></div>
        </div><!-- /xs-post -->
                <div id="xs-post-navigation">
        	<div id="xs-post-navigation-left">
				&laquo; <a href="http://www.chelseasite.cz/?p=5673">Sestavy: Bayer Leverkusen vs Chelsea</a>            </div><!-- /xs-post-navigation-left -->
            <div id="xs-post-navigation-right">
 				           </div><!-- /xs-post-navigation-right -->
 		</div><!-- /xs-post-navigation -->

<!-- You can start editing here. -->
<div id="commentsbox">
<h3 id="comments">Žádný komentář</h3>




<div id="comment-form">

<div id="respond" >

<div class="cancel-comment-reply">
<a rel="nofollow" id="cancel-comment-reply-link" href="/?p=5677#respond" style="display:none;">Odpověď na komentář zrušíte zde.</a></div>

<p>Musíte být <a href="http://www.chelseasite.cz/wp-login.php?redirect_to=http%3A%2F%2Fwww.chelseasite.cz%2F%3Fp%3D5677">přihlášení</a> pro přidávání komentářů</p>

</div>
</div>
</div>
				        </div><!-- /xs-main -->
<div id="xs-sidebar-right">
	<div class="xs-sidebar-right-box"><h4>Match box</h4>			<div class="textwidget"><center/><img border="0" src="http://www.footiewallpapers.com/pics/c/o/comment-soccer-myspace-bayer-leverkusen-logo-395x300px.jpg" width="140" height="100"/> <p><b>Bayer Leverkusen</b><br/>23.11.2011, 20:45<br/>BayArena</p>
</div>
		</div><div class="xs-sidebar-right-box"><h4>Hlavní partner</h4>			<div class="textwidget"><center/><a href="http://www.fotbalove-dresy.com/jamaffiliates/jrox.php?id=134_1_bid_39"><img src="http://www.fotbalove-dresy.com/jamaffiliates/image.php?bid=39&mid=134" width="230" height="230" border="0"/></a></div>
		</div><div class="xs-sidebar-right-box"><h4>Bleskovky</h4><ul><li><strong>23.11. Villas Boas dostal pokutu</strong> - <p>Portugalský trenér André Villas Boas dostal pokutu 12.000 liber od anglické fotbalové asociace za ostré urážky po zápase na rozhodčího Chrise Foye, ve kterém "Blues" prohráli 1:0 s QPR a dostali 2 červené karty .</p>
</li><li><strong>15.11. Sturridge terčom rasistických urážok</strong> - <p>Daniel Sturridge bol údajne terčom rasistických urážok od fanúšika Chelsea v zápase Ligy majstrov proti Genku. Hovorca Chelsea povedal: "Dostali sme novú sťažnosť od fanúšika, ktorú berieme veľmi vážne. Začneme okamžité vyšetrovanie spoločne so šéfom bezpečnosti, ktoré by mohlo zahŕňať aj políciu. Nebudeme tolerovať žiadnu formu rasizmu a budeme povzbudzovať našich fanúšikov na identifikáciu zodpovednej osoby." Pacháteľ, ktorý sa previnil, údajne počas striedania Sturridgea kričal: "Vždy tam posielajú opice."</p>
</li></ul></div><div class="xs-sidebar-right-box"><h4>Tabulka PL</h4>			<div class="textwidget"><p>1. Manchester City - 34 b<br />2. Manchester United - 29 b<br />3. Newcastle United  - 25 b<br />4. Chelsea FC - 22 b<br />5. Tottenham Hotspur - 22 b<br />6. Liverpool FC - 22 b<br />7. Arsenal FC - 22 b</p></div>
		</div><div class="xs-sidebar-right-box"><h4>Anketa</h4>			<div class="textwidget"><center/><!-- BlueBoard.cz Anketa -->
<div id="blok-bbsluzba-941579"></div>
<a id="odkaz-bbsluzba-941579" href="http://blueboard.cz">BlueBoard.cz</a>
<script type="text/javascript" src="http://blueboard.cz/widget-anketa-941579"></script>
<!-- BlueBoard.cz Anketa KONEC --></div>
		</div><div class="xs-sidebar-right-box"><h4>Partneři</h4>			<div class="textwidget"><center><p><a href="http://www.facebook.com/stamfordbridge1905"><img src="http://uploading.sk/images/bannerjk.jpg" border="0" alt="Chelsea FC" width="100" height="50" /></a></p>

<p><a href="http://topfutbal.sk/" target="_blank"><img src="http://www.chelseasite.cz/wp-content/uploads/topfutbal.jpg" border="0" alt="FC Bayern" width="100" height="50" /></a></p>

<p><a href="http://saintsfc.cz/" target="_blank"><img src="http://saintsfc.cz/saints_banner.png">  </p>
</div>
		</div><div class="xs-sidebar-right-box"><h4>Návštěvnost</h4>			<div class="textwidget"><center/><a href="http://www.toplist.cz/" target="_top"><img
 src="http://toplist.cz/count.asp?id=1170097&amp;logo=mc" border="0" alt="TOPlist" width="88" height="60"/></a></div>
		</div><div class="xs-sidebar-right-box"><h4>Přihlášení</h4><ul><li><a href="http://www.chelseasite.cz/wp-login.php?redirect_to=/?p=5677"  title="Chelsea FC - Login" rel="loginbox-toggle">Login</a>

<!-- Start Login-Box -->
	<form id="loginbox" action="http://www.chelseasite.cz/wp-login.php" method="post">
		<fieldset>
			<legend id="loginbox_title">Login</legend>
			<p id="loginbox_username">
				<label>Username:<br />
				<input type="text" name="log" id="user_login" class="loginbox_text" value="" /></label>
			</p>
			<p id="loginbox_password">
				<label>Heslo:<br />
				<input type="password" name="pwd" id="user_pass" class="loginbox_text" value="" /></label>
			</p>
			<p id="loginbox_rememberme">
				<label><input name="rememberme" type="checkbox" id="rememberme" class="loginbox_checkbox" value="forever" />Pamatovat si mě</label>
			</p>
			<p id="loginbox_submit"><input type="submit" class="loginbox_button" value="Login &raquo;" /></p>
			<input type="hidden" name="redirect_to" value="/?p=5677" />
		</fieldset>
	</form>
<!-- End Login-Box -->


</li><li><a href="http://www.chelseasite.cz/wp-login.php?action=register" title="Registrace">Registrace</a></li></ul></div><div class="xs-sidebar-right-box"><h4>Nájdete nás</h4>			<div class="textwidget"><center/><a target="_self" href=" http://www.facebook.com/chelseasite.cz "><img src="http://uploading.sk/images/faceboofo.png" width="" height="" alt="" /></a>

<a target="_self" href="http://twitter.com/#!/chelseasite_cz"><img src="http://uploading.sk/images/twittercop.jpg" width="" height="" alt="" /></a>

<a target="_self" href="http://www.chelseasite.cz/?feed=rss2"><img src="http://uploading.sk/images/rssaea.jpg" width="" height="" alt="" /></a></div>
		</div></div><!-- /xs-sidebar-right -->
<div class="clear"></div>
</div><!-- /xs-container -->
</div><!-- /wrap -->
    <div id="xs-footer-wrap">
		<div id="xs-footer" class="sub-menu">
			<div id="xs-footer-widget-left">
											</div><!--/xs-footer-widget-left -->
        	<div id="xs-footer-widget-middle-left">
											</div><!--/xs-footer-widget-middle-left -->
			<div id="xs-footer-widget-middle-right">
											</div><!--/xs-footer-widget-middle-right -->
    		<div id="xs-footer-widget-right">
								       		</div><!--/xs-footer-right -->
   		 <div class="clear"></div>
		</div><!--/xs-footer -->
	</div><!--/xs-footer-wrap -->
<div id="xs-copyright">&copy; 2011  Chelsea FC | <a href="http://www.wpexplorer.com/quik-community-blog-wordpress-theme.html" title="Quik WordPress Theme">Quik WordPress Theme</a>
  <div id="xs-back-to-top">
    	<a class="scrollto" href="#">Zpátky k menu +</a>
    </div><!-- /back-to-top -->
</div><!-- /xs-copyright -->
<script type='text/javascript'>
/* <![CDATA[ */
var pollsL10n = {
	ajax_url: "http://www.chelseasite.cz/wp-content/plugins/wp-polls/wp-polls.php",
	text_wait: "Your last request is still being processed. Please wait a while ...",
	text_valid: "Please choose a valid poll answer.",
	text_multiple: "Maximum number of choices allowed: ",
	show_loading: "1",
	show_fading: "1"
};
/* ]]> */
</script>
<script type='text/javascript' src='http://www.chelseasite.cz/wp-content/plugins/wp-polls/polls-js.js?ver=2.50'></script>
<div  ><div class="souhrn">Chcete kvalitní, odolná a <strong>designově propracovaná</strong> křesla? Pokud ano, lino.cz je specialista na kancelářská křesla, <strong>konferenční křesla</strong> i zahradní křesla. Naše židle i <a href="http://www.lino.cz/kresla/" title="Křesla Lino">křesla</a> si zachovávají dlouho dobu vzhled novosti, takže nemusíte kupovat nové křesla.</div></div></body>
</html>
HTML

my $replacements = {
  'bradavice' => '<a href="pepekovo">{keyword}</a>',
  'pepek' => '<a href="pepekovo">{keyword}</a>',
  'ľščťžýíáéíťážý' => '<a href="pepekovo">{keyword}</a>',
  '2011 (2012) bydlení kalkulačka na příspě' => '<a href="pepekovo">{keyword}</a>',
  '2011 bydlení kalkulačka na příspě' => '<a href="pepekovo">{keyword}</a>',
  '3d architekt' => '<a href="pepekovo">{keyword}</a>',
  'adidas' => '<a href="pepekovo">{keyword}</a>',
  'adidas boty' => '<a href="pepekovo">{keyword}</a>',
  'adidas damske soupravy' => '<a href="pepekovo">{keyword}</a>',
  'adidas dámské teplákové soupravy' => '<a href="pepekovo">{keyword}</a>',
  'adidas lady' => '<a href="pepekovo">{keyword}</a>',
  'adidas mikiny' => '<a href="pepekovo">{keyword}</a>',
  'adidas originals' => '<a href="pepekovo">{keyword}</a>',
  'adidas soupravy' => '<a href="pepekovo">{keyword}</a>',
  'adidas superstar' => '<a href="pepekovo">{keyword}</a>',
  'adidas trička' => '<a href="pepekovo">{keyword}</a>',
  'aminokyseliny' => '<a href="pepekovo">{keyword}</a>',
  'architektura' => '<a href="pepekovo">{keyword}</a>',
  'architektura barokní' => '<a href="pepekovo">{keyword}</a>',
  'architektura bytová' => '<a href="pepekovo">{keyword}</a>',
  'architektura domu' => '<a href="pepekovo">{keyword}</a>',
  'architektura lidová' => '<a href="pepekovo">{keyword}</a>',
  'architektura moderní' => '<a href="pepekovo">{keyword}</a>',
  'architektura zahradní' => '<a href="pepekovo">{keyword}</a>',
  'architektura zahrady' => '<a href="pepekovo">{keyword}</a>',
  'autopůjčovna' => '<a href="pepekovo">{keyword}</a>',
  'autopůjčovna brno' => '<a href="pepekovo">{keyword}</a>',
  'autopůjčovna olomouc' => '<a href="pepekovo">{keyword}</a>',
  'autopůjčovna ostrava' => '<a href="pepekovo">{keyword}</a>',
  'autopůjčovna praha' => '<a href="pepekovo">{keyword}</a>',
  'autoškola praha' => '<a href="pepekovo">{keyword}</a>',
  'barové židle' => '<a href="pepekovo">{keyword}</a>',
  'bavlněné ponožky, ponožky' => '<a href="pepekovo">{keyword}</a>',
  'bazénová chemie' => '<a href="pepekovo">{keyword}</a>',
  'bcaa' => '<a href="pepekovo">{keyword}</a>',
  'bělení zubů' => '<a href="pepekovo">{keyword}</a>',
  'bělení zubů brno' => '<a href="pepekovo">{keyword}</a>',
  'blank & basic' => '<a href="pepekovo">{keyword}</a>',
  'bomber bunda' => '<a href="pepekovo">{keyword}</a>',
  'botanická zahrada' => '<a href="pepekovo">{keyword}</a>',
  'botičky pro miminka' => '<a href="pepekovo">{keyword}</a>',
  'bydlení' => '<a href="pepekovo">{keyword}</a>',
  'bydlení je hra' => '<a href="pepekovo">{keyword}</a>',
  'bytové interiéry' => '<a href="pepekovo">{keyword}</a>',
  'carnitin' => '<a href="pepekovo">{keyword}</a>',
  'catering' => '<a href="pepekovo">{keyword}</a>',
  'ceny webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'certifikace' => '<a href="pepekovo">{keyword}</a>',
  'certifikace iso' => '<a href="pepekovo">{keyword}</a>',
  'čepice' => '<a href="pepekovo">{keyword}</a>',
  'čočky' => '<a href="pepekovo">{keyword}</a>',
  'dada supreme' => '<a href="pepekovo">{keyword}</a>',
  'dada supreme lady' => '<a href="pepekovo">{keyword}</a>',
  'dada supreme performance' => '<a href="pepekovo">{keyword}</a>',
  'dámská móda' => '<a href="pepekovo">{keyword}</a>',
  'dámská obuv' => '<a href="pepekovo">{keyword}</a>',
  'dámská trička' => '<a href="pepekovo">{keyword}</a>',
  'dámská trička dlouhý rukáv' => '<a href="pepekovo">{keyword}</a>',
  'dámské boty' => '<a href="pepekovo">{keyword}</a>',
  'dámské bundy' => '<a href="pepekovo">{keyword}</a>',
  'dámské doplňky' => '<a href="pepekovo">{keyword}</a>',
  'dámské džíny' => '<a href="pepekovo">{keyword}</a>',
  'dámské hodinky' => '<a href="pepekovo">{keyword}</a>',
  'dámské kalhoty' => '<a href="pepekovo">{keyword}</a>',
  'dámské košile' => '<a href="pepekovo">{keyword}</a>',
  'dámské kožené bundy' => '<a href="pepekovo">{keyword}</a>',
  'dámské levné mikiny' => '<a href="pepekovo">{keyword}</a>',
  'dámské mikiny' => '<a href="pepekovo">{keyword}</a>',
  'dámské mikiny s kapucí' => '<a href="pepekovo">{keyword}</a>',
  'dámské mikiny výprodej' => '<a href="pepekovo">{keyword}</a>',
  'dámské oblečení' => '<a href="pepekovo">{keyword}</a>',
  'dámské peněženky' => '<a href="pepekovo">{keyword}</a>',
  'dámské plážové oblečení' => '<a href="pepekovo">{keyword}</a>',
  'dámské pletené svetry' => '<a href="pepekovo">{keyword}</a>',
  'dámské soupravy' => '<a href="pepekovo">{keyword}</a>',
  'dámské spodní prádlo' => '<a href="pepekovo">{keyword}</a>',
  'dámské svetry' => '<a href="pepekovo">{keyword}</a>',
  'dámské šátky' => '<a href="pepekovo">{keyword}</a>',
  'dámské šaty' => '<a href="pepekovo">{keyword}</a>',
  'dámské teplákové soupravy' => '<a href="pepekovo">{keyword}</a>',
  'dámské tepláky' => '<a href="pepekovo">{keyword}</a>',
  'dámské vesty' => '<a href="pepekovo">{keyword}</a>',
  'dámské zimní boty' => '<a href="pepekovo">{keyword}</a>',
  'dámské zimní bundy' => '<a href="pepekovo">{keyword}</a>',
  'dámské zimní bundy 2011' => '<a href="pepekovo">{keyword}</a>',
  'dámské zimní bundy výprodej' => '<a href="pepekovo">{keyword}</a>',
  'dámské zimní kabátky' => '<a href="pepekovo">{keyword}</a>',
  'dámské zimní kabáty' => '<a href="pepekovo">{keyword}</a>',
  'dámské zimní kozačky' => '<a href="pepekovo">{keyword}</a>',
  'dentální hygiena' => '<a href="pepekovo">{keyword}</a>',
  'dentální hygiena brno' => '<a href="pepekovo">{keyword}</a>',
  'design webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'děti, dětské oblečení' => '<a href="pepekovo">{keyword}</a>',
  'dětská móda' => '<a href="pepekovo">{keyword}</a>',
  'dětská optika' => '<a href="pepekovo">{keyword}</a>',
  'dětské botičky' => '<a href="pepekovo">{keyword}</a>',
  'dětské boty' => '<a href="pepekovo">{keyword}</a>',
  'dětské brýle' => '<a href="pepekovo">{keyword}</a>',
  'dětské čepice' => '<a href="pepekovo">{keyword}</a>',
  'dětské kalhoty' => '<a href="pepekovo">{keyword}</a>',
  'dětské mikiny' => '<a href="pepekovo">{keyword}</a>',
  'dětské oblečení' => '<a href="pepekovo">{keyword}</a>',
  'dětské ponožky' => '<a href="pepekovo">{keyword}</a>',
  'dětské spodní prádlo' => '<a href="pepekovo">{keyword}</a>',
  'dětské zimní boty' => '<a href="pepekovo">{keyword}</a>',
  'dětské zimní čepice, dětské čepice' => '<a href="pepekovo">{keyword}</a>',
  'dětské zimní oblečení' => '<a href="pepekovo">{keyword}</a>',
  'domény' => '<a href="pepekovo">{keyword}</a>',
  'dotace pro podnikatele' => '<a href="pepekovo">{keyword}</a>',
  'dotace z eu' => '<a href="pepekovo">{keyword}</a>',
  'endodoncie brno' => '<a href="pepekovo">{keyword}</a>',
  'famous stars' => '<a href="pepekovo">{keyword}</a>',
  'famous stars and straps' => '<a href="pepekovo">{keyword}</a>',
  'firemní akce' => '<a href="pepekovo">{keyword}</a>',
  'firemní web' => '<a href="pepekovo">{keyword}</a>',
  'fitness' => '<a href="pepekovo">{keyword}</a>',
  'fitness praha 2' => '<a href="pepekovo">{keyword}</a>',
  'fráze' => '<a href="pepekovo">{keyword}</a>',
  'grafický návrh webu' => '<a href="pepekovo">{keyword}</a>',
  'hip hop' => '<a href="pepekovo">{keyword}</a>',
  'hip hop kšiltovky' => '<a href="pepekovo">{keyword}</a>',
  'hip hop oblečení' => '<a href="pepekovo">{keyword}</a>',
  'hip hop praha' => '<a href="pepekovo">{keyword}</a>',
  'hip hop shop' => '<a href="pepekovo">{keyword}</a>',
  'hip hop shop nejlevnější' => '<a href="pepekovo">{keyword}</a>',
  'hip hop teplákové soupravy' => '<a href="pepekovo">{keyword}</a>',
  'hoodboyz' => '<a href="pepekovo">{keyword}</a>',
  'hoodboyz soupravy' => '<a href="pepekovo">{keyword}</a>',
  'hoodboyz tepláky' => '<a href="pepekovo">{keyword}</a>',
  'hovno' => '<a href="pepekovo">{keyword}</a>',
  'hra' => '<a href="pepekovo">{keyword}</a>',
  'hypotéka' => '<a href="pepekovo">{keyword}</a>',
  'ikea kuchyně' => '<a href="pepekovo">{keyword}</a>',
  'interiéry' => '<a href="pepekovo">{keyword}</a>',
  'interiéry bytů' => '<a href="pepekovo">{keyword}</a>',
  'interiéry fotogalerie' => '<a href="pepekovo">{keyword}</a>',
  'interiéry ložnic' => '<a href="pepekovo">{keyword}</a>',
  'interiéry moderní' => '<a href="pepekovo">{keyword}</a>',
  'interiéry obyvacích pokojů' => '<a href="pepekovo">{keyword}</a>',
  'internetové stránky zdarma' => '<a href="pepekovo">{keyword}</a>',
  'jack & jones' => '<a href="pepekovo">{keyword}</a>',
  'jak si vytvořit webové stránky' => '<a href="pepekovo">{keyword}</a>',
  'jak vytvořit internetové stránky' => '<a href="pepekovo">{keyword}</a>',
  'jak vytvořit internetovou stránku' => '<a href="pepekovo">{keyword}</a>',
  'jak vytvořit www stránky' => '<a href="pepekovo">{keyword}</a>',
  'jazykové kurzy brno' => '<a href="pepekovo">{keyword}</a>',
  'jednoduchá tvorba webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'jednoduché webové stránky' => '<a href="pepekovo">{keyword}</a>',
  'jesličky brno' => '<a href="pepekovo">{keyword}</a>',
  'kalhoty sportovní' => '<a href="pepekovo">{keyword}</a>',
  'kavitace' => '<a href="pepekovo">{keyword}</a>',
  'kniha' => '<a href="pepekovo">{keyword}</a>',
  'kojenecké oblečení' => '<a href="pepekovo">{keyword}</a>',
  'kojenecké soupravy' => '<a href="pepekovo">{keyword}</a>',
  'kojenecké zimní oblečení' => '<a href="pepekovo">{keyword}</a>',
  'kondiční jízdy' => '<a href="pepekovo">{keyword}</a>',
  'kontaktní čočky' => '<a href="pepekovo">{keyword}</a>',
  'kosmetické studio' => '<a href="pepekovo">{keyword}</a>',
  'koupelny' => '<a href="pepekovo">{keyword}</a>',
  'koupelny brno' => '<a href="pepekovo">{keyword}</a>',
  'koupelny fotogalerie' => '<a href="pepekovo">{keyword}</a>',
  'koupelny inspirace' => '<a href="pepekovo">{keyword}</a>',
  'kožené bundy' => '<a href="pepekovo">{keyword}</a>',
  'kožené rukavice' => '<a href="pepekovo">{keyword}</a>',
  'křesla' => '<a href="pepekovo">{keyword}</a>',
  'kšiltovky' => '<a href="pepekovo">{keyword}</a>',
  'kuchyně' => '<a href="pepekovo">{keyword}</a>',
  'kuchyně fotogalerie' => '<a href="pepekovo">{keyword}</a>',
  'kuchyně levně' => '<a href="pepekovo">{keyword}</a>',
  'kuchyně rustikalní' => '<a href="pepekovo">{keyword}</a>',
  'kurzy angličtiny brno' => '<a href="pepekovo">{keyword}</a>',
  'květinářství brno' => '<a href="pepekovo">{keyword}</a>',
  'laboratoře' => '<a href="pepekovo">{keyword}</a>',
  'letní šaty' => '<a href="pepekovo">{keyword}</a>',
  'levné mikiny' => '<a href="pepekovo">{keyword}</a>',
  'levné oblečení' => '<a href="pepekovo">{keyword}</a>',
  'levné webové stránky' => '<a href="pepekovo">{keyword}</a>',
  'levné zimní bundy' => '<a href="pepekovo">{keyword}</a>',
  'luxusní dětské oblečení' => '<a href="pepekovo">{keyword}</a>',
  'luxusní pánské hodinky' => '<a href="pepekovo">{keyword}</a>',
  'masáže praha' => '<a href="pepekovo">{keyword}</a>',
  'matrace' => '<a href="pepekovo">{keyword}</a>',
  'mikiny' => '<a href="pepekovo">{keyword}</a>',
  'mikiny nike' => '<a href="pepekovo">{keyword}</a>',
  'mikiny s kapuci' => '<a href="pepekovo">{keyword}</a>',
  'mikiny výprodej' => '<a href="pepekovo">{keyword}</a>',
  'mp3' => '<a href="pepekovo">{keyword}</a>',
  'nábytek' => '<a href="pepekovo">{keyword}</a>',
  'nábytek brno' => '<a href="pepekovo">{keyword}</a>',
  'nábytek z masivu' => '<a href="pepekovo">{keyword}</a>',
  'nákupní centrum' => '<a href="pepekovo">{keyword}</a>',
  'nejlevnější hip hop shop' => '<a href="pepekovo">{keyword}</a>',
  'německé cestovní kanceláře' => '<a href="pepekovo">{keyword}</a>',
  'new era' => '<a href="pepekovo">{keyword}</a>',
  'new era kšiltovky' => '<a href="pepekovo">{keyword}</a>',
  'novorozenencké oblečení' => '<a href="pepekovo">{keyword}</a>',
  'nutrend' => '<a href="pepekovo">{keyword}</a>',
  'objektivy' => '<a href="pepekovo">{keyword}</a>',
  'obklady do koupelny' => '<a href="pepekovo">{keyword}</a>',
  'obklady do kuchyně' => '<a href="pepekovo">{keyword}</a>',
  'oblečení' => '<a href="pepekovo">{keyword}</a>',
  'obuv' => '<a href="pepekovo">{keyword}</a>',
  'ocelové šperky' => '<a href="pepekovo">{keyword}</a>',
  'oční lékař' => '<a href="pepekovo">{keyword}</a>',
  'okno' => '<a href="pepekovo">{keyword}</a>',
  'oplocení' => '<a href="pepekovo">{keyword}</a>',
  'optika' => '<a href="pepekovo">{keyword}</a>',
  'outdoor bundy' => '<a href="pepekovo">{keyword}</a>',
  'outsourcing it' => '<a href="pepekovo">{keyword}</a>',
  'pánská móda' => '<a href="pepekovo">{keyword}</a>',
  'pánská móda 2011' => '<a href="pepekovo">{keyword}</a>',
  'pánská obuv' => '<a href="pepekovo">{keyword}</a>',
  'pánská tílka' => '<a href="pepekovo">{keyword}</a>',
  'pánská trička' => '<a href="pepekovo">{keyword}</a>',
  'pánské boty' => '<a href="pepekovo">{keyword}</a>',
  'pánské boxerky' => '<a href="pepekovo">{keyword}</a>',
  'pánské bundy' => '<a href="pepekovo">{keyword}</a>',
  'pánské čepice' => '<a href="pepekovo">{keyword}</a>',
  'pánské doplňky' => '<a href="pepekovo">{keyword}</a>',
  'pánské džíny' => '<a href="pepekovo">{keyword}</a>',
  'pánské kalhoty' => '<a href="pepekovo">{keyword}</a>',
  'pánské košile' => '<a href="pepekovo">{keyword}</a>',
  'pánské kotníkové boty' => '<a href="pepekovo">{keyword}</a>',
  'pánské kožené bundy' => '<a href="pepekovo">{keyword}</a>',
  'pánské kšiltovky' => '<a href="pepekovo">{keyword}</a>',
  'pánské luxusní košile' => '<a href="pepekovo">{keyword}</a>',
  'pánské mikiny' => '<a href="pepekovo">{keyword}</a>',
  'pánské mikiny se zipem' => '<a href="pepekovo">{keyword}</a>',
  'pánské náramky' => '<a href="pepekovo">{keyword}</a>',
  'pánské oblečení' => '<a href="pepekovo">{keyword}</a>',
  'pánské opasky' => '<a href="pepekovo">{keyword}</a>',
  'pánské peněženky' => '<a href="pepekovo">{keyword}</a>',
  'pánské ponožky' => '<a href="pepekovo">{keyword}</a>',
  'pánské soupravy' => '<a href="pepekovo">{keyword}</a>',
  'pánské spodní prádlo' => '<a href="pepekovo">{keyword}</a>',
  'pánské společenské boty' => '<a href="pepekovo">{keyword}</a>',
  'pánské svetry' => '<a href="pepekovo">{keyword}</a>',
  'pánské šály' => '<a href="pepekovo">{keyword}</a>',
  'pánské teplákové soupravy' => '<a href="pepekovo">{keyword}</a>',
  'pánské tepláky' => '<a href="pepekovo">{keyword}</a>',
  'pánské trenýrky' => '<a href="pepekovo">{keyword}</a>',
  'pánské vesty' => '<a href="pepekovo">{keyword}</a>',
  'pánské větrovky' => '<a href="pepekovo">{keyword}</a>',
  'pánské zimní boty' => '<a href="pepekovo">{keyword}</a>',
  'pánské zimní bundy' => '<a href="pepekovo">{keyword}</a>',
  'pánské zimní kabáty' => '<a href="pepekovo">{keyword}</a>',
  'permanentní make-up' => '<a href="pepekovo">{keyword}</a>',
  'plážové oblečení' => '<a href="pepekovo">{keyword}</a>',
  'plážové šaty' => '<a href="pepekovo">{keyword}</a>',
  'pletené čepice' => '<a href="pepekovo">{keyword}</a>',
  'pletené svetry' => '<a href="pepekovo">{keyword}</a>',
  'pletené šály' => '<a href="pepekovo">{keyword}</a>',
  'pletivo' => '<a href="pepekovo">{keyword}</a>',
  'ploty' => '<a href="pepekovo">{keyword}</a>',
  'podzimní bundy' => '<a href="pepekovo">{keyword}</a>',
  'podzimní vesty' => '<a href="pepekovo">{keyword}</a>',
  'porno' => '<a href="pepekovo">{keyword}</a>',
  'posilovací stroje' => '<a href="pepekovo">{keyword}</a>',
  'povinné ručení' => '<a href="pepekovo">{keyword}</a>',
  'práce' => '<a href="pepekovo">{keyword}</a>',
  'praha' => '<a href="pepekovo">{keyword}</a>',
  'privátní sauna' => '<a href="pepekovo">{keyword}</a>',
  'privátní vířivka' => '<a href="pepekovo">{keyword}</a>',
  'privátní whirlpool' => '<a href="pepekovo">{keyword}</a>',
  'prodej bytů praha' => '<a href="pepekovo">{keyword}</a>',
  'profesionální webdesign' => '<a href="pepekovo">{keyword}</a>',
  'program na tvorbu webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'programy pro tvorbu webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'projekční kancelář' => '<a href="pepekovo">{keyword}</a>',
  'projektová dokumentace' => '<a href="pepekovo">{keyword}</a>',
  'projektování staveb' => '<a href="pepekovo">{keyword}</a>',
  'pronájem eshopu' => '<a href="pepekovo">{keyword}</a>',
  'proteinové nápoje' => '<a href="pepekovo">{keyword}</a>',
  'proteiny' => '<a href="pepekovo">{keyword}</a>',
  'příspěvek na bydlení' => '<a href="pepekovo">{keyword}</a>',
  'ptáci' => '<a href="pepekovo">{keyword}</a>',
  'půjčka' => '<a href="pepekovo">{keyword}</a>',
  'půjčovna aut' => '<a href="pepekovo">{keyword}</a>',
  'půjčovna aut brno' => '<a href="pepekovo">{keyword}</a>',
  'půjčovna aut olomouc' => '<a href="pepekovo">{keyword}</a>',
  'půjčovna aut ostrava' => '<a href="pepekovo">{keyword}</a>',
  'půjčovna aut praha' => '<a href="pepekovo">{keyword}</a>',
  'raw blue' => '<a href="pepekovo">{keyword}</a>',
  'reklamní agentura' => '<a href="pepekovo">{keyword}</a>',
  'restaurace brno' => '<a href="pepekovo">{keyword}</a>',
  'rotopedy' => '<a href="pepekovo">{keyword}</a>',
  'sauna praha' => '<a href="pepekovo">{keyword}</a>',
  'spalovače tuků' => '<a href="pepekovo">{keyword}</a>',
  'sportovní kalhoty' => '<a href="pepekovo">{keyword}</a>',
  'sportovní oblečení' => '<a href="pepekovo">{keyword}</a>',
  'sportovní obuv' => '<a href="pepekovo">{keyword}</a>',
  'správa nemovitosti' => '<a href="pepekovo">{keyword}</a>',
  'správa nemovitosti brno' => '<a href="pepekovo">{keyword}</a>',
  'správa sítě brno' => '<a href="pepekovo">{keyword}</a>',
  'správa webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'správa webu' => '<a href="pepekovo">{keyword}</a>',
  'stativy' => '<a href="pepekovo">{keyword}</a>',
  'stavební dozor' => '<a href="pepekovo">{keyword}</a>',
  'stk praha' => '<a href="pepekovo">{keyword}</a>',
  'stolové nohy' => '<a href="pepekovo">{keyword}</a>',
  'stolové podnože' => '<a href="pepekovo">{keyword}</a>',
  'stoly' => '<a href="pepekovo">{keyword}</a>',
  'stomatologie' => '<a href="pepekovo">{keyword}</a>',
  'stomatologie brno' => '<a href="pepekovo">{keyword}</a>',
  'street dance praha' => '<a href="pepekovo">{keyword}</a>',
  'stříbrné šperky' => '<a href="pepekovo">{keyword}</a>',
  'sushi' => '<a href="pepekovo">{keyword}</a>',
  'šablony webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'šály a šátky' => '<a href="pepekovo">{keyword}</a>',
  'šátky na hlavu' => '<a href="pepekovo">{keyword}</a>',
  'šátky na krk' => '<a href="pepekovo">{keyword}</a>',
  'šperky' => '<a href="pepekovo">{keyword}</a>',
  'tandemový seskok' => '<a href="pepekovo">{keyword}</a>',
  'taneční škola praha' => '<a href="pepekovo">{keyword}</a>',
  'technický dozor investora' => '<a href="pepekovo">{keyword}</a>',
  'teplákové soupravy' => '<a href="pepekovo">{keyword}</a>',
  'teplákové soupravy akce' => '<a href="pepekovo">{keyword}</a>',
  'tepláky' => '<a href="pepekovo">{keyword}</a>',
  'termoprádlo' => '<a href="pepekovo">{keyword}</a>',
  'trička' => '<a href="pepekovo">{keyword}</a>',
  'tvorba eshopu' => '<a href="pepekovo">{keyword}</a>',
  'tvorba internetových stránek' => '<a href="pepekovo">{keyword}</a>',
  'tvorba internetových stránek zdarma' => '<a href="pepekovo">{keyword}</a>',
  'tvorba stránek zdarma' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webové stránky' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webových stránek cena' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webových stránek ceník' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webových stránek levně' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webových stránek návod' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webových stránek pro začátečníky' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webových stránek program' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webových stránek s administrací' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webových stránek zdarma' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webu ceník' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webu online' => '<a href="pepekovo">{keyword}</a>',
  'tvorba webu zdarma' => '<a href="pepekovo">{keyword}</a>',
  'tvorba www stránek' => '<a href="pepekovo">{keyword}</a>',
  'tvorba www stránek ceník' => '<a href="pepekovo">{keyword}</a>',
  'tvorba www stránek zdarma' => '<a href="pepekovo">{keyword}</a>',
  'tvorba www zdarma' => '<a href="pepekovo">{keyword}</a>',
  'tvoření webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'ubytování' => '<a href="pepekovo">{keyword}</a>',
  'ubytování šumava' => '<a href="pepekovo">{keyword}</a>',
  'udržba zeleně' => '<a href="pepekovo">{keyword}</a>',
  'úklid brno' => '<a href="pepekovo">{keyword}</a>',
  'vany do koupelny' => '<a href="pepekovo">{keyword}</a>',
  'vero moda' => '<a href="pepekovo">{keyword}</a>',
  'video' => '<a href="pepekovo">{keyword}</a>',
  'víno' => '<a href="pepekovo">{keyword}</a>',
  'výprodej oblečení' => '<a href="pepekovo">{keyword}</a>',
  'vytváření webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'vytvoření stránek' => '<a href="pepekovo">{keyword}</a>',
  'vytvoření webové stránky' => '<a href="pepekovo">{keyword}</a>',
  'vytvoření webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'vytvoření webových stránek zdarma' => '<a href="pepekovo">{keyword}</a>',
  'vytvoření www stránek' => '<a href="pepekovo">{keyword}</a>',
  'vytvořit webové stránky' => '<a href="pepekovo">{keyword}</a>',
  'výuka angličtiny brno' => '<a href="pepekovo">{keyword}</a>',
  'web stranky tvorba' => '<a href="pepekovo">{keyword}</a>',
  'web stranky zadarmo' => '<a href="pepekovo">{keyword}</a>',
  'web stránky zdarma' => '<a href="pepekovo">{keyword}</a>',
  'web šablona' => '<a href="pepekovo">{keyword}</a>',
  'webová stránka zdarma' => '<a href="pepekovo">{keyword}</a>',
  'webové prezentace' => '<a href="pepekovo">{keyword}</a>',
  'webové stránky ceník' => '<a href="pepekovo">{keyword}</a>',
  'webové stránky s administrací' => '<a href="pepekovo">{keyword}</a>',
  'webové šablony' => '<a href="pepekovo">{keyword}</a>',
  'weby zdarma' => '<a href="pepekovo">{keyword}</a>',
  'wellness praha' => '<a href="pepekovo">{keyword}</a>',
  'www stránky levně' => '<a href="pepekovo">{keyword}</a>',
  'zahrada' => '<a href="pepekovo">{keyword}</a>',
  'zahradní domek' => '<a href="pepekovo">{keyword}</a>',
  'zahradní domky' => '<a href="pepekovo">{keyword}</a>',
  'zahradní jezírka' => '<a href="pepekovo">{keyword}</a>',
  'zahradní krby' => '<a href="pepekovo">{keyword}</a>',
  'zahradní nábytek' => '<a href="pepekovo">{keyword}</a>',
  'zahradní technika' => '<a href="pepekovo">{keyword}</a>',
  'zahradní traktory' => '<a href="pepekovo">{keyword}</a>',
  'založení webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'zážitky jako dárek' => '<a href="pepekovo">{keyword}</a>',
  'zdravotní matrace' => '<a href="pepekovo">{keyword}</a>',
  'zhotovení webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'zimní boty' => '<a href="pepekovo">{keyword}</a>',
  'zimní bunda' => '<a href="pepekovo">{keyword}</a>',
  'zimní bundy' => '<a href="pepekovo">{keyword}</a>',
  'zimní bundy 2011' => '<a href="pepekovo">{keyword}</a>',
  'zimní bundy výprodej' => '<a href="pepekovo">{keyword}</a>',
  'zimní čepice' => '<a href="pepekovo">{keyword}</a>',
  'zimní dámské čepice' => '<a href="pepekovo">{keyword}</a>',
  'zimní dětské čepice' => '<a href="pepekovo">{keyword}</a>',
  'zimní kožené bundy' => '<a href="pepekovo">{keyword}</a>',
  'zimní oblečení' => '<a href="pepekovo">{keyword}</a>',
  'zimní obuv' => '<a href="pepekovo">{keyword}</a>',
  'zimní rukavice' => '<a href="pepekovo">{keyword}</a>',
  'zimní vesty' => '<a href="pepekovo">{keyword}</a>',
  'zimní zahrada' => '<a href="pepekovo">{keyword}</a>',
  'značkové mikiny' => '<a href="pepekovo">{keyword}</a>',
  'značkové oblečení' => '<a href="pepekovo">{keyword}</a>',
  'značkové teplákové soupravy' => '<a href="pepekovo">{keyword}</a>',
  'zubař brno' => '<a href="pepekovo">{keyword}</a>',
  'zubní ordinace' => '<a href="pepekovo">{keyword}</a>',
  'zubní ordinace brno' => '<a href="pepekovo">{keyword}</a>',
  'židle' => '<a href="pepekovo">{keyword}</a>',
  'časem' => '<a href="pepekovo">{keyword}</a>',
  'měla bych' => '<a href="pepekovo">{keyword}</a>',
  'černokněžníkovi' => '<a href="pepekovo">{keyword}</a>',
  'až' => '<a href="pepekovo">{keyword}</a>',
  'otázky' => '<a href="pepekovo">{keyword}</a>',
};

my $timer = Benchmark::Timer->new();

$timer->start('creating page');
my $page = HTMLPage->from_string($html);
$timer->stop;

$timer->start('parsing words');
$page->replace($replacements);
$timer->stop;
$timer->report;

my $word = '';
binmode(STDERR, ":utf8");
foreach $word (@{$page->{'word_replacements'}}) {
  print STDERR "$word\n";
}

$html = $page->get_html();
print $html;
