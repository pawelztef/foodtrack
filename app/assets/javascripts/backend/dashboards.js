$(function() {
  $('.stops').on('click', function() { 
    var id = $(this).attr("id");
    $.ajax({
      type: "POST",
      dataType: "script",
      contentType: 'application/json',
      url: "/backend/stops/activate",
      data: JSON.stringify({
        stop_id: id
      })
    })
    $('.stops').removeClass('success');
    $(this).addClass('success');
  });
})
