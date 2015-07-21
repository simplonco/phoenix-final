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

	$('.video').each(function() {

		var embed = document.getElementById($(this).attr('id'));

		if (embed.getAttribute("data-link-video") == "https://www.youtube.com/watch?v=" + getIdYoutube(embed.getAttribute("data-link-video"))) {

		function getIdYoutube(url) {
		    var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
		    var match = url.match(regExp);

		    if (match && match[2].length == 11) {
		        return match[2];
		    } else {
		        return 'error';
		    }
		}

		var myId = getIdYoutube(embed.getAttribute("data-link-video"));

		$("#" + $(this).attr('id')).html('<iframe src="//www.youtube.com/embed/' + myId + '" frameborder="0" allowfullscreen></iframe>');
		
		} 

		else if (embed.getAttribute("data-link-video") == getIdDailymotion(embed.getAttribute("data-link-video"))) {

		function getIdDailymotion(url) {
		    var regExp = /^.*(dailymotion.com\/|v\/|u\/\w\/|embed\/|video\?v=|\&v=)([^#\&\?]*).*/;
		    var match = url.match(regExp);

		    if (match && match[2].length) {
		        return match[2];
		    } else {
		        return 'error';
		    }
		}

		var myId = getIdDailymotion(embed.getAttribute("data-link-video"));

		$("#" + $(this).attr('id')).html('<iframe width="640" height="480" src="//www.dailymotion.com/embed/' + myId + '" frameborder="0" allowfullscreen></iframe>');
		
		}

		else if (embed.getAttribute("data-link-video") == "https://vimeo.com/" + getIdVimeo(embed.getAttribute("data-link-video"))) {

		function getIdVimeo(url) {
		    var regExp = /^.*(vimeo.com\/|v\/|u\/\w\/|embed\/|video\?v=|\&v=)([^#\&\?]*).*/;
		    var match = url.match(regExp);

		    if (match && match[2].length == 8) {
		        return match[2];
		    } else {
		        return 'error';
		    }
		}

		var myId = getIdVimeo(embed.getAttribute("data-link-video"));

		$("#" + $(this).attr('id')).html('<iframe width="640" height="480" src="//player.vimeo.com/video/' + myId + '" frameborder="0" allowfullscreen></iframe>');
		
		}
	});
}

$(document).ready(ready);
$(document).on('page:load', ready);