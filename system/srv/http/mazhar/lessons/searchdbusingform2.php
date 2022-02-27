<center>
<table border="1">
<h1> DB Connection </h1>
<?php
$v1 =  $_POST["t1"];
$r1 =  $_POST["r1"];
$r1 =  $_POST["r1"];
//----
if ($r1 == "yes"){

// 1: Connect Server & DB
$myconn = mysqli_connect("localhost","root","","mcsm21");
// 2: Connect Table (SQL)
$myquery = "SELECT * FROM student WHERE marks>$v1";
$myresult = mysqli_query($myconn,$myquery);
//3:  Show table data
if (mysqli_num_rows($myresult) > 0){
 while($myrow = mysqli_fetch_assoc($myresult)){
 echo "<tr><td>" . $myrow["rollno"] . "</td>";
 echo "<td>" . $myrow["name"] . "</td>" ;
 echo "<td>" . $myrow["marks"] .  "</td></tr>";
 }
} // if
else
  echo " No record found ";
} // -- if
else
 echo " Cant search";


?>
</table>
</center>