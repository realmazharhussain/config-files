<?php
  $v1 = $_GET["q1"];
  $v2 = $_GET["q2"];
  $v3 = $_GET["q3"];
  
 
 $conn = mysqli_connect("localhost","root","","bscs52021");
//-- condition ---
 $q1 = "SELECT * FROM student WHERE rollno=$v1";
  $result = mysqli_query($conn, $q1);
  if (mysqli_num_rows($result)>0)
    echo "Already exists";
  else
  {
// --  Add in DB --
  $q = "INSERT INTO student VALUES($v1,'$v2',$v3)";
  mysqli_query($conn, $q);
  echo " Inserted successfully!";
  }
 

?>

