<?php
include 'apiConfig.php';
if (isset($_POST['contact'])) {

    $name =$_POST['name'];
    $email =$_POST['email'];
    $message = $_POST['message'];


// The data to send to the API
    $postData = array(
        'name' => $name ,
        'email' => $email,
        'message' => $message,



    );
// Setup cURL
    $url = $apiUrl.'contact/AddMessage';
    $ch = curl_init($url);
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
    echo $response;


// Check for errors
    if($response === FALSE){
        die(curl_error($ch));
        echo 'Dead';
    }

// Decode the response
    $responseData = json_decode($response, TRUE);

// Print the date from the response
    if($responseData != null){
        header("Location:../homepage.html");

        exit();
    }
    else
    {
        echo("Add Failed");
    }


}
?>
