"use strict";

function initMap(coordinates) {
    var centerCoordinates = new google.maps.LatLng(coordinates.centerLat, coordinates.centerLng);
    var mapOptions = {
        center: centerCoordinates,
        zoom: 13
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    coordinates.markers.forEach(function (marker) {
        var coords = new google.maps.LatLng(marker.latitude, marker.longitude);
        var pin = new google.maps.Marker({
            position: coords,
            map: map
        });
        pin.addListener('click', function () {
            window.location = "/places/".concat(marker.id.toString());
        });
    });
}

function autocompleteLocation(coordinates) {
    var defaultBounds = new google.maps.LatLngBounds(new google.maps.LatLng(coordinates.centerLat, coordinates.centerLng));
    var input = document.getElementById('maps-location');
    var options = {
        bounds: defaultBounds
    };
    new google.maps.places.Autocomplete(input, options);
}

;