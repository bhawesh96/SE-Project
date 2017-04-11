<?php 

include_once('conn.php');

$drID = $_POST['drID'];
$date = $_POST['date'];

$sql = "SELECT fname,lname,slot FROM patDetails NATURAL JOIN appointments WHERE drID = '{$drID}' AND app_date = '{$date}'";

		
$result = mysql_query($sql);


if(!$result)
{
	die(mysql_error());
 }

$finalres = array();
if(mysql_num_rows($result) > 0) {
     while($row = mysql_fetch_assoc($result)) {
     	 $patfname = $row["fname"];
     	 $patlname = $row["lname"];
     	 $slot = $row["slot"];
         
         
      
      array_push($finalres,array(
      	"patfname"=>$patfname,
 		"patlname"=>$patlname,
 		"slot"=>$slot
 		 )
		 );   
     }
if(1==1)
{
	//echo 'success';
	echo json_encode(array("result"=>$finalres));
}
else
	echo 'No Appointments Found';
}

else{
	echo 'hat bc';
}
 ?>