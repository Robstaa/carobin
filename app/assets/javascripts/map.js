function initMap(coordinates) {
    var myCoords = new google.maps.LatLng(coordinates.lat, coordinates.lng);
    var mapOptions = {
    center: myCoords,
    zoom: 13
    };
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);

    var marker = new google.maps.Marker({
        position: myCoords,
        map: map
    });
}