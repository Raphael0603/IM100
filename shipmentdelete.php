<?php
    include("config.php");

    if (isset($_GET['id'])) {
        $orderId = $_GET['id'];

        // Delete the product from the database
        $sql = "DELETE FROM shipment WHERE ship_id = $orderId";
        if ($conn->query($sql) === TRUE) {
            header("Location: index.php");
        } else {
            echo "Error deleting product: " . $conn->error;
        }
    } else {
        echo "Invalid request.";
    }
?>
