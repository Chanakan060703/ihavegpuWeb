<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>สเปคที่บันทึกไว้</title>
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
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
        }
        .spec-group {
            background-color: #fff;
            margin-bottom: 20px;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
        }
        .spec-group:hover {
            background-color: #f1f1f1;
        }
        .spec-details {
            flex-grow: 1;
        }
        .spec-name {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin: 0;
        }
        .product-list {
            font-size: 14px;
            color: #555;
            margin-top: 5px;
            white-space: normal;
            overflow-wrap: break-word;
            word-wrap: break-word;
        }
        .button-group {
            display: flex;
            gap: 10px;
        }
        .view-details-btn, .delete-btn {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            color: #fff;
        }
        .view-details-btn {
            background-color: #4CAF50;
        }
        .view-details-btn:hover {
            background-color: #45a049;
        }
        .delete-btn {
            background-color: #dc3545;
        }
        .delete-btn:hover {
            background-color: #c82333;
        }
                .user-image {
    		width: 30px; 
    		height: 30px; 
    		border-radius: 50%; 
    		object-fit: cover;
    		border: 2px solid #4CAF50; 
		}
		.back-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
    margin-bottom:2rem;
}

.back-button:hover {
    background-color: #45a049;
}
		
    </style>
    <script>
        function deleteSpec(groupId) {
            if (confirm("คุณแน่ใจหรือไม่ว่าต้องการลบสเปคนี้?")) {
                window.location.href = "deleteSpec?groupId=" + groupId;
            }
        }
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
    <div class="menu-item"><a href="${pageContext.request.contextPath}/savedSpec">สเปคคอมที่จัดตอนนี้</a></div>
    <div class="menu-item"><a href="newsPage">ข่าวสาร</a></div>
    <div class="menu-item"><a href="contact">ติดต่อเรา</a></div>
    <c:if test="${not empty sessionScope.loggedInUser && sessionScope.loggedInUser.email == 'Chanakan@gmail.com'}">
    <div class="menu-item"><a href="${pageContext.request.contextPath}/viewMessages">ข้อความติดต่อ</a></div>
	</c:if>
</div>
    <div class="container">
        <h2>สเปคที่บันทึกไว้</h2>
        <a href="home" class="back-button"><i class="fa-solid fa-arrow-left"></i>กลับไปหน้าแรก</a>


        <c:if test="${empty savedSpecGroups}">
            <p>ไม่มีสเปคที่บันทึกไว้</p>
        </c:if>

        <c:forEach var="specGroup" items="${savedSpecGroups}" varStatus="status">
            <div class="spec-group" onclick="window.location.href='detailSaveSpec?groupId=${specGroup.groupId}'">
                <div class="spec-details">
                    <p class="spec-name">สเปคที่ ${status.index + 1}</p> 
                    <div class="product-list">
                        <c:forEach var="cartItem" items="${specGroup.cartItems}" varStatus="productStatus">
                            ${cartItem.product.product_name}<c:if test="${!productStatus.last}"> || </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="button-group">
                    <button class="delete-btn" onclick="event.stopPropagation(); deleteSpec(${specGroup.groupId});">ลบ</button>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
