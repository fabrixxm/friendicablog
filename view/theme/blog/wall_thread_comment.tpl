<li class="comment even thread-even depth-$item.thread_level" id="li-comment-$item.id">
      <article id="comment-$item.id" class="comment">
        <footer class="comment-meta">
          <div class="comment-author vcard">
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
            <span class="says">said:
            {{ if $item.threaded }}
            <a href="#respond-$item.id" class="reply-link">(reply)</a>
            {{ endif }}
            </span>
            
          </div>
          <!-- .comment-author .vcard -->
        </footer>
        <div class="comment-content">
          <p>$item.body</p>
        </div>
        <div class="reply">
              {{ for $item.children as $child }}
                {{ inc wall_thread_comment.tpl with $item=$child }}{{ endinc }}
            {{ endfor }}

        </div>
        <!-- .reply -->
      </article>
      <!-- #comment-## -->
      $item.comment
</li>
