<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #d32f2f, #f44336, #ffffff);
            font-family: 'Kanit', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            box-sizing: border-box;
    		background-repeat: no-repeat;
    		background-size: cover;
    		background-image: url('https://64.media.tumblr.com/4e0e28821627a1e566134edef9b0b20b/tumblr_ocmlpt9P0p1vewhn8o2_500.gifv');
        }
        .login-container {
            background: white;
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            max-width: 400px;
            width: 100%;
        }
        .login-container h2 {
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
        .register-link {
            display: block;
            text-align: center;
            font-weight: 600;
            color: #d32f2f;
            text-decoration: none;
            transition: color 0.3s;
        }
        .register-link:hover {
            color: #b71c1c;
        }
        .error-message {
            color: #d32f2f;
            text-align: center;
            margin-bottom: 1rem;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>เข้าสู่ระบบ</h2>
		
		<c:if test="${not empty message}">
            <div class="alert alert-success">
                ${message}
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <form action="loginProcess" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">รหัสผ่าน</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">เข้าสู่ระบบ</button>
            <a href="open_register" class="register-link">ลงทะเบียน</a>
        </form>
    </div>
</body>
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
    }, 5000);
};
</script>
</html>