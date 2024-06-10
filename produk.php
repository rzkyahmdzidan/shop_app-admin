<?php

    include "./config.php";
    $db = new Dbh();
    $conn = $db->connect();

    if (isset($_POST["submit"]) ) {
        $id = $_POST["id"];
        $sql = "DELETE FROM produk WHERE id=$id";
        $result = $conn->query($sql);
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop App</title>
    <link rel="stylesheet" href="./css/general.css">
    <link rel="stylesheet" href="./css/list.css">
    <link rel="shortcut icon" href="./assets/logo.png" type="image/x-icon">
    <style>
        #produk {background-color: var(--background)}
        #produk a {color: black}
    </style>
</head>
<body>

    <?php include './navbar.php'; ?>

    <div id="container">
        <h1>Products</h1>
        <div id="leading">
            <a href="./actions/create_produk.php">+ Create Produk</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>No.</th>
                    <th>ID</th>
                    <th>Nama Produk</th>
                    <th>Kategori</th>
                    <th>Harga</th>
                    <th id="actions">Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php
                
                    $sql = "SELECT produk.*, kategori.nama as namaKategori  FROM produk LEFT JOIN kategori ON kategori.id=produk.idKategori ORDER BY title";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        $nomor = 1;
                        while ($row = $result->fetch_assoc()) {
                            ?>
                                <tr>
                                    <td><?= $nomor++  ?></td>
                                    <td>#<?= $row["id"]  ?></td>
                                    <td>
                                        <div class="flex items-center">
                                            <img src="./uploads/<?= $row["images"] ?>" width="80" height="80" alt="">
                                            <?= $row["title"] ?>
                                        </div>
                                    </td>
                                    <td><?= $row["namaKategori"] ?></td>
                                    <td>Rp<?= number_format($row["price"]) ?></td>
                                    <td>
                                        <form action="./actions/edit_produk.php" method="get">
                                            <input type="hidden" name="id" value="<?= $row["id"] ?>">
                                            <input id="edit" type="submit" value="Edit">
                                        </form>
                                        <form action="" method="post">
                                            <input type="hidden" name="id" value="<?= $row["id"] ?>">
                                            <input id="delete" type="submit" name="submit" value="Delete">
                                        </form>
                                    </td>
                                </tr>
                            <?php

                        }
                    }

                ?>
            </tbody>
        </table>
    </div>

</body>
</html>