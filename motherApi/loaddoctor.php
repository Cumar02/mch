<?php
include("connection.php");

$response=array();

$res= $conn->query("SELECT `ID`, `Name`, `Phone`, `Email`, `Spatialized` FROM `doctor`");

if($res->rowCount()>0)
{


    while($row=$res->fetch())
    {
        array_push($response,array("code"=>"yes","id"=>$row["ID"],"Name"=>$row["Name"],"Phone"=>$row["Phone"],"Email"=>$row["Email"],"Spatialized"=>$row["Spatialized"]));




    }





}

echo json_encode($response);


?>