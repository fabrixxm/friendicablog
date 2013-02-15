// confirm delete, call delete via ajax, remove item from dom
$(".item.drophide").bind("click", function(e){
	var sender = (e && e.target) || (window.event && window.event.srcElement);
	var dropurl = baseurl + "/" +$(sender).attr('href');
	var ret = confirmDelete(); // use friendica confirmDelete function. Translated message for free. 
	if (ret==false) return false;
	$.ajax(dropurl,{
		dataType: "json",
		url: dropurl,
		success: function(data){
			console.log(data);
		/*	if(data[1]!=0){
				$("#item-"+data[0]).hide(400, function(){ 
					$(this).remove(); 
				});
			}*/
		}
	});
	return false;
});

// move selection tools on clicks
$("input.item-select").bind("click", function(e){
	var sender = (e && e.target) || (window.event && window.event.srcElement);
	var position = $(sender).offset(); 
	position.left = position.left + 30;
	
	var n = $( "input.item-select:checked" ).length;
	if (n>0){
		$("#selection-tools").show(400).offset(position);
	} else {
		position.top = 0;
		$("#selection-tools").offset(position).hide(400);
		
		
	}
	console.log(position);
});