<center>
<?php
$connection = mysqli_connect("localhost", "root", "sldi", "bscs52021");
if (! $connection)
{
   echo "Cannot connect to the database!";
}
else
{
   $query = "SELECT * from student";
   $result = mysqli_query($connection, $query);
   if (mysqli_num_rows($result)>0)
   {
      echo "<table border=\"1\">
         <tr>
         <th> Roll No </th>
         <th> Name </th>
         <th> Marks </th>
         </tr>";
      while ($row = mysqli_fetch_assoc($result))
      {
         echo "<tr>";
         echo "<td> $row[rollno] </td>";
         echo "<td> $row[name] </td>";
         echo "<td> $row[marks] </td>";
         echo "</tr>";
      }
      echo "</table>";
   }
   else
   {
      echo "Student Database is Empty!";
   }
}
?>
</center>
