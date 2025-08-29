<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>News</title>
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
        .contact {
            display: flex;
        }
        .contact i, .contact p {
            margin-right: 0.5rem;
        }
        .logshop {
            display: flex;
            gap: 15px;
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
            justify-content: space-around;
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
        .add-news-container {
            text-align: right;
            margin: 20px;
        }
        .add-news-button {
        	background-color: #d32f2f; 
        	color: white;
        	padding: 10px 20px;
        	text-decoration: none;
        	border-radius: 5px;
        	font-size: 16px;
        	display: inline-block;
        	transition: background-color 0.3s, transform 0.3s;
    	}
        .add-news-button i {
            margin-right: 5px;
        }
        .add-news-button:hover {
        	background-color: #b71c1c; 
        	transform: scale(1.05);
    	}

        .news-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin: 20px;
        }
        .news-card-form {
            width: 30%;
            margin: 10px;
        }
        .news-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transition: transform 0.3s;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .news-card:hover {
            transform: scale(1.05);
        }
        .news-card img {
    		width: 100%;
    		height: 350px; 
    		object-fit: cover; 
    		border-radius: 8px;
}
        .news-content {
            padding: 15px;
        }
        .news-title {
            font-size: 18px;
            font-weight: bold;
        }
        .news-description, .news-date {
            margin-top: 10px;
            color: #666;
        }
        .news-actions {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
        }
        
        .btn-edit {
        	background-color: #388e3c; 
        	color: white;
        	padding: 10px 15px;
        	border-radius: 5px;
        	border: none;
        	font-size: 14px;
        	text-decoration: none;
        	cursor: pointer;
        	transition: background-color 0.3s, transform 0.3s;
    	}
    
        .btn-edit {
            background-color: #4CAF50;
            
        }
        .btn-edit:hover {
        	background-color: #2e7d32; 
        	transform: scale(1.05);
    	}
    	
    	.delete-news-link {
        	background-color: #d32f2f; 
        	color: white;
        	padding: 10px 15px;
        	border-radius: 5px;
        	font-size: 14px;
        	text-decoration: none;
        	cursor: pointer;
        	transition: background-color 0.3s, transform 0.3s;
    	}
    	.delete-news-link:hover {
        	background-color: #b71c1c; 
        	transform: scale(1.05);
    	}
        .delete-news-link {
            background-color: #ff4d4d;
        }
        
        
        .btn-view-news {
        display: flex;
    	align-items: center;
    	justify-content: center;
    	width: 30%;
    	margin: auto;
    	background-color: #3498db;
    	color: white;
    	padding: 10px 15px;
    	border-radius: 5px;
    	font-size: 14px;
    	text-decoration: none;
    	cursor: pointer;
    	transition: background-color 0.3s, transform 0.3s;
    	border: none; 
    	}
    	
    	.btn-view-news:hover {
        	background-color: #2980b9;
        	transform: scale(1.05);
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
</head>
<body>
    <div class="nav">
        <div class="contact">
            <p><i class="fa-solid fa-phone"></i>085 801 6787</p>
            <p><i class="fa-solid fa-envelope"></i>info@ihavegpu.com</p>
            <p>IHAVEGPU ถ้าคุณชอบคอมพิวเตอร์เราคือเพื่อนกัน</p>
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
        <a href="home"><img src="assets/logo.jpg"></a>
        <form name="frm1" action="searchNews" method="post">
            <div class="search-bar">
                <i class="fas fa-search"></i>
                <input type="text" name="keyword" placeholder="ค้นหาสินค้า">
            </div>
            <br>
            <font color="red">${error_msg}</font>
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

    <div class="add-news-container">
        <c:if test="${isAdmin}">
            <a href="OpenAddNew" class="add-news-button">
                <i class="fas fa-plus"></i> เพิ่มข่าวใหม่
            </a>
        </c:if>
    </div>
	
    <div class="news-container">
        <c:forEach items="${listNew}" var="news">
            <form action="editNews" method="post" class="news-card-form">
                <div class="news-card">
                    <input type="hidden" name="newsId" value="${news.new_id}">
                    <a href="viewNews?newsId=${news.new_id}"><img src="${news.new_pic}" alt="${news.new_name}"></a>
                    <div class="news-content">
                        <div class="news-title">${news.new_name}</div>
                        <div class="news-description">
    						<c:choose>
        						<c:when test="${fn:length(news.new_detail) > 200}">
            						${fn:substring(news.new_detail, 0, 150)}...
        						</c:when>
        							<c:otherwise>
            							${news.new_detail}
        							</c:otherwise>
    						</c:choose>
						</div>
                        <div class="news-date">ลงเมื่อ ${news.new_date}</div>
                        <div class="news-actions">
                            <c:if test="${isAdmin}">
                                <button type="submit" class="btn-edit">
                                    <i class="fa-solid fa-pen-to-square"></i> แก้ไขข่าว
                                </button>
                            </c:if>
                            <a href="viewNews?newsId=${news.new_id}" class="btn-view-news">
                                <i class="fa-solid fa-eye"></i> อ่านข่าว
                            </a>
                            <c:if test="${isAdmin}">
                                <a href="delNews?newsId=${news.new_id}" class="delete-news-link" 
                                   onclick="return confirm('คุณต้องการลบข่าวนี้ใช่หรือไม่?');">
                                    <i class="fa-solid fa-eraser"></i> ลบข่าว
                                </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </form>
        </c:forEach>
    </div>
</body>
</html>
