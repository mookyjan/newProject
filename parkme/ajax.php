<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
</head>

<body>
</body>
</html>
<?php
require 'connection.php';
$parking_area = $_GET['parking_area'];
$query = "SELECT * FROM parking_plots WHERE parkingarea_id = $parking_area";
$result = mysql_query($query);
?>
<form action="createparkingslot.php" method="post">
<select name="plot_id">

<?php
while($row = mysql_fetch_array($result)){
?>
<option value="<?php echo $row['id'];?>"><?php echo $row['plot_name']; ?></option>;
<?php
}
?>
</select>