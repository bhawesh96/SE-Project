<?php 

include_once('conn.php');

$fname = $_POST['fname'];
$lname = $_POST['lname'];
$phone = $_POST['phone'];
$category = $_POST['category'];
$fees = $_POST['fees'];
$drID = substr($phone,4).substr($fname,2);


$sql = "INSERT INTO drDetails (drID, fname, lname, phone, category, fees) VALUES ('$drID', '$fname', '$lname', '$phone', '$category', '$fees')";

if (mysqli_query($conn, $sql)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}


 ?>