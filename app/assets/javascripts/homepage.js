
var map;
function initMap() {
  var current;

  if (navigator.geolocation){
      navigator.geolocation.getCurrentPosition(function(position) {
         var pos = {
           lat: position.coords.latitude,
           lng: position.coords.longitude
         };

         map = new google.maps.Map(document.getElementById('map'), {
           center: {lat: pos.lat, lng: pos.lng},
           zoom: 10
       });
      // !!! replace temp with method to get array
       var temp = [{address:'2378 west 8th avenue, Vancouver, BC'},{address:'325 howe street, Vancouver, BC'}]
       handlePostLocation(temp);

    });
  }else{
    // Browser doesn't support Geolocation
      handleLocationError(false, map.getCenter());
  }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
}

var temp = [{address: '44 Water St, Canada'},{address:'325 howe street vancouver bc canada'}]

function handlePostLocation (arr) {
var geocoder, infowindow;

  geocoder = new google.maps.Geocoder();
  infowindow = new google.maps.InfoWindow();
  for(var i=0;i<arr.length;i++){
    geocoder.geocode({'address': arr[i].address, country: 'CA'}, function (results, status){
      var marker;
      if (status == google.maps.GeocoderStatus.OK){
        marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location,
          name: results[0].formatted_address
        });
        google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map, marker);
          infowindow.setContent(marker.name)
        });
      }
    });
  }
}

function getNearbyTasks(position, zoom){
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    var lat, lng;
    lat = position.lat;
    if (xhttp.readyState == 4 && xhttp.status == 200){
      lng = position.lng
      xhttp.open("GET", "tasks.json?coordinates={lat:" + lat + ",lng:" + lng +"}", true);
      xhttp.send();
    }
  }
}


window['initMap'] = initMap;
window['handleLocationError'] = handleLocationError;
window['handlePostLocation'] = handlePostLocation;

// $(document).bind('index_task.load', (function(_this) {
//   return function(e, obj) {
//
//   };
// })(this));
