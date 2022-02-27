<?php
 $v1 = $_POST["t1"];
 $v2 = $_POST["t2"];
 
 
 $conn = mysqli_connect("localhost","root","","bscs52021");
//...
$q1 = "SELECT * FROM student WHERE rollno=$v1";
  $result = mysqli_query($conn, $q1);
  if (mysqli_num_rows($result)>0){
   $q = "UPDATE student SET marks=$v2 WHERE rollno=$v1";
   mysqli_query($conn, $q);
   echo " Updata ho gaya";
  }
  else
  echo "Not exists";

?>

