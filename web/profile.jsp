<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="Servlets.User" %>
<%
    HttpSession session1 = request.getSession(false);
    User user = (session1 != null) ? (User) session1.getAttribute("user") : null;

    if (user == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="css/styles.css">
    <style>
        body {
            background-image: url('images/123.jpg');
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #333;
        }

        .logo {
            font-size: 30px;
            display: flex;
            align-items: center;
            color: white;
        }

        .logo i {
            height: 30px;
            margin-right: 10px;
            font-size: 30px;
        }

        nav {
            flex-grow: 1;
            display: flex;
            justify-content: center;
        }

        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            gap: 20px;
        }

        nav ul li {
            margin: 0;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        .profile-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .profile-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .profile-container div {
            margin-bottom: 10px;
        }

        .profile-container label {
            font-weight: bold;
            color: #333;
        }

        .profile-container span {
            margin-left: 10px;
            color: #333;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <header>
        <div class="logo">
            <i class="fa-solid fa-lightbulb"></i>
            <span>NotesKeeper</span>
        </div>
        <nav>
            <ul>
                <li><a href="dashboard.jsp">Home</a></li>
                <li><a href="profile.jsp">Profile</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>
    <div class="content">
        <div class="profile-container">
            <h2>User Profile</h2>
            <div>
                <label>Full Name:</label>
                <span><%= user.getFullName() %></span>
            </div>
            <div>
                <label>Date of Birth:</label>
                <span><%= user.getDob() %></span>
            </div>
            <div>
                <label>Username:</label>
                <span><%= user.getUsername() %></span>
            </div>
            <div>
                <label>Email:</label>
                <span><%= user.getEmail() %></span>
            </div>
        </div>
    </div>
</body>
</html>
