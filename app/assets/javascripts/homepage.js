//      var fakeJson = {
//        "address" : '101-2256 West 7th Avenue'
//      }
// encode.URI will encode my string so I can make the get request

// https://maps.googleapis.com/maps/api/geocode/json?address=101+2256+west+7th+avenue+vancouver+bc
// 1st thing. Convert JSON into required URL
// 2nd thing. Convert RESPONSE into a place. I need the place ID & the geometry.location
      function initMap() {
        var infowindow;
        var current;
        var map;

      //  infowindow = new google.maps.InfoWindow({map:map});
        //console.log(handlePostLocation());
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

            // uncomment once GET is implemented.
            // need another method that calculates the zoom.
            // http://stackoverflow.com/questions/32284554/google-maps-distance-based-on-the-zoom-level
            // getNearbyTasks(pos,zoom);
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

      var temp = [{address:'2378 west 8th avenue'},{address:'325 howe street'}]

      function handlePostLocation (arr){
        for(var i=0;i<arr.length;i++){
          var url = encodeURI(arr[i].address);
        if (status === google.maps.GeocoderStatus.OK)
        $.ajax({
          url: "https://maps.googleapis.com/maps/api/geocode/json?address="+url,
          type: 'GET',
          dataType: 'JSON',
          complete: function (data) {
              console.log(data.responseJSON);
          }
        });
        }
      }
      handlePostLocation(temp);

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
