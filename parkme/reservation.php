<?php
$usrename = "root";
$password = "";
$database = "parkingapp";
$servername = "localhost";
mysql_connect($servername, $usrename, $password, $database);
mysql_select_db($database);

$email = $_POST['email'];
$license_plate_no = $_POST['license_plate_no'];
$startTime = $_POST['startTime'];
$endTime = $_POST['endTime'];
$parkingarea_id = $_POST['parkingarea_id'];

//getting random slot
$select_query = "SELECT * FROM parking_slots WHERE status = '0' and parkingarea_id = '$parkingarea_id' ORDER BY rand() LIMIT 1";
$result1 = mysql_query($select_query);
while($r = @mysql_fetch_assoc($result1)){
		$parkingslot_id = $r['parkingslot_id'];
}

//update slot status
$update_query = "UPDATE parking_slots SET status = '1' WHERE parkingslot_id = '$parkingslot_id'";
mysql_query($update_query);

//populating the reservation table
$insert_query = "INSERT INTO reservation VALUES ('', '$parkingslot_id', '$email', '$license_plate_no', '$startTime', '$endTime')";
if(mysql_query($insert_query)){
		echo 'Yes';
	}
	else{
		 echo 'No';
		}
?>
