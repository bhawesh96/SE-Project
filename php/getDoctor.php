<?php 

include_once('conn.php');

$category = $_POST['category'];
$date = $_POST['date'];

$sql = "SELECT fname,lname,drID FROM drDetails WHERE category = '{$category}' AND drID NOT IN 
		(SELECT drID FROM drNA WHERE date = '{$date}')";

		
$result = mysql_query($sql);


if(!$result)
{
	die(mysql_error());
 }

$finalres = array();
if(mysql_num_rows($result) > 0) {
     while($row = mysql_fetch_assoc($result)) {
     	 $drfname = $row["fname"];
     	 $drlname = $row["lname"];
     	 $drID = $row["drID"];
         
         
      
      array_push($finalres,array(
      	"drID"=>$drID,
 		"drfname"=>$drfname,
 		"drlname"=>$drlname
 		 )
		 );   
     }
if(1==1)
{
	//echo 'success';
	echo json_encode(array("result"=>$finalres));
}
else
	echo 'No History Found';
}

else{
	echo 'hat bc';
}
 ?>