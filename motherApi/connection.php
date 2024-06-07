<?php



$dns="mysql:host=localhost;dbname=mather&child";


try {

	$conn=new PDO($dns,"root","");

	if ($conn) {
		// code...
		// echo "connection ok";
	}else{
		echo"connection failer";
	}



	
} catch (PDOException $e) {
	echo "error".$e->getMessage();
	
	
}

?>