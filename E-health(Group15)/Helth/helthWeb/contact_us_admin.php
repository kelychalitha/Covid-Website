<!DOCTYPE html>
<html lang="en">
<?php
include 'controller/apiConfig.php';
session_start();
if(!isset($_SESSION['token2'])){
    header('Location: homepage.html');
}
else
{

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
    <link rel="stylesheet" href="css/admin.css">
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
                                        <a class="nav-link pl-0 text-nowrap" href="#"><img src="image/logo.png"
                                                class="profile_image" alt=""></a>
                                                <h2><center><b>Admin</b></center></h2>
                                    </li>
                                    
                                    
                                    <li class="nav-item">
                                        <a class="nav-link pl-0" href="phi_view_admin.php"><i class="fas fa-table"></i> <span
                                                class="d-none d-md-inline">PHI View</span></a></br>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link pl-0" href="citizen_view_admin.php"><i class="fas fa-table"></i>
                                            <span class="d-none d-md-inline">Citizen View</span></a></br>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link pl-0" href="positive_p_admin.php"><i class="fas fa-table"></i> <span
                                                class="d-none d-md-inline">Positive P</span></a></br>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link pl-0" href="contact_us_admin.php"><i class="fas fa-table"></i> <span
                                                class="d-none d-md-inline">Contatc Us</span></a></br>
                                    </li>

                                </ul>
                            </div>
                        </nav>
                    </aside>
                    <main class="col-sm-10 bg-faded py-3 flex-grow-1">
                        <h2 class="page_head">Contatc Us Info</h2>
                        <table id="citizen_view" class="table table-bordered table-hover dt-responsive"  >
                            <thead>
                                <tr>
                                    
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Message</th>
                                 
                                    
                                </tr>
                            </thead>
                            <tbody>
                            <?php

                            $url= $apiUrl."contact/messages";
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
                                    echo "<tr> <td>".  $value["name"]. "</td><td> ". $value["email"]. "</td><td> ". $value["message"]. "</td></tr> ";

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
            $('#citizen_view').DataTable({
                
                
            });
        });

        // the function creates a select box
        

        </script>  
</body>

</html>
