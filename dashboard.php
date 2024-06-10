<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop App</title>
    <link rel="stylesheet" href="./css/general.css">
    <link rel="stylesheet" href="./css/list.css">
    <link rel="stylesheet" href="./css/dashboard.css">
    <link rel="shortcut icon" href="./assets/logo.png" type="image/x-icon">
    <style>
        #dashboard {background-color: var(--background)}
        #dashboard a {color: black}
    </style>
</head>
<body>

    <?php include './navbar.php'; ?>

    <div id="container">
        <h1>Dashboard</h1>
        
        <div id="kategori-list">
            <?php
            
            include "./config.php";
            $db = new Dbh();
            $conn = $db->connect();

            $sql = "SELECT * FROM kategori";
            $result = $conn->query($sql);
            while ($row = $result->fetch_assoc()) {
                $idKategori = $row["id"];
                $sql = "SELECT COUNT(*) as jumlah FROM produk WHERE idKategori=$idKategori";
                $jumlah = $conn->query($sql)->fetch_assoc()["jumlah"];
                ?>
                
                <div class="kategori-item">
                    <h1><?= $row["nama"] ?></h1>
                    <p><?= $jumlah ?> products</p>
                </div>
                
                <?php
            }
            
            ?>
    </div>

</body>
</html>