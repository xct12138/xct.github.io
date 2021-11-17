package dao.sql;

import bean.User;
import util.Close;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserQuery {
    private Connection connection=null;
    private PreparedStatement statement=null;
    private ResultSet resultSet=null;
    public UserQuery() {
        InitialContext initialContext= null;
        try {
            initialContext = new InitialContext();
            DataSource dataSource=(DataSource) initialContext.lookup("java:comp/env/test1");
            connection=dataSource.getConnection();
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }

    }

    public User getUserWithCookie(String uname , String pwd){
        try {
            if (connection!=null) {
                statement = connection.prepareStatement("select * from userbaseinfo where uid=? and pwd=?");
                statement.setString(1, uname);
                statement.setString(2, pwd);
            }
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return getUserW(uname,pwd);
    }
    public User getUser(String uname,String pwd){
        try {
            if (connection!=null) {
                statement = connection.prepareStatement("select * from userbaseinfo where uid=? and pwd=md5(?)");
                statement.setString(1, uname);
                statement.setString(2, pwd);
            }
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return getUserW(uname,pwd);
    }

    private User getUserW(String name,String pwd){
         try {
                resultSet=statement.executeQuery();
                if (resultSet.next()) {
                    User user = new User();
                    user.setId(resultSet.getInt(1));
                    user.setUid(resultSet.getString(2));
                    user.setPwd(resultSet.getString(3));
                    user.setEmail(resultSet.getString(4));
                    user.setIcon(resultSet.getString(5));

                    Close.close(connection,resultSet,statement);
                    return user;
                }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Close.close(connection,resultSet,statement);
        }
         return null;
    }
}
