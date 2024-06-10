<?php

    include "./config.php";
    $db = new Dbh();
    $conn = $db->connect();

    if (isset($_POST["submit"]) ) {
        $id = $_POST["id"];
        $sql = "DELETE FROM users WHERE id=$id";
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
        #users {background-color: var(--background)}
        #users a {color: black}
    </style>
</head>
<body>

    <?php include './navbar.php'; ?>

    <div id="container">
        <h1>Customers</h1>
        <table>
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Nama</th>
                    <th>Email</th>
                    <th>Alamat</th>
                    <!-- <th id="actions">Actions</th> -->
                </tr>
            </thead>
            <tbody>
                <?php
                
                    $sql = "SELECT * FROM users ORDER BY nama";
                    $result = $conn->query($sql);
                    if ($result->num_rows > 0) {
                        $nomor = 1;
                        while ($row = $result->fetch_assoc()) {
                            ?>
                                <tr>
                                    <td><?= $nomor++ ?></td>
                                    <td><?= $row["nama"] ?></td>
                                    <td><?= $row["email"] ?></td>
                                    <td><?= $row["alamat"] ?></td>
                                    <!-- <td>
                                        <form action="./actions/edit_user.php" method="post">
                                            <input type="hidden" name="id" value="<?= $row["id"] ?>">
                                            <input id="edit" type="submit" value="Edit">
                                        </form>
                                        <form action="" method="post">
                                            <input type="hidden" name="id" value="<?= $row["id"] ?>">
                                            <input id="delete" type="submit" name="submit" value="Delete">
                                        </form>
                                    </td> -->
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