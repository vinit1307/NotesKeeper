package Servlets;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoteDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/noteskeeper";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Load MySQL JDBC driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("MySQL JDBC driver not found.");
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void saveNote(Note note) {
        String query = "INSERT INTO notes (title, content, username) VALUES (?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, note.getTitle());
            statement.setString(2, note.getContent());
            statement.setString(3, note.getUsername());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateNote(Note note) {
        String query = "UPDATE notes SET title = ?, content = ? WHERE id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, note.getTitle());
            statement.setString(2, note.getContent());
            statement.setInt(3, note.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

      public List<Note> getNotesByUsername(String username) {
        System.out.println("Fetching notes for username: " + username);
        List<Note> notes = new ArrayList<>();
        String query = "SELECT * FROM notes WHERE username = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Note note = new Note();
                note.setId(resultSet.getInt("id"));
                note.setTitle(resultSet.getString("title"));
                note.setContent(resultSet.getString("content"));
                note.setUsername(resultSet.getString("username"));
                notes.add(note);
                System.out.println("Retrieved note: " + note);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return notes;
    }
      public static Note getNoteById(int id) {
        String query = "SELECT * FROM notes WHERE id = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Note note = new Note();
                note.setId(resultSet.getInt("id"));
                note.setTitle(resultSet.getString("title"));
                note.setContent(resultSet.getString("content"));
                note.setUsername(resultSet.getString("username"));
                return note;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

   public boolean deleteNoteById(int noteId) {
        String sql = "DELETE FROM notes WHERE id = ?";
        boolean rowDeleted = false;

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, noteId);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

  public User getUserDetailsByUsername(String username) {
        User user = null;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username = ?")) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setFullName(rs.getString("full_name"));
                    user.setDob(rs.getString("dob"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
            
        }
        return user;
    }
}

