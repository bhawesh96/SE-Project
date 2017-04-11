<?php 

include_once('conn.php');

$fname = $_POST['fname'];
$lname = $_POST['lname'];
$phone = $_POST['phone'];
$dob = $_POST['dob'];
$sex = $_POST['sex'];
$patID = substr($fname,2).substr($phone,-4);



$sql = "INSERT INTO patDetails (patID, fname, lname, phone, dob, sex) VALUES ('$patID', '$fname', '$lname', '$phone', '$dob', '$sex')";

if (mysql_query($sql)) {
    echo "New record created successfully";
} 
else {
    echo "Error: " . $sql . "<br>" . mysqli_error($sql);
}


 ?>