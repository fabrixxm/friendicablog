<div style="display: none;">
    <div id="profile-jot-wrapper" >
        <div id="profile-jot-banner-wrapper">
            <div id="profile-jot-desc" >&nbsp;</div>
            <div id="character-counter" class="grey"></div>
        </div>
        <div id="profile-jot-banner-end"></div>

        <form id="profile-jot-form" action="$action" method="post" >
            <input type="hidden" name="type" value="$ptyp" />
            <input type="hidden" name="profile_uid" value="$profile_uid" />
            <input type="hidden" name="return" value="$return_path" />
            <input type="hidden" name="location" id="jot-location" value="$defloc" />
            <input type="hidden" name="coord" id="jot-coord" value="" />
            <input type="hidden" name="post_id" value="$post_id" />
            <input type="hidden" name="preview" id="jot-preview" value="0" />
            <input type="hidden" name="post_id_random" value="$rand_num" />
            <div id="jot-title-wrap"><input name="title" id="jot-title" type="text" placeholder="$placeholdertitle" value="$title"></div>
            {{ if $placeholdercategory }}
            <div id="jot-category-wrap"><input name="category" id="jot-category" type="text" placeholder="$placeholdercategory" value="$category"  /></div>
            {{ endif }}
            <div id="jot-text-wrap">
            <img id="profile-jot-text-loading" src="images/rotator.gif" alt="$wait" title="$wait" style="display: none;" />
            <textarea rows="5" cols="64" class="profile-jot-text" id="profile-jot-text" name="body" >{{ if $content }}$content{{ endif }}</textarea>
            </div>

        <dl class="toolbox">
            <dd  style="{{if $visitor=none}}display: none;{{endif}}"><a href="#" onclick="return false;" id="wall-image-upload" class="icon camera" title="$upload"></a></dd>
            <dd  style="{{if $visitor=none}}display: none;{{endif}}"><a href="#" onclick="return false;" id="wall-file-upload" class="icon attach" title="$attach"></a></dd>
            <dd  style="{{if $visitor=none}}display: none;{{endif}}"><a href="#" id="profile-link" class="icon link" title="$weblink" ondragenter="return linkdropper(event);" ondragover="return linkdropper(event);" ondrop="linkdrop(event);" onclick="jotGetLink(); return false;"></a></dd>
            <dd  style="{{if $visitor=none}}display: none;{{endif}}"><a href="#" id="profile-video" class="icon video" title="$video" onclick="jotVideoURL();return false;"></a></dd>
            <dd  style="{{if $visitor=none}}display: none;{{endif}}"><a href="#" id="profile-audio" class="icon audio" title="$audio" onclick="jotAudioURL();return false;"></a></dd>
            <dd  style="{{if $visitor=none}}display: none;{{endif}}"> <a href="#" id="profile-location" class="icon globe" title="$setloc" onclick="jotGetLocation();return false;"></a></dd>
            <dd  style="display: none;"><a href="#" id="profile-nolocation" class="icon noglobe" title="$noloc" onclick="jotClearLocation();return false;"></a></dd>
            <dd  style="{{if $visitor=none}}display: none;{{endif}}"><a href="#profile-jot-acl-wrapper" id="jot-perms-icon" class="icon $lockstate"  title="$permset" ></a>$bang</dd>
        </dl>
        <dl class="toolbox right">
            <dd  style="{{if $visitor=none}}display: none;{{endif}}"><img id="profile-rotator" src="$baseurl/view/theme/blog/images/rotator.gif" alt="$wait" title="$wait" style="display: none;" /></dd>
            <dd><input type="submit" id="profile-jot-submit" name="submit" value="$share" class="button" /></dd>
            {{ if $preview }}<dd><a href="#" onclick="preview_post(); return false;" id="jot-preview-link" class="button">$preview</a></dd>{{ endif }}
        </dl>


        </form>

        <div id="jot-preview-content" style="display:none;"></div>


    </div>
</div>    
<div style="display: none;">
    <div id="profile-jot-acl-wrapper" style="width:auto;height:auto;overflow:auto;">
        $acl
        <hr style="clear:both"/>
        <div id="profile-jot-email-label">$emailcc</div><input type="text" name="emailcc" id="profile-jot-email" title="$emtitle" />
        <div id="profile-jot-email-end"></div>
        $jotnets
        <div class="buttonbar" >
            <a href="#" class="button" onclick="$.colorbox.close(); return false;">Ok</a>
        </div>
    </div>
</div>

<a href="#profile-jot-wrapper" class="showjot button">$share</a>
