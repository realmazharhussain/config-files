<?php
 $conn = mysqli_connect("localhost","root","","bscs52021");
//-- condition ---
 $q1 = "SELECT * FROM student WHERE rollno=9";
  $result = mysqli_query($conn, $q1);
  if (mysqli_num_rows($result)>0)
    echo "Already exists";
  else
  {
// --  Add in DB --
  $q = "INSERT INTO student VALUES(9,'Hamza',41)";
  mysqli_query($conn, $q);
  echo " Inserted successfully!";
  }
?>
