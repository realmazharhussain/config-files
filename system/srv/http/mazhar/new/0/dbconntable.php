
<center>
<table border="1">
<?php
// 1- connect to database
 $conn = mysqli_connect("localhost","root","","bscs52021");
// 2- Fetch table data
  $q = "SELECT * FROM student";
  $result = mysqli_query($conn, $q);
// 3- Show table data
  while($row = mysqli_fetch_assoc($result)){
   echo "<tr><td>" . $row["rollno"] . "</td>";
   echo "<td>" . $row["name"] . "</td>";   
   echo "<td>" . $row["marks"] . "</td></tr>";   
   }
?>
</table>
</center>