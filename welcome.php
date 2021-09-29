<?php 
session_start();

if (isset($_SESSION['emplid']) && isset($_SESSION['username'])) {

?>
<!DOCTYPE html>
<html>
     <head>
          <title>GradSchoolZero</title>
          <link rel="stylesheet" type="text/css" href="style.css">
     </head>
     <body>
          <h1>Welcome <?php echo $_SESSION['name']; ?></h1>
          <a href="logout.php">Logout</a>
     </body>
</html>

<?php 
}else{
     header("location:index.php");
     exit();
}
 ?>