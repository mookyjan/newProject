<?php
$username = "root";
$password = "";
$database = "parkingapp";
$servername = "localhost";
mysql_connect($servername, $username, $password, $database);
mysql_select_db($database);
$email = $_POST['user_email'];
$select_query = "SELECT reservation.reservation_id , reservation.email , reservation.license_plate_no, reservation.start_time , reservation.end_time , parking_areas.name , parking_plots.plot_name , parking_slots.parkingslot_name FROM parking_areas , parking_plots , reservation , parking_slots WHERE reservation.parkingslot_id = parking_slots.parkingslot_id and parking_slots.parkingarea_id = parking_areas.id and parking_slots.parkingplot_id = parking_plots.id and reservation.email = '$email'";
$result = mysql_query($select_query);
$num_of_rows = mysql_num_rows($result);
if($num_of_rows == 0){
	echo 'NO';
	}
else{
$rows = array();
while($r = mysql_fetch_assoc($result)){
		$rows[] = $r;
	}
	echo json_encode($rows);
}
?>