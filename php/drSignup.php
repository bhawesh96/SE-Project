<?php 

include_once('conn.php');

$fname = $_POST['fname'];
$lname = $_POST['lname'];
$phone = $_POST['phone'];
$category = $_POST['category'];
$fees = $_POST['fees'];
$drID = substr($phone,4).substr($fname,2);


$sql = "INSERT INTO drDetails (drID, fname, lname, phone, category, fees) VALUES ('$drID', '$fname', '$lname', '$phone', '$category', '$fees')";

if (mysql_query($sql)) {
    echo "New record created successfully";
} else {
    echo mysql_error($sql);
}


 ?>