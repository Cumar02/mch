<?php

include("connection.php");


if (isset($_GET['username'])) 
{
	// code...
	$user=$_GET['username'];
	$pass=$_GET['pass'];
    $Email=$_GET['Email'];



    $res= $conn->query("select *from users where username='".$user."' ");
    if ($res->rowCount()>0) {
        # code...
        echo "exist";
    } else {
        # code...
        //insert
        $res= $conn->query("INSERT INTO `users`(`username`, `pass`, `Email`) VALUES ('".$user."','".$pass."','".$Email."')");
    
        if ($res) {
            # code...
            echo "yes";
        } else {
            # code...
            echo "no";
        }
        
    }
    
}


?>