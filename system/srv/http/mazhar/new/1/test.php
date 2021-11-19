<center>
<table border="2">
<tr>
<th> ID </th>
<th> Name </th>
<th> Age </th>
</tr>
<?php

// connect to database 
    $con = mysqli_connect("localhost","root","sldi","test");

    // fetch table data 
    $q = "SELECT * FROM tset";
    $result = mysqli_query($con,$q);
    
    // show table data 
    while($row= mysqli_fetch_assoc($result) ){
      echo "<tr><td>" .  $row["ID"] . "</td>";
      echo  "<td>" .   $row["Name"] . "</td>";
      echo  "<td>" .  $row["Age"] . "</td></tr>" ;
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
