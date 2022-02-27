<?php
  $v1 = $_GET["q1"];  

 $conn = mysqli_connect("localhost","root","","bscs52021");
//-- condition ---
 $q1 = "SELECT * FROM student WHERE rollno=$v1";
  $result = mysqli_query($conn, $q1);
  if (mysqli_num_rows($result)>0)
    echo "<img src='redcancel.png' height='20' width='20'>";
  else
    echo "<img src='yesgreen.jpg'  height='20' width='40'>";
   
 //---------
 


?>

