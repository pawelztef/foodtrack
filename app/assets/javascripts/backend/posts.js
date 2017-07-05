$(function() {
  $('#post_publish_date').datetimepicker({
    format: 'YYYY-MM-DD HH:mm'
  });
  $('#posts-table').dataTable({
    "language": {
      "processing":     "Przetwarzanie...",
      "search":         "Szukaj:",
      "lengthMenu":     "Pokaż _MENU_ pozycji",
      "info":           "Pozycje od _START_ do _END_ z _TOTAL_ łącznie",
      "infoEmpty":      "Pozycji 0 z 0 dostępnych",
      "infoFiltered":   "(filtrowanie spośród _MAX_ dostępnych pozycji)",
      "infoPostFix":    "",
      "loadingRecords": "Wczytywanie...",
      "zeroRecords":    "Nie znaleziono pasujących pozycji",
      "emptyTable":     "Brak danych",
      "paginate": {
        "first":      "Pierwsza",
        "previous":   "Poprzednia",
        "next":       "Następna",
        "last":       "Ostatnia"
      },
      "aria": {
        "sortAscending": ": aktywuj, by posortować kolumnę rosnąco",
        "sortDescending": ": aktywuj, by posortować kolumnę malejąco"
      }
    }
  });

  if ($('#post-form-wrapper').hasClass('posts-new')) {
    // auto writing to permalink input 
    $("#post_title").keyup(function(e){
      var userInput = $(this).val();
      var x = slugify(userInput);
      $("#post_slug").val(x);
    });
  }

  function slugify(text)
  {
    return text.toString().toLowerCase()
      .replace(/\s+/g, '-')           // Replace spaces with -
      .replace(/[^\w\-]+/g, '')       // Remove all non-word chars
      .replace(/\-\-+/g, '-')         // Replace multiple - with single -
      .replace(/^-+/, '')             // Trim - from start of text
      .replace(/-+$/, '');            // Trim - from end of text
  }

  // $('.gallery-image').on('click', function() {
  //   alert("clicked");
  //   var id = $(this).attr("id");
  //   $.ajax({
  //     type: "POST",
  //     dataType: "script",
  //     contentType: 'application/json',
  //     url: "/backend/posts/add_image",
  //     data: JSON.stringify({
  //       image_id: id
  //     })
  //   })
  // });
});
