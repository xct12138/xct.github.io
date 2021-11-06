package servlet;


import javax.naming.InitialContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/signin")
public class SignInServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp){
        try {
            req.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String uname = req.getParameter("uname");
        String password = req.getParameter("password");

        Connection connection=null;
        PreparedStatement pre=null;
        ResultSet resultSet=null;
        try {
            InitialContext initialContext = new InitialContext();
            DataSource dataSource= (DataSource) initialContext.lookup("java:comp/env/test1");
            connection = dataSource.getConnection();
            String nextPage="/source/page/Login.jsp";
            if (null!=connection) {
                pre = connection.prepareStatement("select * from userbaseinfo where uid=? and pwd=md5(?)");
                pre.setString(1, uname);
                pre.setString(2, password);
                resultSet = pre.executeQuery();
                if (resultSet.next()) {
                    req.setAttribute("loginResult", true);

                    req.setAttribute("uid",uname);
                    nextPage="/source/page/main.jsp";
                } else {
                    req.setAttribute("loginResult", false);
                }
            }
            req.getRequestDispatcher(nextPage).forward(req, resp);
        }
        catch (Exception throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                if (resultSet!=null) resultSet.close();
                if (connection!=null) connection.close();
                if (pre!=null) pre.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
