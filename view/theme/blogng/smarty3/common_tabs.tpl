<dl class="sub-nav">
	{{foreach $tabs as $tab}}
		<dd id="{{$tab.id}}" class="{{if $tab.sel}}active{{/if}}"><a href="{{$tab.url}}" {{if $tab.title}} title="{{$tab.title}}"{{/if}}>{{$tab.label}}</a></dd>
	{{/foreach}}
</dl>
