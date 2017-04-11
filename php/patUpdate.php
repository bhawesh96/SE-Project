<?php 

include_once('conn.php');

$patID = $_POST['patID'];
$fname = $_POST['fname'];
$lname = $_POST['lname'];
$phone = $_POST['phone'];




$sql = "UPDATE patDetails SET fname='{$fname}', lname='{$lname}', phone='{$phone}' WHERE patID='{$patID}'";

if (mysql_query($sql)) {
    echo "Updated successfully";
} 
else {
    echo mysql_error($sql);
}


 ?>
