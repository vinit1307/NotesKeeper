<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Servlets.Note" %>
<%
    HttpSession session1 = request.getSession(false);
    String username = (session1 != null && session1.getAttribute("username") != null) ? (String) session1.getAttribute("username") : "Guest";
    List<Note> notes = (List<Note>) request.getAttribute("notes");  // Ensure the attribute name matches
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
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

        .dashboard-content {
            flex: 1;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .dashboard-content h1 {
            color: #333;
        }

        .note-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .note {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            padding: 20px;
            margin: 10px;
        }

        .note h2 {
            font-size: 20px;
            margin: 0;
        }

        .note p {
            font-size: 16px;
        }

        .actions {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .actions button {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            margin: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .actions button:hover {
            background-color: #0056b3;
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
                <li><a href="dashboard">Home</a></li>
                <li><a href="profile.jsp">Profile</a> </li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>
    <div class="dashboard-content">
        <h1>Welcome <%= username %> to Your Dashboard</h1>
      <div class="note-container">
            <% if (notes != null && !notes.isEmpty()) {
                for (Note note : notes) { %>
                    <div class="note">
                        <h2><%= note.getTitle() %></h2>
                        <p><%= note.getContent() %></p>
                        <div class="actions">
                            <form action="edit-note" method="get">
                                <input type="hidden" name="id" value="<%= note.getId() %>" />
                                <button type="submit">Edit</button>
                            </form>
                            <form action="confirm-delete.jsp" method="post">
                                <input type="hidden" name="id" value="<%= note.getId() %>" />
                                <button type="submit">Delete</button>
                            </form>
                        </div>
                    </div>
                <% }
            } else { %>
                <p>No Notes available</p>
            <% } %>
        </div>
        <div class="actions">
            <button onclick="window.location.href='add-note.jsp'">Add a Note</button>
        </div>
    </div>
    <footer>
        <p>&copy; 2024 NotesKeeper. All rights reserved.</p>
    </footer>
</body>
</html>