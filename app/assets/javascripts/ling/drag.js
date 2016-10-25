$(document).ready(function(){
    
    $(function () {
        $("#sortable").sortable({
            update: function (event, ui) {
                var order = $(this).sortable('serialize');

                $(document).on("click", "#saveorder", function () { //that doesn't work
                    $.ajax({
                        data: order,
                        type: 'POST',
                        url: '/admin/product/sortimages'
                    });
                });
            }
        }).disableSelection();
        $('#saveorder').on('click', function () {
            var r = $("#sortable").sortable("toArray");
            var a = $("#sortable").sortable("serialize", {
            });
            console.log(r, a);
        });
      });
});
