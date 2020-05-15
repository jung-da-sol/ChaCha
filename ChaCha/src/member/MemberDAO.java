package member;

import java.sql.Connection;
import java.sql.DriverManager;

public class MemberDAO {

	private Connection conn;
	
	public MemberDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "c##chacha";
			String dbPassword = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
