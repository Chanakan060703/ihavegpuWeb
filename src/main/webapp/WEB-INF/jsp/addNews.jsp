<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add News</title>
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
        input[type="text"], input[type="date"], textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .btn-save-news {
            display: inline-block;
            background-color: #28a745;
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
            background-color: #218838;
        }
       .back-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #e74c3c;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
    margin-top:2rem;
}
    </style>
</head>
<body>
    <div class="form-container">
        <h2>เพิ่มข่าวใหม่</h2>
        <form action="addNews" method="post">
            <div class="form-group">
                <label for="imageUrl">URL รูปภาพ:</label>
                <input type="text" id="imageUrl" name="imageUrl" placeholder="ใส่ URL ของรูปภาพ" required>
            </div>
            <div class="form-group">
                <label for="newsTitle">หัวข้อข่าว:</label>
                <input type="text" id="newsTitle" name="newsTitle" placeholder="ใส่หัวข้อข่าว" required>
            </div>
            <div class="form-group">
                <label for="newsContent">เนื้อหาของข่าว:</label>
                <textarea id="newsContent" name="newsContent" rows="6" placeholder="ใส่เนื้อหาของข่าว" required></textarea>
            </div>
            <div class="form-group">
                <label for="newsDate">วันที่:</label>
                <input type="date" id="newsDate" name="newsDate" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn-save-news">บันทึกข่าว</button>
                <a  href="newsPage" class="back-button"><i class="fa-solid fa-arrow-left"></i>ยกเลิก</a>
            </div>
        </form>
    </div>
</body>
</html>
