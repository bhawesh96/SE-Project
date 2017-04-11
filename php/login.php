<?php 

include_once('conn.php');

$username = $_POST['username'];
$pass = $_POST['pass'];

$sql = "SELECT * FROM patDetails WHERE fname='{$username}'";
 $result = mysql_query($sql);


if(!$result)
{
	die(mysql_error());
 }

$finalres = array();
if(mysql_num_rows($result) > 0) {
     while($row = mysql_fetch_assoc($result)) {
     	 $patID = $row['patID'];
         $fname = $row["fname"];
         $lname = $row['lname'];
         $phone = $row['phone'];
         $dob = $row['dob'];
         $sex = $row['sex'];
      
      array_push($finalres,array(
 		"patID"=>$patID,
 		"fname"=>$fname,
 		"lname"=>$lname,
 		"phone"=>$phone,
 		"dob"=>$dob,
 		"sex"=>$sex
		 )
		 );   
     }
if($pass == $phone)
{
	//echo 'success';
	echo json_encode(array("result"=>$finalres));
}
else
	echo 'wrongpass';
}

else{
	echo 'hat bc';
}
?>
