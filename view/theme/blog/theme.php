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

function blogtheme_imgurl($headimg) {
    $a = get_app();
    if ($headimg[0]==".") return $a->get_baseurl().'/view/theme/blog/headers/'.substr($headimg,1);
    if ($headimg == "~none~") return "";
    return False;
}