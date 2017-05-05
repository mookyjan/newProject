<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>ParkMe</title>
<style>
	h2{
		margin-left:200px;
		font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
		}
	.form1{
		margin-top:100px;
		margin-left:300px;
	}
		
	.form1 input, select {
	 height: 35px;
	 width: 300px;
	 border-style:solid;
	 border-width:1px;
	 border-color:#1B1B1B;
	 border-radius:6px;
  }
	.form_div input, select {
	margin-bottom: 10px;
	font-size: 14px;
	margin-left: 20px;
	font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
	}
	label {
	display: inline-block;
	/**display: inline; */   
	zoom: 1;
	padding-top: 5px;
	text-align: right;
	width: 240px;
	font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
}
#submit_button {
     height: 40px;
	 width: 100px;
	 border: none;
	 margin-left:370px;
	 background-color:white;
	 border-style:solid;
	 border-width:1px;
	 border-color:#1B1B1B;
	 font-size:19px;
}

</style>
</head>

<body>
	<?php
    	include 'home.php';
		require 'connection.php';
		//session variable email
		$email = $_SESSION['email'];
	?>
    <h2>Parking Area Detail</h2>
    <div class="form1">
    <form action="createnewplot.php" method="post">
      <div class="form_div">
        <label>Select Parking Area</label>
        
        <select name="select1"><?php 
		echo "<option>Select</option>";
		//use of session variable
		$query = "SELECT * FROM parking_areas WHERE email = '$email'";
		$query1 = mysql_query($query);
		while($row = mysql_fetch_array($query1)){ 
		?> 
    <option value="<?php echo $row['id'];?>"><?php echo $row["name"];?></option>
    <?php
		}
	?>
        </select><br/>
          
        <label>Enter name of Parking Plot</label>
        <input type="text" name="plot_name" >
        <br>
        <input type="submit" value="Submit" name="submit" id="submit_button"> 
      </div>
    </form>
</div>
</body>
	<?php
	include 'connection.php';
	if(isset($_POST['submit'])){
		$area_id = $_POST['select1'];
		$plot_name = $_POST['plot_name'];
		if(empty($area_id) or empty($plot_name)){
				echo "<label style='color:red; margin-left:570px;'>some field are empty</label>";
			}
			else{
			$query = "INSERT INTO parking_plots VALUES ('', '$area_id', '$plot_name')";
		    if(mysql_query($query)){
				echo '<p style="color:green; margin-left:650px;">new Parking Plot is added to </p>';
				}
			}
			
		}
	?>
</html>