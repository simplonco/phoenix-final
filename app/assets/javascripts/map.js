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

window.setTimeout(initMap, 100); 

function initMap() {
	//this should check if your leaflet is available or wait if not. 
	if(typeof L === "undefined"){
	    window.setTimeout(initMap, 100);
	    return;
	}

	L.mapbox.accessToken = 'pk.eyJ1IjoiYmxhY2t5cmVib3JuIiwiYSI6ImYzZmU0N2NkYjI2Yzg2MWJkOGQzNjVhMDRiZDMxZDQ0In0.bIVCO2X4xY-smtD8C1WDKg';
	$('.map').each(function() {
		var map = L.mapbox.map($(this).attr('id'), 'mapbox.streets', {zoomControl:false}).setView([48.855, 2.4], 8);
		
		var geocoder = L.mapbox.geocoder('mapbox.places');
		var adress = document.getElementById($(this).attr('id'));
	
		geocoder.query(adress.getAttribute("data-adress-map").split(",")[0], showMap);

		function showMap(err, data) {
		    // The geocoder can return an area, like a city, or a
		    // point, like an address. Here we handle both cases,
		    // by fitting the map bounds to an area or zooming to a point.
		    if (data.lbounds) {
		        map.fitBounds(data.lbounds);
		    } 
		    else if (data.latlng) {
		        map.setView([data.latlng[0], data.latlng[1]], 13);
		    }
		    
		    var marker = L.marker([data.latlng[0], data.latlng[1]]).addTo(map);

		    marker.bindPopup(adress.getAttribute("data-title-map") +"<br>"+ adress.getAttribute("data-adress-map"));

		    new L.Control.Zoom({ position: 'bottomright' }).addTo(map);
		}

	});
	
}

