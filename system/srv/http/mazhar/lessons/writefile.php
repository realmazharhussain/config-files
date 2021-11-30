 <?php
 
 $fh = fopen("myfile.txt","a");
  fwrite($fh, " Write inside file");
  
 // write script 
 $fh = fopen("myfile.txt","r");
  fwrite($fh, " Write inside file");
 
 // read script

/*
create a form that intake file1name and file2name, then copy the contents of file1 into file2. 
DON'T take file names by typing ; instead use
<input type="file"> i.e. file dialog to input file names
  
 ?>
 
 
 
 