<section class="entry-content">
<h1 class="entry-title">$title</h1>


<form action="settings/oauth" method="post" autocomplete="off">
<input type='hidden' name='form_security_token' value='$form_security_token'>


<a class="button" href="$baseurl/settings/oauth/add">$add</a>

	{{ for $apps as $app }}
	<div class='oauthapp'>
		<img src='$app.icon' class="{{ if $app.icon }} {{ else }}noicon{{ endif }}">
		<p>{{ if $app.name }}$app.name{{ else }}$noname{{ endif }}</p>
		{{ if $app.my }}
			{{ if $app.oauth_token }}
			<button class="button"  type="submit" name="remove" value="$app.oauth_token">$remove</button>
			{{ endif }}
		{{ endif }}
		{{ if $app.my }}
		<a href="$baseurl/settings/oauth/edit/$app.client_id" class="button">$edit</a>
		<a href="$baseurl/settings/oauth/delete/$app.client_id?t=$form_security_token" class="button">$delete</a>
		{{ endif }}		
	</div>
	{{ endfor }}

</form>
</section>