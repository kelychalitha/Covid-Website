<?php
include 'apiConfig.php';

if (isset($_POST['submit'])) {
    $id =$_POST['id'];
    $fname =$_POST['fname'];
    $lname =$_POST['lname'];
    $age = $_POST['age'];
    $phone = $_POST['phone'];
    $profession = $_POST['prof'];
    $email = $_POST['email'];
    $affiliaction = $_POST['affil'];
    $password = $_POST['pass'];
    $image_name = $_FILES["file"]["name"];
    $image_type = $_FILES["file"]["type"];
    $file_temp_name = $_FILES["file"]["tmp_name"];
    $path = move_uploaded_file($file_temp_name, "C:/xampp/htdocs/helthWeb/uploads/citizen/".$image_name);



// The data to send to the API
    $userData = array(
        'fname' => $fname ,
        'lname' => $lname,
        'age' => $age,
        'phone' => $phone,
        'profeson' => $profession,
        'email' => $email,
        'affilication'=> $affiliaction,
        'image' => $image_name,
        'password' => $password,
        'id' => $id


    );


    $url = $apiUrl."auth/updateCitizen/";
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
