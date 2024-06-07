<?php

include("connection.php");


if (isset($_GET['Name'])) 
{
	// code...
	$Name=$_GET['Name'];
	$Phone=$_GET['Phone'];
    $Email=$_GET['Email'];
    $Spatialized=$_GET['Spatialized'];



    $res= $conn->query("UPDATE `doctor` SET `Name`='[$Name]',`Phone`='[$Phone]',
    `Spatialized`='[$Spatialized]',`regDate`='[$regDate]' WHERE ,`Email`='[$Email]'");
    
        if ($res) {
            # code...
            echo "yes";
        } else {
            # code...
            echo "no";
        }
    
}
echo json_encode($res);


?>