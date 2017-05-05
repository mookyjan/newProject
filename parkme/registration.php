<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>ParkMe</title>
<style>
body{
	background-color:#FBF9F9;
	}
.form1{
		margin-top:100px;
	}
.form1 input {
	height: 35px;
	width: 300px;
	border-style:solid;
	border-width:1px;
	border-color:#1B1B1B;
	border-radius:6px;
  }
.form_div input {
	margin-bottom: 10px;
	font-size: 16px;
	margin-left: 20px;
	font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
}
label {
	display: inline-block;
	/**display: inline; */   
	zoom: 1;
	padding-top: 5px;
	text-align: right;
	width: 140px;
	font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
}
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
li {
	float: left;
}
li a {
	display: block;
	color:black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size:18px;
	font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
}
#submit_button {
     height: 40px;
	 width: 120px;
	 border: none;
	 margin-left:155px;
	 background-color:white;
	 border-style:solid;
	 border-width:1px;
	 border-color:#1B1B1B;
	 font-size:19px;
	 font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
}
</style>    
</head>

<body>

<ul>
  <li><a style="font-size:30px;  color:#DE2225">Admin Dashboard</a></li>
  <li style="float:right"><a href="registration.php">Registration</a></li>
  <li style="float:right"><a href="login.php">Login</a></li>
</ul>
<div class="form1">
  <center>
    <form action="registration.php" method="post">
		<div class="form_div">
        <label>First Name</label>
        <input type="text" name="firstname" >
        <br>
        <label>Last Name</label>
        <input type="text" name="lastname">
        <br>
        <label>Email</label>
        <input type="email" name="email">
        <br>
        <label>Password</label>
        <input type="password" name="password1">
        <br>
        <label>Confirm Password</label>
        <input type="password" name="password2">
        <br>
        <label>Phone Number</label>
        <input type="tel" name="phone_number" min="11" max="11">
        <br>
        <input type="submit" value="Submit" name="submit" id="submit_button">
		</div>
    </form>
  </center>
</div>

</body>
<?php
include 'connection.php';
	if(isset($_POST['submit'])){
	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$name = $firstname.' '.$lastname;
	$email = $_POST['email'];
	$password1 = $_POST['password1'];
	$password2 = $_POST['password2'];
	//$password = md5($password1);
	$phone_number = $_POST['phone_number'];
	if(empty($firstname) or empty($lastname) or empty($email) or empty($password1) or empty($phone_number) or $password1!==$password2){
		echo "<label style='color:red; margin-left:700px; width:300px'>some fields are empty<label>";
	}
	else{
			$query = "INSERT INTO customers VALUES ('$name', '$password1', '$email', '$phone_number')";
			if(mysql_query($query)){ 
		     header('Location: login.php');
			}
		}
}
?>
</html>
