<center>
<?php

  $fh =fopen("xmlfromdb.xml","w");
  fwrite($fh,"<?xml version='1.0' ?>");
  fwrite($fh,"\n<bscs>");
//----
 $conn = mysqli_connect("localhost","root","","bscs52021");
  $q = "SELECT * FROM student";
  $result = mysqli_query($conn, $q);

  while($row = mysqli_fetch_assoc($result)){
   fwrite($fh,"\n<student>");
   fwrite($fh,"\n\t<rollno>" . $row["rollno"] . "</rollno>");
   fwrite($fh,"\n\t<name>" . $row["name"] . "</name>");
   fwrite($fh,"\n\t<marks>" . $row["marks"] . "</marks>");
   fwrite($fh,"\n</student>");
   }
 //---
   fwrite($fh,"\n</bscs>");
?>
</center>