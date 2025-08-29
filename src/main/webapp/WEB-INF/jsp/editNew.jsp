<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit News</title>
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
        .form-container {
    		max-width: 600px;
    		margin: 50px auto;
    		padding: 20px;
    		background-color: white;
    		border-radius: 10px;
    		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

		h2 {
    		text-align: center;
    		margin-bottom: 20px;
    		color: #333;
		}

		.form-group {
    		margin-bottom: 15px;
		}

		label {
    		display: block;
    		font-weight: bold;
    		margin-bottom: 5px;
    		color: #333;
		}

		input[type="text"],
		input[type="date"],
		textarea {
    		width: 100%;
    		padding: 10px;
    		font-size: 16px;
    		border: 1px solid #ccc;
    		border-radius: 5px;
    		box-sizing: border-box;
		}

		textarea {
    		resize: none;
		}

		input[type="text"]:focus,
		input[type="date"]:focus,
		textarea:focus {
    		border-color: #4CAF50;
    		outline: none;
		}


		.btn-save-news {
    		display: inline-block;
    		background-color: #e74c3c;
    		color: white;
    		padding: 10px 20px;
    		font-size: 16px;
    		border: none;
    		border-radius: 5px;
    		cursor: pointer;
    		width: 100%;
    		text-align: center;
		}

		.btn-save-news:hover {
    		background-color: #ff7667;
		}
    </style>
    <script>
        function toggleDropdown() {
            document.getElementById("dropdownMenu").classList.toggle("show");
        }

        window.onclick = function(event) {
            if (!event.target.matches('.dropdown-toggle')) {
                var dropdowns = document.getElementsByClassName("dropdown-menu");
                for (var i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
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
			<a href=""><i class="fa-solid fa-user"></i></a>
			<a href=""><i class="fa-solid fa-bag-shopping"></i></a>
		</div>
	</div>
<div class="mainhead">
    <img src="path/to/logo.png" alt="Logo">
    <div class="search-bar">
        <i class="fas fa-search"></i>
        <input type="text" placeholder="ค้นหาสินค้า">
    </div>
    <div class="menu-item active"><a href="#">หน้าแรก</a></div>
    <div class="menu-item"><a href="#">จัดสเปกคอม</a></div>
    <div class="menu-item"><a href="#">สเปคคอมที่จัดตอนนี้</a></div>
    <div class="menu-item"><a href="#">ข่าวสาร</a></div>
    <div class="menu-item"><a href="#">ติดต่อเรา</a></div>
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
    
    <div class="form-container">
        <h2>แก้ไขข่าว</h2>
        <form action="updateNews" method="post" class="edit-news-form">
            <div class="form-group">
                <label for="imageUrl">URL รูปภาพ:</label>
                <input type="text" id="imageUrl" name="imageUrl" placeholder="ใส่ URL ของรูปภาพ" required value="${news.new_pic}">
            </div>

            <div class="form-group">
                <label for="newsTitle">หัวข้อข่าว:</label>
                <input type="text" id="newsTitle" name="newsTitle" placeholder="ใส่หัวข้อข่าว" required value="${news.new_name}">
            </div>

            <div class="form-group">
                <label for="newsContent">เนื้อหาของข่าว:</label>
                <textarea id="newsContent" name="newsContent" rows="6" placeholder="ใส่เนื้อหาของข่าว" required>${news.new_detail}</textarea>
            </div>

            <div class="form-group">
                <label for="newsDate">วันที่:</label>
                <input type="date" id="newsDate" name="newsDate" required value="${news.new_date}">
            </div>

            <div class="form-group">
                <button type="submit" class="btn-save-news">บันทึกข่าว</button>
            </div>
        </form>
    </div>
</body>
</html>