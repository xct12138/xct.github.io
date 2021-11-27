package service;

import bean.Article;
import dao.sql.SqlLink;
import util.Close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleService {
    private Connection connection=null;
    private PreparedStatement statement=null;
    private ResultSet resultSet=null;

    public ArticleService() {
        connection= SqlLink.getConnection();
    }

    public List<Article> queryArticle_aid(String aid){
        try {
            if (connection != null) {
                statement = connection.prepareStatement("select * from article where aid="+aid+"");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return executeQuery();
    }

    public List<Article> queryArticle_title(String likeTitle){
        try {
            if (connection!=null) {
                statement = connection.prepareStatement("select * from article where title like '%" + likeTitle + "%'");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return executeQuery();
    }

    public List<Article> queryArticle_author(String author){
        try {
            if (connection!=null) {
                statement = connection.prepareStatement("select * from article where author= '" + author + "'");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return executeQuery();
    }

    public List<Article> queryArticle_collect(String author){
        try {
            if (connection!=null) {
                statement = connection.prepareStatement("select * from article,collect where collect.aid=article.aid and collect.uid= '" + author + "'");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return executeQuery();
    }
    private List<Article> executeQuery(){
        List<Article> articleList=new ArrayList<>();
        try {
            if (statement!=null) {
                resultSet = statement.executeQuery();
                Article article = null;
                while (resultSet.next()) {
                    article = new Article();
                    article.setAid(resultSet.getString(1));
                    article.setAuthor(resultSet.getString(2));
                    article.setTitle(resultSet.getString(3));
                    article.setTextPath(resultSet.getString(4));
                    article.setLikeText(resultSet.getInt(5));
                    article.setCollect(resultSet.getInt(6));
                    articleList.add(article);
                }
            }
            Close.close(connection,resultSet,statement);
         }catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            Close.close(connection,resultSet,statement);
        }
        return articleList;
    }

    public boolean addArticle(Article article){
        try {
            statement=connection.prepareStatement("insert into article values(" +
                    article.getAid()+",'"+
                    article.getAuthor()+"',"+
                    (article.getTitle()!=null?"'"+article.getTitle()+"'":"null")+","+
                    (article.getTextPath()!=null?"'"+article.getTextPath()+"'":"null")+","+
                    (article.getLikeText()!=null?"'"+article.getLikeText()+"'":"null")+","+
                    article.getCollect()+")");
            int i = statement.executeUpdate();
            Close.close(connection,statement);
            if (i==1) return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            Close.close(connection,statement);
        }
        return false;
    }
}
