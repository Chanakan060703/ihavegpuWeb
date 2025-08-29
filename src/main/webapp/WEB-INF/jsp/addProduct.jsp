<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>เพิ่มสินค้าใหม่</title>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Kanit', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            box-sizing: border-box;
    		background-repeat: no-repeat;
    		background-size: cover;
    		background-image: url('https://64.media.tumblr.com/4e0e28821627a1e566134edef9b0b20b/tumblr_ocmlpt9P0p1vewhn8o2_500.gifv');
        }
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 600px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 5px;
        }
        .btn-submit {
        	font-family: 'Kanit', sans-serif;
            display: inline-block;
            padding: 10px 20px;
            background-color: #28a745;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-submit:hover {
            background-color: #218838;
            transform: scale(1.05);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2); 
        }

        .btn-submit:active {
            background-color: #1e7e34;
            transform: scale(0.98);
        }
        .btn-cancel {
        	margin-top: 1rem;
            display: inline-block;
            padding: 10px 20px;
            background-color: #dc3545;
            color: #fff; 
            text-decoration: none;
            border-radius: 8px;
            transition: background-color 0.3s, transform 0.2s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            
        }

        .btn-cancel:hover {
            background-color: #c82333;
            transform: scale(1.05); 
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2); 
        }

        .btn-cancel:active {
            background-color: #bd2130; 
            transform: scale(0.98); 
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>เพิ่มสินค้าใหม่</h2>
        <form action="addProduct" method="post">
            <div class="form-group">
                <label for="nameProduct">ชื่อสินค้า:</label>
                <input type="text" id="nameProduct" name="nameProduct" required>
            </div>
            <div class="form-group">
                <label for="price">ราคา:</label>
                <input type="number" id="price" name="price" required>
            </div>
            <div class="form-group">
                <label for="detail">รายละเอียด:</label>
                <textarea id="detail" name="detail" required></textarea>
            </div>
            <div class="form-group">
                <label for="brand">แบรนด์:</label>
                <input type="text" id="brand" name="brand" required>
            </div>
            <div class="form-group">
                <label for="qty">จำนวนสินค้า:</label>
                <input type="number" id="qty" name="qty" required>
            </div>
            <div class="form-group">
                <label for="imageUrl">URL รูปสินค้า:</label>
                <input type="text" id="imageUrl" name="imageUrl" required>
            </div>
            <div class="form-group">
                <label for="typeId">ประเภทสินค้า:</label>
                <select id="typeId" name="typeId" required>
                    <c:forEach var="type" items="${productTypes}">
                        <option value="${type.type_id}">${type.type_name}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn-submit">เพิ่มสินค้า</button>
            <a href="allProducts" class="btn-cancel">ยกเลิก</a>
        </form>
    </div>
</body>
</html>
