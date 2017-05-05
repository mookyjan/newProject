
<?php
	require 'connection.php';
	$parking_area = @$_GET['parking_area'];
	$parking_plot = @$_GET['plot'];
	if($parking_area != ""){
	$query = "SELECT * FROM parking_plots WHERE parkingarea_id = $parking_area";
	$result = mysql_query($query);
	echo "<select id='parkingPlot' onChange='change_plot()'>";
	echo "<option> Select </section>";
	while($rows = mysql_fetch_array($result))
	{
		echo "<option value='$rows[id]'>"; echo $rows["plot_name"]; echo "</option>";
	}
	echo "</select>";
}

if($parking_plot != ""){
	$query = "SELECT * FROM parking_slots WHERE parkingplot_id = $parking_plot";
	$result = mysql_query($query);
	echo "<select>";
	while($rows = mysql_fetch_array($result))
	{
		echo "<option value='$rows[id]'>"; echo $rows["parkingslot_name"]; echo "</option>";
	}
	echo "</select>";
}
?>