<?php

include("connection.php");


if (isset($_GET['Name'])) 
{
	// code...
	$Name=$_GET['Name'];
	$production_date=$_GET['production_date'];
    $expiry_date=$_GET['expiry_date'];
    $qty=$_GET['qty'];
    $price=$_GET['price'];
    $description=$_GET['description'];



    $res= $conn->query("INSERT INTO `product`(`Name`, `production_date`, `expiry_date`, `qty`, `price`, `description`) VALUES('".$Name."','".$production_date."','".$expiry_date."','".$qty."','".$price."','".$description."')");
    
        if ($res) {
            # code...
            echo "yes";
        } else {
            # code...
            echo "no";
        }
    
}


?>