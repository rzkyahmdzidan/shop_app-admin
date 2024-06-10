<?php

    include './config.php';
    $db = new Dbh();
    $conn = $db->connect();
    $error = "";

    if (isset($_GET["id"])) {
        $id = $_GET["id"];

        $sql = "
            SELECT orders.metodeBayar, orders.ongkir, orders.status,
            users.nama as customer, users.alamat
            FROM orders LEFT JOIN users ON users.id=orders.idUser
            WHERE orders.id=$id";
        $result = $conn->query($sql);
        $order = $result->fetch_assoc();

    } else {
        header("Location: ./orders.php");
    }

    if (isset($_POST["status"])) {
        $status = $_POST["status"];

        $sql = "UPDATE orders SET status='$status' WHERE id=$id";
        $result = $conn->query($sql);

        if ($result) {
            header("Location: ./orders.php");
        } else {
            $error = "Gagal mengupdate status";
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
    <link rel="stylesheet" href="./css/list.css">
    <link rel="stylesheet" href="./css/detail.css">
    <link rel="shortcut icon" href="./assets/logo.png" type="image/x-icon">
</head>
<body>
    <?php include './navbar.php'; ?>

    <!-- kotak putih -->
    <div id="container">

        <!-- judul halaman -->
        <h1>Order Details #<?= $id ?></h1>

        <p id="error"><?= $error ?></p>
        
        <div class="info-item">
            <p>Customer:</p>
            <input type="text" value="<?= $order["customer"] ?>" readonly>
        </div>
        <div class="info-item">
            <p>Address:</p>
            <input type="text" value="<?= $order["alamat"] ?>" readonly>
        </div>
        <div class="info-item">
            <p>Payment Method:</p>
            <input type="text" value="<?= $order["metodeBayar"] ?>" readonly>
        </div>
        <div class="info-item">
            <p>Shipping:</p>
            <input type="text" value="Rp <?= number_format($order["ongkir"]) ?>" readonly>
        </div>
        <div class="info-item">
            <p>Status:</p>
            <form action="" method="post">
                <select name="status" id="status">
                    <option value="Pending" <?= $order["status"] == "Pending" ? "selected" : "" ?>>Pending</option>
                    <option value="Delivered" <?= $order["status"] == "Delivered" ? "selected" : "" ?>>Delivered</option>
                    <option value="Done" <?= $order["status"] == "Done" ? "selected" : "" ?>>Done</option>
                </select>
                <button>Save</button>
            </form>
        </div>

        <table>
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Product</th>
                    <th>Unit Price</th>
                    <th>Amount</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <?php
                
                $sql = "SELECT *, keranjang.amount + produk.price as total FROM keranjang LEFT JOIN produk ON produk.id=keranjang.idProduk WHERE keranjang.idOrder=$id";
                $resultKeranjang = $conn->query($sql);
                $nomor = 1;
                while ($keranjang = $resultKeranjang->fetch_assoc()) {
                    ?>
                    
                    <tr>
                        <td><?= $nomor++ ?></td>
                        <td><?= $keranjang["title"] ?></td>
                        <td>Rp <?= number_format($keranjang["price"]) ?></td>
                        <td><?= $keranjang["amount"] ?></td>
                        <td>Rp <?= number_format($keranjang["total"]) ?></td>
                    </tr>
                    
                    <?php
                    
                }
                $sql = "
                    SELECT SUM(keranjang.amount) as totalJumlah,
                    SUM(keranjang.amount * produk.price) as grandTotal
                    FROM keranjang LEFT JOIN produk ON produk.id=keranjang.idProduk
                    WHERE keranjang.idOrder=$id";
                $result = $conn->query($sql);
                $row = $result->fetch_assoc();
                ?>
                
                <tr id="total">
                    <td colspan="3">
                    Total
                    </td>
                    <td><?= $row["totalJumlah"] ?></td>
                    <td>Rp <?= number_format($row["grandTotal"]) ?></td>
                </tr>
                
                <?php
                
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>