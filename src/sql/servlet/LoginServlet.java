package sql.servlet;

import sql.DBLinkPool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String uname = req.getParameter("uname");
        String password = req.getParameter("password");
        Connection connection = DBLinkPool.getConnection();
        try {
            if (connection==null) {
                resp.getWriter().print("link error");
                return;
            }
            Statement statement = connection.createStatement();
            String s = "select id from userbaseinfo where uid='" + uname + "' and pwd=md5('" + password + "'";
            ResultSet resultSet = statement.executeQuery(s);
            System.out.println(resultSet);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }
}
