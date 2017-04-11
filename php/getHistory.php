<?php 

include_once('conn.php');

$patID = $_POST['patID'];

$sql = "SELECT fname,date,description FROM patHistory NATURAL JOIN drDetails WHERE patID = '{$patID}'";
$result = mysql_query($sql);


if(!$result)
{
	die(mysql_error());
 }

$finalres = array();
if(mysql_num_rows($result) > 0) {
     while($row = mysql_fetch_assoc($result)) {
     	 $drfname = $row["fname"];
         $date = $row['date'];
         $description = $row['description'];
      
      array_push($finalres,array(
 		"drfname"=>$drfname,
 		"date"=>$date,
 		"description"=>$description
		 )
		 );   
     }
if($pass == $phone)
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