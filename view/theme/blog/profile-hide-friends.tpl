	<div class='field yesno'>
		<label for='id_hide-friends'>$desc</label>
		<div class='onoff' id="id_hide-friends_onoff">
			<input  type="hidden" name='$hide-friends' id='id_hide-friends' value="{{if $yes_selected}}1{{else}}0{{endif}}">
			<a href="#" class='off'>$no_str</a>
			<a href="#" class='on'>$yes_str</a>
		</div>
	</div>
