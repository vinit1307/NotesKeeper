<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Servlets.Note" %>
<%
    Note note = (Note) request.getAttribute("note");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Note</title>
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
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .logo i {
            margin-right: 10px;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        nav ul li {
            margin: 0;
        }

        nav ul li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        .note-form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            max-width: 600px;
            margin: 0 auto;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .note-form h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .note-form label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        .note-form input, .note-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .note-form button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .note-form button:hover {
            background-color: #0056b3;
        }
    </style>
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
        <div class="note-form">
            <h2>Edit Note</h2>
            <form action="edit-note" method="post">
                <input type="hidden" name="id" value="<%= note.getId() %>" />
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="<%= note.getTitle() %>" required>
                <label for="content">Content:</label>
                <textarea id="content" name="content" rows="5" required><%= note.getContent() %></textarea>
                <button type="submit">Save Note</button>
            </form>
        </div>
    </div>
</body>
</html>
