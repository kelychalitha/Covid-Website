<?php
session_start();
unset($_SESSION["token"]);
unset($_SESSION["token1"]);
unset($_SESSION["token2"]);
header("Location:../homepage.html");
?>
