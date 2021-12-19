package listener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

public class DestroyListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        Enumeration<Driver> driverEnumeration= DriverManager.getDrivers();
        Driver driver=null;
        while (driverEnumeration.hasMoreElements()){
            driver=driverEnumeration.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
            } catch (SQLException troubles) {
                troubles.printStackTrace();
            }
        }
        AbandonedConnectionCleanupThread.checkedShutdown();
    }
}
