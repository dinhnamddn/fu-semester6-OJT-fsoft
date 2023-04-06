package fa.training.utils;

import fa.training.utils.Constants;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtils {
    private static Connection connection;

    //get connection
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        if(connection == null){
            //load driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            //Create connection
            connection = DriverManager
                    .getConnection(Constants.DB_URL,Constants.DB_USERNAME,Constants.DB_PASSWORD);
        }
        return connection;
    }

}
