<?php
$usrename = "root";
$password = "";
$database = "parkingapp";
$servername = "localhost";
mysql_connect($servername, $usrename, $password, $database);
mysql_select_db($database);
//vehicle image
$make = $_POST['make'];
$model = $_POST['model'];
$license_plate_no = $_POST['license_plate'];
$color = $_POST['color'];
$user_email = $_POST['user_email'];
$query = "INSERT INTO vehicle_registration VALUES ('$make', '$model', '$license_plate_no', '$color', '$user_email', 'image')";
if(mysql_query($query)){
		echo "Yes";
	}

?>