<?php
include("connection.php");

// $_GET['username']="ahmed";
// $_GET['pass']="123";


if (isset($_GET['username'])) 
{
	// code...
	$user=$_GET['username'];
	$pass=$_GET['pass'];


   $res=	$conn->query("select *from users where username='".$user."'and pass='".$pass."' ");
	if ($res->rowCount()>0) {
		// code...
		echo "yes";
	}else{
		echo "no";
	}


}


?>