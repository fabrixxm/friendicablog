<script>
	$(function(){
		
		$("#cnftheme").colorbox({
			href: function(){
				var theme = $("#id_theme :selected").val();
				var theme_mobile = $("#id_theme_mobile :selected").val();
				return "$baseurl/admin/themes/"+theme;
			},
			width: "80%",
			height: "100%",
			onComplete: function(){
				$("div#cboxLoadedContent form").submit(function(e){
					var url = $(this).attr('action');
					// can't get .serialize() to work...
					var data={};
					$(this).find("input").each(function(){
						data[$(this).attr('name')] = $(this).val();
					});
					$(this).find("select").each(function(){
						data[$(this).attr('name')] = $(this).children(":selected").val();
					});
					console.log(":)", url, data);
					
					$.post(url, data, function(data) {
						if(timer) clearTimeout(timer);
						NavUpdate();
						$.colorbox.close();
					})
					
					return false;
				});
				
			}
		});
	});
</script>
<div id='adminpage'>
	<h1>$title - $page</h1>
	
	<form action="$baseurl/admin/site" method="post">
 	<input type='hidden' name='form_security_token' value='$form_security_token'>

	{{ inc field_input.tpl with $field=$sitename }}{{ endinc }}
	{{ inc field_textarea.tpl with $field=$banner }}{{ endinc }}
	{{ inc field_select.tpl with $field=$language }}{{ endinc }}
	{{ inc field_select.tpl with $field=$theme }}{{ endinc }}
	{{ inc field_select.tpl with $field=$theme_mobile }}{{ endinc }}
	{{ inc field_select.tpl with $field=$ssl_policy }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$new_share }}{{ endinc }}

	
	<div class="buttonbar"><input type="submit" name="page_site" value="$submit" /></div>
	
	<h3>$registration</h3>
	{{ inc field_input.tpl with $field=$register_text }}{{ endinc }}
	{{ inc field_select.tpl with $field=$register_policy }}{{ endinc }}
	{{ inc field_input.tpl with $field=$daily_registrations }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$no_multi_reg }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$no_openid }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$no_regfullname }}{{ endinc }}
	
	<div class="buttonbar"><input type="submit" name="page_site" value="$submit" /></div>

	<h3>$upload</h3>
	{{ inc field_input.tpl with $field=$maximagesize }}{{ endinc }}
	{{ inc field_input.tpl with $field=$maximagelength }}{{ endinc }}
	{{ inc field_input.tpl with $field=$jpegimagequality }}{{ endinc }}
	
	<h3>$corporate</h3>
	{{ inc field_input.tpl with $field=$allowed_sites }}{{ endinc }}
	{{ inc field_input.tpl with $field=$allowed_email }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$block_public }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$force_publish }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$no_community_page }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$ostatus_disabled }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$diaspora_enabled }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$dfrn_only }}{{ endinc }}
	{{ inc field_input.tpl with $field=$global_directory }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$thread_allow }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$newuser_private }}{{ endinc }}
	
	<div class="buttonbar"><input type="submit" name="page_site" value="$submit" /></div>
	
	<h3>$advanced</h3>
	{{ inc field_checkbox.tpl with $field=$no_utf }}{{ endinc }}
	{{ inc field_checkbox.tpl with $field=$verifyssl }}{{ endinc }}
	{{ inc field_input.tpl with $field=$proxy }}{{ endinc }}
	{{ inc field_input.tpl with $field=$proxyuser }}{{ endinc }}
	{{ inc field_input.tpl with $field=$timeout }}{{ endinc }}
	{{ inc field_input.tpl with $field=$delivery_interval }}{{ endinc }}
	{{ inc field_input.tpl with $field=$poll_interval }}{{ endinc }}
	{{ inc field_input.tpl with $field=$maxloadavg }}{{ endinc }}
	{{ inc field_input.tpl with $field=$abandon_days }}{{ endinc }}
	{{ inc field_input.tpl with $field=$lockpath }}{{ endinc }}
	{{ inc field_input.tpl with $field=$temppath }}{{ endinc }}
	{{ inc field_input.tpl with $field=$basepath }}{{ endinc }}

	<h3>$performance</h3>
	{{ inc field_checkbox.tpl with $field=$use_fulltext_engine }}{{ endinc }}
	{{ inc field_input.tpl with $field=$itemcache }}{{ endinc }}
	{{ inc field_input.tpl with $field=$itemcache_duration }}{{ endinc }}

	
	<div class="buttonbar"><input type="submit" name="page_site" value="$submit" /></div>
	
	</form>
</div>
