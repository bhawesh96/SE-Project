<?php 

include_once('conn.php');

$sql = "SELECT * FROM drDetails";
$result = mysql_query($sql);


if(!$result)
{
	die(mysql_error());
 }

$finalres = array();
if(mysql_num_rows($result) > 0) {
     while($row = mysql_fetch_assoc($result)) {
     	 $fname = $row["fname"];
         $lname = $row['lname'];
         $phone = $row['phone'];
         $cat = $row['category'];
         $fees = $row['fees'];
      
      array_push($finalres,array(
 		"fname"=>$fname,
 		"lname"=>$lname,
 		"phone"=>$phone,
 		"category"=>$cat,
 		"fees"=>$fees,
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
	echo 'DNE';
}

 ?>