$(window).load(function() {
  var $window = $(window);
  if ($window.width() < 767) {
    $("#navbar-wishlist").prepend(document.createTextNode('Wish list'));
  }
});
