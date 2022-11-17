package fa.training.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static fa.training.utils.Constant.*;

public class JdbcConnection {
    public static Connection getConnection() throws SQLException {
        return DriverManager
                .getConnection(DB_SQL_SERVER_CONNECTION_URL+ "databaseName=" + DB_NAME,DB_USERNAME,DB_PASSWORD);
    }
}
