package sql;

import com.mysql.jdbc.Driver;

import java.sql.*;

public class LoginSql {
    public static Connection getConnection(){
        String[] loginX;
        Connection connection=null;
        try {
            loginX = SqlConfig.getLoginX();
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+loginX[2], loginX[0], loginX[1]);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}
