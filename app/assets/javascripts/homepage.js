//      var fakeJson = {
//        "address" : '101-2256 West 7th Avenue'
//      }
// encode.URI will encode my string so I can make the get request

// https://maps.googleapis.com/maps/api/geocode/json?address=101+2256+west+7th+avenue+vancouver+bc
// 1st thing. Convert JSON into required URL
// 2nd thing. Convert RESPONSE into a place. I need the place ID & the geometry.location
var map;
      function initMap() {
        var infowindow, current;

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
             infowindow = new google.maps.InfoWindow({map:map});
             infowindow.setPosition(pos);
             infowindow.setContent("Debugging window. SUCCESS!");
            // !!! replace temp with method to get array
             var temp = [{address:'2378 west 8th avenue'},{address:'325 howe street'}]
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

      function handlePostLocation (arr){
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
