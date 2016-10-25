$(document).on("click","#container-categories .pagination a ,#product-containter .pagination a", function(){
    $.getScript(this.href);
    return false;
});
$(document).on("click","#prange",function(){
  alert("Precio");
  $.ajax({

    url: $("#path").val() ,
    type: 'POST',
    data: { category_id: $("#id").val(), price: $("#price-filter").val() },
    success: function( result ){}
  });
});
