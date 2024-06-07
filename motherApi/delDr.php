<?php
include("connection.php");

if(isset($_GET['ID']))
{
    $ID=$_GET['ID'];

    
    $res= $conn->query("DELETE FROM `doctor` WHERE ID='$ID'");
    
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