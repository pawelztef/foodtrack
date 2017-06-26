$(function() {
  $('#post_publish_date').datetimepicker({
    format: 'YYYY-MM-DD HH:mm'
  });
  tinyMCE.init({
    selector: 'textarea#post_body',
  });
});
