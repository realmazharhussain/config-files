<center>
<?php
// 1- connect to database
 $conn = mysqli_connect("localhost","root","","bscs52021");
// 2- Fetch table data
  $q = "SELECT * FROM student";
  $result = mysqli_query($conn, $q);
// 3- Show table data
  while($row = mysqli_fetch_assoc($result)){
   echo $row["rollno"];
   echo $row["name"];   
   echo $row["marks"] . "<br>";   
   }
?>
</center>