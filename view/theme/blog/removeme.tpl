<section class="entry-content">
<h1 class="entry-title">$title</h1>

<div id="remove-account-wrapper">

<div class="info-message">$desc</div>

<form action="$basedir/removeme" autocomplete="off" method="post" >
<input type="hidden" name="verify" value="$hash" />

<div class="field password">
    <label for="remove-account-pass">$passwd</label>
    <input type="password" id="remove-account-pass" name="qxz_password" />
</div>

<input type="submit" name="submit" value="$submit" />

</form>
</div>
</section>
