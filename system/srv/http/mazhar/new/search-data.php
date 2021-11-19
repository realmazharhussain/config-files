<center>
<?php
#$rollno = $_POST["rollno"];
$rollno = 0;
$connection = mysqli_connect("localhost", "root", "sldi", "bscs52021");
if (! $connection)
{
   echo "Cannot connect to the database!";
}
else
{
   $query = "SELECT * from student WHERE rollno=$rollno";
   $result = mysqli_query($connection, $query);
   if (mysqli_num_rows($result)>0)
   {
      $row = mysqli_fetch_assoc($result);
      echo "
      <table border=\"1\">
         <tr>
         <th> Roll No </th>
         <th> Name </th>
         <th> Marks </th>
         </tr>
         <tr>
         <td> $row[rollno] </td>
         <td> $row[name] </td>
         <td> $row[marks] </td>
         </tr>
      </table>";
   }
   else
   {
      echo "Could Not Find a Student with that Roll No!";
   }
}
?>
</center>
