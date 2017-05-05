<?php

$servername = "localhost";
$username = "root";
$passward="";
$dbname ="parkingapp";

$conn = new MySQLi($servername,$username,$passward,$dbname);

if($conn->connect_error)
{
    die("Connection failed: " . $conn->connect_error); 
} 
$email = $_POST['email'];
$password=$_POST['password']; 
$qry=("select * from users where email='$email' and password='$password'");
$result =mysqli_query($conn,$qry);
$row=mysqli_fetch_array($result);

if($row["email"]==$email && $row["password"]==$password)
{
echo "Yes";

}
else
{
echo '{"success":0,"error_message":"email and/or password is invalid."}';

}

?>