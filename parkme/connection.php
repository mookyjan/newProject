<!doctype html>
<html>
<head>
<meta charset="UTF-8">
</head>

<body>
<?php
	$localhost = 'localhost';
	$user_name = 'root';
	$password = '';
	$database = 'parkingapp';
	mysql_connect($localhost,$user_name,$password);
	mysql_select_db($database);
	
?>
</body>
</html>