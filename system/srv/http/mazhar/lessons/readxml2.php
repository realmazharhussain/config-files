<?php
 
 $xml = simplexml_load_file("myxml.xml");
 foreach($xml->children() as $stu){ 
  echo "RollNo: " . $stu->rollno ;
  echo "subject: " . $stu['sub'] ;  
  echo " Name: " . $stu->name;
  echo " Marks: " . $stu->marks . "<hr>"; 
 }
?>