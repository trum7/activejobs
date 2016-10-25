alert("si carga-1");
$(document).ready(function(){
	//alert("si carga0");

	$(document).on("click","#addcategory",function(){
		alert("si carga1");
		$.ajax({
			url: '/admin/category/new',
			type: 'POST',
			data: {name: $("#name").val(), description: $("#description").val() },
			success: function( result ){}
		});
	});
	$(document).on("click","#editcategory",function(){
		$.ajax({
			url: '/admin/category/change',
			type: 'POST',
			data: {name: $("#name").val(), description: $("#description").val(), id: $("#id").val() },
			success: function( result ){}
		});
	});
	$(document).on("click","#addproduct",function(){
		$.ajax({
			url: '/admin/product/new',
			type: 'POST',
			data: {name: $("#name").val(), description: $("#description").val(), model: $("#model").val(),
		 				price: $("#price").val(), tax_class_id: $("#tax_class_id").val(), quantity: $("#quantity").val(),
						length: $("#length").val(), width: $("#width").val(), height: $("#height").val(), weight: $("#weight").val(),
						status: $("#status").val(), category1: $("#category1").val(), product_discount_price: $("#discount").val(),
						product_discount_start: $("#product_discount_start").val(), product_discount_end: $("#product_discount_end").val()},
			success: function( result ){}
		});
		$('#addproduct').addClass('hidden');
		$('#saveimage').removeClass('hidden');
		$('#finishadd').removeClass('hidden');
		$('#idImage').removeClass('hidden');
		$('#idImage').addClass('active');
		$('#general').removeClass('active');
		$('#general').addClass('hidden');
		$('#link').addClass('hidden');
		$('#tab-data').removeClass('active');
		$('#tab-links').removeClass('active');
		$('#tab-image').addClass('active');

	});
	$(document).on("click","#editproduct",function(){
		$.ajax({
			url: '/admin/product/change',
			type: 'POST',
			data: { id: $("#id").val(), name: $("#name").val(), description: $("#description").val(), model: $("#model").val(),
		 				price: $("#price").val(), quantity: $("#quantity").val(),	length: $("#length").val(), width: $("#width").val(), height: $("#height").val(),
						weight: $("#weight").val(), status: $("#status").val(), category1: $("#category1").val(), product_discount_price: $("#discount").val() },
			success: function( result ){}
		});
	});


	// $(document).on("click","#saveimage",function(){
	// 	$( "#indexcambio" ).html( "<%= escape_javascript( render( "addproduct" ) ) %>" );
	// 	$('#tab-image').removeClass('active');
	// 	$('#saveimage').addClass('hidden');
	// 	$('#saveorder').removeClass('hidden');
	// 	$('#tab-sort').addClass('active');
	// 	$('#idImage').removeClass('active');
	// 	$('#idSort').addClass('active');
	// 	$('#idImage').addClass('hidden');
	// 	$('#idSort').removeClass('hidden');
	// });

});
//$( function() {
	//$( '#sortable' ).sortable();
	//$( '#sortable' ).disableSelection();
//});
//function update_order() {window.location.href = '/admin/product/sortimages?'+$('#sortable').sortable('serialize');
