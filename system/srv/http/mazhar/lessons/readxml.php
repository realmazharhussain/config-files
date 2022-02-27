<?php
 $xml = simplexml_load_file("myxml.xml");
 echo $xml->student[0]->rollno;
 echo $xml->student[0]->name;
 echo $xml->student[0]->marks; 
?>