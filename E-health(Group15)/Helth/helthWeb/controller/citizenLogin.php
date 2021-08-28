<?php
include 'apiConfig.php';
if (isset($_POST['login'])) {
    session_start();
    unset($_SESSION["token1"]);
    unset($_SESSION["image1"]);

    $email =$_POST['email'];
    $password =$_POST['pass'];

// login data  send to the API
    $postData = array(
        'password' => $password,
        'email' => $email,
    );

// Setup cURL

    $ch = curl_init('http://localhost:8000/auth/citizenlogin');
    curl_setopt_array($ch, array(
        CURLOPT_POST => TRUE,
        CURLOPT_RETURNTRANSFER => TRUE,
        CURLOPT_HTTPHEADER => array(
            'Content-Type: application/json'
        ),
        CURLOPT_POSTFIELDS => json_encode($postData)
    ));

// Send the request
    $response = curl_exec($ch);

// Check for errors
    if($response === FALSE){
        die(curl_error($ch));
        echo 'Dead';
    }

// Decode the response
    $responseData = json_decode($response, TRUE);
    echo($responseData['token'] );

// Print the date from the response

    $token = $responseData['token'];
    $id = $responseData['id'];
    $email= $responseData['email'];
    $fname= $responseData['fname'];
    $image = $responseData['image'];
    $nic = $responseData['nic'];
    $_SESSION["token1"] =$token;
    $_SESSION['email1'] =$email;
    $_SESSION['fname1'] =$fname;
    $_SESSION['image1'] =$image;
    $_SESSION['nic'] =$nic;
    $_SESSION['cid'] =$id;
    $_SESSION['addr'] =$responseData['address'];
    $_SESSION['lct'] =$responseData['location'];
    $_SESSION['aff'] =$responseData['affilication'];
    $_SESSION['prof'] =$responseData['profeson'];
    $_SESSION['lname1'] =$responseData['lname'];
    $_SESSION['phone1'] =$responseData['phone'];
    $_SESSION['age1'] =$responseData['age'];
    if($token != null   ){
        //echo ($image);
        header("Location:../dashboard_citizen.php");
        exit();
    }

    else{

       echo '<script language="javascript">';
       echo 'alert("Login error");';
       echo 'window.location.href="../homepage.html";';
       echo '</script>';
       exit();
    }

}
?>
