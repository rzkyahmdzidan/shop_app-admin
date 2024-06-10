<?php

    include './config.php';
    $db = new Dbh();
    $conn = $db->connect();
    $error = "";

    if (isset($_POST["username"])) {
        $username = $_POST["username"];
        $password = $_POST["password"];
        $sql = "SELECT * FROM admin WHERE username='$username' AND password='$password'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            header("Location: ./orders.php");
        } else if ($username != "" && $password != "") {
            $error = "Username atau password Anda salah";
        }
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop App</title>
    <link rel="stylesheet" href="./css/general.css">
    <link rel="stylesheet" href="./css/login.css">
    <link rel="shortcut icon" href="./assets/logo.png" type="image/x-icon">
</head>
<body>

    <!-- Nampilkan error -->
    <p id="error"><?= $error ?></p>

    <!-- kotak hijau -->
    <div id="container">

        <!-- Tulisan login -->
        <h1>Login</h1>

        <!-- form  -->
        <form id="login" action="" method="post">

            <!-- input username -->
            <input type="text" name="username" placeholder="Username">

            <!-- input password -->
            <input type="password" name="password" placeholder="Password">
        </form>

        <!-- tombol login -->
        <button form="login">Login</button>
    </div>
</body>
</html>