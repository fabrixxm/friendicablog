<!DOCTYPE html>

<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
	<head>
		<meta charset="utf-8" />

		<!-- Set the viewport width to device width for mobile -->
		<meta name="viewport" content="width=device-width" />

		<title><?php if (x($page, 'title')) echo $page['title'] ?></title>
		<script>var baseurl="<?php echo $a->get_baseurl() ?>";</script>

		<!-- Included CSS Files (Compressed) -->
		<link rel="stylesheet" href="<?php echo $a->get_baseurl() ?>/view/theme/blogng/stylesheets/foundation.min.css">
		<link rel="stylesheet" href="<?php echo $a->get_baseurl() ?>/view/theme/blogng/stylesheets/app.css">

		<script src="<?php echo $a->get_baseurl() ?>/view/theme/blogng/javascripts/modernizr.foundation.js"></script>

		<!-- IE Fix for HTML5 Tags -->
		<!--[if lt IE 9]>
		  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<!-- questo preferirei evitarlo, ma importa degli script che servono -->
		<?php if (x($page, 'htmlhead')) echo $page['htmlhead'] ?>
	</head>


	<body>
		<?php if (x($page, 'nav')) echo $page['nav']; ?>
		<div class="row">
			<div class="nine columns">
				<?php if (x($page, 'content')) echo $page['content']; ?>
			</div>
			<div class="three columns">
				<?php if (x($page, 'aside')) echo $page['aside']; ?>
			</div>
			
		</div>
		
		<!--
		<aside><?php if (x($page, 'aside')) echo $page['aside']; ?></aside>
		<section><?php if (x($page, 'content')) echo $page['content']; ?>
			<div id="page-footer"></div>
		</section>
		<right_aside><?php if (x($page, 'right_aside')) echo $page['right_aside']; ?></right_aside>
		<footer><?php if (x($page, 'footer')) echo $page['footer']; ?></footer>-->
		
		
		<!-- Included JS Files (Compressed) -->
		<!-- <script src="<?php echo $a->get_baseurl() ?>/view/theme/blogng/javascripts/jquery.js"></script> -->
		<script src="<?php echo $a->get_baseurl() ?>/view/theme/blogng/javascripts/foundation.min.js"></script>

		<!-- Initialize JS Plugins -->
		<script src="<?php echo $a->get_baseurl() ?>/view/theme/blogng/javascripts/app.js"></script>
	</body>
</html>

