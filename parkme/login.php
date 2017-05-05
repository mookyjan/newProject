<?php
	session_start();
?>
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
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size:18px;
	font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
}
#submit_button {
    height: 40px;
	width: 130px;
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

<body >
<div class="login">
<ul>
  <li><a style="font-size:30px; color:#C6272A;">Admin Dashboard</a></li>
  <li style="float:right"><a href="registration.php">Registration</a></li>
  <li style="float:right"><a href="login.php">Login</a></li>
</ul>

<div class="form1">
  <center>
    <form action="login.php" method="post">
      <div class="form_div">
        <label>Email</label>
        <input type="email" name="email">
        <br>
        <label>Password</label>
        <input type="password" name="password" >
        <br>
        <input type="submit" value="Submit" name="submit" id="submit_button"> 
      </div>
    </form>
  </center>
</div>
  </div>
</body>

<?php 
	include 'connection.php';
	if(isset($_POST['submit'])){
		$email = $_POST['email'];
		$_SESSION['user_email'] = $_POST['email'];
		$password = $_POST['password'];
		if(empty($password) or empty($email)){
				echo "<label style='color:red; margin-left:700px; width:300px'>some fields are empty<label>";
			}
			else{
			$query = "SELECT * FROM customers WHERE email='$email' and password='$password'";
			$result = mysql_query($query);
			if(mysql_num_rows($result) == 1){
				//session variable email
					$_SESSION['email'] = $email;
					header('Location: home.php');
				
				}
				else{
						echo "<label style='color:red; width:400px; float:right; margin-top:-110px;'>your password and email does'nt matched</label>";
					}
			}
		}

?>
</html>

