  
  
    <!DOCTYPE html>
<html>
    <head>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCYoOtD46LiTsJdI5P4_8BcYKExlTZq8Gc&callback=initMap"></script>
        <script>
            var map;

            function initialize() {
                var mapOptions = {
                    zoom: 12,
                    center: new google.maps.LatLng(34.2001, 72.0508),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                map = new google.maps.Map(document.getElementById('map_canvas'),
                    mapOptions
                );
                google.maps.event.addListener(map, 'click', function(event) {
                    document.getElementById('latMap').value = event.latLng.lat();
                    document.getElementById('lngMap').value = event.latLng.lng();
                });
            }
            function mapDivClicked (event) {
                var target = document.getElementById('map_canvas'),
                    posx = event.pageX - target.offsetLeft,
                    posy = event.pageY - target.offsetTop,
                    bounds = map.getBounds(),
                    neLatlng = bounds.getNorthEast(),
                    swLatlng = bounds.getSouthWest(),
                    startLat = neLatlng.lat(),
                    endLng = neLatlng.lng(),
                    endLat = swLatlng.lat(),
                    startLng = swLatlng.lng();

               
                document.getElementById('lat').value = startLat + ((posy/350) * (endLat - startLat));
                document.getElementById('lng').value = startLng + ((posx/500) * (endLng - startLng));
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>
    </head>
    <body>
        <div id="map_canvas" onclick="mapDivClicked(event);" style="height:730px; width: 1400px; margin-left:10px"></div>
    
        lat: <input id="lat" />
        lng: <input id="lng" />
        <div />
     
    </body>
</html>