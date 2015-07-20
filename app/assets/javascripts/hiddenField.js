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
//= require turbolinks
//= require_tree .

var ready;
ready = function() {
    
      $('#page_contact_slide').change(function(slide) {
        $('li#page_title_map_input').toggle();
        $('li#page_adress_map_input').toggle();
        $('li#page_video_input').toggle();
        if (document.getElementById('page_title_map_input').style.display != "none" && document.getElementById('page_adress_map_input').style.display != "none") {
          $('li#page_title_map_input').toggle();
          $('li#page_adress_map_input').toggle();
        }
        if (document.getElementById('page_video_input').style.display != "none") {
          $('li#page_video_input').toggle();
        }
      });

      $('#page_contact_formulaire_de_contact').change(function() {
        if (document.getElementById('page_title_map_input').style.display != "none" && document.getElementById('page_adress_map_input').style.display != "none") {
          $('li#page_title_map_input').toggle();
          $('li#page_adress_map_input').toggle();
        }
        if (document.getElementById('page_video_input').style.display != "none") {
          $('li#page_video_input').toggle();
        }
      });
    
      $('#page_contact_map').change(function() {
        $('li#page_title_map_input:hidden').show();
        $('li#page_adress_map_input:hidden').show();
        if (document.getElementById('page_video_input').style.display != "none") {
          $('li#page_video_input').toggle();
        }
      });
    
      $('#page_contact_video').change(function() {
        $('li#page_video_input:hidden').show();
        if (document.getElementById('page_title_map_input').style.display != "none" && document.getElementById('page_adress_map_input').style.display != "none") {
          $('li#page_title_map_input').toggle();
          $('li#page_adress_map_input').toggle();
        }
      });
}

$(document).ready(ready);
$(document).on('page:load', ready);