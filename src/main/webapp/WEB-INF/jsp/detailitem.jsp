<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
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

        .dropdown {
            position: relative;
            display: inline-block;
            padding-left:3rem;
        }

        .dropdown-toggle {
            cursor: pointer;
            background-color: #f8f8f8;
            padding: 10px;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }


        .dropdown-menu {
            display: none;
            position: absolute;
            background-color: #fff;
            min-width: 200px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            border-radius: 5px;
            overflow: hidden;
            top: 100%;
            left: 0;
        }

        .dropdown-menu a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .dropdown-menu a:hover {
            background-color: #f1f1f1;
        }

        .dropdown-menu .selected {
            background-color: #ffdddd;
        }

        .show {
            display: block;
            margin-left:3rem;
        }
        .product-container {
            display: flex;
            gap: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            padding: 20px;
        }
        .product-image {
            flex: 1;
            max-width: 300px;
        }
        .product-image img {
            width: 100%;
            border-radius: 8px;
        }
        .product-details {
            flex: 2;
        }
        .product-details h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .price {
            font-size: 28px;
            color: #e74c3c;
            margin: 15px 0;
        }
        .stock-status {
            background-color: #d4edda;
            color: #155724;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
            margin-bottom: 10px;
        }
        .quantity {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 20px 0;
        }
        .quantity input {
            text-align: center;
            width: 50px;
            height: 30px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .quantity button {
            background: #e74c3c;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
        }
        .actions {
            display: flex;
            gap: 10px;
        }
        .actions button, .actions a {
            background: #e74c3c;
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
            border: none;
            cursor: pointer;
        }
        .actions .add-to-cart {
            background: #fff;
            color: #e74c3c;
            border: 1px solid #e74c3c;
        }
        .add-to-cart,
    .buy-now {
        background: #e74c3c;
        color: #fff;
        text-decoration: none;
        padding: 10px 20px;
        border-radius: 5px;
        text-align: center;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .add-to-cart:hover,
    .buy-now:hover {
        background-color: #c0392b;
    }

    .add-to-cart:disabled,
    .buy-now:disabled {
        background-color: #ddd;
        color: #888;
        cursor: not-allowed;
        border: 1px solid #ccc;
    }
    
    .user-image {
    		width: 30px; 
    		height: 30px; 
    		border-radius: 50%; 
    		object-fit: cover;
    		border: 2px solid #4CAF50; 
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
    </style>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        function toggleDropdown() {
            var dropdown = document.getElementById("dropdownMenu");
            dropdown.classList.toggle("show");
        }

        document.querySelector(".dropdown-toggle").addEventListener("click", function(event) {
            event.stopPropagation(); 
            toggleDropdown();
        });

        document.addEventListener("click", function() {
            var dropdown = document.getElementById("dropdownMenu");
            if (dropdown.classList.contains("show")) {
                dropdown.classList.remove("show");
            }
        });
    });
        
        function buyNow(productId) {
            const qty = document.getElementById("quantity").value;

            // สร้างฟอร์มสำหรับส่ง request แบบ POST
            const form = document.createElement("form");
            form.method = "POST";
            form.action = "${pageContext.request.contextPath}/receipt/checkouts";

            // เพิ่ม input สำหรับ productId และ quantity
            const productIdField = document.createElement("input");
            productIdField.type = "hidden";
            productIdField.name = "productId";
            productIdField.value = productId;
            form.appendChild(productIdField);

            const quantityField = document.createElement("input");
            quantityField.type = "hidden";
            quantityField.name = "quantity";
            quantityField.value = qty;
            form.appendChild(quantityField);

            document.body.appendChild(form);
            form.submit();  // ส่ง form แบบ POST
        }
        
        function decreaseQuantity() {
            let qty = document.getElementById("quantity");
            if (qty.value > 1) qty.value--;
        }

        function increaseQuantity() {
            let qty = document.getElementById("quantity");
            qty.value++;
        }
        
        setTimeout(function() {
            const successMessage = document.getElementById("successMessage");
            const errorMessage = document.getElementById("errorMessage");
            if (successMessage) successMessage.style.display = "none";
            if (errorMessage) errorMessage.style.display = "none";
        }, 2000);
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
    <div class="search-bar">
        <i class="fas fa-search"></i>
        <input type="text" placeholder="ค้นหาสินค้า">
    </div>
    <div class="menu-item active"><a href="home">หน้าแรก</a></div>
    <div class="menu-item"><a href="specProduct">จัดสเปกคอม</a></div>
    <div class="menu-item"><a href="savedSpec">สเปคคอมที่จัดตอนนี้</a></div>
    <div class="menu-item"><a href="newsPage">ข่าวสาร</a></div>
    <div class="menu-item"><a href="contact">ติดต่อเรา</a></div>
</div>
<div class="dropdown">
        <div class="dropdown-toggle" onclick="toggleDropdown()">
            <i class="fas fa-th-large"></i> หมวดหมู่สินค้า
            <i class="fas fa-caret-down" style="margin-left: 8px;"></i>
        </div><br>
        <div id="dropdownMenu" class="dropdown-menu">
            <a href="specProduct" class="selected"><i class="fa-solid fa-screwdriver-wrench"></i>จัดสเปคคอม</a>
            <c:forEach var="type" items="${productTypes}">
        		<a href="viewProductsByType?typeId=${type.type_id}" class="${selectedTypeId == type.type_id ? 'selected' : ''}" ><i class="${type.iconClass}"></i> ${type.type_name}
        	</a>
    		</c:forEach>
        </div>
    </div>
    
         <form action="addToCart" method="post">
   <div class="product-container">
        <div class="product-image">
            <img src="${product.pic_product}" alt="${product.product_name}">
        </div>
        <div class="product-details">
            <h2>${product.product_name}</h2>
            <p>แบรนด์: ${product.brand} | รหัสสินค้า: SKU-${product.product_id}</p>
            <p>รายละเอียด: ${product.detail}</p>
            <p class="price">฿${product.price}</p>
            <p>จำนวนที่เหลือ: ${product.product_qty}</p>

            
                <div class="quantity">
    				<button type="button" onclick="decreaseQuantity()">-</button>
    				<input type="number" id="quantity" name="quantity" value="1" min="1" ">
    				<button type="button" onclick="increaseQuantity(${product.product_qty})">+</button>
				</div>

                
                <div class="actions">
                <form action="addToCart" method="POST">
    				<input type="hidden" name="productId" value="${product.product_id}" />
    				<input type="hidden" name="redirectUrl" value="detailProduct?productId=${product.product_id}" />
    				<button type="submit" class="add-to-cart" onclick="addtocatr(${product.product_id})" 
                        ${product.product_qty == 0 ? 'disabled' : ''}>เพิ่มในตะกร้า</button>
				</form>
        			
                    <button type="button" class="buy-now" onclick="buyNow(${product.product_id})" 
                    ${product.product_qty == 0 ? 'disabled' : ''}>ซื้อเลย</button>

                </div>
                <c:if test="${not empty param.success}">
    				<p id="successMessage" style="color: green;">${param.success}</p>
				</c:if>

				<c:if test="${not empty param.error}">
    				<p  id="errorMessage" style="color: red;">${param.error}</p>
				</c:if>

        
        </div>
    </div> 
</form>
</body>
</html>