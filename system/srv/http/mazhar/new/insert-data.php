<center>
<?php
$rollno = $_POST["rollno"];
$name = $_POST["name"];
$marks = $_POST["marks"];
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
      echo "A student with that Roll No. already exists in the database";
   else
   {
      $query = "INSERT INTO student VALUES ($rollno, '$name', $marks)";
      mysqli_query($connection, $query);
      echo "Added Student Data Successfully!";
   }
}
?>
</center>
