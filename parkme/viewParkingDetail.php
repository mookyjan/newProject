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
    <form action="viewParkingDetail.php" method="post">
      <div class="form_div">
        <label>Parking Areas</label>
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
        <label>Parking Plots</label>
        <span id="plot">
        	<select name="sel">
            	<option>Select</option>
            </select>
        </span>
        
        </select><br/>
        <label>Parking Slots</label>
        <span id="slot">
        	<select name="sel">
            	<option>Select</option>
            </select>
        </span><br/>
    
      </div>
    </form>
</div>

<script type="text/javascript">
 	function change_parkingArea(){
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", "ajax11.php?parking_area="+document.getElementById("parkingarea").value,false);
			xmlhttp.send(null);
			document.getElementById("plot").innerHTML = xmlhttp.responseText;
			
		}

 	function change_plot(){
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", "ajax11.php?plot="+document.getElementById("parkingPlot").value,false);
			xmlhttp.send(null);
			document.getElementById("slot").innerHTML = xmlhttp.responseText;
			
		}
 </script>
</body>
</html>