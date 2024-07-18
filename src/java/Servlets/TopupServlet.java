package servlets;

import model.Topup;
import db.DbConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

@WebServlet("/topups")
public class TopupServlet extends HttpServlet {
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
                    insertTopup(request, response, conn);
                    break;
                case "delete":
                    deleteTopup(request, response, conn);
                    break;
                case "edit":
                    showEditForm(request, response, conn);
                    break;
                case "update":
                    updateTopup(request, response, conn);
                    break;
                case "pay":
                    processPayment(request, response, conn);
                    break;
                case "checkout":
                    showCheckoutForm(request, response, conn);
                    break;
                case "confirmPayment":
                    confirmPayment(request, response, conn);
                    break;
                default:
                    listTopup(request, response, conn);
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

        private void listTopup(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws SQLException, IOException, ServletException {
        String search = request.getParameter("search");
        String sort = request.getParameter("sort");
        String filterDate = request.getParameter("filterDate");
        String filterYear = request.getParameter("filterYear");

        String sql = "SELECT t.id, t.user_id, t.amount, u.username, t.payment_method, t.status, t.timestamp " +
                     "FROM topup_transactions t " +
                     "JOIN users u ON t.user_id = u.id " +
                     "WHERE 1=1";
        List<Object> params = new ArrayList<>();

        if (search != null && !search.trim().isEmpty()) {
            sql += " AND u.username LIKE ?";
            params.add("%" + search + "%");
        }
        if (filterDate != null && !filterDate.trim().isEmpty()) {
            sql += " AND DATE(t.timestamp) = ?";
            params.add(LocalDate.parse(filterDate, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        }
        if (filterYear != null && !filterYear.trim().isEmpty()) {
            sql += " AND YEAR(t.timestamp) = ?";
            params.add(Integer.parseInt(filterYear));
        }
        if (sort != null) {
            sql += " ORDER BY " + sort;
        } else {
            sql += " ORDER BY t.timestamp DESC"; // Default sort by timestamp
        }

        PreparedStatement statement = conn.prepareStatement(sql);
        for (int i = 0; i < params.size(); i++) {
            statement.setObject(i + 1, params.get(i));
        }
        ResultSet resultSet = statement.executeQuery();

        List<Topup> topupList = new ArrayList<>();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            int userId = resultSet.getInt("user_id");
            double amount = resultSet.getDouble("amount");
            String username = resultSet.getString("username");
            String paymentMethod = resultSet.getString("payment_method");
            String status = resultSet.getString("status");
            Timestamp timestamp = resultSet.getTimestamp("timestamp");

            Topup topup = new Topup(id, userId, amount, username, paymentMethod, status, timestamp);
            topupList.add(topup);
        }

        request.setAttribute("topupList", topupList);
        request.getRequestDispatcher("topup_list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("topup_select.jsp").forward(request, response);
    }

    private void insertTopup(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws SQLException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMethod = request.getParameter("paymentMethod");

        String sql = "INSERT INTO topup_transactions (user_id, amount, payment_method, status) VALUES (?, ?, ?, 'Pending')";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, userId);
        statement.setDouble(2, amount);
        statement.setString(3, paymentMethod);
        statement.executeUpdate();

        response.sendRedirect("topups?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        String sql = "SELECT t.id, t.user_id, t.amount, u.username, t.payment_method, t.status, t.timestamp " +
                     "FROM topup_transactions t " +
                     "JOIN users u ON t.user_id = u.id " +
                     "WHERE t.id=?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            Topup topup = new Topup(
                    resultSet.getInt("id"),
                    resultSet.getInt("user_id"),
                    resultSet.getDouble("amount"),
                    resultSet.getString("username"),
                    resultSet.getString("payment_method"),
                    resultSet.getString("status"),
                    resultSet.getTimestamp("timestamp")
            );
            request.setAttribute("topup", topup);
            request.getRequestDispatcher("topup_form.jsp").forward(request, response);
        }
    }

    private void updateTopup(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMethod = request.getParameter("paymentMethod");
        String status = request.getParameter("status");

        String sql = "UPDATE topup_transactions SET user_id=?, amount=?, payment_method=?, status=? WHERE id=?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, userId);
        statement.setDouble(2, amount);
        statement.setString(3, paymentMethod);
        statement.setString(4, status);
        statement.setInt(5, id);
        statement.executeUpdate();

        response.sendRedirect("topups?action=list");
    }

    private void deleteTopup(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        String sql = "DELETE FROM topup_transactions WHERE id=?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, id);
        statement.executeUpdate();

        response.sendRedirect("topups?action=list");
    }

    private void processPayment(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();
        double amount = Double.parseDouble(request.getParameter("amount"));

        // Insert the top-up transaction into the database
        String sql = "INSERT INTO topup_transactions (user_id, amount, payment_method, status) VALUES (?, ?, ?, 'Pending')";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, userId);
        statement.setDouble(2, amount);
        statement.setString(3, "QRIS");
        statement.executeUpdate();

        // Forward to the QRIS payment page
        request.setAttribute("amount", amount);
        request.getRequestDispatcher("payment.jsp").forward(request, response);
    }

    private void showCheckoutForm(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws ServletException, IOException {
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    private void confirmPayment(HttpServletRequest request, HttpServletResponse response, Connection conn)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();
        double amount = Double.parseDouble(request.getParameter("amount"));

        // Update the top-up transaction in the database
        String sql = "UPDATE topup_transactions SET status='Completed' WHERE user_id=? AND amount=? AND status='Pending'";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setInt(1, userId);
        statement.setDouble(2, amount);
        statement.executeUpdate();

        // Forward to the receipt page
        request.setAttribute("amount", amount);
        request.getRequestDispatcher("receipt.jsp").forward(request, response);
    }
}
