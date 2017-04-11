<?php 

include_once('conn.php');

$slot = $_POST['slot'];
$patID = $_POST['patID'];
$drID = $_POST['drID'];
$date = $_POST['date'];
$appID = $patID.$slot.$drID;

$sql = "INSERT INTO appointments (appID, patID, drID, app_date ,slot) VALUES ('$appID', '$patID', '$drID', '$date', '$slot')";

		
$result = mysql_query($sql);


if(!$result)
{
	die(mysql_error());
 }

else{
	echo "Booked successfully";
}

?>