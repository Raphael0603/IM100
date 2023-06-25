<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
</head>
<style>
     *{
    background-color: rgb(211, 205, 205);
}


#prod{
    justify-content: center;
    width: 400px;
    height: 25px;
    padding: 3px;
    margin: 3px;
    border-radius: 4px;
    border: 1px solid white;
    text-align: center;
   
}
.prod{
    font-size: 15px;
    font-family: 'Lucida Sans';
    justify-content: center;
    align-items: center;
    display: row;
    color: black;
    font-weight: bold;
}


#AddBtn{
    height: 30px;
    width: 100px;
    border-radius: 4px;
    border: 0;
    background-color: rgb(73, 88, 228);
    transition: 0.5s;
    color: white;
    margin-top: 15px;
    align-items: center;
    justify-content: center;
    display: flex;

}

#AddBtn:hover{
    background-color: rgb(28, 158, 158);
}

th{
    width: 400px;
    padding: 10px;
    background-color: black;
    color: white;
}
tr{
    padding: 10px;
}
table{
    border: 1px solid;
    border-color: gray;
    margin: 25px;
    
}
td{
    border: 1px solid;
    border-color: gray;
    width: 50px;
    border-width: 1px;
    padding: 10px;
    font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}

h2{
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}

#BACKbtn{
    height: 30px;
    width: 100px;
    border-radius: 4px;
    border: 0;
    background-color: rgb(73, 88, 228);
    transition: 0.5s;
    color: white;
    margin-bottom: 20px;

}

.search{
    width: 200px;
    height: 25px;
    padding: 3px;
    margin: 3px;
    border-radius: 4px;
    border: 1px solid;
    margin-left: 10px;

}

.search-input #search-term{
    width: 50%;
    height: 30px;
    padding: 3px;
    margin: 3px;
    border-radius: 4px;
    border: 1px solid black;
    margin-left: 50px;
    margin-top: 15px;
}
.seachBtn #search-Btn{
    height: 30px;
    width: 100px;
    border-radius: 4px;
    border: 0;
    background-color: rgb(53, 192, 48);
    transition: 0.5s;
    color: white;
    margin-left: 50px;
    margin-top: 15px;
}
.header{
    text-align: center;
}
h3{
    text-align: center;
}
.title{
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    font-size: 100px;
    text-align: center;
}
</style>
<body>
<?php
    include("config.php");

        if (isset($_GET['id'])) {
            $order_id = $_GET['id'];

            // Fetch the product from the database based on the product ID
            $sql = "SELECT * FROM completed WHERE id = $order_id";
            $result = $conn->query($sql);

            if ($result->num_rows == 1) {
                $row = $result->fetch_assoc();
                $id = $row['id'];
                $customer_id = $row['customer_id'];
                $order_id = $row['order_id'];
                $date_arrive = $row['date_arrive'];
                $prod_id = $row['prod_id'];

                // Display the edit form with pre-filled values
                echo "
                <form action='completedupdate.php' method='POST'>
                    <input type='hidden' name='id' value=' $id'>
                    <div class='prod'><label for='prod_id'>Customer ID:</label></div>
                    <div class='prod'><input type='text' id='prod' name='customer_id' value='$customer_id' required><br>
                    <div class='prod'><label for='QTY'>Order ID:</label></div>
                   <input type='text' id='prod' name='order_id' value='$order_id' reqired><br>
                   <div class='prod'<label for='order_date'>Date Arrive:</label></div>
                    <input type='text' id='prod' name='date_arrive' value='$date_arrive' ><br>
                    <div class='prod'<label for='order_date'>Product ID:</label></div>
                    <input type='text' id='prod' name='prod_id' value='$prod_id' ><br>
                    <div class='seachBtn'><input type='submit' id='search-Btn' name='submit' value='Update'></div>
                    
                </form>";
            } else {
                echo "Product not found.";
            }
             } else {
            echo "Invalid request.";
        }
    ?>
     <h1 class="header"><br>Completed</h1>
    <?php
        include("config.php");
        $sql = "SELECT * FROM completed";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo "<table>";
            echo "<tr>";
            echo "<th>ID</th><th>Customer ID</th><th>Order ID</th><th>Date Arrive</th><th>Product ID</th>";
            echo "</tr>";
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row['id'] . "</td>";
                echo "<td>" . $row['customer_id'] . "</td>";
                echo "<td>" . $row['order_id'] . "</td>";
                echo "<td>" . $row['date_arrive'] . "</td>";
                echo "<td>" . $row['prod_id'] . "</td>";
                echo "</td>";
                echo "</tr>";
            }
            echo "</table>";
        }    
    ?>
<form method="POST" action="index.php">
        <div class="backBtn"><input type="submit" id="BACKbtn" name="search" value="BACK"></div>
    </form>

</body>
</html>
