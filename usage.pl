#!/usr/bin/perl -w

use encoding 'utf8';

use strict;
use warnings;
use diagnostics;
use HTMLPage;
use Benchmark::Timer;


my $html = <<HTML;
<?xml version="1.0" encoding="utf-8"?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs-cz" lang="cs-cz" dir="ltr" >



<head>
  <base href="http://zazo.4fan.cz/" />
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta name="robots" content="index, follow" />
  <meta name="keywords" content="zazo, hp povídky, harry potter" />
  <meta name="description" content="Povídky ze světa Harryho Pottera, Zazo" />
  <meta name="generator" content="Joomla! 1.5 - Open Source Content Management" />
  <title>Povídky ze světa HP</title>
  <link href="/index.php?format=feed&amp;type=rss" rel="alternate" type="application/rss+xml" title="RSS 2.0" />
  <link href="/index.php?format=feed&amp;type=atom" rel="alternate" type="application/atom+xml" title="Atom 1.0" />
  <link href="/templates/joomspirit_43/favicon.ico" rel="shortcut icon" type="image/x-icon" />
  <link rel="stylesheet" href="/components/com_jcomments/tpl/default/style.css?v=12" type="text/css" />
  <script type="text/javascript" src="/media/system/js/mootools.js"></script>
  <script type="text/javascript" src="/media/system/js/caption.js"></script>


<!-- style sheet links -->
<link rel="stylesheet" href="/templates/system/css/general.css" type="text/css" />
<link rel="stylesheet" href="/templates/joomspirit_43/css/main.css" type="text/css" />
<link rel="stylesheet" href="/templates/joomspirit_43/css/nav.css" type="text/css" />
<link rel="stylesheet" href="/templates/joomspirit_43/css/typo.css" type="text/css" />
<link rel="stylesheet" href="/templates/joomspirit_43/css/moomenuh.css" type="text/css" />



<!--[if lt IE 7]>
<link rel="stylesheet" href="/templates/joomspirit_43/css/ie6.css" type="text/css" />
<![endif]-->

<!--	Moomenu horizontal	-->
<script src="/templates/joomspirit_43/lib/js/moomenuh.js" type="text/javascript"></script>

<!--	effect mootools		-->
<script src="/templates/joomspirit_43/lib/js/tooltips.js" type="text/javascript"></script>




</head>

<body style="font-size:12px;" >


		<div id="wrapper" style="width:960px;">

			<!--	nav	main -->
						<div id="nav_main">
				<table align="center">
				<tr><td>
						<div class="moduletable_menu">
					<ul class="menu" id="main_menu"><li id="current" class="active item1"><a href="http://zazo.4fan.cz/"><span>Domů</span></a></li><li class="parent item53"><a href="/zazo.html"><span>Zazo</span></a><ul><li class="item56"><a href="/zazo/bezvaprazdniny.html"><span>Bezva prázdniny</span></a></li><li class="item96"><a href="/zazo/lord-z-tirosu.html" target="_blank"><span>Lord z Tirosu</span></a></li></ul></li><li class="parent item59"><a href="/dollow.html"><span>Dollow</span></a><ul><li class="item61"><a href="/dollow/hpafz.html"><span>Harry Potter &amp; Frozen Throne</span></a></li></ul></li><li class="parent item55"><a href="/spolecne.html"><span>Společné</span></a><ul><li class="item66"><a href="/spolecne/cernokneznik.html"><span>Černokněžník</span></a></li><li class="item76"><a href="/spolecne/nove-bradavice.html"><span>Nové Bradavice</span></a></li></ul></li><li class="parent item54"><a href="/sabrine.html"><span>Sabrine</span></a><ul><li class="item77"><a href="/sabrine/ad-dobra.html"><span>Řád dobra</span></a></li></ul></li></ul>		</div>

				</td></tr>
				</table>
			</div>


			<div id="middle_site">

								<div id="left" style="width:200px;">

				<div class="moduletable ">
					<div class="texte">

												<h3 class="module"><span class="module-2">Novinky</span></h3>

						<div class="content">
							<ul class="latestnews">
	<li class="latestnews">
		<a href="/zazo/lord-z-tirosu/95-5-kapitola-lztu.html" class="latestnews">
			5. kapitola (LZT¨)</a>
	</li>
	<li class="latestnews">
		<a href="/zazo/lord-z-tirosu/94-4-kapitola-lzt.html" class="latestnews">
			4. kapitola (LZT)</a>
	</li>
	<li class="latestnews">
		<a href="/zazo/lord-z-tirosu/92-3-kapitola-lzt.html" class="latestnews">
			3. kapitola (LZT)</a>
	</li>
	<li class="latestnews">
		<a href="/zazo/lord-z-tirosu/91-2-kapitola-lzt.html" class="latestnews">
			2. kapitola (LZT)</a>
	</li>
	<li class="latestnews">
		<a href="/zazo/lord-z-tirosu/90-1-kapitola-lzt.html" class="latestnews">
			1. kapitola (LZT)</a>
	</li>
	<li class="latestnews">
		<a href="/zazo/lord-z-tirosu/89-prolog-lzt.html" class="latestnews">
			Prolog (LZT)</a>
	</li>
	<li class="latestnews">
		<a href="/sabrine/ad-dobra/88-prolog-d.html" class="latestnews">
			Prolog (ŘD)</a>
	</li>
