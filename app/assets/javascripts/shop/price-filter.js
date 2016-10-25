$("#price-filter").slider();
$("#price-filter").on("slide", function(slideEvt) {
	$("#SliderVal").text("$"+slideEvt.value[0]+" - $"+slideEvt.value[1]);
});
