<?php 

include_once('conn.php');

$drID = $_POST['drID'];
$date = $_POST['date'];

$sql = "INSERT INTO drNA (drID,date) VALUES ('$drID', '$date')";

		
$result = mysql_query($sql);


if(!$result)
{
	die(mysql_error());
 }

else{
	echo "Leave alloted successfully";
}

?>