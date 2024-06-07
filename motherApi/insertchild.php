<?php

include("connection.php");


if (isset($_GET['Name'])) 
{
	// code...
	$Name=$_GET['Name'];
	$sex=$_GET['sex'];
    $weight=$_GET['weight'];
    $height=$_GET['height'];
    $date_of_bith=$_GET['date_of_bith'];
    $place_of_birth=$_GET['place_of_birth'];
    $hospital=$_GET['hospital'];
    $mother=$_GET['mother'];
    $doctor_ID=$_GET['doctor_ID'];
    $description=$_GET['description'];



    $res= $conn->query("INSERT INTO `child`(`Name`, `sex`, `weight`, 
    `height`, `date_of_bith`, `place_of_birth`, `hospital`, `mother`, 
    `doctor_ID`, `description`)VALUES('".$Name."','".$sex."','".$weight."','".$height."'
    ,'".$date_of_bith."','".$place_of_birth."','".$hospital."','".$mother."',
    '".$doctor_ID."','".$description."')");
    
        if ($res) {
            # code...
            echo "yes";
        } else {
            # code...
            echo "no";
        }
    
}


?>