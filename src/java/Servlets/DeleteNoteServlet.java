package Servlets;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/delete-note")
public class DeleteNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.html");
            return;
        }

        int noteId = Integer.parseInt(request.getParameter("id"));

        NoteDAO noteDAO = new NoteDAO();
        boolean isDeleted = noteDAO.deleteNoteById(noteId);

        if (isDeleted) {
            response.sendRedirect("dashboard");
        } else {
            response.getWriter().write("Error deleting the note.");
        }
    }
}
    