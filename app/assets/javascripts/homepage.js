var map;
function initMap() {
  var infowindow, current, pos;

  if (navigator.geolocation){
      navigator.geolocation.getCurrentPosition(function(position) {
          pos = {
           lat: position.coords.latitude,
           lng: position.coords.longitude
         };

         map = new google.maps.Map(document.getElementById('map'), {
           center: {lat: pos.lat, lng: pos.lng},
           zoom: 10
       });
       infowindow = new google.maps.InfoWindow({map:map});
       infowindow.setPosition(pos);
       infowindow.setContent("Debugging window. SUCCESS!");
       // !!! uncomment below and remove mock data once service call is in place.
       // temp = getNearbyTasks(pos, 10)
       var temp = [{address:'2378 west 8th avenue, Vancouver, BC'},{address:'325 howe street, Vancouver, BC'}]
       handlePostLocation(temp);

    });
  }else{
    // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
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
  var geocoder = new google.maps.Geocoder();

  for(var i=0;i<arr.length;i++){
    geocoder.geocode({'address': arr[i].address, country: 'CA'}, function (results, status){
      if (status == google.maps.GeocoderStatus.OK){
        var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
      }
    });
  }
}


function getNearbyTasks(position, zoom){
  var url = "search/tasks?lat=" + position.lat + "&long=" + position.long +"&zoom=" zoom;
  $.ajax{
    url: url,
    type: GET,
    contentType: 'application/json; charset=utf-8',
    success: function(response){
      return response;
      }
    error: function(){
      console.log("Error! Cannot get tasks");
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
