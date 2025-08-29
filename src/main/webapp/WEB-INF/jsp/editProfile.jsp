<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Kanit', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            margin-top: 50px;
            max-width: 600px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
            color: #343a40;
        }

        .form-label {
            font-weight: 600;
            color: #495057;
        }

        .form-control {
            border-radius: 5px;
            transition: box-shadow 0.3s ease;
        }

        .form-control:focus {
            box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.5);
        }

        .btn-primary {
            width: 100%;
            padding: 10px;
            font-size: 18px;
            border-radius: 5px;
            background-color: #e74c3c;
            border: none;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #ff7667;
        }

        .profile-pic {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .profile-pic img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
        }

        .back-link:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>แก้ไขข้อมูลโปรไฟล์</h2>
        
        <!-- Profile Picture -->
        <div class="profile-pic">
            <img src="${sessionScope.loggedInUser.imageUrl}" alt="Profile Picture">
        </div>

        <form action="updateProfile" method="post">
            <div class="mb-3">
                <label for="firstName" class="form-label">ชื่อ</label>
                <input type="text" class="form-control" id="firstName" name="firstName" value="${sessionScope.loggedInUser.firstName}" required>
            </div>
            <div class="mb-3">
                <label for="lastName" class="form-label">นามสกุล</label>
                <input type="text" class="form-control" id="lastName" name="lastName" value="${sessionScope.loggedInUser.lastName}" required>
            </div>
            <div class="mb-3">
                <label for="dob" class="form-label">วันเกิด</label>
                <input type="date" class="form-control" id="dob" name="dob" value="${sessionScope.loggedInUser.dob}" required>
            </div>
            <div class="mb-3">
                <label for="imageUrl" class="form-label">URL รูปภาพ</label>
                <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="${sessionScope.loggedInUser.imageUrl}">
            </div>
            <button type="submit" class="btn btn-primary">บันทึก</button>
        </form>

        <a href="home" class="back-link">ย้อนกลับไปยังเว็บไซต์</a>
        <a href="logout" class="back-link">ออกจากระบบ</a>
    </div>
</body>
</html>