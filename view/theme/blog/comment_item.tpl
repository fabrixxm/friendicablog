<div style="{{ if $threaded }}display:none;{{ endif }}">
 <div id="respond-$id" class="respond {{ if $threaded }}thread{{ endif }}" >
    <h3 id="reply-title">
      Leave a Reply 
    </h3>
    <form id="comment-edit-form-$item.id" class="comment-edit-form" action="item" method="post" onsubmit="post_comment($id); return false;">
            <input type="hidden" name="type" value="$type" />
            <input type="hidden" name="profile_uid" value="$profile_uid" />
            <input type="hidden" name="parent" value="$parent" />
            <input type="hidden" name="return" value="$return_path" />
            <input type="hidden" name="jsreload" value="$jsreload" />
            <input type="hidden" name="preview" id="comment-preview-inp-$id" value="0" />
            <input type="hidden" name="post_id_random" value="$rand_num" />
            

      <p class="comment-form-comment">
        <label for="comment"><img class="my-comment-photo" src="$myphoto" alt="$mytitle" title="$mytitle" width="16" height="16" /> $comment</label>
        <textarea id="comment" name="body" cols="45" rows="8" aria-required="true"></textarea>
      </p>

      <p class="form-submit">
            <input type="submit" onclick="post_comment($id); return false;" id="comment-edit-submit-$id" class="comment-edit-submit" name="submit" value="$submit" />
            {{ if $preview }}<a href="#" onclick="preview_comment($id); return false;" id="comment-edit-preview-link-$id" class="button">$preview</a>{{ endif }}
      </p>
    </form>
    <div id="comment-edit-preview-$id" class="comment-edit-preview" style="display:none;"></div>
</div>
<!-- #respond -->
</div>