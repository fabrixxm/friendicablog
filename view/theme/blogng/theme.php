<?php
/**
 * Name: Blog-NG
 * Version: 0.0.1
 * Author: Fabio <http://kirgroup.com/profile/fabrixxm>
 */
 
function blogng_init(&$a) {
	$a->theme_info = array(
		'family' => 'blog',
		'version' => '0.0.1'
		
	);
	set_template_engine($a, 'smarty3');
}