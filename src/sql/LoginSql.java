package sql;

public class LoginSql {
    private String name;
    private String pwd;
    private String dbName;

    public LoginSql() {

    }

    public LoginSql(String name, String pwd, String dbName) {
        this.name = name;
        this.pwd = pwd;
        this.dbName = dbName;
    }
}
