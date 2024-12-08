package Servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.html");
            return;
        }

        String username = (String) session.getAttribute("username");
        NoteDAO noteDAO = new NoteDAO();
        User user = noteDAO.getUserDetailsByUsername(username);
        List<Note> notes = noteDAO.getNotesByUsername(username);

        if (notes == null) {
            System.out.println("No notes found for username: " + username);
        } else {
            System.out.println("Notes retrieved for username: " + username);
            for (Note note : notes) {
                System.out.println(note);
            }
        }

        if (user == null) {
            System.out.println("No user details found for username: " + username);
        } else {
            session.setAttribute("user", user);
        }

        request.setAttribute("notes", notes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
