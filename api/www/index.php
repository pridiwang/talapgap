<!DOCTYPE html>
<html><head><title>Talapgap</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha512-MoRNloxbStBcD8z3M/2BmnT+rg4IsMxPkXaGh2zD6LGNNFE80W3onsAhRcMAMrSoyWL9xD7Ert0men7vR8LUZg==" crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/css/dataTables.bootstrap4.min.css" integrity="sha512-PT0RvABaDhDQugEbpNMwgYBCnGCiTZMh9yOzUsJHDgl/dMhD9yjHAwoumnUk3JydV3QTcIkNDuN40CJxik5+WQ==" crossorigin="anonymous" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha512-M5KW3ztuIICmVIhjSqXe01oV2bpe248gOxqmlcYrEzAvws7Pw3z6BK0iGbrwvdrUQUhi3eXgtxp5I8PDo9YfjQ==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.21/js/jquery.dataTables.min.js" integrity="sha512-BkpSL20WETFylMrcirBahHfSnY++H2O1W+UnEEO4yNIl+jI2+zowyoGJpbtk6bx97fBXf++WJHSSK2MV4ghPcg==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/5.4.2/tinymce.min.js" integrity="sha512-SPCExIkjTrrcv8Jfu4dzvDJfMe7A9CKmKE8v1fd+Ku3Dq5B9w8rfmrAHfz2RKU+4zOyT1JlprGA1bC2o8Z1yZA==" crossorigin="anonymous"></script>

</head><body>
<?php 
$rnd=rand(0,9999);
print "<script src=include.js?$rnd></script>";
error_reporting(E_ERROR);
extract($_GET);
$json[response]=true;
require "route.php";
require "include.php";
require "user.php";
//extract($_GET);
print "<nav class='nav navbar-nav navbar-expand navbar-light navbar-collaps bg-dark'><ul class='navbar-nav'>";
while(list(,$t)=each($config[menus])) print "<li class='nav-item'><a class='nav-link text-light' href=?action=browse&tb=$t>".flddict($t)."</a></li>";
print "</ul></nav><div class='container'>";
if($msg) print "<div class='alert alert-success' role='alert' >$msg <button type=button class=close data-dismiss=alert aria-label=Close><span aria-hidden=true>&times;</span>
</button></div>";
if($action=='browse'){
    $q="select * from $tb where 1 $cond ";
    //print "<br>$q";
    qbrowse($q,$tb);
}

if($action=='edit') edit($tb,$_GET[id]); 
?>

</div></body></html>