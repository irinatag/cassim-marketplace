$(document).ready(function() {
  $('body').on('click', '#send', function(event) {
    event.preventDefault();
    var productID = window.location.pathname.replace(/\D/g, "")
    $.ajax('/mail',
    {
      type: 'post',
      data: {
        id: productID
      }
    })
  })
})
