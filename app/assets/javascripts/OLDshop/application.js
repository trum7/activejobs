var open = 0;
function displayMenu(menu){
	if( open == 0 ){
		document.getElementById(menu).style.display = "block";
		open = 1;
	}else{
		document.getElementById(menu).style.display = "none";
		open = 0;
	}
}
function openNav() {
	document.getElementById("mask").style.display = "block";
	document.getElementById("sideNav").style.width = "17em";
}
function closeNav() {
	document.getElementById("mask").style.display = "none";
	document.getElementById("sideNav").style.width = "0";
}