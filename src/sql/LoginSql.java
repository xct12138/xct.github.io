package sql;

import com.mysql.jdbc.Driver;

import java.sql.*;

public class LoginSql {
    public static Connection getConnection(){
        String[] loginX = new String[0];
        Connection connection=null;
        try {
            //Class.forName("com.mysql.jdbc.Driver");
            DriverManager.registerDriver(new Driver());
            loginX = SqlConfig.getLoginX();
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tdb1","xct","1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}
