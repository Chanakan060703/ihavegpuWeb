<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <title>สรุปการสั่งซื้อ</title>
    <style>
        /* Container styling */
        .container {
            width: 80%;
            margin: 0 auto;
            font-family: 'Kanit', sans-serif;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #007bff;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Table styling */
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        .table th, .table td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .table th {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
        }

        .table td {
            font-size: 16px;
            color: #333;
        }

        /* Total price styling */
        .total-price {
            text-align: right;
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-top: 10px;
            margin-bottom: 20px;
        }

        /* Form section styling */
        .form-section {
            margin-top: 20px;
        }

        .form-section h3 {
            font-size: 18px;
            color: #007bff;
            margin-bottom: 10px;
        }

        .form-section input, .form-section select {
            width: 100%;
            padding: 12px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        /* Button styling */
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn-cancel {
            background-color: #dc3545;
            margin-left: 10px;
        }

        .btn-cancel:hover {
            background-color: #c82333;
        }

        /* Center align for buttons */
        .btn-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>สรุปการสั่งซื้อ</h2>
        <p><strong>วันที่:</strong> ${receipt.date}</p>
        <p><strong>อีเมลผู้สั่งซื้อ:</strong> ${receipt.email}</p>

        <c:choose>
            <c:when test="${singleProduct}">
                <!-- แสดงรายการสั่งซื้อจากหน้า Detail -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>ชื่อสินค้า</th>
                            <th>จำนวน</th>
                            <th>ราคาต่อหน่วย</th>
                            <th>ราคารวม</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${product.product_name}</td>
                            <td>${quantity}</td>
                            <td>฿${product.price}</td>
                            <td>฿${total}</td>
                        </tr>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <!-- แสดงรายการสั่งซื้อจากหน้า Cart -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>ชื่อสินค้า</th>
                            <th>จำนวน</th>
                            <th>ราคาต่อหน่วย</th>
                            <th>ราคารวม</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td>${item.product.product_name}</td>
                                <td>${item.quantity}</td>
                                <td>฿${item.product.price}</td>
                                <td>฿${item.totalPrice}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>

        <div class="total-price">
            ยอดรวมทั้งหมด: ฿${total}
        </div>
    

        <!-- ฟอร์มกรอกที่อยู่ -->
        <div class="form-section">
            <h3>ที่อยู่สำหรับจัดส่ง</h3>
            <form action="confirmOrder" method="post">
                <input type="text" name="house_number" placeholder="บ้านเลขที่" required>
                <input type="text" name="building" placeholder="หมู่" required>
                <input type="text" name="sub_district" placeholder="ตำบล" required>
                <input type="text" name="district" placeholder="อำเภอ" required>
                <input type="text" name="province" placeholder="จังหวัด" required>
                <input type="email" name="emailA" placeholder="อีเมล" value="${receipt.email}" readonly>

                <h3>เลือกวิธีการชำระเงิน</h3>
                <select name="paymentMethod" required>
                    <option value="" disabled selected>เลือกวิธีการชำระเงิน</option>
                    <option value="Credit Card">บัตรเครดิต</option>
                    <option value="Bank Transfer">โอนเงินผ่านธนาคาร</option>
                    <option value="COD">เก็บเงินปลายทาง (COD)</option>
                </select>

                <div class="btn-container">
                    <button type="submit" class="btn">ชำระเงิน</button>
					<a href="${pageContext.request.contextPath}/cart" class="btn btn-cancel">ยกเลิก</a>         </div>
            </form>
        </div>
    </div>

</body>
</html>
