$(document).on('turbolinks:load', function() {
    

	var btn = document.getElementById("makecomment");
	var show = document.getElementById("commform");

	btn.addEventListener('click', function(){
		if (show.style.display === "inline") {
			show.style.display = "none";
		}
		else{
			show.style.display = "inline";
		}
	});
});