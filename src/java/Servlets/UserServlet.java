package servlets;

import model.User;
import db.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        try (Connection conn = DbConnection.getConnection()) {
            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertUser(request, response, conn);
                    break;
                case "delete":
                    deleteUser(request, response, conn);
                    break;
                case "edit":
                    showEditForm(request, response, conn);
                    break;
                case "update":
                    updateUser(request, response, conn);
                    break;
                case "login":
                    loginUser(request, response, conn);
                    break;
                case "register":
                    registerUser(request, response, conn);
                    break;
                default:
                    listUser(request, response, conn);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("user_form.jsp").forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws SQLException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String sql = "INSERT INTO users (username, email, password, status) VALUES (?, ?, ?, 'active')";
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, email);
            statement.setString(3, password);
            statement.executeUpdate();
        }
        response.sendRedirect("users?action=list");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "UPDATE users SET status='inactive' WHERE id=?";
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
        response.sendRedirect("users?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM users WHERE id=?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            User user = new User(
                    resultSet.getInt("id"),
                    resultSet.getString("username"),
                    resultSet.getString("email"),
                    resultSet.getString("password"),
                    resultSet.getString("status")
            );
            request.setAttribute("user", user);
            request.getRequestDispatcher("user_form.jsp").forward(request, response);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String sql = "UPDATE users SET username=?, email=?, password=?, status='active' WHERE id=?";
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, email);
            statement.setString(3, password);
            statement.setInt(4, id);
            statement.executeUpdate();
        }
        response.sendRedirect("users?action=list");
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws SQLException, IOException, ServletException {
        String search = request.getParameter("search");
        String sort = request.getParameter("sort");

        String sql = "SELECT * FROM users WHERE status='active'";
        if (search != null && !search.trim().isEmpty()) {
            sql += " AND (username LIKE ? OR email LIKE ?)";
        }
        if (sort != null) {
            sql += " ORDER BY " + sort;
        }

        PreparedStatement statement = conn.prepareStatement(sql);
        if (search != null && !search.trim().isEmpty()) {
            statement.setString(1, "%" + search + "%");
            statement.setString(2, "%" + search + "%");
        }
        ResultSet resultSet = statement.executeQuery();

        List<User> userList = new ArrayList<>();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String username = resultSet.getString("username");
            String email = resultSet.getString("email");
            String password = resultSet.getString("password");
            String status = resultSet.getString("status");
            userList.add(new User(id, username, email, password, status));
        }

        request.setAttribute("userList", userList);
        request.getRequestDispatcher("user_list.jsp").forward(request, response);
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws SQLException, ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check if the login attempt is for the admin user
        if ("admin".equals(username) && "admin".equals(password)) {
            HttpSession session = request.getSession();
            User admin = new User(0, "admin", "admin@example.com", "admin", "active");
            session.setAttribute("user", admin);
            response.sendRedirect("admin.jsp");
            return;
        }

        String sql = "SELECT * FROM users WHERE username=? AND password=? AND status='active'";
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                HttpSession session = request.getSession();
                User user = new User(
                        resultSet.getInt("id"),
                        resultSet.getString("username"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("status")
                );
                session.setAttribute("user", user);
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws SQLException, IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check for duplicate username or email
        String checkSql = "SELECT * FROM users WHERE username=? OR email=?";
        try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
            checkStmt.setString(1, username);
            checkStmt.setString(2, email);
            ResultSet resultSet = checkStmt.executeQuery();
            if (resultSet.next()) {
                request.setAttribute("errorMessage", "Username or email already exists");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
        }

        // Insert the new user
        String sql = "INSERT INTO users (username, email, password, status) VALUES (?, ?, ?, 'active')";
        try (PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, email);
            statement.setString(3, password);
            statement.executeUpdate();
        }
        response.sendRedirect("login.jsp");
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}
