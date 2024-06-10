<?php

    include "./config.php";
    $db = new Dbh();
    $conn = $db->connect();

    extract($_GET);
    if (!isset($sort)) $sort = "id";

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
        #orders {background-color: var(--background)}
        #orders a {color: black}
    </style>
</head>
<body>

    <?php include './navbar.php'; ?>

    <!-- kotak putih -->
    <div id="container">

        <!-- judul halaman -->
        <h1>Transactions</h1>

        <div id="sort">
            <p>Sort:</p>
            <select name="sort">
                <option value="createdAt" <?= $sort == "id" ? "selected" : "" ?>>ID</option>
                <option value="status DESC" <?= $sort == "status DESC" ? "selected" : "" ?>>Status</option>
            </select>
        </div>
        <table>
            <!-- bagian atas hijau -->
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Order ID</th>
                    <th>Nama Produk</th>
                    <th>Alamat</th>
                    <th>Harga</th>
                    <th>Status</th>
                    <th id="actions">Actions</th>
                </tr>
            </thead>

            <!-- bagian data -->
            <tbody>
                <?php
                
                    $sql = "
                        SELECT orders.*, users.alamat
                        FROM orders LEFT JOIN users ON orders.idUser=users.id
                        ORDER BY orders.$sort
                    ";
                    $nomor = 1;
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        while ($order = $result->fetch_assoc()) {
                            $date = date_create($order["createdAt"]);
                            $idOrder = $order["id"];
                
                            $sqlKeranjang = "
                                SELECT keranjang.amount * produk.price as amount,
                                produk.title as namaProduk
                                FROM keranjang LEFT JOIN produk ON produk.id=keranjang.idProduk
                                WHERE keranjang.idOrder=$idOrder
                            ";
                            $resultKeranjang = $conn->query($sqlKeranjang);
                            
                            $daftarProduk = "";
                            $amount = 0;
                            if ($resultKeranjang->num_rows > 0) {
                                while ($keranjang = $resultKeranjang->fetch_assoc()) {
                                    $namaProduk = $keranjang["namaProduk"];
                                    $daftarProduk = "$daftarProduk, $namaProduk";
                                    $amount += $keranjang["amount"];
                                }
                                $daftarProduk = substr($daftarProduk, 2);
                            }
                            
                            ?>
                                <tr>
                                    <td><?= $nomor++ ?></td>
                                    <td>#<?= $order["id"] ?></td>
                                    <td><?= $daftarProduk ?></td>
                                    <td><?= $order["alamat"] ?></td>
                                    <td>Rp <?= number_format($amount + $order["idUser"]) ?></td>
                                    <td><?= $order["status"] ?></td>
                                    <td>
                                        <form action="./detail_order.php" method="get">
                                            <input type="hidden" name="id" value="<?= $order["id"] ?>">
                                            <input id="edit" type="submit" value="Details">
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

    <script src="./js/orders.js"></script>
</body>
</html>