<?php
include("connection.php");

$response=array();

$res= $conn->query("SELECT `ID`, `Name`, `sex`, `weight`, `height`, `date_of_bith`, `place_of_birth`, `hospital`, `mother`, `doctor_ID`, `description` FROM `child`");

if($res->rowCount()>0)
{


    while($row=$res->fetch())
    {
        array_push($response,array("code"=>"yes","id"=>$row["ID"],"Name"=>$row["Name"],"sex"=>$row["sex"],"weight"=>$row["weight"],"height"=>
        $row["height"],"date_of_bith"=>$row["date_of_bith"],"place_of_birth"=>$row["place_of_birth"],"hospital"=>$row["hospital"],"mother"=>$row["mother"],"doctor_ID"=>$row["doctor_ID"],"description"=>$row["description"]));




    }





}

echo json_encode($response);


?>