package MyMealManager;

import java.sql.*;

public class DbManager {
        static private String databaseURL = "jdbc:mysql://localhost:3306/";
        static private String dbname = "CS130";
        static private String username = "cs130";
        static private String password = "test";
	
	public static Connection getConnection(boolean readOnly)
	throws SQLException {        
            Connection conn = DriverManager.getConnection(
                databaseURL + dbname, username, password);
            conn.setReadOnly(readOnly);        
            return conn;
        }
	
	private DbManager() {}
	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
