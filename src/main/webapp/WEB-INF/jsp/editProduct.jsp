<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>แก้ไขสินค้า</title>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body { 
        font-family: 'Kanit', sans-serif; 
        box-sizing: border-box;
    	background-repeat: no-repeat;
    	background-size: cover;		background-image: url('https://64.media.tumblr.com/4e0e28821627a1e566134edef9b0b20b/tumblr_ocmlpt9P0p1vewhn8o2_500.gifv');
        
        }
        .form-container { width: 600px; margin: auto; padding: 20px; background-color: #fff; border-radius: 8px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; font-weight: bold; }
        input, select, textarea { width: 95%; padding: 10px; margin-top: 5px; }
        .btn-submit { background-color: #4CAF50; color: #fff; padding: 10px; border: none; width: 100%; cursor: pointer; }
        
    </style>
</head>
<body>
    <div class="form-container">
        <h2>แก้ไขสินค้า</h2>
        <form action="updateProduct" method="post">
            <input type="hidden" name="productId" value="${product.product_id}">
            <div class="form-group">
                <label>ชื่อสินค้า:</label>
                <input type="text" name="product_name" value="${product.product_name}" required>
            </div>
            <div class="form-group">
                <label>ราคา:</label>
                <input type="number" name="price" step="0.01" value="${product.price}" required>
            </div>
            <div class="form-group">
                <label>รายละเอียด:</label>
                <textarea name="detail" required>${product.detail}</textarea>
            </div>
            <div class="form-group">
                <label>ประเภทสินค้า:</label>
                <select name="type_id" required>
                    <c:forEach var="type" items="${productTypes}">
                        <option value="${type.type_id}" ${product.type_id.type_id == type.type_id ? "selected" : ""}>${type.type_name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>แบรนด์:</label>
                <input type="text" name="brand" value="${product.brand}" required>
            </div>
            <div class="form-group">
                <label>จำนวนสินค้า:</label>
                <input type="number" name="product_qty" value="${product.product_qty}" required>
            </div>
            <div class="form-group">
                <label>รูปสินค้า (URL):</label>
                <input type="text" name="imageUrl" value="${product.pic_product}">
            </div>
            <button type="submit" class="btn-submit">บันทึกการแก้ไข</button>
        </form>
    </div>
</body>
</html>
