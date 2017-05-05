<!DOCTYPE html>
<html>
<head>
<style>
table {
    width:100%;
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: center;
}
table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color:#fff;
}
table#t01 th	{
    background-color: orange;
    color: white;
}
</style>
</head>
<body>
<?php
	require 'home.php';
	
?>
<table id="t01">
        <thead>
            <tr>
                <th>Reservation ID</th>
    			<th>User Email</th>
    			<th>Vehicle Plate Number</th>
    			<th>Parking Area</th>		
   				 <th>Parking Plot</th>
   				 <th>Parking Slot</th>
   				 <th>Start Time</th>
   				 <th>End Time</th>
            </tr>
        </thead>
        <tbody>
        <?php
		require 'connection.php';
		$email = $_SESSION['email'];
		
		$query = "SELECT reservation.reservation_id , reservation.email , reservation.license_plate_no, 			reservation.start_time , reservation.end_time , parking_areas.name , parking_plots.plot_name , parking_slots.parkingslot_name FROM parking_areas , parking_plots , reservation , parking_slots WHERE reservation.parkingslot_id = parking_slots.parkingslot_id and parking_slots.parkingarea_id = parking_areas.id and parking_slots.parkingplot_id = parking_plots.id and parking_areas.email = '$email'";
		$res = mysql_query($query);
        while ($row = mysql_fetch_assoc($res))
        {
            echo '<tr>
					<td>'.$row["reservation_id"].'</td>
					<td>'.$row["email"].'</td>
					<td>'.$row["license_plate_no"].'</td>
                    <td>'.$row["name"].'</td>
                    <td>'.$row["plot_name"].'</td>
                    <td>'.$row["parkingslot_name"].'</td>
                    <td>'.$row["start_time"].'</td>
                    <td>'.$row["end_time"].'</td>
                </tr>';
        }?>
        </tbody>
    </table>
</body>
