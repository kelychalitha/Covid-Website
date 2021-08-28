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
    $lname= $_SESSION['lname1'];
    $image= $_SESSION['image1'];
    $id= $_SESSION['cid'];
    $ad= $_SESSION['addr'];
    $lt= $_SEnaSSION['lct'];
    $aft= $_SESSION['aff'];
    $pro= $_SESSION['prof'];
    $pho= $_SESSION['phone1'];
    $age= $_SESSION['age1'];
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
            <div class="my-2 my-lg-0">
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
                        <Center>
                            <form method="post" action="controller/update_citizen.php" enctype="multipart/form-data">
                            <div class="col-md-8 center box">
                            <center><img src="uploads/citizen/<?php echo($image); ?>" alt=""></center>
                                <input type="file" required name="file" id="file" accept="image/*">
                    
                                <label for="file">Edit-PIC</label>
                                <div class="box1">
                                <input type="text" minlength="4" required name="fname" value="<?php echo($fname);?>" placeholder="First Name">
                                    <input type="hidden" class="form-control" name="id" value="<?php echo($id);?>">
                                <input type="text" minlength="4" required name="lname" value="<?php echo($lname);?>" placeholder="Last Name">
                                <input type="text" maxlength="2" required name="age" value="<?php echo($age);?>" placeholder="Age">
                                <input type="text" maxlength="10" required name="phone"  value="<?php echo($pho);?>" placeholder="Contact Number">
                                
                                <input type="text" minlength="3" required name="prof"  value="<?php echo($pro);?>" placeholder="Profession">
                                <input type="email" minlength="2" required name="email"  value="<?php echo($email);?>" placeholder="Email">
                               
                                <input type="text" minlength="2" required name="affil" value="<?php echo($aft);?>" placeholder="Affiliation">
                               
                                <input type="Password" minlength="6" required name="cpw" placeholder="Current Password">
                                <input type="Password" minlength="6" required name="pass" placeholder="New Password">
                                <button style="float: centre;margin: 10px 10.2%;" name="submit" type="submit">Edit</button>
                                <button style="float: centre;margin: 10px 10.2%;" type="submit" name="submit">Upload</button>
                                <p>Make sure the information you entered is correct.!</p>
                                <!-- <a href="citizen-dash.html">Back</a> -->
                                <!-- <a href="citizen-dash.html" class="btn btn-info btn-xs" role="button">Back</a> -->
                    
                                </div>
                            </div>
                        </Center>
                        </form>
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

