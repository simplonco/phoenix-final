var ready;
ready = function() {
	L.mapbox.accessToken = 'pk.eyJ1IjoiYmxhY2t5IiwiYSI6IjA4NWJjZDNiNDQ0MTg3YjVmZTNkM2NkMWQ3MmM4ZjU4In0.SDQh56AZPCbIL2rVs4eAkQ';
	var map = L.mapbox.map('map', 'mapbox.streets').setView([48.855, 2.4], 8);
	var geocoder = L.mapbox.geocoder('mapbox.places');
	var adress = document.getElementById("map");

	geocoder.query(adress.getAttribute("data-adress-map"), showMap);

	function showMap(err, data) {
	    // The geocoder can return an area, like a city, or a
	    // point, like an address. Here we handle both cases,
	    // by fitting the map bounds to an area or zooming to a point.
	    if (data.lbounds) {
	        map.fitBounds(data.lbounds);
	    } else if (data.latlng) {
	        map.setView([data.latlng[0], data.latlng[1]], 13);
	    }
	    
	    var marker = L.marker([data.latlng[0], data.latlng[1]]).addTo(map);

	    marker.bindPopup(adress.getAttribute("data-title-map") +"<br>"+ adress.getAttribute("data-adress-map"));
	}
};

$(document).ready(ready);
$(document).on('page:load', ready);

