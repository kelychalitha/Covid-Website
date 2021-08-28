<!DOCTYPE html>
<html lang="en">
<?php
session_start();
if(!isset($_SESSION['token'])){
header('Location: homepage.html');
}
else
{
$token= $_SESSION['token'];
$email= $_SESSION['email'];
$fname= $_SESSION['fname'];
$lname= $_SESSION['lname'];
$phone= $_SESSION['phone'];
$image= $_SESSION['image'];
$pid= $_SESSION['pid'];
} ?>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="css/phi.css">
    <!--<link rel="stylesheet" href="css/PHI-dashboard.css">-->

    <title>E-Health</title>
</head>

<body>
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">
            <h3>E-<span style="color:lightskyblue;">HEALTH</span></h3>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
         
            </ul>
            <div class="my-2 my-lg-0"></form>
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><a href="controller/logout.php">Logout</a></button>
            </div>
        </div>
    </nav>
    <div class="row m-0 p-0 px-0">
        <div class="content">
            <div class="container-fluid">
                <div class="row min-vh-100 flex-column flex-md-row">
                    <aside class="col-12 col-md-2 p-0 bg-secondary flex-shrink-1">
                        <nav
                            class="navbar navbar-expand navbar-dark bg-secondary flex-md-column flex-row align-items-start py-2">
                            <div class="collapse navbar-collapse ">
                                <ul class="flex-md-column flex-row navbar-nav w-100 justify-content-between">
                                    <li class="nav-item">
                                        <a class="nav-link pl-0 text-nowrap" href="#"><img src="uploads/<?php echo($image); ?>"
                                                                                           class="profile_image" alt=""></a>
                                        <center>  <h2><b>PHI</b></h2>
                                            <em><?php echo($fname); ?></em>
                                        </center>
                                    </li>
                                    <li class="nav-item center">
                                        <a class="nav-link pl-0" href="dashboard_phi.php"><i class="fa fa-table"></i> <span
                                                class="d-none d-md-inline">Dashboard</span></a></br>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link pl-0" href="health_status_phi.php"><i class="fa fa-notes-medical"></i> <span
                                                class="d-none d-md-inline">Health Status</span></a></br>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link pl-0" href="citizen_visit_phi.php"><i class="fa fa-route"></i>
                                            <span class="d-none d-md-inline">Citizen Visit</span></a></br>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link pl-0" href="profile_settings_phi.php"><i class="fa fa-cog"></i> <span
                                                class="d-none d-md-inline">Profile</span></a></br>
                                    </li>

                                </ul>
                            </div>
                        </nav>
                    </aside>
                    <main class="col-sm-10 bg-faded py-3 flex-grow-1">
                        <h2 class="page_head"> Update Your Profile Details</h2>
                        <form class="container-fluid col-sm-10" method="post" action="controller/phi_update.php">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputFirstname">First Name</label>
                                    <input type="text" minlength="4" class="form-control" name="fname" value="<?php echo($fname);?>" id="inputFirstname" placeholder="John" required>
                                    <input type="hidden" class="form-control" name="id" value="<?php echo($pid);?>">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputLastname">Last Name</label>
                                    <input type="text" minlength="4" class="form-control" name="lname" value="<?php echo($lname);?>" id="inputLastname" placeholder="Smith" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputContactnumber">Contact Number</label>
                                    <input type="text" maxlength="10" class="form-control" value="<?php echo($phone);?>" name="phone" id="inputContactnumber"
                                        placeholder="+94 71 236 4869" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Email</label>
                                    <input type="text" minlength="2" name="email" value="<?php echo($email);?>"  class="form-control" id="inputEmail4"
                                        placeholder="john@gmail.com" required>
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Current Password</label>
                                    <input type="password" minlength="6"  name="cpass" class="form-control" id="inputPassword4" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputNewPassword4">New Password</label>
                                    <input type="password" minlength="6" name="pass" class="form-control" id="inputNewPassword4" required>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center">
                                <button name="submit"  class="btn btn-success btn-lg btn-block col-md-6" type="submit">Update</button>
                            </div>
                        </form>
                        <body oncontextmenu="return false">
                        <body ondragstart="return false" onselectstart="return false"></body>
                    </main>
                </div>
            </div>
        </div>
    </div>
    <div class="footer fixed-bottom bg-dark">
        E-Health &copy; 2021
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
<!--ThisCodewaswrittenbyKelyWeerasooriya-->
</html>
