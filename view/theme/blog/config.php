<?php
/**
 * Theme settings
 */



function theme_content(&$a){
	if(!local_user())
		return;		

    $headimg = get_pconfig(local_user(), 'blogtheme', 'headimg');
    $headimghome = get_pconfig(local_user(), 'blogtheme', 'headimghome');
    
	return blogtheme_form($a,$headimg, $headimghome);
}

function theme_post(&$a){
	if(! local_user())
		return;
	
	if (isset($_POST['blog-settings-submit'])){
		set_pconfig(local_user(), 'blogtheme', 'headimg',  $_POST['blog_headimg']);
		set_pconfig(local_user(), 'blogtheme', 'headimghome',  $_POST['blog_headimghome']);
	}
}


function theme_admin(&$a){
    $headimg = get_config('blogtheme', 'headimg');
    $headimghome = get_config('blogtheme', 'headimghome');

	return blogtheme_form($a,$headimg, $headimghome);
}

function theme_admin_post(&$a){
	if (isset($_POST['blog-settings-submit'])){
        set_config('blogtheme', 'headimg',  $_POST['blog_headimg']);
        set_config('blogtheme', 'headimghome',  $_POST['blog_headimghome']);
	}
}

function blogtheme_form(&$a, $headimg, $headimghome){
    
    if ($headimg === False) $headimg = ".willow.jpg"; 
    $imgs = array(
        "~none~" => t("None"),
        ".willow.jpg" => "willow.jpg",
        ".wheel.jpg" => "wheel.jpg",
    );

    
	$t = get_markup_template("config.tpl" );
	$o .= replace_macros($t, array(
		'$submit' => t('Submit'),
		'$baseurl' => $a->get_baseurl(),
		'$title' => t("Theme settings"),
		'$headimg' => array('blog_headimg', t('Header image'), $headimg, '', $imgs ),
		'$headimghome' => array('blog_headimghome', t('Header image only on profile pages'), $headimghome, ''),
	));
	return $o;
}
