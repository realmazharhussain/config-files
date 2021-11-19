<?php
  $v1 = $_POST["t1"];
  $v2 = $_POST["t2"];
  $v3 = $_POST["t3"];
  $r11 = $_POST["doit"];

if($r11== "Yes"){
  
 $conn = mysqli_connect("localhost","root","","pizza delivery mangement system");
//-- condition ---
 $q1 = "SELECT * FROM costamer WHERE costamerId=$v1";
  $result = mysqli_query($conn, $q1);
  if (mysqli_num_rows($result)>0)
    echo "Already exists";
  else
  {
// --  Add in DB --
  $q = "INSERT INTO costamer VALUES($v1,'$v2','$v3','$v4','$v5',$v6)";
  mysqli_query($conn, $q);
  echo " Inserted successfully!";
  }
} // if-end
else
echo " Can not add";

?>

