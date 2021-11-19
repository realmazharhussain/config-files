<?php
  $v = $_POST["t1"];
  $conn = mysqli_connect("localhost","root","","pizza delivery management system");
  $q = "SELECT * FROM customer WHERE costomerId=$v";
  $result = mysqli_query($conn,$q);
  if(mysqli_num_rows($result)>0)
  {
	while($row = mysqli_fetch_assoc($result))
	{
		echo $row["firsName"];
		echo $row["lastName"];
	}
   }
   else 
      echo "Result Not Found";	   
?>