</ul>						</div>
					</div>
				</div>


				<div class="moduletable ">
					<div class="texte">

												<h3 class="module"><span class="module-2">Hledat</span></h3>

						<div class="content">
							<form action="index.php" method="post">
	<div class="search">
		<input name="searchword" id="mod_search_searchword" maxlength="20" alt="Hledat" class="inputbox" type="text" size="20" value="hledat..."  onblur="if(this.value=='') this.value='hledat...';" onfocus="if(this.value=='hledat...') this.value='';" />	</div>
	<input type="hidden" name="task"   value="search" />
	<input type="hidden" name="option" value="com_search" />
	<input type="hidden" name="Itemid" value="1" />
</form>						</div>
					</div>
				</div>


				</div>

								<div id="right" style="width:200px;">

				<div class="moduletable ">
					<div class="texte">

												<h3 class="module"><span class="module-2">Stav</span></h3>

						<div class="content">
							<strong>Členové</strong> : 1<br />
<strong>Obsah</strong> : 44<br />
<strong>Odkazy</strong> : 6<br />
<strong>Počet zobrazení článků</strong> : 48243<br />
						</div>
					</div>
				</div>


				<div class="moduletable ">
					<div class="texte">

												<h3 class="module"><span class="module-2">Nejčtenější</span></h3>

						<div class="content">
							<ul class="mostread">
	<li class="mostread">
		<a href="/zazo/bezvaprazdniny/46-prolog.html" class="mostread">
			Prolog (BP)</a>
	</li>
	<li class="mostread">
		<a href="/zazo/lord-z-tirosu/95-5-kapitola-lztu.html" class="mostread">
			5. kapitola (LZT¨)</a>
	</li>
	<li class="mostread">
		<a href="/zazo/bezvaprazdniny/47-1-kapitola.html" class="mostread">
			1. kapitola (BP)</a>
	</li>
	<li class="mostread">
		<a href="/spolecne/cernokneznik/51-prolog.html" class="mostread">
			Prolog (Č)</a>
	</li>
	<li class="mostread">
		<a href="/zazo/bezvaprazdniny/50-zaatky-jsou-vdy-nejhori.html" class="mostread">
			2. kapitola (BP)</a>
	</li>
</ul>						</div>
					</div>
				</div>


				</div>


				<div id="main_component" >





					<!--  MAIN COMPONENT -->



<div class="blog">


			<div class="leading">


<h2 class="contentheading">
	Přidávání</h2>



