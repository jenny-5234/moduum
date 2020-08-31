import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import javax.sql.DataSource;

public class ConnectionTest {
//    private static final String DRIVER ="oracle.jdbc.driver.OracleDriver";

    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String URL = "jdbc:sqlserver://modumjeon.duckdns.org:1433;database=YL1;";
    private static final String USER = "sa";
    private static final String PW = "@Modum1234";

    @Test
    public void testConnection() throws Exception {
        Class.forName(DRIVER);

        try (Connection conn = DriverManager.getConnection(URL, USER, PW)) {
            System.out.println(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

