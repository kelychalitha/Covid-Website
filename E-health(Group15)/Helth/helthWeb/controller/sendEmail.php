<?php
include 'apiConfig.php';

if (isset($_POST['submit'])) {

    $email = $_POST['email'];




// The data to send to the API
    $userData = array(

        'email' => $email,



    );


    $url = $apiUrl."citizen/email/".$email;
    $data_json = json_encode($userData);

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json','Content-Length: ' . strlen($data_json)));
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT');
    curl_setopt($ch, CURLOPT_POSTFIELDS,$data_json);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response  = curl_exec($ch);


// Decode the response
    $responseData = json_decode($response, TRUE);

// Print the date from the response
    if($responseData == "success"){
        echo("Email Send failed");
        exit();
    }
    else
    {

        header("Location:../citizen_view_admin.php");
        exit();

    }
}
?>
