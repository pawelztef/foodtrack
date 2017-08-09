$(function() {
  $('#new_image').fileupload({
    dataType: 'script',
    progressall: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .bar').css( 'width', progress + '%');
        if( progress === 100) {
          setTimeout(function(){ $('#progress .bar').css( 'width', '0%'); }, 3000);
          $('#flash_wrapper').html( " <div id='flash' class='alert alert-info alert-dismissible' role='alert'> <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span> </button> <p class='notice'> Zdjęcia zostały zapisane</p> </div> ");
          $('#flash_wrapper').delay('3000').slideUp();
        }
    }
  });
})
