<center>
<table border="1">
<?php
 $v1 = $_GET["q1"];
// 1- connect to database
 $conn = mysqli_connect("localhost","root","","bscs52021");
// 2- Fetch table data
  $q = "SELECT * FROM student WHERE rollno=$v1";
  $result = mysqli_query($conn, $q);
// 3- Show table data
 if (mysqli_num_rows($result)>0){
  while($row = mysqli_fetch_assoc($result)){
   echo "<tr><td>" . $row["rollno"] . "</td>";
   echo "<td>" . $row["name"] . "</td>";   
   echo "<td>" . $row["marks"] . "</td></tr>";   
   }
  }
 else
   echo "No recod found";

 

   
   
?>
</table>
</center>