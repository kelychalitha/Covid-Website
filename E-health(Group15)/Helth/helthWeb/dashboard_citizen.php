<!DOCTYPE html>
<html lang="en">
<?php
session_start();
if(!isset($_SESSION['token1'])){
    header('Location: homepage.html');
}
else
{
    $token= $_SESSION['token1'];
    $email= $_SESSION['email1'];
    $fname= $_SESSION['fname1'];
    $image= $_SESSION['image1'];
} ?>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="css/citizen.css">


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
                                        <a class="nav-link pl-0 text-nowrap" href="#"><img src="uploads/citizen/<?php echo($image); ?>"
                                                class="profile_image" alt=""></a>
                                        <center>    <h2><b>Citizen</b></h2>
                                        <em><?php echo($fname); ?></em></center>
                                    </li>
                                    <li class="nav-item center">
                                        <a class="nav-link pl-0" href="dashboard_citizen.php"><i class="fas fa-table"></i> <span
                                                class="d-none d-md-inline">Dashboard</span></a></br>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link pl-0" href="profile_settings_citizen.php"><i class="fas fa-table"></i> <span
                                                class="d-none d-md-inline">Profile</span></a></br>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link pl-0" href="health_state_citizen.php"><i class="fas fa-table"></i>
                                            <span class="d-none d-md-inline">Health State</span></a></br>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link pl-0" href="citizen_visit_citizen.php"><i class="fas fa-table"></i> <span
                                                class="d-none d-md-inline">Citizen Visit</span></a></br>
                                    </li>

                                </ul>
                            </div>
                        </nav>
                    </aside>
                    <main class="col bg-faded py-3 flex-grow-1">
                        <h2 class="page_head">If you are sick, steps to prevent the spread of COVID-19 </h2></br>
                        <h4><i class="far fa-hand-point-right">&nbsp;&nbsp;<b>Stay home except to get medical care</i></h4></br>
                        <h4><i class="far fa-hand-point-right">&nbsp;&nbsp;<b>Separate yourself from other people</i></h4></br>
                        <h4><i class="far fa-hand-point-right">&nbsp;&nbsp;<b>Monitor your symptoms</i></h4></br>
                        <h4><i class="far fa-hand-point-right">&nbsp;&nbsp;<b>Call ahead before visiting your doctor</i></h4></br>
                        <h4><i class="far fa-hand-point-right">&nbsp;&nbsp;<b>Get Tested</i></h4></br>
                        <h4><i class="far fa-hand-point-right">&nbsp;&nbsp;<b>If you are sick, wear a mask over your nose and mouth</i></h4></br>
                        <h4><i class="far fa-hand-point-right">&nbsp;&nbsp;<b>Cover your coughs and sneezes</i></h4></br></b>
                        <h4><i class="far fa-hand-point-right">&nbsp;&nbsp;<b>Clean all “high-touch” surfaces everyday</i></h4></br></b></br>
                        <h2 class="page_head"><a href="https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjqn4LHkdTvAhVPIbcAHUxYDUsQFjAAegQIBBAD&url=https%3A%2F%2Fwww.cdc.gov%2Fcoronavirus%2F2019-ncov%2Fprevent-getting-sick%2Fprevention-H.pdf&usg=AOvVaw2IIrk8mMj9fSTSb6ZTAoAp" 
                            target="_blank" style="color: rgb(241, 189, 91);" ><h4 class="page_head2">More Details:</h4> How to protect yourself & Others</a></h2>

                            


                        <!--<h2 class="page_head"><a href="https://phi.lk/Manual_for_the_Sri_Lanka_PHI.pdf" target="_blank" style="color: rgb(241, 189, 91);" ><h4 class="page_head2">More Details:</h4> Duty list of public helath inspector Sri Lanka</a></h2>-->

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

</html>
