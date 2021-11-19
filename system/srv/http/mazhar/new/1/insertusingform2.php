<?php
  $v1 = $_POST["t1"];
  $v2 = $_POST["t2"];
  $v3 = $_POST["t3"];
  $r11 = $_POST["r1"];

if($r11== "y"){
  
 $conn = mysqli_connect("localhost","root","sldi","bscs52021");
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
  echo " $v1 Yes";
} // if-end
else
echo " Can not add";

?>

