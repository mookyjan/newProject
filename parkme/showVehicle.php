<?php
$usrename = "root";
$password = "";
$database = "parkingapp";
$servername = "localhost";
mysql_connect($servername, $usrename, $password, $database);
$user_email = $_POST['user_email'];
mysql_select_db($database);$query = "SELECT * FROM vehicle_registration WHERE email = '$user_email'";
$result = mysql_query($query);
$num = mysql_num_rows($result);
$rows = array();
while($r = mysql_fetch_assoc($result)){
		$rows[] = $r;
	}
	echo json_encode($rows);
?>