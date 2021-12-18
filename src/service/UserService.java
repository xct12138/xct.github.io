package service;

import bean.User;
import dao.sql.SqlLink;
import util.Close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {
    private Connection connection=null;
    private PreparedStatement statement=null;
    private ResultSet resultSet=null;
    public UserService() {
        connection= SqlLink.getConnection();
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
        return getUserW();
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
        return getUserW();
    }

    private User getUserW(){
        try {
            resultSet=statement.executeQuery();
            if (resultSet.next()) {
                User user = new User();
                user.setUid(resultSet.getString(1));
                user.setPwd(resultSet.getString(2));
                user.setEmail(resultSet.getString(3));
                user.setIcon(resultSet.getString(4));

                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Close.close(resultSet,statement,connection);
        }
        return null;
    }

    public int update(){

        return 0;
    }
    public int addUser(User user){
        int i=0;
        try {
            if (connection!=null) {
                statement = connection.prepareStatement("insert into userbaseinfo(uid,pwd) values (?,?)");
                statement.setString(1, user.getUid());
                statement.setString(2, user.getPwd());
                 i= statement.executeUpdate();
            }
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            Close.close(statement,connection);
        }
        return i;
    }

    public boolean hasCollected(User user,String article){
        try {
            if (connection!=null) {
                statement = connection.prepareStatement("select * from collect where uid=? and aid=?");
                statement.setString(1, user.getUid());
                statement.setString(2, article);
                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) return true;
            }
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            Close.close(statement,connection);
        }
        return false;
    }
    public void collect(User user,String article){
        try {
            if (connection!=null) {
                statement = connection.prepareStatement("insert into collect values (?,?)");
                statement.setString(1, user.getUid());
                statement.setString(2, article);
                statement.executeUpdate();
            }
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            Close.close(statement,connection);
        }
    }
}
