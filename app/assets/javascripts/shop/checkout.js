$(document).ready(function(){
	//alert("si carga0");
	$(document).on("click","#index",function(){
		alert("si carga1");
		$.ajax({
			url: '/checkout/first',
			type: 'GET',
			data: {//name: $("#first").val(), description: $("#description").val()
			},
			success: function( result ){}
		});
	});


	$(document).on("click","#first-data",function(){
		alert("agg");
		document.getElementById('ocultar').style.display = 'none';
		document.getElementById('cent').style.display = 'block';
		document.getElementById('load').style.display = 'block';

		$.ajax({
			url: '/checkout/first_data',
			type: 'POST',
			data: {firstname: $("#firstname").val(), lastname: $("#lastname").val(), company: $("#company").val(),
			street: $("#street").val(), city: $("#city").val(), zip: $("#zip").val(), state: $("#state").val(),
			country: $("#country").val(), phone: $("#phone").val(), email: $("#email").val()
			},
			 complete: function( result ){document.getElementById('load').style.display = 'none';document.getElementById('cent').style.display = 'none';document.getElementById('ocultar').style.display = 'block';}
		});
	});

	$(document).on("click","#yesdelivery",function(){
		$.ajax({
			url: '/checkout/yesdeliveryaddress',
			type: 'POST',
			data: {address2: $("#field").val()},
			success: function( result ){}
		});
	});

	$(document).on("click","#addcart",function(){
		alert("si carga1");
		$.ajax({
			url: '/addtocart',
			type: 'POST',
			data: {id: $("#addcart").val(), authenticity_token: $("#authenticity_token").val()
			},
			success: function( result ){}
		});
	});

	$(document).on("click","#refresh",function(){
		$.ajax({
			url: '/refreshcart',
			type: 'GET',
			data: { id: $("#addcart").val()
			},
			success: function( result ){}
		});
	});

	$(document).on("click","#delete",function(){
		$.ajax({
			url: '/refreshcart',
			type: 'POST',
			data: {
			},
			success: function( result ){}
		});
	});

	$(document).on("click","#navbar-cart",function(){
		$.ajax({
			url: '/refreshcart',
			type: 'GET',
			data: {
			},
			success: function( result ){}
		});
	});
});
//$( function() {
	//$( '#sortable' ).sortable();
	//$( '#sortable' ).disableSelection();
//});
//function update_order() {window.location.href = '/admin/product/sortimages?'+$('#sortable').sortable('serialize');
