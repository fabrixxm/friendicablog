<article class="post-8 post type-post status-publish format-standard hentry category-uncategorized tag-html tag-wordpress {{if $mode == network}}compact{{endif}}" id="item-$item.id">
		<header class="entry-header">
                    <h1 class="entry-title"><a rel="bookmark" title="Permalink" href="$item.plink.href">$item.title</a></h1>
			
                    <div class="entry-meta">
						{{if $mode != profile}}<img class="avatar avatar-68 photo avatar-default " alt="" title="$item.name" src="$item.thumb"  height="68" width="68">{{endif}}
						{{ if $item.lock }}<a href="#" class="icon lock" alt="$item.lock" onclick="lockview(event,$item.id); return false;"></a>{{ endif }}
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


	<footer class="entry-meta">
			<img id="like-rotator-$item.id" class="like-rotator" src="images/rotator.gif" alt="$item.wait" title="$item.wait" style="display: none;" />
			{{ if $item.vote }}
				<a href="#" class="icon like" title="$item.vote.like.0" onclick="dolike($item.id,'like'); return false"></a>
				{{ if $item.vote.dislike }}<a href="#" class="icon dislike" title="$item.vote.dislike.0" onclick="dolike($item.id,'dislike'); return false"></a>{{ endif }}
				<span class="icon sep"> &#183; </span>
			{{ endif }}
			
			{{ if $item.vote.share }}
				<a href="#" class="icon recycle" title="$item.vote.share.0" onclick="jotShare($item.id); return false"></a>
				<span class="icon sep"> &#183; </span>				
			{{ endif }}
			
			{{ if $item.star }}
				<a href="#" id="starred-$item.id" onclick="dostar($item.id); return false;" class="icon $item.isstarred" title="$item.star.toggle"></a>
			{{ endif }}
			{{ if $item.tagger }}
				<a href="#" onclick="itemTag($item.id); return false;" class="icon tag" title="$item.tagger.add"></a>
			{{ endif }}
			{{ if $item.filer }}
				<a href="#" onclick="itemFiler($item.id); return false;" class="icon file" title="$item.filer"></a>
			{{ endif }}				
			<span class="right-tools">
				{{ if $item.edpost }}
					<a class="editpost icon edit" href="$item.edpost.0" title="$item.edpost.1"></a>
					<span class="icon sep"> &#183; </span>
				{{ endif }}
				{{ if $item.drop.dropping }}<a href="item/drop/$item.id" class="item icon drophide" title="$item.drop.delete"></a>{{ endif }}
				{{ if $item.drop.pagedrop }}<input type="checkbox"  title="$item.drop.select" class="item-select" name="itemselected[]" value="$item.id" />{{ endif }}
			 
			</span>
	
		</footer>
</article>

{{ if $mode != profile }}

<div id="comments"class="{{if $mode == network}}compact{{endif}}">
  {{if $mode != network}}
	<h2 id="comments-title">
        $item.total_comments_num $item.total_comments_text {{if $item.title}}on &ldquo;<span>$item.title</span>&rdquo;{{endif}}	
	</h2>
  {{endif}}
  <ol class="commentlist">
    
    {{ for $item.children as $child }}
            {{ inc wall_thread_comment.tpl with $item=$child }}{{ endinc }}
    {{ endfor }}
  
    
  </ol>
    $item.comment
	{{if $mode == network}}<a href="#respond-$item.id" class="reply-link">Add a comment</a>{{endif}}
</div>
{{ endif }}

