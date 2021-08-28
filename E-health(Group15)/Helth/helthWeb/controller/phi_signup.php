<?php
include 'apiConfig.php';
if (isset($_POST['signup'])) {

    $fname =$_POST['fname'];
    $lname =$_POST['lname'];
    $nic = $_POST['nic'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $address = $_POST['address'];
    $location = $_POST['location'];
    $password = $_POST['password'];
    $image_name = $_FILES["file"]["name"];
    $image_type = $_FILES["file"]["type"];
    $file_temp_name = $_FILES["file"]["tmp_name"];
    $path = move_uploaded_file($file_temp_name, "C:/xampp/htdocs/helthWeb/uploads/".$image_name);

// The data to send to the API
    $postData = array(
        'fname' => $fname ,
        'lname' => $lname,
        'nic' => $nic,
        'phone' => $phone,
        'email' => $email,
        'address' => $address,
        'location' => $location,
        'image' => $image_name,
        'password' => $password,


    );
// Setup cURL
    $url = $apiUrl.'auth/phi/signup';
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
