<?php
/**
 * Name: Blog
 * Version: 0.5
 * Description: Blog theme ported from <a href='http://wordpress.org/extend/themes/twentyeleven'>Twenty Eleven wordpress theme</a>
 * Author: Fabio <http://kirgroup.com/profile/fabrixxm>
 * Maintainer: Fabio <http://kirgroup.com/profile/fabrixxm>
 */


function blog_init(&$a) {

    $a->theme_info = array();
}

function blog_install(&$a){
	register_hook('display_item', 'view/theme/blog/theme.php','blogtheme_display_item');
	logger("installed theme blog");
}
function blog_uninstall(&$a){
	unregister_hook('display_item', 'view/theme/blog/theme.php','blogtheme_display_item');
	logger("uninstalled theme blog");
}

function blogtheme_imgurl($headimg) {
    $a = get_app();
    if ($headimg[0]==".") return $a->get_baseurl().'/view/theme/blog/headers/'.substr($headimg,1);
    if ($headimg == "~none~") return "";
    return False;
}

function blogtheme_display_item(&$a, &$data){
	if (!is_null($data)) {
		$nick = $a->profile['nickname'];
		if (is_null($nick)) $nick = $a->user['nickname'];
		$data['output']['displaylink'] = $a->get_baseurl()."/display/".$nick."/".$data['item']['id'];
	}
	

}