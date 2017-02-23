//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require underscore
//= require gmaps/google
//= require bootsy
//= require attachinary
//= require_tree .

$(".radio-enhanced").click(function(){
  $('.plus').css('color', 'white');
  $(this).find('.plus').css('color', '#32B796');
})
