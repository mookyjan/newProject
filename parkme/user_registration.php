<?php
$usrename = "root";
$password = "";
$database = "parkingapp";
$servername = "localhost";
mysql_connect($servername, $usrename, $password, $database);
mysql_select_db($database);
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$name = $firstname.' '.$lastname;
$email = $_POST['email'];
$password = $_POST['password'];
//$encrypted_password = md5($password);/**/
$phone_number = $_POST['phone_number'];
$query = "INSERT INTO users VALUES ('$name', '$email', '$password', '$phone_number')";
if(mysql_query($query)){
		echo "Yes";
	}

?>