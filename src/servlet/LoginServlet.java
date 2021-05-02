package servlet;

import sql.LoginSql;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String uname = req.getParameter("uname");
        String password = req.getParameter("password");

        Connection connection = new LoginSql().getConnection();
        try {
            PreparedStatement pre = connection.prepareStatement("select * from student where sname=? and pwd=?");
            pre.setString(1,uname);
            pre.setString(2,password);
            ResultSet resultSet = pre.executeQuery();
            if (resultSet.next()){
                req.setAttribute("result",true);
                req.getRequestDispatcher("main.jsp").forward(req,resp);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}
