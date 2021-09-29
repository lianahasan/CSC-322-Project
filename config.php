<?php

$host= "localhost";
$dbuser= "root";
$dbpass = "orange";
// $dbname = "test_db";
$dbname = "ccny";

$connection = mysqli_connect($host, $dbuser, $dbpass, $dbname);

if (!$connection) {
	echo "Connection failed.";
}