<?php 

include_once('conn.php');

$sql = "SELECT fname,lname,drID FROM drDetails WHERE 1";

		
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
	echo 'No Records Found';
}

else{
	echo 'hat bc';
}
 ?>