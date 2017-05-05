<?php
$usrename = "root";
$password = "";
$database = "parkingapp";
$servername = "localhost";
mysql_connect($servername, $usrename, $password, $database);
mysql_select_db($database);
$license_plate_no = $_POST['license_plate_no'];
$query = "DELETE FROM vehicle_registration WHERE license_plate_no = '$license_plate_no'";
if(mysql_query($query)){
		echo "Yes";
	}
	else{
			echo 'No';
		}
?>