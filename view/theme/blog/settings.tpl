<section class="entry-content">
<h1 class="entry-title">$ptitle</h1>

$nickname_block

<form action="settings" id="settings-form" method="post" autocomplete="off" >
<input type='hidden' name='form_security_token' value='$form_security_token'>

<h2 class="settings-heading">$h_pass</h2>

{{inc field_password.tpl with $field=$password1 }}{{endinc}}
{{inc field_password.tpl with $field=$password2 }}{{endinc}}

{{ if $oid_enable }}
{{inc field_input.tpl with $field=$openid }}{{endinc}}
{{ endif }}

<div class="buttonbar" >
<input type="submit" name="submit" class="settings-submit" value="$submit" />
</div>


<h2 class="settings-heading">$h_basic</h2>

{{inc field_input.tpl with $field=$username }}{{endinc}}
{{inc field_input.tpl with $field=$email }}{{endinc}}
{{inc field_custom.tpl with $field=$timezone }}{{endinc}}
{{inc field_input.tpl with $field=$defloc }}{{endinc}}
{{inc field_checkbox.tpl with $field=$allowloc }}{{endinc}}


<div class="buttonbar" >
<input type="submit" name="submit" class="settings-submit" value="$submit" />
</div>


<h2 class="settings-heading">$h_prv</h2>


<input type="hidden" name="visibility" value="$visibility" />

{{inc field_input.tpl with $field=$maxreq }}{{endinc}}

$profile_in_dir

$profile_in_net_dir

$hide_friends

$hide_wall

$blockwall

$blocktags

$suggestme

$unkmail


{{inc field_input.tpl with $field=$cntunkmail }}{{endinc}}

{{inc field_input.tpl with $field=$expire.days }}{{endinc}}


<div class="field input">
	<span class="field_help"><a href="#advanced-expire-popup" id="advanced-expire" class='popupbox button' title="$expire.advanced">$expire.label</a></span>
	<div style="display: none;">
		<div id="advanced-expire-popup" style="width:auto;height:auto;overflow:auto;">
			<h2>$expire.advanced</h2>
			{{ inc field_yesno.tpl with $field=$expire.items }}{{endinc}}
			{{ inc field_yesno.tpl with $field=$expire.notes }}{{endinc}}
			{{ inc field_yesno.tpl with $field=$expire.starred }}{{endinc}}
			{{ inc field_yesno.tpl with $field=$expire.network_only }}{{endinc}}
		</div>
	</div>

</div>


$group_select

<div id="settings-default-perms" class="settings-default-perms" >
	<a href="#profile-jot-acl-wrapper" id="settings-default-perms-menu" class='popupbox button'>$permissions $permdesc</a>
	<div id="settings-default-perms-menu-end"></div>

	<div id="settings-default-perms-select" style="display: none; margin-bottom: 20px" >
	
	<div style="display: none;">
		<div id="profile-jot-acl-wrapper" style="width:auto;height:auto;overflow:auto;">
			$aclselect
                <div class="buttonbar" >
                    <a href="#" class="button" onclick="$.fancybox.close(); return false;">Ok</a>
                </div>
		</div>
	</div>

	</div>
</div>
<br/>
<div id="settings-default-perms-end"></div>


<div class="buttonbar" >
<input type="submit" name="submit" class="settings-submit" value="$submit" />
</div>



<h2 class="settings-heading">$h_not</h2>
<div id="settings-notifications">

<h3>$activity_options</h3>

{{inc field_checkbox.tpl with $field=$post_newfriend }}{{endinc}}
{{inc field_checkbox.tpl with $field=$post_joingroup }}{{endinc}}
{{inc field_checkbox.tpl with $field=$post_profilechange }}{{endinc}}


<h3>$lbl_not</h3>

<div class="group">
{{inc field_intcheckbox.tpl with $field=$notify1 }}{{endinc}}
{{inc field_intcheckbox.tpl with $field=$notify2 }}{{endinc}}
{{inc field_intcheckbox.tpl with $field=$notify3 }}{{endinc}}
{{inc field_intcheckbox.tpl with $field=$notify4 }}{{endinc}}
{{inc field_intcheckbox.tpl with $field=$notify5 }}{{endinc}}
{{inc field_intcheckbox.tpl with $field=$notify6 }}{{endinc}}
{{inc field_intcheckbox.tpl with $field=$notify7 }}{{endinc}}
{{inc field_intcheckbox.tpl with $field=$notify8 }}{{endinc}}
</div>

</div>

<div class="buttonbar" >
<input type="submit" name="submit" class="settings-submit" value="$submit" />
</div>


<h2 class="settings-heading">$h_advn</h2>
<h3>$h_descadvn</h3>

$pagetype

<div class="buttonbar" >
<input type="submit" name="submit" class="settings-submit" value="$submit" />
</div>

<section class="entry-content">
