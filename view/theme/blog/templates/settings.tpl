{{*
 *	AUTOMATICALLY GENERATED TEMPLATE
 *	DO NOT EDIT THIS FILE, CHANGES WILL BE OVERWRITTEN
 *
 *}}
<section class="entry-content">
<h1 class="entry-title">{{$ptitle}}</h1>

{{$nickname_block}}

<form action="settings" id="settings-form" method="post" autocomplete="off" >
<input type='hidden' name='form_security_token' value='{{$form_security_token}}'>

<h2 class="settings-heading">{{$h_pass}}</h2>

{{include file="field_password.tpl" field=$password1}}
{{include file="field_password.tpl" field=$password2}}

{{if $oid_enable}}
{{include file="field_input.tpl" field=$openid}}
{{/if}}

<div class="buttonbar" >
<input type="submit" name="submit" class="settings-submit" value="{{$submit}}" />
</div>


<h2 class="settings-heading">{{$h_basic}}</h2>

{{include file="field_input.tpl" field=$username}}
{{include file="field_input.tpl" field=$email}}
{{include file="field_custom.tpl" field=$timezone}}
{{include file="field_input.tpl" field=$defloc}}
{{include file="field_checkbox.tpl" field=$allowloc}}


<div class="buttonbar" >
<input type="submit" name="submit" class="settings-submit" value="{{$submit}}" />
</div>


<h2 class="settings-heading">{{$h_prv}}</h2>


<input type="hidden" name="visibility" value="{{$visibility}}" />

{{include file="field_input.tpl" field=$maxreq}}

{{$profile_in_dir}}

{{$profile_in_net_dir}}

{{$hide_friends}}

{{$hide_wall}}

{{$blockwall}}

{{$blocktags}}

{{$suggestme}}

{{$unkmail}}


{{include file="field_input.tpl" field=$cntunkmail}}

{{include file="field_input.tpl" field=$expire.days}}


<div class="field input">
	<span class="field_help"><a href="#advanced-expire-popup" id="advanced-expire" class='popupbox button' title="{{$expire.advanced}}">{{$expire.label}}</a></span>
	<div style="display: none;">
		<div id="advanced-expire-popup" style="width:auto;height:auto;overflow:auto;">
			<h2>{{$expire.advanced}}</h2>
			{{include file="field_yesno.tpl" field=$expire.items}}
			{{include file="field_yesno.tpl" field=$expire.notes}}
			{{include file="field_yesno.tpl" field=$expire.starred}}
			{{include file="field_yesno.tpl" field=$expire.network_only}}
		</div>
	</div>

</div>


{{$group_select}}

<div id="settings-default-perms" class="settings-default-perms" >
	<a href="#profile-jot-acl-wrapper" id="settings-default-perms-menu" class='popupbox button'>{{$permissions}} {{$permdesc}}</a>
	<div id="settings-default-perms-menu-end"></div>

	<div id="settings-default-perms-select" style="display: none; margin-bottom: 20px" >
	
	<div style="display: none;">
		<div id="profile-jot-acl-wrapper" style="width:auto;height:auto;overflow:auto;">
			{{$aclselect}}
                <div class="buttonbar" >
                    <a href="#" class="button" onclick="$.colorbox.close(); return false;">Ok</a>
                </div>
		</div>
	</div>

	</div>
</div>
<br/>
<div id="settings-default-perms-end"></div>


<div class="buttonbar" >
<input type="submit" name="submit" class="settings-submit" value="{{$submit}}" />
</div>



<h2 class="settings-heading">{{$h_not}}</h2>
<div id="settings-notifications">

<h3>{{$activity_options}}</h3>

{{include file="field_checkbox.tpl" field=$post_newfriend}}
{{include file="field_checkbox.tpl" field=$post_joingroup}}
{{include file="field_checkbox.tpl" field=$post_profilechange}}


<h3>{{$lbl_not}}</h3>

<div class="group">
{{include file="field_intcheckbox.tpl" field=$notify1}}
{{include file="field_intcheckbox.tpl" field=$notify2}}
{{include file="field_intcheckbox.tpl" field=$notify3}}
{{include file="field_intcheckbox.tpl" field=$notify4}}
{{include file="field_intcheckbox.tpl" field=$notify5}}
{{include file="field_intcheckbox.tpl" field=$notify6}}
{{include file="field_intcheckbox.tpl" field=$notify7}}
{{include file="field_intcheckbox.tpl" field=$notify8}}
</div>

</div>

<div class="buttonbar" >
<input type="submit" name="submit" class="settings-submit" value="{{$submit}}" />
</div>


<h2 class="settings-heading">{{$h_advn}}</h2>
<h3>{{$h_descadvn}}</h3>

{{$pagetype}}

<div class="buttonbar" >
<input type="submit" name="submit" class="settings-submit" value="{{$submit}}" />
</div>

<section class="entry-content">