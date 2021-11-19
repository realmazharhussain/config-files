<?php
$rollno = $_POST["rollno"];
$connection = mysqli_connect("localhost", "root", "sldi", "bscs52021");
if (! $connection)
   echo "Cannot connect to the database!";
else
{
   $query = "SELECT * FROM student WHERE rollno=$rollno";
   $result = mysqli_query($connection, $query);
   if (mysqli_num_rows($result)>0)
   {
      $query = "DELETE FROM student WHERE rollno=$rollno";
      echo "Deleting Record ... <br>";
   }
   else
   {
      $query = "INSERT INTO student VALUES ($rollno, 'PRODUCT', 0)";
      echo "Inserting Record ... <br>";
   }
   if (mysqli_query($connection, $query))
      echo "Done!";
   else
      echo "Failed!";

}
?>
