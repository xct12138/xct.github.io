package sql;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class DBLinkPool {
    public static final int ExpansionCoefficient = 16;
    /**
     * linkSql池
     *      linkPool_notUsed    未用对象池
     *      linkPool_using      正在使用的对象池
     */
    private static final List<Connection> linkPool_notUsed=new LinkedList<>();
    private static final List<Connection> linkPool_using=new LinkedList<>();

    /**
     * 扩充连接池，以ExpansionCoefficient为增加的大小
     */
    private static void expandPool(){
        LinkSQL linkSQL=new LinkSQL();
        for (int i = 0; i < ExpansionCoefficient; i++) {
            linkPool_notUsed.add(linkSQL.getConnection());
        }
    }
    /**
     * 从池中获取连接对象
     * @return connection 数据库连接对象
     */
    public static Connection getConnection(){
        Connection connection;
        if (linkPool_notUsed.size() <= 0) {
            expandPool();
        }
        connection = linkPool_notUsed.remove(linkPool_notUsed.size()-1);
        linkPool_using.add(connection);
        return connection;
    }

    /**
     * 归还数据库连接对象
     * @param connection 要归还的连接对象
     */
    public static void returnConnection(Connection connection){
        if (connection!=null && linkPool_using.remove(connection)){
            linkPool_notUsed.add(connection);
        }
    }

    /**
     * 销毁数据库连接，在容器关闭时调用
     */
    public static void closeAll(){
        for (Connection connection : linkPool_notUsed) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        for (Connection connection : linkPool_using) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
