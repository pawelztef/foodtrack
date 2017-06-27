$(function() {
  $('#post_publish_date').datetimepicker({
    format: 'YYYY-MM-DD HH:mm'
  });
  $('#posts-table').dataTable({
    responsive: true
  });
});
