<?php
include 'apiConfig.php';

if (isset($_POST['submit'])) {
    $id =$_POST['id'];




// The data to send to the API
    $userData = array(
        'id' => $id

    );


    $url = $apiUrl."citizen/updatestate/".$id;
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
        echo("Delete Failed ");
        exit();
    }
    else
    {

        header("Location:../citizen_view_admin.php");
        exit();

    }
}
?>
