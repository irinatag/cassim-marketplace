$(document).ready(function() {
  $('body').on('click', '#send', function(event) {
    event.preventDefault();
    var productID = window.location.pathname.replace(/\D/g, "");
    var qty = $('#desired').val();
    var email = $('#email').val();
    $.ajax('/reserve',
    {
      type: 'post',
      data: {
        id: productID,
        qty: qty
      }
    });

    $.ajax('/mail',
    {
      type: 'post',
      data: {
        id: productID,
        qty: qty,
        email: email
      }
    });
  });

  $('body').on('click', '#reserve', function(event) {
    $('#reserve-button').append('<p>How many?</p><form method="post">\
      <input id="desired" type="number" />\
      <input id="email" type="email" placeholder="email"/>\
    </form><button id="send">This button to send email</button>'
    );
  });
});
