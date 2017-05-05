<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>ParkMe</title>
<style>
	h2{
		margin-left:200px;
		font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
		}
		
	.form1{
		margin-top:100px;
		margin-left:300px;
	}
		
	.form1 input {
	 height: 35px;
	 width: 300px;
	 border-style:solid;
	 border-width:1px;
	 border-color:#1B1B1B;
	 border-radius:4px;
  }
.form_div input, textarea {
	margin-bottom: 10px;
	font-size: 14px;
	margin-left: 20px;
	font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
}
label {
	display: inline-block;
	/**display: inline; */   
	zoom: 1;
	padding-top: 5px;
	text-align: right;
	width: 240px;
	font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
}
#submit_button {
     height: 40px;
	 width: 100px;
	 border: none;
	 margin-left:370px;
	 background-color:white;
	 border-style:solid;
	 border-width:1px;
	 border-color:#1B1B1B;
	 font-size:19px;
}
</style>
</head>

<body>
<?php
	include 'home.php';
?>
<h2>Parking Area Detail</h2>

<div class="form1">
    <form action="createparkarea.php" method="post" enctype="multipart/form-data">
      <div class="form_div">
        <label>Enter name of parking area</label>
        <input type="text" name="area_name">
        <br>
        <label>Enter address of parking area</label>
        <input type="text" name="area_address" >
        <br>
        <label>Parking Area image</label>
        <input type="file" name="image">
        <br>
        <label>Enter Parking Fee/hr (in dollar)</label>
        <input type="number" name="parking_fee" >
        <br>
        <label>Enter latitude</label>
        <input type="number" name="latitude" step="0.000000000000000001" id="lat">
        <br>
        <label>Enter longitude</label>
        <input type="number" name="longitude" step="0.000000000000000001" id="lng">
        <br>
        <label>Enter Description about Parking Area</label>
        <textarea name="description" rows="5" cols="50"></textarea>
        <br>
        <input type="submit" value="Submit" name="submit" id="submit_button"> 
      </div>
    </form>
</div>

</body>





<?php 
	include 'connection.php';
	if(isset($_POST['submit'])){
		
		$tmp_name = $_FILES['image']['tmp_name'];
		$image = $_FILES['image']['name'];
		$filepath = "images/";
	
        move_uploaded_file($tmp_name, $filepath.$image);
		
		//session variable email
		$email = $_SESSION['email'];
		$area_name = $_POST['area_name'];
		$area_address = $_POST['area_address'];
		$parking_fee = $_POST['parking_fee'];
		$latitude = $_POST['latitude'];
		$longitude = $_POST['longitude'];
		$description = $_POST['description'];
		if(empty($area_name) or empty($area_address) or empty($parking_fee) or empty($latitude) or empty($longitude) or empty(						                $description)){
				echo "<label style='color:red; float:right; margin-top:-280px; margin-right:250px'>some field are empty</label";
		}
		else{
			$query = "INSERT INTO parking_areas VALUES ('', '$area_name', '$area_address', '$image', '$parking_fee',             '$longitude', '$latitude', '$description', '$email')";
		    if(mysql_query($query)){
				echo '<p style="color:green;">new Parking area is added</p>';
				}
			}
		}

?>
	<br><span style="color:#0B040C; font-family:Segoe, 'Segoe UI', 'DejaVu Sans', 'Trebuchet MS', Verdana, sans-serif;">You can enter value of latitude and longitude from here</span>
<div id="map_canvas" onclick="mapDivClicked(event);" style="height:730px; width: 1300px; margin-left:50px"></div>
        <div />
</html>
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
        
        
        
        
        
        





