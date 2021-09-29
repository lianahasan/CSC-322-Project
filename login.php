<?php 
session_start(); 
include "config.php";

if (isset($_POST['username']) && isset($_POST['password'])) {
	$username = $_POST['username'];
	$password = $_POST['password'];

	$sql = "SELECT * FROM students WHERE username='$username' AND password='$password'";
	$result = mysqli_query($connection, $sql);

	if (mysqli_num_rows($result) == 1) {
		$row = mysqli_fetch_assoc($result);
		if ($row['username'] === $username && $row['password'] === $password) {
			$_SESSION['emplid'] = $row['emplid'];
			$_SESSION['name'] = $row['name'];
			$_SESSION['username'] = $row['username'];
			header("location:welcome.php");
			exit();
		}else{
			header("location:index.php?error=Login failed. Please try again.");
			exit();
		}
	}else{
		header("location:index.php?error=Login failed. Please try again.");
		exit();
	}
	
}else{
	header("location:index.php");
	exit();
}