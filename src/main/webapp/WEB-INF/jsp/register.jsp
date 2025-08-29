<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #d32f2f, #f44336, #ffffff);
            font-family: 'Kanit', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            box-sizing: border-box;
    		background-repeat: no-repeat;
    		background-size: cover;
    		background-image: url('https://64.media.tumblr.com/4e0e28821627a1e566134edef9b0b20b/tumblr_ocmlpt9P0p1vewhn8o2_500.gifv');
        }
        .register-container {
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            max-width: 500px;
            width: 100%;
        }
        .register-container h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            font-weight: 600;
            color: #b71c1c;
        }
        .form-label {
            font-weight: 600;
            color: #555;
        }
        .form-control {
            margin-bottom: 1rem;
            border-radius: 8px;
            transition: all 0.3s;
        }
        .form-control:focus {
            box-shadow: 0px 0px 6px rgba(211, 47, 47, 0.5);
            border-color: #d32f2f;
        }
        .btn-primary {
            width: 100%;
            padding: 0.8rem;
            font-size: 1rem;
            font-weight: 600;
            background-color: #d32f2f;
            border: none;
            border-radius: 8px;
            transition: background-color 0.3s;
            margin-bottom: 1rem;
        }
        .btn-primary:hover {
            background-color: #b71c1c;
        }
        .btn-secondary {
            width: 100%;
            padding: 0.8rem;
            font-size: 1rem;
            font-weight: 600;
            background-color: #9e9e9e;
            border: none;
            border-radius: 8px;
            transition: background-color 0.3s;
        }
        .btn-secondary:hover {
            background-color: #616161;
        }
        .login-link {
            display: block;
            text-align: center;
            margin-top: 1.2rem;
            font-weight: 600;
            color: #d32f2f;
            text-decoration: none;
            transition: color 0.3s;
        }
        .login-link:hover {
            color: #b71c1c;
        }
    </style>
</head>

<body>
    <div class="register-container">
        <h2>สมัครสมาชิก</h2>
        
        <!-- แสดงข้อความแจ้งเตือน -->
        <c:if test="${not empty message}">
            <div class="alert alert-success">
                ${message}
            </div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                ${error}
            </div>
        </c:if>
        
        <form action="register" method="post" onsubmit="return validateForm()">
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="firstName" class="form-label">ชื่อ</label>
                <input type="text" class="form-control" id="firstName" name="firstName" required>
            </div>
            <div class="mb-3">
                <label for="lastName" class="form-label">นามสกุล</label>
                <input type="text" class="form-control" id="lastName" name="lastName" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">รหัสผ่าน</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="mb-3">
                <label for="dob" class="form-label">วันเกิด</label>
                <input type="date" class="form-control" id="dob" name="dob" required>
            </div>
            <div class="mb-3">
                <label for="imageUrl" class="form-label">URL รูปภาพ</label>
                <input type="url" class="form-control" id="imageUrl" name="imageUrl">
            </div>
            <button type="submit" class="btn btn-primary">สมัครสมาชิก</button>
            <a href="login" class="login-link">เข้าสู่ระบบ</a>
            <a href="home" class="btn btn-secondary mt-3">กลับไปหน้าหลัก</a>
        </form>
    </div>

    <script>
    window.onload = function() {
        setTimeout(function() {
            var messageAlert = document.getElementById("messageAlert");
            var errorAlert = document.getElementById("errorAlert");

            if (messageAlert) {
                messageAlert.style.opacity = 0;
                setTimeout(function() { messageAlert.style.display = "none"; }, 1000);
            }

            if (errorAlert) {
                errorAlert.style.opacity = 0;
                setTimeout(function() { errorAlert.style.display = "none"; }, 1000);
            }
        }, 5000); // 5 วินาที
    };
        function validateForm() {
            // ตรวจสอบความยาวรหัสผ่าน
            const password = document.getElementById('password').value;
            if (password.length < 6) {
                alert('รหัสผ่านต้องมีความยาวอย่างน้อย 6 ตัวอักษร');
                return false;
            }

            const dob = new Date(document.getElementById('dob').value);
            const today = new Date();
            let age = today.getFullYear() - dob.getFullYear();
            const monthDifference = today.getMonth() - dob.getMonth();
            if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < dob.getDate())) {
                age--;
            }

            if (age < 13) {
                alert('คุณต้องมีอายุมากกว่า 13 ปีขึ้นไป');
                return false;
            }

            return true; // ผ่านการตรวจสอบทั้งหมด
        }
    </script>
</body>
</html>
