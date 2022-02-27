 <?php
 
 $fh = fopen("myfile.txt","r");
 while(!feof($fh)){
  $str1 = fgets($fh) . "<br>";
  echo $str1;
 }
 
 ?>