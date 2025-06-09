package com.week2.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.week2.login.util.DBUtil;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        // 1. Read parameters
        String username      = request.getParameter("username");
        String userEmail     = request.getParameter("useremail");
        String password      = request.getParameter("password");
        String preferredName = request.getParameter("preferredname");
        String name          = request.getParameter("name");

        // 2. Validate
        StringBuilder errs = new StringBuilder();
        if (username == null || !username.matches("[A-Za-z]{1,10}"))
            errs.append("Username must be 1–10 letters.<br>");
        if (userEmail == null || !userEmail.matches(".+@.+\\..+"))
            errs.append("Enter a valid email.<br>");
        if (password == null || password.length() < 6)
            errs.append("Password must be at least 6 chars.<br>");
        if (name == null || name.isBlank())
            errs.append("Full name is required.<br>");

        if (errs.length() > 0) {
            request.setAttribute("errorMsg", errs.toString());
            request.getRequestDispatcher("/index.jsp")
                   .forward(request, response);
            return;
        }

        // 3. Insert into DB
        String sql = """
          INSERT INTO users
            (username, userEmail, password, preferredName, name)
          VALUES (?, ?, ?, ?, ?)
          """;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, userEmail);
            ps.setString(3, password);           // hash in prod!
            ps.setString(4, preferredName);
            ps.setString(5, name);

            ps.executeUpdate();

            // 4. On success
            request.setAttribute("successMsg", "Sign-up successful!");
            request.getRequestDispatcher("/index.jsp")
                   .forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Database insert error", e);
        }
    }
}
