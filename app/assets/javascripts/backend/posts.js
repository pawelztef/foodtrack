$(function() {
  $('#post_publish_date').datetimepicker({
    format: 'YYYY-MM-DD HH:mm'
  });
  $('#posts-table').dataTable({
    responsive: true
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
});
