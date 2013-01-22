<article class="post-8 post type-post status-publish format-standard hentry category-uncategorized tag-html tag-wordpress" id="item-$item.id">
		<header class="entry-header">
                    <h1 class="entry-title"><a rel="bookmark" title="Permalink" href="$item.plink.href">$item.title</a></h1>
			
                    <div class="entry-meta">
                        <span class="sep">Posted </span>
                        <a rel="bookmark" title="12:04 am" href="$item.plink.href">
                            <time pubdate="" datetime="$item.localtime" class="entry-date">$item.ago</time>
                        </a>
                        <span class="by-author"> 
                            <span class="sep"> by </span>
                            <span class="author vcard dropmenu">
                                <a rel="author" title="$item.linktitle" href="$item.profile_url" class="url fn n">$item.name</a>
                                <ul class="menu-popup" id="author-menu-$item.id">
                                    $item.item_photo_menu
                                </ul>                                  
                            </span>
                         </span>
                    </div><!-- .entry-meta -->
			
                    <div class="comments-link">
                        <a title="Comment" href="$item.plink.href">$item.total_comments_num</a>
                    </div>
            </header><!-- .entry-header -->

            <div class="entry-content">
                $item.body
            </div><!-- .entry-content -->
		
		<footer class="entry-meta">
                    {{ if $item.categories }}
                    <span class="cat-links">
                        <span class="entry-utility-prep entry-utility-prep-cat-links">Posted in</span> 
                        {{ for $item.categories as $cat }}
                            <a href="$cat.url">$cat.name</a>{{if $cat.removeurl}} (<a href="$cat.removeurl" title="$remove">x</a>) {{endif}} 
                        {{ endfor }}
                    </span>
                    <span class="sep"> | </span>
                    {{ endif }}
                    {{ if $item.hashtags }}
                    <span class="tag-links">
                        <span class="entry-utility-prep entry-utility-prep-tag-links">Tagged</span> 
                        {{ for $item.hashtags as $tag }}
                            $tag
                        {{ endfor }}
                    </span>
                    <span class="sep"> | </span>
                    {{ endif  }}
                    {{ if $item.mentions }}
                    <span class="tag-links">
                        <span class="entry-utility-prep entry-utility-prep-tag-links">Mention</span> 
                        {{ for $item.mentions as $men }}
                            $men
                        {{ endfor }}
                    </span>
                    <span class="sep"> | </span>
                    {{ endif  }}
                    
                    <span class="comments-link"><a title="Comment" href="$item.plink.href">$item.total_comments_num $item.total_comments_text</a>
                    </span>
        </footer><!-- #entry-meta -->
</article>

<div id="comments">
  <h2 id="comments-title">
        $item.total_comments_num $item.total_comments_text on &ldquo;<span>$item.title</span>&rdquo;	
  </h2>
  <ol class="commentlist">
    
    {{ for $item.children as $child }}
            {{ inc wall_thread_comment.tpl with $item=$child }}{{ endinc }}
    {{ endfor }}
  
    
  </ol>
  <div id="respond">
    <h3 id="reply-title">
      Leave a Reply 
      <small>
        <a rel="nofollow" id="cancel-comment-reply-link" href="/?p=8#respond" style="display:none;">Cancel reply</a>
      </small>
    </h3>
    <form action="http://wp-themes.com/wp/wp-comments-post.php" method="post" id="commentform">
      <p class="comment-notes">
        Your email address will not be published. Required fields are marked 
        <span class="required">*</span>
      </p>
      <p class="comment-form-author">
        <label for="author">
          Name 
          <span class="required">*</span>
        </label>
        <input id="author" name="author" type="text" value="" size="30" aria-required="true">
      </p>
      <p class="comment-form-email">
        <label for="email">
          Email 
          <span class="required">*</span>
        </label>
        <input id="email" name="email" type="text" value="" size="30" aria-required="true">
      </p>
      <p class="comment-form-url">
        <label for="url">Website</label>
        <input id="url" name="url" type="text" value="" size="30">
      </p>
      <p class="comment-form-comment">
        <label for="comment">Comment</label>
        <textarea id="comment" name="comment" cols="45" rows="8" aria-required="true"></textarea>
      </p>
      <p class="form-allowed-tags">
        You may use these 
        <abbr title="HyperText Markup Language">HTML</abbr>
         tags and attributes:  
        <code>&lt;a href="" title=""> &lt;abbr title=""> &lt;acronym title=""> &lt;b> &lt;blockquote cite=""> &lt;cite> &lt;code> &lt;del datetime=""> &lt;em> &lt;i> &lt;q cite=""> &lt;strike> &lt;strong> </code>
      </p>
      <p class="form-submit">
        <input name="submit" type="submit" id="submit" value="Post Comment">
        <input type="hidden" name="comment_post_ID" value="8" id="comment_post_ID">
        <input type="hidden" name="comment_parent" id="comment_parent" value="0">
      </p>
    </form>
  </div>
  <!-- #respond -->
</div>
