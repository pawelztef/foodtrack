// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/extras/dataTables.responsive
//= require moment
//= require bootstrap-datetimepicker
//= require bootstrap_sb_admin_base_v2
//= require cocoon
//= require ckeditor/init
//= require ckeditor/config
//= require ckeditor/plugins/pastecode/plugin
//= require ckeditor/plugins/pastecode/lang/en
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require jquery.validate.localization/messages_pl
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require jquery.slick
//= require underscore
//= require gmaps/google
//= require_tree .
//

$(document).ready(function(){
  $("#nav-icon3").click(function(e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
    $('#nav-icon3').toggleClass('open');

  });

  $('.dropdown-toggle').dropdown();

  $("#flash").delay(500).show('normal', function(){
    $(this).delay(2500).slideUp();
  });

  $('#settings-info').popover({
    container: 'body',
    content: 'Niektóre ustawienia wymagają ponownego uruchomienia aplikacji.<br> W tym celu skontaktuj się z administratorem servera.',
    html: true
  });
  if (window.location.href.indexOf('#_=_') > 0) {
    window.location = window.location.href.replace(/#.*/, '');
  }

});
