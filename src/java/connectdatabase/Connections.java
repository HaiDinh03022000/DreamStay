
package connectdatabase;

import java.sql.Connection;
import java.sql.DriverManager;


public class Connections {
    private final String serverName = "DESKTOP-R4TO9PD\\HAIDINH";
    private final String dbName = "DreamSteay1";
    private final String portNumber = "1433";
    private final String instance = "";
    private final String userID = "sa";
    private final String password = "sa123";
    public Connection getConnection() throws Exception{
        String url = "jdbc:sqlserver://"+serverName+":"+portNumber+"\\"+instance+";databaseName="+dbName;
        if(instance == null || instance.trim().isEmpty())
            url = "jdbc:sqlserver://"+serverName+":"+portNumber+";databaseName="+dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }
    public static void main(String[] args) {
        try {
            System.out.println(new Connections().getConnection());
        } catch (Exception e) {
        }
    }
}
