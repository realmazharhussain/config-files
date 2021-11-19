<center>
<table border="2">
<?php

// connect to database 
    $con = mysqli_connect("localhost","root","","pizza delivery management system");

    // fetch table data 
    $q = "SELECT * FROM customer";
    $result = mysqli_query($con,$q);
    
    // show table data 
    while($row= mysqli_fetch_assoc($result) ){
      echo "<tr><td>" .  $row["customerId"] . "</td>";
      echo  "<td>" .   $row["firstName"] . "</td>";
	  echo  "<td>" .   $row["lastName"] . "</td>";
	  echo  "<td>" .   $row["city"] . "</td>";
	  echo  "<td>" .   $row["streetNo"] . "</td>";
      echo  "<td>" .  $row["houseNo"] . "</td></tr>" ;
    } 

 /*   // insert data in table 
    $q = "INSERT INTO customer VALUES(4,'homo','karachi')";
    mysqli_query($con,$q);   */

   // $q = "DELETE FROM customer WHERE srNo.=3";
  //  mysqli_query($con,$q);

    // udate record 

   // $q = "UPDATE customer SET name='ahmad' WHERE name='aa'";
    //mysqli_query($con,$q);
?>
</table>
</center>