<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ตะกร้าสินค้า</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Kanit', sans-serif;
            margin: 0;
   			padding: 0;
    		box-sizing: border-box;
    		background-repeat: no-repeat;
    		background-size: cover;
    		background-image: url('https://64.media.tumblr.com/4e0e28821627a1e566134edef9b0b20b/tumblr_ocmlpt9P0p1vewhn8o2_500.gifv');
        }
        .nav{
        	display: flex;
        	justify-content: space-between;
        	background-color:black;
        	padding-left:1rem;
        	padding-right:1rem;
        	color:#fff;
        	font-size:12px;
        }
        .contact{
        	display: flex;
        	
        }
        .contact i {
        	margin-right:0.5rem;
        }
        .contact p{
        	margin-right:0.5rem;
        }
        
		.logshop {
			margin-top:0.5rem;
			margin-right:0.5rem;
    		display: flex;
   			justify-content: center;
    		align-items: center;
    		gap: 15px;
    		height: 100%;
		}


		.logshop a {
    		color: #fff;
    		font-size: 20px;
    		text-decoration: none;
    		transition: color 0.3s, transform 0.3s;
		}


		.logshop a:hover {
    		color: #f0f0f0;
    		transform: scale(1.1);
		}
        
        .mainhead {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            background-color: #fff;
        }
        
        .mainhead img {
            height: 50px;
            margin-right: 20px;
        }
        
        .search-bar {
            flex-grow: 1;
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 50px;
            padding: 5px 15px;
        }
        
        .search-bar input {
            border: none;
            outline: none;
            width: 100%;
        }
        
        .search-bar .fa-search {
            margin-right: 10px;
        }
        
        .menu-item {
    		margin: 0 15px;
    		position: relative;
		}

		.menu-item a {
    		color: #333;
    		text-decoration: none;
    		padding: 8px 12px;
    		border-radius: 5px;
    		font-weight: bold;
    		transition: background-color 0.3s, color 0.3s;
		}

		.menu-item a:hover {
    		background-color: #f0f0f0;
    		color: #d32f2f;
		}


		.mainhead {
    	display: flex;
        align-items: center;
        padding: 10px 20px;
        background-color: #fff;
        position: sticky;
        top: 0;
        z-index: 1000;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		}


			.menu-item .active a {
    		border-bottom: 2px solid #d32f2f;
   			padding-bottom: 6px;
		}
        .container {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }
        .table th, .table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        .product-image {
            width: 80px;
            border-radius: 8px;
        }
        .total-price {
            text-align: right;
            margin: 20px 0;
            font-size: 18px;
            color: #333;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            color: #fff;
        }
        .btn-update {
            background-color: #28a745;
        }
        .btn-checkout {
            background-color: #007bff;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .btn-container {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }
        .btn-container .btn {
            flex: 1;
            text-align: center;
        }
        .user-image {
    		width: 30px; 
    		height: 30px; 
    		border-radius: 50%; 
    		object-fit: cover;
    		border: 2px solid #4CAF50; 
		}
    </style>
    <script>
        function removeFromCart(productId) {
            const form = document.createElement("form");
            form.method = "POST";
            form.action = "removeFromCart";

            const productIdField = document.createElement("input");
            productIdField.type = "hidden";
            productIdField.name = "productId";
            productIdField.value = productId;
            form.appendChild(productIdField);

            const redirectUrlField = document.createElement("input");
            redirectUrlField.type = "hidden";
            redirectUrlField.name = "redirectUrl";
            redirectUrlField.value = "cart";
            form.appendChild(redirectUrlField);

            document.body.appendChild(form);
            form.submit();
        }
        
        function removeFromCart(productId) {
            console.log("Removing product with ID: " + productId); 
            const form = document.createElement("form");
            form.method = "POST";
            form.action = "removeFromCart";

            const productIdField = document.createElement("input");
            productIdField.type = "hidden";
            productIdField.name = "productId";
            productIdField.value = productId;
            form.appendChild(productIdField);

            const redirectUrlField = document.createElement("input");
            redirectUrlField.type = "hidden";
            redirectUrlField.name = "redirectUrl";
            redirectUrlField.value = "cart";
            form.appendChild(redirectUrlField);

            document.body.appendChild(form);
            form.submit();
        }

        document.querySelector(".btn-checkout").addEventListener("click", function() {
            console.log("Checkout button clicked");
        });
    </script>
</head>
<body>
		<div class="nav">
		<div class="contact">
			<p><i class="fa-solid fa-phone"></i>085 801 6787</p>
			<p><i class="fa-solid fa-envelope"></i>info@ihavegpu.com</p>
			<p>IHAVEGPUถ้าคุณชอบคอมพิวเตอร์เราคือเพื่อนกัน</p>
		</div>
		<div class="logshop">
    <c:choose>
        <c:when test="${not empty sessionScope.loggedInUser}">
            <a href="editProfile">
                <img src="${sessionScope.loggedInUser.imageUrl}" alt="User" class="user-image">
            </a>
        </c:when>
        <c:otherwise>
            <a href="open_register">
                <i class="fa-solid fa-user"></i>
            </a>
        </c:otherwise>
    </c:choose>
    <a href="cart"><i class="fa-solid fa-bag-shopping"></i></a>
</div>
	</div>
	
<div class="mainhead">
    <a href="home"><img src="assets/logo.jpg" ></a>
    <form name="frm1" action="searchProduct" method="post">
    <div class="search-bar">
        <i class="fas fa-search"></i>
        <input type="text" name="keyword" placeholder="ค้นหาสินค้า">
    </div>
    <br>
	<font color="red" >${error_msg }</font>
    </form>
	<div class="menu-item active"><a href="home">หน้าแรก</a></div>
    <div class="menu-item"><a href="specProduct">จัดสเปกคอม</a></div>
    <div class="menu-item"><a href="savedSpec">สเปคคอมที่จัดตอนนี้</a></div>
    <div class="menu-item"><a href="newsPage">ข่าวสาร</a></div>
    <div class="menu-item"><a href="#">ติดต่อเรา</a></div>
    <c:if test="${not empty sessionScope.loggedInUser && sessionScope.loggedInUser.email == 'Chanakan@gmail.com'}">
    <div class="menu-item"><a href="${pageContext.request.contextPath}/viewMessages">ข้อความติดต่อ</a></div>
	</c:if>
</div>
    <div class="container">
        <h2>ตะกร้าสินค้าของคุณ</h2>
        	    <div class="menu-item"><a href="${pageContext.request.contextPath}/receipt/Open_orderHistory" class="btn">ประวัติการสั่งซื้อ</a></div>
        <c:if test="${not empty errorMessages}">
            <div class="error-message">
                <ul>
                    <c:forEach var="error" items="${errorMessages}">
                        <li>${error}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <c:if test="${not empty cartItems}">
            <form action="updateCart" method="post">
                <table class="table">
                    <thead>
                        <tr>
                            <th>รูปสินค้า</th>
                            <th>ชื่อสินค้า</th>
                            <th>จำนวน</th>
                            <th>ราคา/ชิ้น</th>
                            <th>ลบ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td><img src="${item.product.pic_product}" alt="${item.product.product_name}" class="product-image"></td>
                                <td>${item.product.product_name}</td>
                                <td>
                                    <input type="number" name="quantities" value="${item.quantity}" min="1" style="width: 60px;">
                                    <input type="hidden" name="productIds" value="${item.product.product_id}">
                                </td>
                                <td>฿${item.totalPrice}</td>
                                <td>
                                    <button type="button" class="btn btn-delete" onclick="removeFromCart(${item.product.product_id})">ลบ</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="total-price">ยอดรวมทั้งหมด: ฿${totalPrice}</div>
                <div class="text-center btn-container">
                    <a href="home" class="btn btn-checkout">เลือกซื้อสินค้าเพิ่มเติม</a>
                    <button type="submit" class="btn btn-update">อัปเดตจำนวนสินค้า</button>
                    <c:choose>
    					<c:when test="${not empty loggedInUser}">
        					<a href="${pageContext.request.contextPath}/receipt/checkout" class="btn btn-checkout">ไปยังหน้าชำระเงิน</a>
    					</c:when>
    				<c:otherwise>
        					<a href="${pageContext.request.contextPath}/login" class="btn btn-checkout" onclick="alert('กรุณาเข้าสู่ระบบก่อน');">ไปยังหน้าชำระเงิน</a>
    				</c:otherwise>
				</c:choose>
                </div>
            </form>
        </c:if>

        <c:if test="${empty cartItems}">
            <p class="text-center">ตะกร้าของคุณว่างเปล่า</p>
            <div class="text-center">
                <a href="home" class="btn btn-checkout">เลือกซื้อสินค้าเพิ่มเติม</a>
            </div>
        </c:if>
    </div>
</body>
</html>
