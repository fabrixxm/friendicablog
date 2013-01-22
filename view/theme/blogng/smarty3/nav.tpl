<div class="fixed contain-to-grid">
    <nav class="top-bar">
		<ul>
			<!-- Title Area -->
			<li class="name">
				<h1>
					<a href="#">{{$banner}}</a>
				</h1>
			</li>
			<li class="toggle-topbar"><a href="#"></a></li>
		</ul>

		<section>
			<!-- Left Nav Section -->
			<ul class="left">
				<li class="divider"></li>
				{{if $userinfo}}
				<li class="has-dropdown">
					<a href="#"><img src="{{$userinfo.icon}}" alt="{{$userinfo.name}}">{{$userinfo.name}}</a>
					<ul class="dropdown">
						{{foreach $nav.usermenu as $usermenu}}
							<li><a class="{{$usermenu.2}}" href="{{$usermenu.0}}" title="{{$usermenu.3}}">{{$usermenu.1}}</a></li>
						{{/foreach}}
						
						{{if $nav.notifications}}<li><a class="{{$nav.notifications.2}}" href="{{$nav.notifications.0}}" title="{{$nav.notifications.3}}" >{{$nav.notifications.1}}</a></li>{{/if}}
						{{if $nav.messages}}<li><a class="{{$nav.messages.2}}" href="{{$nav.messages.0}}" title="{{$nav.messages.3}}" >{{$nav.messages.1}}</a></li>{{/if}}
						{{if $nav.contacts}}<li><a class="{{$nav.contacts.2}}" href="{{$nav.contacts.0}}" title="{{$nav.contacts.3}}" >{{$nav.contacts.1}}</a></li>{{/if}}	
						<li class="divider"></li>
						{{if $nav.manage}}
						<li><a class="{{$nav.manage.2}}" href="{{$nav.manage.0}}" title="{{$nav.manage.3}}">{{$nav.manage.1}}</a></li>
						<li class="divider"></li>
						{{/if}}				

						{{if $nav.settings}}<li><a class="{{$nav.settings.2}}" href="{{$nav.settings.0}}" title="{{$nav.settings.3}}">{{$nav.settings.1}}</a></li>{{/if}}
						{{if $nav.admin}}<li><a class="{{$nav.admin.2}}" href="{{$nav.admin.0}}" title="{{$nav.admin.3}}" >{{$nav.admin.1}}</a></li>{{/if}}

						{{if $nav.logout}}<li><a class="{{$nav.logout.2}}" href="{{$nav.logout.0}}" title="{{$nav.logout.3}}" >{{$nav.logout.1}}</a></li>{{/if}}
					</ul>
				</li>
				{{/if}}

				{{if $nav.login}}<li><a class="{{$nav.login.2}}" href="{{$nav.login.0}}" title="{{$nav.login.3}}" >{{$nav.login.1}}</a><li>{{/if}}
				
				
				{{if $nav.community}}
					<li id="nav-community-link" class="{{if $sel.community}}active{{/if}}">
						<a class="{{$nav.community.2}}" href="{{$nav.community.0}}" title="{{$nav.community.3}}" >{{$nav.community.1}}</a>
					</li>
				{{/if}}

				{{if $nav.network}}
					<li id="nav-network-link" class="{{if $sel.network}}active{{/if}}">
						<a class="{{$nav.network.2}}" href="{{$nav.network.0}}" title="{{$nav.network.3}}" >{{$nav.network.1}}
							<span id="net-update" class="nav-notify"></span>
						</a>
					</li>
				{{/if}}

				{{if $nav.home}}
					<li id="nav-home-link" class="{{if $sel.home}}active{{/if}}">
						<a class="{{$nav.home.2}}" href="{{$nav.home.0}}" title="{{$nav.home.3}}" >{{$nav.home.1}}
							<span id="home-update" class="nav-notify"></span>
						</a>
					</li>
				{{/if}}

				{{if $nav.notifications}}
					<li  id="nav-notifications-linkmenu" class="has-dropdown">
						<a href="{{$nav.notifications.0}}" title="{{$nav.notifications.1}}">{{$nav.notifications.1}} <span id="notify-update" class="nav-notify"></span></a>

						<ul id="nav-notifications-menu" class="dropdown">
							<!-- TODO: better icons! -->
							<li class="row">
								<div class="six columns">
									<a href="#" onclick="notifyMarkAll(); return false;" title="{{$nav.notifications.mark.1}}">"{{$nav.notifications.mark.1}}"</a>
								</div>
								<div class="six columns">
									<a href="{{$nav.notifications.all.0}}" title="{{$nav.notifications.all.1}}">"{{$nav.notifications.all.1}}"</a>
								</div>
							</li>
							<li class="empty"><label>{{$emptynotifications}}</label></li>
						</ul>
					</li>		
				{{/if}}		
				
				<li class="divider hide-for-small"></li>
			</ul>

			<!-- Right Nav Section -->
			<ul class="right">
				<li class="divider show-for-medium-and-up"></li>
				{{if $nav.help}} 
				<li id="nav-help-link" class="{{if $sel.help}}active{{/if}}">
					<a class="{{$nav.help.2}}" target="friendica-help" href="{{$nav.help.0}}" title="{{$nav.help.3}}" >{{$nav.help.1}}</a>
				</li>
				{{/if}}

				<li id="nav-search-link" class="{{if $sel.search}}active{{/if}}">
					<a class="{{$nav.search.2}}" href="{{$nav.search.0}}" title="{{$nav.search.3}}" >{{$nav.search.1}}</a>
				</li>
				<li id="nav-directory-link" class="{{if $sel.directory}}active{{/if}}">
					<a class="{{$nav.directory.2}}" href="{{$nav.directory.0}}" title="{{$nav.directory.3}}" >{{$nav.directory.1}}</a>
				</li>

				{{if $nav.apps}}
					<li id="nav-apps-link" class="{{if $sel.apps}}active{{/if}}">
						<a class=" {{$nav.apps.2}}" href="#" rel="#nav-apps-menu" title="{{$nav.apps.3}}" >{{$nav.apps.1}}</a>
						<ul id="nav-apps-menu" class="menu-popup">
							{{foreach $apps as $ap}}
							<li>{{$ap}}</li>
							{{/foreach}}
						</ul>
					</li>
				{{/if}}				
			</ul>
		</section>
    </nav>
</div>

<ul id="nav-notifications-template" style="display:none;" rel="template">
	<li><a href="{0}"><img data-src="{1}">{2} <span class="notif-when">{3}</span></a></li>
</ul>				
