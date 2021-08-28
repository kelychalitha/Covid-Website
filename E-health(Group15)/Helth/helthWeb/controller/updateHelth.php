<?php
include 'apiConfig.php';
if (isset($_POST['submit'])) {


    $id = $_POST['id'];
    $test =$_POST['test'];
    $results = $_POST['status'];
    $nic = $_POST['nic'];

// The data to send to the API
    $postData = array(
        'id' => $id ,
        'results' => $results,
        'test' => $test,
        'nic' => $nic

    );
// Setup cURL
    $url = $apiUrl.'citizen/addCitizenReport';
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
        header("Location:../dashboard_phi.php");
        exit();
    }
    else
    {
        echo("Add Failed");
    }


}
?>
