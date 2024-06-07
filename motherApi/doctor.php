<?php

include("connection.php");


if (isset($_GET['Name'])) 
{
	// code...
	$Name=$_GET['Name'];
	$Phone=$_GET['Phone'];
    $Email=$_GET['Email'];
    $Spatialized=$_GET['Spatialized'];



    $res= $conn->query("INSERT INTO `doctor`(`Name`, `Phone`, `Email`, `Spatialized`) VALUES('".$Name."','".$Phone."','".$Email."','".$Spatialized."')");
    
        if ($res) {
            # code...
            echo "yes";
        } else {
            # code...
            echo "no";
        }
    
}


?>