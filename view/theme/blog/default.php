<?php 
    $headimg = get_config('blogtheme', 'headimg');
    $headimghome = get_config('blogtheme', 'headimghome');
    $headimghome = get_config('blogtheme', 'headimghome');
    if (local_user()) {
        $headimg = get_pconfig(local_user(), 'blogtheme', 'headimg');
        $headimghome = get_pconfig(local_user(), 'blogtheme', 'headimghome');
    }
    $headimg = blogtheme_imgurl($headimg);
   
    if ($headimghome && $a->module!='profile') $headimg="";
    
    if ($headimg === False) $headimg = $a->get_baseurl()."/view/theme/blog/headers/willow.jpg";
    
    
   
    // if mod==display whe are looking a single thread, delete aside content
    if  ($a->module=='display') { unset($page['aside']); unset($page['right_aside']); }

    // if no aside content, show page in singular mode
    $bodyclass="";
    if (!x($page,'aside') && !x($page,'right_aside')) $bodyclass.=" singular";
    
    
?><!DOCTYPE html >
<html>
<head>
  <title><?php if(x($page,'title')) echo $page['title'] ?></title>
  <script>var baseurl="<?php echo $a->get_baseurl() ?>";</script>
  <?php if(x($page,'htmlhead')) echo $page['htmlhead'] ?>
</head>
<body class="<?php echo $bodyclass;?>">
    <div id="page">
        <?php 
            if(x($page,'nav')){
                // header image
                echo str_replace("~blog.header.image~", $headimg, 
                       str_replace("~config.sitename~",get_config('config','sitename'),
                       str_replace("~system.banner~",get_config('system','banner'),
                            $page['nav']
                        )));
            }
        ?>
        
        <div id="main">
            <div id="primary">
                <div id="content" role="main">
                    <?php if(x($page,'content')) echo $page['content']; ?>
                </div>
            </div>
            <?php if (x($page,'aside') || x($page,'right_aside')) { ?>
            <div id="secondary" class="widget-area <?php if (in_array($a->module, array('profile','photos','display'))) echo 'overlap'; if ($headimg=="") echo " lower"; ?>" role="complementary">
                <?php if(x($page,'aside')) echo $page['aside']; ?>
                <?php if(x($page,'right_aside')) echo $page['right_aside']; ?>
            </div>
            <?php }?>
        </div>
        <footer id="colophon" role="contentinfo">
            <div id="site-generator">
                <a rel="generator" title="Personal Communication Platform" href="http://www.friendica.com/">Proudly powered by Friendica</a>
                <?php if(x($page,'footer')) echo $page['footer']; ?>
            </div>                        
        </footer>
    </div>
	<?php if(x($page,'end')) echo $page['end']; ?>
</body>
</html>

