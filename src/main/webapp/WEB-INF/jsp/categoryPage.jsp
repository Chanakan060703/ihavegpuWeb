<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${selectedTypeName}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;700&display=swap" rel="stylesheet">
     <style>
     	body {
            font-family: 'Kanit', sans-serif;
            margin: 0;
   			padding: 0;
    		box-sizing: border-box;
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
    		justify-content: space-around;
    		align-items: center;
    		padding: 10px 20px;
    		background-color: #fff;
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
        .container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
        }
        .card {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            width: 250px;
            text-align: center;
            padding: 20px;
        }
        .card img {
            width: 100%;
            height: auto;
            margin-bottom: 15px;
        }
        .card h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }
        .card p {
            font-size: 14px;
            color: #555;
            margin: 5px 0;
        }
        .price {
            font-size: 20px;
            color: #e74c3c;
            margin: 10px 0;
        }
        .card button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .card button:hover {
            background-color: #2980b9;
        }
        .topic{
        	display: flex;
        	align-items: center;
        	justify-content: space-between;
        	width:80%;
        	margin-left:10rem;
        }
        .user-image {
    		width: 30px; 
    		height: 30px; 
    		border-radius: 50%; 
    		object-fit: cover;
    		border: 2px solid #4CAF50; 
		}
		.btn-view, .btn-add {
        display: inline-block;
        padding: 10px 20px;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        transition: background-color 0.3s, color 0.3s;
    }

    .btn-view {
    background-color: #e74c3c;
    color: #fff;
    border: none;
    cursor: pointer;
}
.btn-view:hover {
    background-color: #ff7667;
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
    <a href=""><i class="fa-solid fa-bag-shopping"></i></a>
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
</div>
<div class="dropdown">
        <div class="dropdown-toggle" onclick="toggleDropdown()">
            <i class="fas fa-th-large"></i> หมวดหมู่สินค้า
            <i class="fas fa-caret-down" style="margin-left: 8px;"></i>
        </div><br>
        <div id="dropdownMenu" class="dropdown-menu">
            <a href="#" class="selected"><i class="fa-solid fa-screwdriver-wrench"></i>จัดสเปคคอม</a>
            <c:forEach var="type" items="${productTypes}">
        		<a href="viewProductsByType?typeId=${type.type_id}" class="${selectedTypeId == type.type_id ? 'selected' : ''}" ><i class="${type.iconClass}"></i> ${type.type_name}
        	</a>
    		</c:forEach>
        </div>
    </div>

<div class="container">
    <c:choose>
        <c:when test="${not empty products}">
            <c:forEach var="product" items="${products}">
                <c:if test="${product.type != null && product.type.type_id == selectedTypeId}">
                    <div class="card">
                        <img src="${product.pic_product}" alt="${product.product_name}">
                        <h3>${product.product_name}</h3>
                        <p>${product.detail}</p>
                        <p>แบรนด์: ${product.brand}</p>
                        <p class="price">฿${product.price}</p>
                        <p>จำนวนที่เหลือ: 
                            <c:choose>
                                <c:when test="${product.product_qty > 0}">
                                    ${product.product_qty}
                                </c:when>
                                <c:otherwise>
                                    <span class="out-of-stock">หมด</span>
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <form action="addToCart" method="POST">
    <input type="hidden" name="productId" value="${product.product_id}" />
    <input type="hidden" name="redirectUrl" value="allProducts" />
    <input type="hidden" name="quantity" value="1" min="1" max="${product.product_qty}" />
    <button type="submit" class="cart-btn" ${product.product_qty == 0 ? 'disabled' : ''}>เพิ่มในรถเข็น</button>
</form>
                    </div>
                </c:if>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>ไม่พบสินค้าในประเภทนี้</p>
        </c:otherwise>
    </c:choose>
</div>
</div>
</body>
</html>