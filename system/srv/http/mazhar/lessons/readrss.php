<?php
$xml=simplexml_load_file("yahoonews.xml") or die("Error: Cannot create object");
foreach($xml->children() as $news) { 
    echo $news->title . "<br>"; 

} 
?>