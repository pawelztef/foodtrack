
$(function() {


  if ($('#product-form-wrapper').hasClass('products-new')) {
    // auto writing to permalink input 
    $("#product_name").keyup(function(e){
      var userInput = $(this).val();
      var x = slugify(userInput);
      $("#product_slug").val(x);
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