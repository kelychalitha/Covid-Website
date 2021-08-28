<!DOCTYPE html>
<html lang="en">
<?php
session_start();
if(isset($_SESSION['token'])){
    header('Location: dashboard_phi.php');
}
else
{

} ?>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>E-health</title>
    <link rel="stylesheet" type="text/css" href="css/profile_php.css">
</head>


<body>
    <a href="homepage.html" class="btn btn-info btn-xs" role="button">Back</a>

<form action="controller/phi_signup.php" method="post"  enctype="multipart/form-data">
    <Center>
        <div class="col-md-8 center box">
            <center><img src="image/pra2.jpg" alt=""></center>
            <input type="file" name="file" id="file" accept="image/*">

            <label for="file">ADD PIC</label>
            <div class="box1">
            <input type="text" name="fname" minlength="4" placeholder="First Name" required>
            <input type="text" name="lname"  minlength="4" placeholder="Last Name" required>
            <input type="text" name="nic" minlength="10" maxlength="12" placeholder="NIC" required>
            <input type="text" name="phone" maxlength="10" placeholder="Contact number" required>
            <!-- <input type="text" name="" placeholder="Current Location"> -->
            <input type="email" name="email" minlength="2" placeholder="Email" required>
            <!-- <input type="text" name="" placeholder="Password"> -->
            <input type="text" name="address" minlength="8" placeholder="Address" required>
            <input type="text" name="location" minlength="2" placeholder="Current Location" required>
            <input type="password" name="password" minlength="6" placeholder="Password" required>
            <button type="submit" name="signup" style="float: centre;margin: 10px 10.2%;">Register</button>
            <p>By creating an account, Now you can <a href="phi-login.php" style="text-decoration:none" >Login</a></p>
            <!-- <a href="homepage.html" style="text-decoration:none" >Back</a> -->
            </div>
        </div>
    </Center></form>
</body>
</html>
