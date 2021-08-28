<?php
include 'apiConfig.php';

if (isset($_POST['submit'])) {

    $id =$_POST['id'];
    $fname =$_POST['fname'];
    $lname = $_POST['lname'];
    $phone = $_POST['phone'];
    $email= $_POST['email'];
    $password = $_POST['pass'];

// The data to send to the API
    $userData = array(
        'id' => $id,
        'fname' => $fname,
        'lname' => $lname,
        'email' => $email,
        'phone' => $phone,
        'password' => $password


    );



    $url = $apiUrl."auth/updatePhi/";
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
        echo("Results Update failed");
        exit();
    }
    else
    {

       header("Location:logout.php");
        exit();

    }
}
?>
