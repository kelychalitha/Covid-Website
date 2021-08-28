<?php
include 'apiConfig.php';
if (isset($_POST['login'])) {
    session_start();
    unset($_SESSION["token"]);
    unset($_SESSION["image"]);
    $email =$_POST['email'];
    $password =$_POST['pass'];

// login data  send to the API
    $postData = array(
        'password' => $password,
        'email' => $email,
    );

// Setup cURL
// Setup cURL
    $ch = curl_init('http://localhost:8000/auth/philogin');
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


// Print the date from the response

    $token = $responseData['token'];
    $id = $responseData['id'];
    $email= $responseData['email'];
    $fname= $responseData['fname'];
    $image = $responseData['image'];
    $_SESSION['image']  = $image;
    $_SESSION["token"] =$token;
    $_SESSION['email'] =$email;
    $_SESSION['fname'] =$fname;
    $_SESSION['lname'] =$responseData['lname'];
    $_SESSION['phone'] =$responseData['phone'];
    $_SESSION['pid'] =$id;
    if($token != null   ){
       //echo ($image);
       header("Location:../dashboard_phi.php");
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
