$(function(){

  var $container = $('#masonry-container');

  $container.masonry({
    itemSelector: '.box',
    columnWidth: 3,
    gutterWidth: 15
  });

  $container.imagesLoaded( function(){
    $container.masonry({
      itemSelector : '.box'
    });
  });

});
