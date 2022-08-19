<form method="post" action="">
<input type="text" name="value">
<input type="submit">
</form>

<?php
$counter = 0;
$servername = "localhost";
$username = "sina";
$password = "pass";
$dbname = "project";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM sina ORDER BY time DESC";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($counter < $_POST['value']) {
	$row = $result->fetch_assoc();
    echo "time:" . $row["time"]. ",load:" . $row["load"]. ",temp:" . $row["temp"].",faces:" . $row["faces"]. "<br>";
  $counter = $counter + 1;
  }
} else {
  echo "0 results";
}
$conn->close();
?>

