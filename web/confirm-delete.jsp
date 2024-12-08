<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session2 = request.getSession();
    if (session2.getAttribute("username") == null) {
        response.sendRedirect("login.html");
    }
    int noteId = Integer.parseInt(request.getParameter("id"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Delete</title>
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

        .confirm-content {
            flex: 1;
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }

        .confirm-content h1 {
            color: #333;
        }

        .confirm-content p {
            font-size: 16px;
            color: #333;
        }

        .confirm-content form {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .confirm-content button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
        }

        .confirm-content button:hover {
            background-color: #0056b3;
        }

        .confirm-content .cancel-button {
            background-color: #ccc;
        }

        .confirm-content .cancel-button:hover {
            background-color: #999;
        }

        footer {
            text-align: center;
            padding: 10px 0;
            background-color: #333;
            color: #fff;
            width: 100%;
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
    <div class="confirm-content">
        <h1>Confirm Delete</h1>
        <p>Are you sure you want to delete this note?</p>
        <form action="delete-note" method="post">
        <input type="hidden" name="id" value="<%= noteId %>">
        <button type="submit">Yes</button>
            </form>
    <form action="dashboard" method="get">
        <button type="submit">No</button>
    </form>
    </div>
    <footer>
        <p>&copy; 2024 NotesKeeper. All rights reserved.</p>
    </footer>
</body>
</html>
