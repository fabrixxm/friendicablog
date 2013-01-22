<section class="entry-content">
<h1 class="entry-title">$title</h1>

<form method="POST">
<input type='hidden' name='form_security_token' value='$form_security_token'>

{{ inc field_input.tpl with $field=$name }}{{ endinc }}
{{ inc field_input.tpl with $field=$key }}{{ endinc }}
{{ inc field_input.tpl with $field=$secret }}{{ endinc }}
{{ inc field_input.tpl with $field=$redirect }}{{ endinc }}
{{ inc field_input.tpl with $field=$icon }}{{ endinc }}

<div class="buttonbar" >
<input type="submit" name="submit" class="settings-submit" value="$submit" />
<input type="submit" name="cancel" class="settings-submit" value="$cancel" />
</div>

</form>
</section>