<?php
include("connection.php");

$response=array();

$res= $conn->query("SELECT `ID`, `Name`, `Phone`, `Email`, `title`, `salary`, `levelEducation` FROM `employee`");

if($res->rowCount()>0)
{


    while($row=$res->fetch())
    {
        array_push($response,array("code"=>"yes","id"=>$row["ID"],"Name"=>$row["Name"],"Phone"=>$row["Phone"],"Email"=>$row["Email"],"title"=>$row["title"],"salary"=>$row["salary"],"levelEducation"=>$row["levelEducation"]));




    }





}

echo json_encode($response);


?>