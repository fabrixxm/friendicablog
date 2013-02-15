      <article id="search-$item.id" class="search">
        <footer class="search-meta">
          <div class="search-author vcard">
            <img class="avatar avatar-68 photo avatar-default " alt="" title="$item.name" src="$item.thumb"  height="68" width="68">
            <span class="fn dropmenu">
              <a href="$item.profile_url" rel="external nofollow" class="url" title="$item.linktitle">$item.name</a>
              <ul class="menu-popup" id="author-menu-$item.id">
                    $item.item_photo_menu
                </ul>                                  
            </span>
             
            <a href="$item.plink.href">
              <time datetime="$item.localtime">$item.ago</time>
            </a>
          </div>
          <!-- .comment-author .vcard -->
        </footer>
        {{ if $item.title }}
        <header class="search-header">
                    <h1><a rel="bookmark" title="Permalink" href="$item.plink.href">$item.title</a></h1>
        </header>
        {{ endif }}
        <div class="search-content">
          <p>$item.body</p>
        </div>

		<footer class="entry-meta">
			{{ if $item.conv }}
					<a href='$item.conv.href'title='$item.conv.title'>$item.conv.title</a>
			{{ endif }}
        </footer><!-- #entry-meta -->
		
      </article>

