package servlet;


import util.Close;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname = req.getParameter("upUname");
        String password = req.getParameter("upPassword");
        String email= req.getParameter("email");

        //访问数据库所需变量
        Connection connection=null;
        PreparedStatement statement = null;
        Statement statement1 = null;
        try {
            //从数据库连接池中获取连接对象connection
            InitialContext initialContext=new InitialContext();
            DataSource dataSource = (DataSource) initialContext.lookup("java:comp/env/test1");
            connection = dataSource.getConnection();

            if (connection!=null && uname != null) {
                //检查用户名是否重复
                statement1 = connection.createStatement();
                if (statement1.executeQuery("select uid from userbaseinfo where uid='" + uname + "'").next()) {
                    req.setAttribute("signupResult", false);
                    req.setAttribute("isRepeat", true);
                }else if (password != null && email != null) {
                    statement = connection.prepareStatement("insert into userbaseinfo(uid,pwd,email) values(?,md5(?),?)");
                    statement.setString(1, uname);
                    statement.setString(2, password);
                    statement.setString(3, email);
                    int i = statement.executeUpdate();
                    if (i>0) req.setAttribute("signupResult",true);
                }
                req.getRequestDispatcher("/source/page/Login.jsp").forward(req, resp);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }finally {
            //将连接connection还给连接池
            Close.close(connection,statement,statement1);
        }
    }
}
