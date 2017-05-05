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
	 font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
}
span{
		font-family:Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
		
	}
</style>
</head>

<body>
	<?php
    	include 'home.php';
		require 'connection.php';
		//use of session variable email
		$email = $_SESSION['email'];
	?>
    <h2>Parking Area Detail</h2>
    <div class="form1">
    <form action="createparkingslot.php" method="post">
      <div class="form_div">
        <label>Select Parking Area</label>
    	<select id="parkingarea" name="select_parking_area" onChange="change_parkingArea()">
        	<option>Select</option>
           	<?php
				
            	$query = "SELECT * FROM parking_areas WHERE email = '$email'";
				$res = mysql_query($query);
				while($row = mysql_fetch_array($res))
				{
				?>
                <option value="<?php echo $row["id"];?>"><?php echo $row["name"];?></option>	
                <?php
                }
				?>
        </select><br/>
        <label>Select Parking Plot</label>
        <span id="plot">
        	<select name="sel">
            	<option>Select</option>
            </select>
        </span><br/>
 <script type="text/javascript">
 	function change_parkingArea(){
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", "ajax.php?parking_area="+document.getElementById("parkingarea").value,false);
			xmlhttp.send(null);
			document.getElementById("plot").innerHTML = xmlhttp.responseText;
			
		}
 </script>
          
        <label>Enter name of Parking Slot</label>
        <input type="text" name="slot_name" >
        <br>
        <label>Select Parking Type</label>
        <input type="radio" name="parkingtype" value="two_wheel" style="margin-left:20px; width:30px;"><span>Two Wheel</span>
  		<input type="radio" name="parkingtype" value="four_wheel" style="margin-left:10px; width:30px;"><span>Four Wheel</span>
        <br>
        <input type="submit" value="Submit" name="submit" id="submit_button"> 
      </div>
    </form>
</div>
</body>
</html>
<?php
	if(isset($_POST['submit'])){
		$parkingarea_id = $_POST['select_parking_area'];
		$parkingplot_id = $_POST['plot_id'];
		$parkingslot_name = $_POST['slot_name'];
		$parkingtype = $_POST['parkingtype'];
		$slot_status = "yes";
		if(empty($parkingarea_id) or empty($parkingplot_id) or empty($parkingslot_name) or empty($parkingtype) or empty(	  $slot_status)){
				echo "<label style='color:red; float:right; margin-right:380px; margin-top:-262px'>some field are empty</label>";
			}
			else{
		$query = "INSERT INTO parking_slots VALUES ('', '$parkingarea_id', '$parkingplot_id', '$parkingslot_name', '$parkingtype', '$slot_status')";
		if(mysql_query($query))
		{
			echo "<label style='color:green; float:right; margin-right:380px; margin-top:-262px'>new slot is successfully added</label>";
		}
			}
		}
		
?>






