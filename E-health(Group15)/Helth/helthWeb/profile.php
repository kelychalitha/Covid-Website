
<!DOCTYPE html>
<html lang="en">

<?php
session_start();
if(isset($_SESSION['token1'])){
    header('Location: dashboard_citizen.php');
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
    <link rel="stylesheet" type="text/css" href="css/profile.css">
</head>
<body>
    <a href="homepage.html" class="btn btn-info btn-xs" role="button">Back</a>
    <Center>
        <form action="controller/citizan_signup.php" method="post"  enctype="multipart/form-data">
        <div class="col-md-8 center box">
            <center><img src="image/pra2.jpg" alt=""></center>
            <input type="file" name="file" id="file" accept="image/*">

            <label for="file">ADD PIC</label>
            <div class="box1">
            <input type="text" minlength="4" required name="fname" placeholder="First Name">
            <input type="text" minlength="4" required name="lname" placeholder="Last Name">
            <input type="text" maxlength="2" required name="age" placeholder="Age">
            <input type="text" minlength="10" maxlength="12" required name="nic" placeholder="NIC">
            <input type="text" minlength="8" required name="address" placeholder="Address">
            <input type="text" maxlength="10" required name="phone" placeholder="Contact Number">
            <input type="text" minlength="3" required name="prof" placeholder="Profession">
            <input type="email" minlength="2" required name="email" placeholder="Email">
            <!-- <input type="text" name="" placeholder="Password"> -->
            <input type="text" minlength="2" required name="affiliaction" placeholder="Affiliation">
            <input type="text" minlength="2" required name="location" placeholder="Current Location">
            <!-- <input type="text" name="" placeholder="Health Status"> -->
            <input type="password" minlength="6" required name="password" placeholder="Password">
            <button name="signup" style="float: centre;margin: 10px 10.2%;" type="submit">Register</button>
            <p>By creating an account, Now you can <a href="citizen-login.php">Login</a></p>
            <!-- <a href="homepage.html">Back</a> -->
            </div>
        </div></form>
    </Center>
</body>
</html>
