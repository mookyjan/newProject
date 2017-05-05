<?php
	session_start();
	if(!isset($_SESSION['user_email'])){
			header('location: login.php');
		}
?>

<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<style>
body{
		background-color:#EADFDF;
	}	
 ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #000000;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
	font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
	
}


li a:hover {
    background-color: #111;
}
	
</style>
</head>

<body>

<div class="nav">
<ul>
<li ><a style="color:#C6070B;">Admin Dashboard</a></li>
<div style="margin-left:270px">
  <li><a href="createparkarea.php">Create new ParkingArea</a></li>
  <li><a href="createnewplot.php">Create new Plot</a></li>
  <li><a href="createparkingslot.php">Create new Slot</a></li>
  <li><a href="viewBooking.php">View Booking</a></li>
  <li><a href="#viewfeedback.php">View Feedback</a></li>
  <li><a href="viewParkingDetail.php">View ParkingArea Detail</a></li>
  <li style="float:right;"><a href="logout.php" style="color:#DD5B8A">Logout</a></li>
  </div>
</ul>
</div>
<div>You are logged in as an admin</div>
</body>
</html>



