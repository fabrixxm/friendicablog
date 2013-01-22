<section class="entry-content">
<h1  class="entry-title">$title</h1>


<form action="settings/features" method="post" autocomplete="off">
<input type='hidden' name='form_security_token' value='$form_security_token'>

{{ for $features as $f }}
<h2 class="settings-heading">$f.0</h2>

{{ for $f.1 as $fcat }}
	{{ inc field_yesno.tpl with $field=$fcat }}{{endinc}}
{{ endfor }}
{{ endfor }}

<div class="buttonbar" >
<input type="submit" name="submit" class="settings-features-submit" value="$submit" />
</div>

</form>
</section>

