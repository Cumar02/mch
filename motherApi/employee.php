<?php

include("connection.php");


if (isset($_GET['Name'])) 
{
	// code...
	$Name=$_GET['Name'];
	$Phone=$_GET['Phone'];
    $Email=$_GET['Email'];
    $title=$_GET['title'];
    $salary=$_GET['salary'];
    $levelEducation=$_GET['levelEducation'];



    $res= $conn->query("INSERT INTO `employee`(`Name`, `Phone`, `Email`, `title`, `salary`, `levelEducation`) VALUES('".$Name."','".$Phone."','".$Email."','".$title."','".$salary."','".$levelEducation."')");
    
        if ($res) {
            # code...
            echo "yes";
        } else {
            # code...
            echo "no";
        }
    
}


?>