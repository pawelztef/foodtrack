$(function() {
  $('.timeline-badge').on('click', function() { 
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
    $('.timeline-badge').removeClass('success');
    $(this).addClass('success');
  });
})
