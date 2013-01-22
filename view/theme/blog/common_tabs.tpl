<ul class="tabs">
	{{ for $tabs as $tab }}
		<li id="$tab.id"><a href="$tab.url" class="$tab.sel"{{ if $tab.title }} title="$tab.title"{{ endif }}>$tab.label</a></li>
	{{ endfor }}
</ul>
