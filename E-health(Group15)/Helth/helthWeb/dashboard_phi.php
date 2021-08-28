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
    $image= $_SESSION['image'];
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
                                                class="d-none d-md-inline">Settings</span></a></br>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </aside>
                    <main class="col bg-faded py-3 flex-grow-1">
                        <h2 class="page_head">COVID-19 Prevention Methods</h2></br>
                        <h4><i class="fas fa-head-side-mask">&nbsp;&nbsp;Always wear a clean face mask when you leave from home.</i></h4></br>
                        <h4><i class="fas fa-hands-wash">&nbsp;&nbsp;Wash your hand often and use soap & water, or an alcohol-based hand rub.</i></h4></br>
                        <h4><i class="fas fa-ban">&nbsp;&nbsp;Don't touch your eyes, nose or mouth.</i></h4></br>
                        <h4><i class="fas fa-box-tissue">&nbsp;&nbsp;Cover your cough and sneeze using a elbow or tissue and dispose tissue properly</i></h4></br>
                        <h4><i class="fas fa-users-slash">&nbsp;&nbsp;Avoid Shaking hands or hugging your friends and relatives.</i></h4></br>
                        <h4><i class="fas fa-people-arrows">&nbsp;&nbsp;You should keep at least one meter distance between yourself and others, if in public or while you are talking.</i></h4></br>
                        <h4><i class="fas fa-notes-medical">&nbsp;&nbsp;You should monitor your health daily.</i></h4></br></b></br>
                        <h4 class="page_head"><a href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjqn4LHkdTvAhVPIbcAHUxYDUsQFjAAegQIBBAD&url=https%3A%2F%2Fwww.cdc.gov%2Fcoronavirus%2F2019-ncov%2Fprevent-getting-sick%2Fprevention-H.pdf&usg=AOvVaw2IIrk8mMj9fSTSb6ZTAoAp" 
                            target="_blank" style="color: rgb(241, 189, 91);" ><h4 class="page_head2">More Details:</h4><i class="fas fa-hand-point-right" style="color: rgb(47, 0, 255);" >&nbsp;How to protect yourself & Others</i> </a></h4>
                        <h4 class="page_head"><a href="https://phi.lk/Manual_for_the_Sri_Lanka_PHI.pdf" target="_blank" style="color: rgb(241, 189, 91);" ><i class="fas fa-hand-point-right" style="color: rgb(47, 0, 255);">&nbsp;PHI Duty List Manual</i></a></h4>
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
    <!--ThisCodewaswrittenbyKelyWeerasooriya-->
</body>

</html>
