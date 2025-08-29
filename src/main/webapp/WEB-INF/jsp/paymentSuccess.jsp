<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>การชำระเงินสำเร็จ</title>
    <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
            background-color: #e8f5e9;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .success-message {
            font-size: 20px;
            color: #4caf50;
            font-weight: bold;
        }
        .btn {
            padding: 10px 20px;
            margin: 10px 5px;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-home {
            background-color: #4caf50;
        }
        .btn-home:hover {
            background-color: #388e3c;
        }
    </style>
    <script>
        function printReceipt() {
            window.print();
        }
        function goToHome() {
            window.location.href = '${pageContext.request.contextPath}/home';
        }
    </script>
</head>
<body>
    <div class="container">
        <p class="success-message">การชำระเงินสำเร็จ!</p>
        <p>ขอบคุณสำหรับการสั่งซื้อของคุณ</p>
        <p>ยอดรวม: ฿${total}</p>
        <p>ที่อยู่จัดส่ง: ${address.house_number}, ${address.building}, ${address.sub_district}, ${address.district}, ${address.province}</p>
        <p>วิธีการชำระเงิน: ${paymentMethod}</p>

   
        <button class="btn btn-home" onclick="goToHome()">ออกไปหน้าแรก</button>
    </div>
</body>
</html>
