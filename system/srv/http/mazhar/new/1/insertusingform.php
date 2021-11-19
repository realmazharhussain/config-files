<?php
  $v1 = $_POST["t1"];
  $v2 = $_POST["t2"];
  $v3 = $_POST["t3"];
  $v4 = $_POST["t4"];
  $v5 = $_POST["t5"];
  $v6 = $_POST["t6"];
  $r11 = $_POST["r1"];

if($r11== "y"){
  
 $conn = mysqli_connect("localhost","root","","pizza delivery mangement system");
//-- condition ---
 $q1 = "SELECT * FROM student WHERE costamerId=$v1";
  $result = mysqli_query($conn, $q1);
  if (mysqli_num_rows($result)>0)
    echo "Already exists";
  else
  {
// --  Add in DB --
  $q = "INSERT INTO costamer VALUES($v1,'$v2','$v3','$v4','$v5',$v6,)";
  mysqli_query($conn, $q);
  echo " Inserted successfully!";
  }
} // if-end
else
echo " Can not add";
?>

