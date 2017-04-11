<?php 

$patID = $_POST['patID'];
$drID = $_POST['drID'];
$date = $_POST['date'];
$desc = $_POST['desc'];

$sql2 = "INSERT INTO patHistory (patID, drID, date,description) VALUES ('$patID', '$drID', '$date', '$desc')";
 		
mysql_query($sql2);

 ?>
