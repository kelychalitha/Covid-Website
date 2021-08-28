<!DOCTYPE html>
<html lang="en">
<?php
include 'controller/apiConfig.php';
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
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
    <!--<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">-->
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.7/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="css/phi.css">
    <!--<link rel="stylesheet" href="css/PHI-dashboard.css">-->
    
    <title>E-health</title>
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
                    <main class="col-sm-10 bg-faded py-3 flex-grow-1">
                        <h2 class="page_head">Citizen Visit Places Details</h2>
                        <table id="example" class="table table-striped table-bordered table-hover dt-responsive"  >
                            <thead>
                                <tr>
                                    <th>NIC</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Address</th>
                                    <th>Contact Number</th>
                                    <th>Email</th>
                                    <th>Date</th>
                                    <th>Visit Place</th>    
                                </tr>
                            </thead>
                            <tbody>
                            <?php

                            $url= $apiUrl."place/visits";
                            $ch = curl_init();
                            curl_setopt($ch, CURLOPT_URL,$url);
                            curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
                            curl_setopt($ch, CURLOPT_ENCODING, ""); // this will handle gzip content
                            $response  = curl_exec($ch);

                            // Check for errors
                            if($response === FALSE){
                                die(curl_error($ch));
                                echo 'Dead';
                            }

                            // Decode the response
                            $responseData = json_decode($response, TRUE);


                            if($responseData != null){
                                foreach ($responseData  as $key => $value) {
                                    echo "<tr> <td>".  $value["nic"]. "</td><td> ". $value["fname"]. "</td><td> ". $value["lname"]. "</td><td> ". $value["address"]. "</td><td> "
                                        . $value["phone"]. "</td><td> ". $value["email"]. "</td><td> ".  $value["date"]. "</td><td> ".
                                        $value["location"]. "</td></tr> ";


                                }

                            }

                            else{
                                echo "No Data Found";
                                exit();
                            }


                            ?>
                            </tbody>
                            <tfoot>   
                            </tfoot>
                        </table>
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
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.7/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.7/js/responsive.bootstrap4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        /* Create an array with the values of all the select options in a column */
        $(document).ready(function() {
            $('#example').DataTable({     
            });
        });
        // the function creates a select box
        </script>  
</body>
<!--ThisCodewaswrittenbyKelyWeerasooriya-->
</html>
