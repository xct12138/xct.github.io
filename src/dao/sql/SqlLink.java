package dao.sql;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class SqlLink {


    public static Connection getConnection(){
        Connection connection=null;
        try {
            InitialContext initialContext= new InitialContext();
            DataSource dataSource=(DataSource) initialContext.lookup("java:comp/env/test1");
            connection=dataSource.getConnection();
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
