<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>ประวัติการสั่งซื้อ</title>
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
        	background-color: white;
            width: 80%;
            margin: 2rem auto;
            font-family: 'Arial', sans-serif;
            padding:1rem;
            border-radius: 5px;	 
        }
        
        h2 {
            text-align: center;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .table th, .table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            display: inline-block;
        }
        .btn-delete {
            background-color: #dc3545;
            margin-left: 5px;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        .btn-clear {
            background-color: #dc3545;
            display: block;
            width: fit-content;
            margin: 0 auto 20px;
            padding: 10px 20px;
        }
        .btn-clear:hover {
            background-color: #c82333;
        }
        .user-image {
    		width: 30px; 
    		height: 30px; 
    		border-radius: 50%; 
    		object-fit: cover;
    		border: 2px solid #4CAF50; 
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
            <a href="${pageContext.request.contextPath}/editProfile">
                <img src="${sessionScope.loggedInUser.imageUrl}" alt="User" class="user-image">
            </a>
        </c:when>
        <c:otherwise>
            <a href="open_register">
                <i class="fa-solid fa-user"></i>
            </a>
        </c:otherwise>
    </c:choose>
    <a href="${pageContext.request.contextPath}/cart"><i class="fa-solid fa-bag-shopping"></i></a>
</div>
	</div>
	
<div class="mainhead">
    <a href="home"><img src="${pageContext.request.contextPath}/assets/logo.jpg"></a>
    <form name="frm1" action="searchProduct" method="post">
    <div class="search-bar">
        <i class="fas fa-search"></i>
        <input type="text" name="keyword" placeholder="ค้นหาสินค้า">
    </div>
    <br>
	<font color="red" >${error_msg }</font>
    </form>
	<div class="menu-item active"><a href="${pageContext.request.contextPath}/home">หน้าแรก</a></div>
    <div class="menu-item"><a href="${pageContext.request.contextPath}/specProduct">จัดสเปกคอม</a></div>
    <div class="menu-item"><a href="${pageContext.request.contextPath}/savedSpec">สเปคคอมที่จัดตอนนี้</a></div>
    <div class="menu-item"><a href="${pageContext.request.contextPath}/newsPage">ข่าวสาร</a></div>
    <div class="menu-item"><a href="${pageContext.request.contextPath}/contact">ติดต่อเรา</a></div>
    <c:if test="${not empty sessionScope.loggedInUser && sessionScope.loggedInUser.email == 'Chanakan@gmail.com'}">
    <div class="menu-item"><a href="${pageContext.request.contextPath}/viewMessages">ข้อความติดต่อ</a></div>
	</c:if>
</div>

    <div class="container">
        <h2>ประวัติการสั่งซื้อ</h2>

        <c:if test="${not empty orderHistory}">         
            <table class="table">
                <thead>
                    <tr>
                        <th>วันที่</th>
                        <th>ยอดรวม</th>
                        <th>สถานะ</th>
                        <th>จัดการ</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="receipt" items="${orderHistory}">
                        <tr>
                            <td>${receipt.date}</td>
                            <td>฿${receipt.total}</td>
                            <td>ชำระเงินแล้ว</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/receipt/viewOrderDetail?receiptId=${receipt.reciept_id}" class="btn">ดูรายละเอียด</a>
                                <a href="${pageContext.request.contextPath}/receipt/deleteOrder?receiptId=${receipt.reciept_id}" class="btn btn-delete" onclick="return confirm('คุณต้องการลบคำสั่งซื้อนี้หรือไม่?');">ลบ</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty orderHistory}">
            <p class="text-center">ไม่มีประวัติการสั่งซื้อ</p>
        </c:if>

        <div class="text-center">
            <a href="${pageContext.request.contextPath}/home" class="btn">กลับไปที่หน้าแรก</a>
        </div>
    </div>
</body>
</html>
