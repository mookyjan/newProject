01
<?php 
    $uploadFolder = "./upload";
    if (!file_exists($uploadFolder)) {
        mkdir($uploadFolder);
    }
    $uploadFile = $uploadFolder . "/" . basename($_FILES["fileToUpload"]["name"]);
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $uploadFile)) {
        echo "Successfully";
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
?>
