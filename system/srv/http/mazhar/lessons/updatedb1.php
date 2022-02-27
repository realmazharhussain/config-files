<?php
 $conn = mysqli_connect("localhost","root","","bscs52021");
//...
$q1 = "SELECT * FROM student WHERE rollno=9";
  $result = mysqli_query($conn, $q1);
  if (mysqli_num_rows($result)>0){
   $q = "UPDATE student SET marks=45 WHERE rollno=9";
   mysqli_query($conn, $q);
   echo " Updata ho gaya";
  }
  else
  echo "Not exists";

?>
