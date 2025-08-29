<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>จัดสเปกคอม</title>
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


        /* Sidebar Styles */
        .container {
            display: flex;
            margin: 20px auto;
            max-width: 1200px;
            gap: 20px;
        }

        .sidebar {
            width: 25%;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .sidebar h3 {
            color: #333;
            margin-bottom: 15px;
        }

       

        /* Cart Sidebar */
        .cart-sidebar {
            border-top: 1px solid #ccc;
            padding-top: 15px;
            margin-top: 20px;
        }

        .cart-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 15px;
    padding: 10px;
    background-color: #f8f8f8;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.cart-item img {
    width: 50px;
    height: 50px;
    margin-right: 15px;
    border-radius: 5px;
}

.cart-item-details {
    flex-grow: 1;
    margin-left: 10px;
}

.cart-item-title {
    font-size: 16px;
    font-weight: bold;
    margin: 0;
}

.cart-item-price,
.qty {
    font-size: 14px;
    color: #666;
    margin: 5px 0;
}

.remove-item {
    background-color: #e74c3c;
    color: white;
    border: none;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
    display: flex;
    align-items: center;
    justify-content: center;
}

.remove-item:hover {
    background-color: #c0392b;
}
		
		 /* ปุ่ม Checkout Styling */
    .checkout-btn {
        display: inline-block;
        width: 85%;
        padding: 10px 20px;
        background-color: #e74c3c; /* สีแดงสด */
        color: #fff;
        font-size: 18px;
        font-weight: bold;
        text-align: center;
        border: none;
        border-radius: 8px;
        text-decoration: none;
        cursor: pointer;
        transition: background-color 0.3s, box-shadow 0.3s, transform 0.2s;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        margin-top: 1rem;
    }

    .checkout-btn:hover {
        background-color: #c0392b; /* สีแดงเข้มขึ้นเมื่อ hover */
        box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        transform: scale(1.03); /* ขยายขนาดเล็กน้อยเมื่อ hover */
    }

    .checkout-btn:focus {
        outline: none;
        box-shadow: 0 0 0 3px rgba(231, 76, 60, 0.5); 
    }

    /* Active Effect */
    .checkout-btn:active {
        background-color: #a93226; 
        box-shadow: 0 3px 5px rgba(0, 0, 0, 0.2);
        transform: scale(0.98); 
    }


        .save-spec-btn {
            width: 100%;
            padding: 10px;
            background-color: #27ae60;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            transition: background-color 0.3s;
        }

     

        .save-spec-btn:hover {
            background-color: #219150;
        }

      

        /* Product List Styles */
        .content {
            width: 75%;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .product-list {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

.product-card {
    width: 220px; /* ขนาดการ์ดที่เล็กลง */
    background-color: #ffffff;
    padding: 10px;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    text-align: center;
    position: relative;
}

.product-card img {
    max-width: 100%;
    height: auto;
    margin-bottom: 10px;
    border-radius: 5px;
}

.product-card .product-name {
    font-size: 14px;
    font-weight: bold;
    color: #333;
    margin-bottom: 5px;
}

.product-card .product-price {
    color: #e74c3c;
    font-size: 14px;
    font-weight: bold;
    margin-bottom: 15px;
}

.btn-add {
    display: inline-flex;
    align-items: center;
    padding: 5px 10px;
    background-color: #ff3d00;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}

.btn-add i {
    margin-left: 5px;
    font-size: 16px;
}

.btn-add:hover {
    background-color: #cc3200;
}
        .type-product {
    display: flex;
    align-items: center;
    padding: 10px 15px;
    width: 100%;
    background-color: #f8f9fc;
    color: #333;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    text-align: left;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}

.type-product-container {
    display: flex;
    flex-wrap: wrap; /* ทำให้ปุ่มขึ้นบรรทัดใหม่เมื่อพื้นที่ไม่พอ */
    gap: 10px;
    margin-bottom: 20px;
}

.type-product {
    width: 150px; /* ขยายความกว้างของปุ่ม */
    display: flex;
    align-items: center;
    justify-content: center; /* จัดข้อความและไอคอนให้อยู่ตรงกลาง */
    padding: 10px 15px; /* เพิ่ม padding ให้ปุ่มใหญ่ขึ้น */
    background-color: #f8f9fc;
    color: #333;
    font-size: 16px; /* เพิ่มขนาดตัวอักษร */
    font-weight: bold;
    border: none;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}

.type-product i {
    font-size: 18px; /* ขยายขนาดไอคอน */
    margin-right: 8px;
    color: #333;
}

.type-product:hover {
    background-color: #e2e6ea;
    transform: scale(1.03);
}


.user-image {
    		width: 30px; 
    		height: 30px; 
    		border-radius: 50%; 
    		object-fit: cover;
    		border: 2px solid #4CAF50; 
		}
		.search-filter {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 20px;
}

.search-bar {
    display: flex;
    align-items: center;
    border: 1px solid #ccc;
    border-radius: 50px;
    padding: 5px 15px;
    flex-grow: 1;
}

.price-filter {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 5px 10px;
    font-size: 14px;
    background-color: #fff;
    cursor: pointer;
}
.qty {
    font-size: 14px;
    color: #666;
}

.out-of-stock {
    color: #e74c3c;
    font-weight: bold;
}

.btn-add:disabled {
    background-color: #ccc;
    color: #666;
    cursor: not-allowed;
}
.sort-dropdown {
    padding: 10px;
    font-size: 16px;
    border: 2px solid #4CAF50; /* สีขอบ */
    border-radius: 5px; /* มุมโค้งมน */
    background-color: white;
    color: #333;
    cursor: pointer;
    appearance: none; /* ซ่อนลูกศรของเบราว์เซอร์ */
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%234CAF50"><path d="M7 10l5 5 5-5z"/></svg>');
    background-repeat: no-repeat;
    background-position: right 10px center;
    background-size: 15px;
}

.sort-dropdown option {
    color: #333;
    background-color: white;
    padding: 10px;
}

    </style>
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
    <div class="menu-item"><a href="contact">ติดต่อเรา</a></div>
    <c:if test="${not empty sessionScope.loggedInUser && sessionScope.loggedInUser.email == 'Chanakan@gmail.com'}">
    <div class="menu-item"><a href="${pageContext.request.contextPath}/viewMessages">ข้อความติดต่อ</a></div>
	</c:if>
</div>

   <div class="container">
       <div class="sidebar">
    <div class="cart-sidebar">
        <h3>สินค้า</h3>
        <c:if test="${not empty cartItems}">
            <c:forEach var="item" items="${cartItems}">
                <div class="cart-item">
                    <img src="${item.product.pic_product}" alt="${item.product.product_name}">
                    <div class="cart-item-details">
                        <p class="cart-item-title">${item.product.product_name}</p>
                        <p class="cart-item-price">฿${item.getTotalPrice()}</p>
                        <p class="qty">จำนวนที่สั่งซื้อ: ${item.quantity}</p> 
                    </div>
                    <form name="cartForm" action="removeFromCart" method="post" style="display:inline;">
    					<input type="hidden" name="productId" value="${item.product.product_id}">
    					<input type="hidden" name="redirectUrl" value="specProduct"> 
    					<button type="submit" class="remove-item"><i class="fas fa-trash-alt"></i></button>
					</form>
                </div>
            </c:forEach>
            <h4>${totalPrice}</h4>
            <form action="saveSpec" method="POST">
    <button type="submit" class="save-spec-btn">บันทึกสเปค</button>
</form>
            <a href="${pageContext.request.contextPath}/receipt/checkout" class="checkout-btn">สั่งซื้อ</a>
        </c:if>
        <c:if test="${empty cartItems}">
            <p>ไม่มีสินค้าในตะกร้า</p>
        </c:if>
    </div>
</div>
				
    
        <div class="content">
        <div class="search-filter">
        <form name="frm1" action="searchProductSpec" method="post">
    			<div class="search-bar">
        		<i class="fas fa-search"></i>
        		<input type="text" name="keyword" placeholder="ค้นหาสินค้า">
    		</div>
		</form>        
		<form action="specProduct" method="get">  
    		<input type="hidden" name="typeId" value="${selectedTypeId}">
    		<select name="sortOrder" class="sort-dropdown" onchange="this.form.submit()">
    			<option value="" disabled selected>เรียงตามราคา</option>
    			<option value="low-to-high" ${sortOrder == 'low-to-high' ? 'selected' : ''}>ราคาต่ำ-สูง</option>
    			<option value="high-to-low" ${sortOrder == 'high-to-low' ? 'selected' : ''}>ราคาสูง-ต่ำ</option>
			</select>

		</form>
    </div>
    		<font color="red" >${error_msgs}</font>
    
    		<div class="type-product-container">
            <c:forEach var="type" items="${productTypes}">
                <form action="specProduct" method="get" style="margin-bottom: 10px;">
                    <input type="hidden" name="typeId" value="${type.type_id}">
                    <button type="submit" class="type-product">
                        <i class="${type.iconClass}"></i>${type.type_name}
                    </button>
                </form>
            </c:forEach>
        </div>
            
            <h2 style="text-align: center; color: #333;">จัดสเปกคอม</h2>
            <div class="product-list">
                <c:forEach var="product" items="${listProduct}">
                    <div class="product-card">
                        <img src="${product.pic_product}" alt="${product.product_name}">
                        <h3 class="product-name">${product.product_name}</h3>
                        <p>${product.detail}</p>
                        <p class="product-price">฿${product.price}</p>
                        
                        <p class="qty">จำนวนที่เหลือ:
    								<c:choose>
        								<c:when test="${product.product_qty > 0}">
            								${product.product_qty}
        								</c:when>
        								<c:otherwise>
            								<span class="out-of-stock">หมด</span>
        								</c:otherwise>
    								</c:choose>
								</p>
                        <form action="addToCart" method="post">
                            <input type="hidden" name="productId" value="${product.product_id}">
                            <input type="hidden" name="quantity" value="1">
                            <input type="hidden" name="redirectUrl" value="specProduct">
                            <button type="submit" class="btn-add" ${product.product_qty == 0 ? 'disabled' : ''}>เพิ่ม<i class="fas fa-plus"></i></button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
