package sql.sql;

import java.sql.Connection;
import java.sql.DriverManager;


public class LinkSQL {
    private String name;
    private String pwd;
    private String database;

    public LinkSQL() {
        this("","","");
        String[] loginConfig = SQLConfig.getLoginConfig();
        if (loginConfig!=null) {
            this.setName(loginConfig[0]);
            this.setPwd(loginConfig[1]);
            this.setDatabase(loginConfig[2]);
        } else throw new NullPointerException();
    }

    public LinkSQL(String name, String pwd, String database) {
        this.name = name;
        this.pwd = pwd;
        this.database = database;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setDatabase(String database) {
        this.database = database;
    }

    public String getDatabase() {
        return database;
    }

    public String getName() {
        return name;
    }
/*
      加载
     */



    public Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/"+database,name,pwd);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
