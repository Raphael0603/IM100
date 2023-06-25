<?php
        $id =           $_POST['id'];
        $customer_id =           $_POST['customer_id'];
        $order_id  =          $_POST['order_id'];
        $date_arrive =           $_POST['date_arrive'];
        $prod_id  =          $_POST['prod_id'];

    
        include_once('config.php');

        $conn = new mysqli ($servername, $username, $password, $dbname);

        if($conn->connect_error){
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "INSERT INTO completed (id, customer_id, order_id, date_arrive, prod_id) VALUES ($id, $customer_id, $order_id, '$date_arrive', $prod_id)";

        if($conn->query($sql) === TRUE ) {
            $conn->close();
            header("Location: index.php");
        }else{
            echo "Error: " .$sql . "<br>" . $conn->error;
        }

    ?>