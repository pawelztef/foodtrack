// $(function() {
//   return $('#new_image').fileupload({
//     dataType: "script",
//     add(e, data) {
//       types = /(\.|\/)(gif|jpe?g|png)$/i;
//       file = data.files[0];
//       if (types.test(file.type) || types.test(file.name)) {
//         data.context = $(tmpl("template-upload", file));
//         $('#new_image').append(data.context);
//         return data.submit();
//       } else {
//         return alert(`${file.name} is not a gif, jpeg, or png image file`);
//       }
//     },
//     progress(e, data) {
//       if (data.context) {
//         progress = parseInt((data.loaded / data.total) * 100, 10);
//         return data.context.find('.bar').css('width', progress + '%');
//       }
//     }
//   });
// });

$(function() {
  $('#new_image').fileupload({
    dataType: 'script',
    progressall: function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .bar').css(
            'width',
            progress + '%'
        );
    }
  });
})
