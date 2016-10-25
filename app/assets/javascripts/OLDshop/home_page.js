function seeMore() {
	document.getElementById("moreText").style.display = "block";
	document.getElementById("lessText").style.display = "none";
	document.getElementById("seeMoreLink").style.display = "none";
	document.getElementById("seeLessLink").style.display = "block";
}
function seeLess() {
	document.getElementById("lessText").style.display = "block";
	document.getElementById("moreText").style.display = "none";
	document.getElementById("seeLessLink").style.display = "none";
	document.getElementById("seeMoreLink").style.display = "block";
}