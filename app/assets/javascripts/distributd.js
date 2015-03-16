$(document).ready(function() {
  $('body').on('click', '#send', function(event) {
    event.preventDefault();
    console.log('pushed the button')
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
