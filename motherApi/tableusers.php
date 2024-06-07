<?php
include("connection.php");

$response=array();

$res= $conn->query("SELECT `ID`, `username`, `pass`, `Email` FROM `users`");

if($res->rowCount()>0)
{
    while ($row=$res->fetch()) {
        # code...

        array_push($response,array("code"=>"yes","id"=>$row["ID"],"username"=>$row["username"],"pass"=>$row["pass"],"Email"=>$row["Email"]));
    }
}else{
    array_push($response,array('code'=>"no","sms"=>"data not found"));
}

echo json_encode($response);


?>