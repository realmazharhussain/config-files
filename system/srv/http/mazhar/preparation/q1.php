<?php
$id = $_POST["BookId"];
$title = $_POST["BookTitle"];
$author = $_POST["BookAuthor"];
$button = $_POST["button"];

$conn = mysqli_connect("localhost", "root", "sldi", "bookdb");

if ($button == "Insert")
{
  $querry = "SELECT * FROM books WHERE ID=$id";
  $result = mysqli_query($conn, $querry);
  if (mysqli_num_rows($result)>0)
    echo "Already exists!";
  else
  {
    $querry = "INSERT INTO books VALUES($id, '$title', '$author')";
    if(mysqli_query($conn, $querry))
      echo "Success!";
  }
}
else if ($button == "Delete")
{
  $querry = "SELECT * FROM books WHERE ID=$id";
  $result = mysqli_query($conn, $querry);
  if (mysqli_num_rows($result) == 0)
    echo "Does not exist!";
  else
  {
    $querry = "DELETE FROM books WHERE ID=$id";
    if(mysqli_query($conn, $querry))
      echo "Success!";
  }
}
else if ($button == "Update")
{
  $querry = "SELECT * FROM books WHERE ID=$id";
  $result = mysqli_query($conn, $querry);
  if (mysqli_num_rows($result) == 0)
    echo "Does not exist!";
  else
  {
    $querry = "UPDATE books SET Title='$title', Author='$author' WHERE ID=$id";
    if(mysqli_query($conn, $querry))
      echo "Success!";
  }
}
else if ($button == "Search")
{
  $querry = "SELECT * FROM books WHERE ID=$id";
  $result = mysqli_query($conn, $querry);
  if (mysqli_num_rows($result) == 0)
    echo "Does not exist!";
  else
  {
    $row = mysqli_fetch_assoc($result);
    echo "
    <table border='1'>
      <tr>
      <th>ID</th>
      <th>Title</th>
      <th>Author</th>
      </tr>
      <tr>
      <td>$id</td>
      <td>$title</td>
      <td>$author</td>
      </tr>
    ";
  }
}