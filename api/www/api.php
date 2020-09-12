<?php 
error_reporting(E_ERROR);
extract($_GET);
$json[response]=true;
require "route.php";
require "include.php";
if($action=='browse'){
    $q="select * from $tb ";
    $json[result]=qdt($q);
}

if($json){
    header("content-type:application/json;charset:UTF-8");
    echo json_encode($json);
}
?>