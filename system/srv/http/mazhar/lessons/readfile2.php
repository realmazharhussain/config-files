 <?php
 
 $fh = fopen("myfile.txt","r");
 while(!feof($fh)){
  $str1 = fgetc($fh);
  echo $str1;
 }
 
 ?>