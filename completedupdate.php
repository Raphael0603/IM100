<?php
    include("config.php");

    if (isset($_POST['submit'])) {
        $id =     $_POST['id'];
        $customer_id =      $_POST['prod_id'];
        $order_id=          $_POST['order_id'];
        $date_arrive =    $_POST['date_arrive'];
        $prod_id=          $_POST['prod_id'];

        // Update the product in the database
        $sql = "UPDATE completed SET customer_id = $customer_id, order_id = $order_id, date_arrive = '$date_arrive' WHERE id = $id";
        if ($conn->query($sql) === TRUE) {
            header("Location: index.php");
        } else {
            echo "Error updating product: " . $conn->error;
        }
    } else {
        echo "Invalid request.";
    }
?>