<p class="buttonheading">
	<a href="/index.php?view=article&amp;id=85:pidavani&amp;format=pdf" title="PDF" onclick="window.open(this.href,'win2','status=no,toolbar=no,scrollbars=yes,titlebar=no,menubar=no,resizable=yes,width=640,height=480,directories=no,location=no'); return false;" rel="nofollow"><img src="/templates/joomspirit_43/images/pdf_button.png" alt="PDF"  /></a><a href="/index.php?view=article&amp;id=85:pidavani&amp;tmpl=component&amp;print=1&amp;layout=default&amp;page=" title="Tisk" onclick="window.open(this.href,'win2','status=no,toolbar=no,scrollbars=yes,titlebar=no,menubar=no,resizable=yes,width=640,height=480,directories=no,location=no'); return false;" rel="nofollow"><img src="/templates/joomspirit_43/images/printButton.png" alt="Tisk"  /></a><a href="/component/mailto/?tmpl=component&amp;link=aHR0cDovL3phem8uNGZhbi5jei9jb21wb25lbnQvY29udGVudC9hcnRpY2xlLzg1LXBpZGF2YW5pLmh0bWw%3D" title="Email" onclick="window.open(this.href,'win2','width=400,height=350,menubar=yes,resizable=yes'); return false;"><img src="/templates/joomspirit_43/images/emailButton.png" alt="Email"  /></a></p>




<p class="iteminfo">
		<span class="modifydate">
		LAST_UPDATED2	</span>
			<span class="createdby">
		Napsal uživatel Administrator	</span>


		<span class="createdate">
		Pondělí, 20 Červen 2011 19:03	</span>
	</p>




<p><span style="font-family: andale mono,times;"><span style="font-size: 12pt;">Odjíždím dnes na dovolenou, ale hned, jak se vrátím, tak přidám kapitolu k LZT a černokněžníkovi. Měla bych se vrátit v pátek ;). Tedy 29. července můžete očekávat kapitol.</span></span></p>
<p><span style="font-family: andale mono,times;"><span style="font-size: 12pt;"></span></span><span style="font-family: andale mono,times;"><span style="font-size: 12pt;">Bradavice, Lovec&nbsp;- časem začnu s přidáváním</span></span></p>
<p><span style="font-family: andale mono,times;"><span style="font-size: 12pt;">Až budu mít náladu trochu upravím stránky.</span></span></p>
<p><span style="font-family: andale mono,times;"><span style="font-size: 12pt;">
<hr />
Otázky k ohledně datumů či neuvěřejněných povídek pište sem do komentářů :-) </span></span>
<p><span style="font-family: andale mono,times;">&nbsp;</span></p>
</p>
<p><span style="font-family: andale mono,times;"></span></p><div class="jcomments-links"> <a href="/component/content/article/85-pidavani.html#comments" class="comments-link">Komentáře (37)</a> </div>




		</div>
		<span class="leading_separator">&nbsp;</span>





	</div>




					<div style="display:none;text-indent:-9999px;font-size:0;line-height:0;"><a href="http://www.joomspirit.com" title="joomla template">joomla template</a></div>
				</div>

				<div class="clr"></div>

			</div>	<!--	END OF MIDDLE SITE	-->

			<div id="bottom_site">



			</div>	<!--	END OF BOTTOM_SITE	-->

		</div>	<!-- END OF WRAPPER	-->

		<div id="header">



		</div>	<!--	END OF HEADER	-->



<div  ><div class="dulezite">Značkové <a href="http://www.krutyhadry.cz" title="Kruté Hadry">oblečení</a> od světoznámých značek v eshopu <a href="http://nejlevnejsihiphop.cz" title="hip hop">nejlevnejsihiphop.cz</a>. Na našich stránkách naleznete bundy, <a href="http://www.levneteplaky.cz" title="Hip hop tepláky">tepláky</a>, trička a spoustu jiného je na <a href="http://www.nejvicobleceni.cz" title="Novinky z oblečení">hip hop shop</a>. Novinkou na našich stránkách jsou kolekce od Ecko, Raw Blue... jsme hustý <a href="http://www.hopshop.name" title="Výber z toho nej oblečení">hip hop shop</a>.</div></div> </body>
</html>
HTML

