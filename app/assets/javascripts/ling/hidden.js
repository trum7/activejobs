$(document).on("click",function(){
    /*disable non active tabs*/
    $('#tabs li.disabled').find('a').removeAttr('data-toggle');
    $('#addproduct').click(function(){
        /*enable next tab*/
        $('#tabs li.disabled').removeClass('disabled');
        $('#tabs li.disabled').find('a').attr("data-toggle","tab")
    });
});
