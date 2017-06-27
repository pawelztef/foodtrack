$(function() {
  $('.track-date').datetimepicker({
    format: 'YYYY-MM-DD HH:mm'
  });
  $('#stops').on('cocoon:after-insert', function(e, insertedItem) {
    $('.track-date').datetimepicker({
    format: 'YYYY-MM-DD HH:mm'
    });
  });
  $('#tracks-table').dataTable();
});
