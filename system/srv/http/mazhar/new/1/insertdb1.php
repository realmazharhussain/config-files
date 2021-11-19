<?php
 $conn = mysqli_connect("localhost","root","","pizza delivery mangement system");
//-- condition ---
 $q1 = "SELECT * FROM student WHERE costamerId=9";
  $result = mysqli_query($conn, $q1);
  if (mysqli_num_rows($result)>0)
    echo "Already exists";
  else
  {
// --  Add in DB --
  $q = "INSERT INTO costamer VALUES(9,'Hamza','ali','chowkazam'41,11)";
  mysqli_query($conn, $q);
  echo " Inserted successfully!";
  }
?>
