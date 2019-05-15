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
        new google.maps.Marker({
            position: coords,
            map: map
        });
    });
}