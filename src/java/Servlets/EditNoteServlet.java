package Servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;


@WebServlet("/edit-note")
public class EditNoteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int noteId = Integer.parseInt(request.getParameter("id"));
        Note note = NoteDAO.getNoteById(noteId);
        request.setAttribute("note", note);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit-note.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int noteId = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        Note note = new Note();
        note.setId(noteId);
        note.setTitle(title);
        note.setContent(content);
        
        NoteDAO.updateNote(note);
        response.sendRedirect("dashboard");
    }
}