my $replacements = {
  'bradavice' => '<a href="pepekovo">{keyword}</a>',
  'pepek' => '<a href="pepekovo">{keyword}</a>',
  'ľščťžýíáéíťážý' => '<a href="pepekovo">{keyword}</a>',
  '2011 (2012) bydlení kalkulačka na příspě' => '<a href="pepekovo">{keyword}</a>',
  '2011 bydlení kalkulačka na příspě' => '<a href="pepekovo">{keyword}</a>',
  '3D architekt' => '<a href="pepekovo">{keyword}</a>',
  'Adidas' => '<a href="pepekovo">{keyword}</a>',
  'adidas boty' => '<a href="pepekovo">{keyword}</a>',
  'adidas damske soupravy' => '<a href="pepekovo">{keyword}</a>',
  'adidas dámské teplákové soupravy' => '<a href="pepekovo">{keyword}</a>',
  'Adidas Lady' => '<a href="pepekovo">{keyword}</a>',
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
  'autopůjčovna Brno' => '<a href="pepekovo">{keyword}</a>',
  'autopůjčovna Olomouc' => '<a href="pepekovo">{keyword}</a>',
  'autopůjčovna Ostrava' => '<a href="pepekovo">{keyword}</a>',
  'autopůjčovna Praha' => '<a href="pepekovo">{keyword}</a>',
  'autoškola Praha' => '<a href="pepekovo">{keyword}</a>',
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
  'Dada Supreme' => '<a href="pepekovo">{keyword}</a>',
  'Dada Supreme Lady' => '<a href="pepekovo">{keyword}</a>',
  'Dada Supreme Performance' => '<a href="pepekovo">{keyword}</a>',
  'dámská móda' => '<a href="pepekovo">{keyword}</a>',
  'dámská obuv' => '<a href="pepekovo">{keyword}</a>',
  'dámská trička' => '<a href="pepekovo">{keyword}</a>',
  'Dámská trička dlouhý rukáv' => '<a href="pepekovo">{keyword}</a>',
  'Dámské boty' => '<a href="pepekovo">{keyword}</a>',
  'dámské bundy' => '<a href="pepekovo">{keyword}</a>',
  'dámské doplňky' => '<a href="pepekovo">{keyword}</a>',
  'Dámské džíny' => '<a href="pepekovo">{keyword}</a>',
  'Dámské hodinky' => '<a href="pepekovo">{keyword}</a>',
  'dámské kalhoty' => '<a href="pepekovo">{keyword}</a>',
  'Dámské košile' => '<a href="pepekovo">{keyword}</a>',
  'Dámské kožené bundy' => '<a href="pepekovo">{keyword}</a>',
  'dámské levné mikiny' => '<a href="pepekovo">{keyword}</a>',
  'dámské mikiny' => '<a href="pepekovo">{keyword}</a>',
  'Dámské mikiny s kapucí' => '<a href="pepekovo">{keyword}</a>',
  'dámské mikiny výprodej' => '<a href="pepekovo">{keyword}</a>',
  'dámské oblečení' => '<a href="pepekovo">{keyword}</a>',
  'dámské peněženky' => '<a href="pepekovo">{keyword}</a>',
  'dámské plážové oblečení' => '<a href="pepekovo">{keyword}</a>',
  'Dámské pletené svetry' => '<a href="pepekovo">{keyword}</a>',
  'dámské soupravy' => '<a href="pepekovo">{keyword}</a>',
  'Dámské spodní prádlo' => '<a href="pepekovo">{keyword}</a>',
  'Dámské svetry' => '<a href="pepekovo">{keyword}</a>',
  'dámské šátky' => '<a href="pepekovo">{keyword}</a>',
  'dámské šaty' => '<a href="pepekovo">{keyword}</a>',
  'Dámské teplákové soupravy' => '<a href="pepekovo">{keyword}</a>',
  'dámské tepláky' => '<a href="pepekovo">{keyword}</a>',
  'Dámské vesty' => '<a href="pepekovo">{keyword}</a>',
  'dámské zimní boty' => '<a href="pepekovo">{keyword}</a>',
  'Dámské zimní bundy' => '<a href="pepekovo">{keyword}</a>',
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
  'Dětské kalhoty' => '<a href="pepekovo">{keyword}</a>',
  'dětské mikiny' => '<a href="pepekovo">{keyword}</a>',
  'dětské oblečení' => '<a href="pepekovo">{keyword}</a>',
  'dětské ponožky' => '<a href="pepekovo">{keyword}</a>',
  'Dětské spodní prádlo' => '<a href="pepekovo">{keyword}</a>',
  'dětské zimní boty' => '<a href="pepekovo">{keyword}</a>',
  'Dětské zimní čepice, dětské čepice' => '<a href="pepekovo">{keyword}</a>',
  'dětské zimní oblečení' => '<a href="pepekovo">{keyword}</a>',
  'domény' => '<a href="pepekovo">{keyword}</a>',
  'dotace pro podnikatele' => '<a href="pepekovo">{keyword}</a>',
  'dotace z EU' => '<a href="pepekovo">{keyword}</a>',
  'endodoncie brno' => '<a href="pepekovo">{keyword}</a>',
  'famous stars' => '<a href="pepekovo">{keyword}</a>',
  'famous stars and straps' => '<a href="pepekovo">{keyword}</a>',
  'firemní akce' => '<a href="pepekovo">{keyword}</a>',
  'firemní web' => '<a href="pepekovo">{keyword}</a>',
  'fitness' => '<a href="pepekovo">{keyword}</a>',
  'fitness Praha 2' => '<a href="pepekovo">{keyword}</a>',
  'Fráze' => '<a href="pepekovo">{keyword}</a>',
  'grafický návrh webu' => '<a href="pepekovo">{keyword}</a>',
  'hip hop' => '<a href="pepekovo">{keyword}</a>',
  'hip hop kšiltovky' => '<a href="pepekovo">{keyword}</a>',
  'hip hop oblečení' => '<a href="pepekovo">{keyword}</a>',
  'hip hop Praha' => '<a href="pepekovo">{keyword}</a>',
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
  'Jack & Jones' => '<a href="pepekovo">{keyword}</a>',
  'jak si vytvořit webové stránky' => '<a href="pepekovo">{keyword}</a>',
  'jak vytvořit internetové stránky' => '<a href="pepekovo">{keyword}</a>',
  'jak vytvořit internetovou stránku' => '<a href="pepekovo">{keyword}</a>',
  'jak vytvořit www stránky' => '<a href="pepekovo">{keyword}</a>',
  'jazykové kurzy Brno' => '<a href="pepekovo">{keyword}</a>',
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
  'koupelny Brno' => '<a href="pepekovo">{keyword}</a>',
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
  'kurzy angličtiny Brno' => '<a href="pepekovo">{keyword}</a>',
  'květinářství Brno' => '<a href="pepekovo">{keyword}</a>',
  'laboratoře' => '<a href="pepekovo">{keyword}</a>',
  'letní šaty' => '<a href="pepekovo">{keyword}</a>',
  'levné mikiny' => '<a href="pepekovo">{keyword}</a>',
  'levné oblečení' => '<a href="pepekovo">{keyword}</a>',
  'levné webové stránky' => '<a href="pepekovo">{keyword}</a>',
  'levné zimní bundy' => '<a href="pepekovo">{keyword}</a>',
  'luxusní dětské oblečení' => '<a href="pepekovo">{keyword}</a>',
  'luxusní pánské hodinky' => '<a href="pepekovo">{keyword}</a>',
  'masáže Praha' => '<a href="pepekovo">{keyword}</a>',
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
  'outsourcing IT' => '<a href="pepekovo">{keyword}</a>',
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
  'prodej bytů Praha' => '<a href="pepekovo">{keyword}</a>',
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
  'půjčovna aut Brno' => '<a href="pepekovo">{keyword}</a>',
  'půjčovna aut Olomouc' => '<a href="pepekovo">{keyword}</a>',
  'půjčovna aut Ostrava' => '<a href="pepekovo">{keyword}</a>',
  'půjčovna aut Praha' => '<a href="pepekovo">{keyword}</a>',
  'raw blue' => '<a href="pepekovo">{keyword}</a>',
  'reklamní agentura' => '<a href="pepekovo">{keyword}</a>',
  'restaurace Brno' => '<a href="pepekovo">{keyword}</a>',
  'rotopedy' => '<a href="pepekovo">{keyword}</a>',
  'sauna Praha' => '<a href="pepekovo">{keyword}</a>',
  'spalovače tuků' => '<a href="pepekovo">{keyword}</a>',
  'sportovní kalhoty' => '<a href="pepekovo">{keyword}</a>',
  'sportovní oblečení' => '<a href="pepekovo">{keyword}</a>',
  'sportovní obuv' => '<a href="pepekovo">{keyword}</a>',
  'správa nemovitosti' => '<a href="pepekovo">{keyword}</a>',
  'správa nemovitosti Brno' => '<a href="pepekovo">{keyword}</a>',
  'správa sítě Brno' => '<a href="pepekovo">{keyword}</a>',
  'správa webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'správa webu' => '<a href="pepekovo">{keyword}</a>',
  'stativy' => '<a href="pepekovo">{keyword}</a>',
  'stavební dozor' => '<a href="pepekovo">{keyword}</a>',
  'stk Praha' => '<a href="pepekovo">{keyword}</a>',
  'stolové nohy' => '<a href="pepekovo">{keyword}</a>',
  'stolové podnože' => '<a href="pepekovo">{keyword}</a>',
  'stoly' => '<a href="pepekovo">{keyword}</a>',
  'stomatologie' => '<a href="pepekovo">{keyword}</a>',
  'stomatologie Brno' => '<a href="pepekovo">{keyword}</a>',
  'street dance Praha' => '<a href="pepekovo">{keyword}</a>',
  'stříbrné šperky' => '<a href="pepekovo">{keyword}</a>',
  'sushi' => '<a href="pepekovo">{keyword}</a>',
  'šablony webových stránek' => '<a href="pepekovo">{keyword}</a>',
  'šály a šátky' => '<a href="pepekovo">{keyword}</a>',
  'šátky na hlavu' => '<a href="pepekovo">{keyword}</a>',
  'šátky na krk' => '<a href="pepekovo">{keyword}</a>',
  'šperky' => '<a href="pepekovo">{keyword}</a>',
  'tandemový seskok' => '<a href="pepekovo">{keyword}</a>',
  'taneční škola Praha' => '<a href="pepekovo">{keyword}</a>',
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
  'ubytování Šumava' => '<a href="pepekovo">{keyword}</a>',
  'udržba zeleně' => '<a href="pepekovo">{keyword}</a>',
  'úklid Brno' => '<a href="pepekovo">{keyword}</a>',
  'vany do koupelny' => '<a href="pepekovo">{keyword}</a>',
  'Vero Moda' => '<a href="pepekovo">{keyword}</a>',
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
  'výuka angličtiny Brno' => '<a href="pepekovo">{keyword}</a>',
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
  'wellness Praha' => '<a href="pepekovo">{keyword}</a>',
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
  'zubní ordinace Brno' => '<a href="pepekovo">{keyword}</a>',
  'židle' => '<a href="pepekovo">{keyword}</a>',
  'časem' => '<a href="pepekovo">{keyword}</a>',
  'měla bych' => '<a href="pepekovo">{keyword}</a>',
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
