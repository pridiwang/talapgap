<?php 
function flddict($in){
    $dicts=array();
    if(array_key_exists($in,$dicts)){
        
    }else{
        $o=str_replace('_',' ',$in);
        $o=ucwords($o);
        return $o;
    }
}
?>