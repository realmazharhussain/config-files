<?php
$isbn = $_POST["isbn"];
$title = $_POST["title"];
$author = $_POST["author"];
$connection = mysqli_connect("localhost", "root", "sldi", "bscs52021");
if (! $connection)
   echo "Cannot connect to the database!";
else
{
   $query = "SELECT * FROM books WHERE title=$title AND isbn=$isbn AND author=$author";
   $result = mysqli_query($connection, $query);
   if (mysqli_num_rows($result)>0)
   {
      echo "<table border='1'>
         <tr>
         <th> Title </th>
         <th> ISBN </th>
         <th> Author </th>
         </tr>";
      while($row = mysqli_fetch_assoc($result))
      {
         echo "<tr>
            <td> $row[title] </td>
            <td> $row[isbn] </td>
            <td> $row[author] </td>
            </tr>";
      }
      echo "</table>";

   }
   else
   {
      echo "No book found with given attributes";
   }
}
?>
