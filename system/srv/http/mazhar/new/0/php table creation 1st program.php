<table border="1" style> 
<?php

// connect to database 
    $conn = mysqli_connect("localhost","root","","pizza delivery manage");

    // fetch table data 
    $q = "SELECT * FROM customer";
    $result = mysqli_query($con,$q);
    
    // show table data 
    while($row = mysqli_fetch_assoc($result) ){
      echo "<tr><td>" .  $row["Customer ID"] . "</td>";
      echo  "<td>" .   $row["Customer First Name"] . "</td>";
	  echo  "<td>" .   $row["Customer last Name"] . "</td>";
	  echo  "<td>" .   $row["Customer City"] . "</td>";
	  echo  "<td>" .   $row["Customer Street No"] . "</td>";
      echo  "<td>" .  $row["Customer HouseNo"] . "</td></tr>" ;
    } 

 /*   // insert data in table 
    $q = "INSERT INTO customer VALUES(4,'homo','karachi')";
    mysqli_query($con,$q);   */

   // $q = "DELETE FROM customer WHERE srNo.=3";
  //  mysqli_query($con,$q);

    // udate record 

    $q = "UPDATE customer SET name='ahmad' WHERE name='aa'";
    mysqli_query($con,$q);
?>
</table>