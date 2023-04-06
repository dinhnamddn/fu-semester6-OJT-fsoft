package fa.training.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {

    private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=JWEB_Final;encrypt=false";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "sa";
    private static Connection connection = null;
    private ConnectionUtil() {
    }

    public static Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            if (connection == null || connection.isClosed()) {
                openConnection();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }

    private static void openConnection() {
        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}