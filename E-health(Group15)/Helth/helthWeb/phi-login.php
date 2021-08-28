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
    <link rel="stylesheet" href="css/login.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <title>E-health</title>
</head>
<body>
  <!-- <div class="topone">
  <p>Let's Go<a href="homepage.html">Back</a></p>
  </div> -->
    <div class="container-fluid bg">
        <div class=row>
            <div class="col-md-4 col-sm-4 col-xs-12"></div>
            <div class="col-md-4 col-sm-4 col-x-12">
                <!-- form start -->
                <form class="form-container" method="post" action="controller/phiLogin.php">
                  <h1>Login </h1>
                    <div class="form-group">
                      <label for="exampleInputEmail1" class="form-label">User Name</label>
                      <input type="email" minlength="2" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" placeholder="Enter Email" required>
                      <!-- <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div> -->
                    </div>
                    <div class="form-group">
                      <label for="exampleInputPassword1" class="form-label">Password</label>
                      <input type="password" minlength="6" class="form-control" name="pass" id="exampleInputPassword1" placeholder="Enter Passward" required>
                    </div>
                    <!-- <div class="checkbox">
                      <input type="checkbox" class="form-check-input" id="exampleCheck1">
                      <label class="form-check-label" for="exampleCheck1">Check me out</label>
                    </div> -->
                    <div class="first">
                    <button name="login" type="submit" class="btn btn-info btnn" href="">Login</button>
                    <!--button type="submit" class="btn btn-info btnn">Submit</button-->
                    </div>
                  </form>
                  
                </div>
                

                <!-- form end -->

            </div>
        
        <div class="col-md-4 col-sm-4 col-xl-12"></div>
        </div>
    
    </div>
    
</body>
</html>
