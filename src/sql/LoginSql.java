package sql;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;

public class LoginSql {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public Connection getConnection(){
        String[] loginX = new String[0];
        Connection connection=null;
        try {
            loginX = SqlConfig.getLoginX();
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + loginX[2], loginX[0], loginX[1]);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}
