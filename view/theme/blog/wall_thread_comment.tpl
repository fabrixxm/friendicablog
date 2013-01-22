<li class="comment even thread-even depth-1" id="li-comment-2">
      <article id="comment-2" class="comment">
        <footer class="comment-meta">
          <div class="comment-author vcard">
            <img alt="" src="http://0.gravatar.com/avatar/?d=identicon&s=68" class="avatar avatar-68 photo avatar-default" height="68" width="68">
            <span class="fn">
              <a href="http://joseph.randomnetworks.com/" rel="external nofollow" class="url">Joseph Scott</a>
            </span>
             on 
            <a href="http://wp-themes.com/?p=8&cpage=1#comment-2">
              <time datetime="2008-06-21T00:07:24+00:00">21 June, 2008 at 12:07 am</time>
            </a>
            <span class="says">said:</span>
          </div>
          <!-- .comment-author .vcard -->
        </footer>
        <div class="comment-content">
          <p>I never could remember more than the first few lines of that nursery rhyme.</p>
        </div>
        <div class="reply">
							</div>
        <!-- .reply -->
      </article>
      <!-- #comment-## -->
      {{ for $item.children as $child }}
            {{ inc wall_thread_comment.tpl with $item=$child }}{{ endinc }}
        {{ endfor }}
</li>