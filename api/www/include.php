<?php 
require "config.php";
require "flddict.php";
$json[log][]="connecting $dbserver $dbuser $dbpass $dbname ";
$db=mysqli_connect($dbserver,$dbuser,$dbpass,$dbname) or die ("can not connect");

$dt=qdt("select name,type,data from config ");
while(list(,$dr)=each($dt)){
    extract($dr);
    $config[$name]=$data;
    if($dr[type]=='array') $config[$name]=explode(',',$data);
}
if($action=='update'){
    if(!$id){
        $q="insert into $tb (logs) values ( concat(now(),' added by $_SESSION[user]') ) ";
        print "<br>$q";
        $id=qexe($q); 
        print "<br>id $id ";
    }
    $q ="update $tb set logs=concat(now(),' updated $_SESSION[user]\n',logs) ";
    while(list($fld,$val)=each($_POST)){
        $q.=",$fld='$val' ";
    }
    $q.=" where id='$id' ";
    
    $rs=qexe($q);
    if($rs) $msg=" updated ";
    $action='browse'; 
}

function edit($tb,$id){
    global $config;
    if($id) $q="select * from $tb where id='$id' ";
    else $q="select * from $tb limit 1 ";
    $dr=qdr($q);
    //print $q;    print_r($dr);
    while(list($fld,$val)=each($dr)){
        if(!$id) $val='';
        if(in_array($fld,$config[controlflds])) continue;
        $input="<input id=$tb-$fld class='form-control form-control-sm' type=text name=$fld value='$val' >";
        if(in_array($fld,$config[textflds]))$input="<textarea id=$tb-$fld class='form-control form-control-sm' type=text name=$fld >$val</textarea>";
        $o.="<div class='form-group col-md-3'><label for='$tb-$fld ' >".flddict($fld)."</label>$input</div>";
    }
    if($tb=='content'){
        $o.="<div class='form-group col-12'><lable>Content</label><textarea class='form-control' name=content id=content-content rows=20>".nl2br($dr[content])."</textarea></div>";
    }
    print "<form class='form row' action=?action=update&tb=$tb&id=$id method=post>
    $o
<button class='btn btn-sm btn-primary' ><i class='fas fa-save'></i> ".flddict('save')."</button>
    </form>";
}
function qbrowse($q,$tb){
    global $config;
    $dt=qdt($q);
    //print_r($dt);
    while(list($i,$dr)=each($dt)){
        $k=$i+1;
        $tbody.="<tr ><td>$k</td>";
        while(list($fld,$val)=each($dr)){
            if(in_array($fld,$config[controlflds])) continue;
            if(in_array($fld,$config[skipbrowse])) continue;
            if($i==0){
                $thead.="<td>$fld</td>";
            }
            $tbody.="<td class='$fld' >$val</td>";
        }
        $tbody.="<td><a href=?action=edit&tb=$tb&id=$dr[id] class='fas fa-edit'></a></td></tr>";
    }
    print "<table class='table table-bordered table-sm table-striped' >
    <thead><tr><td></td>$thead<td><a href=?action=edit&tb=$tb class='fa fa-plus text-success'></a></td></tr></thead>
    <tbody>$tbody</tbody>
    </table>";
}
function qdt($q){
    $ck=qexe($q);
    if(!$ck) return array();
    while($dr=$ck->fetch_assoc()) $dt[]=$dr;
    return $dt;
}

function qval($q){
    $ck=qexe($q);
    if(!$ck) return array();
    $dr=$ck->fetch_array(MYSQLI_NUM);
    $o=$dr[0];
    return $o;

}
function qdr($q){
    $ck=qexe($q);
    if(!$ck) return array();
    $dr=$ck->fetch_assoc();
    return $dr;
}

function qexe($q){
    global $db;
    $q=trim($q);
    $ck=$db->query($q);
    if(!$ck){
        return false;
        print $db->error;
        print $q;
    }else{
        if(substr($q,0,6)=='insert') return $db->insert_id;
        return $ck;
    }
}
?>