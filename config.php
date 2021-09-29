<?php

$host= "localhost";
$dbuser= "root";
$dbpass = "";
$dbname = "ccny";

$connection = mysqli_connect($host, $dbuser, $dbpass, $dbname);

if (!$connection) {
	echo "Connection failed.";
}
