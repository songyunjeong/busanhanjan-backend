package model;

import java.sql.*;

public class UserInfoDAO {
	
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private String sql;
	
	public UserInfoDAO() {
		String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
		String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";
		
		if (conn == null) {
			try {
				Class.forName(jdbc_driver);
				conn = DriverManager.getConnection(jdbc_url, "scott", "tiger");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public int insertUserInfo(UserInfoDO userDO) {
		int rowCount = 0;
		sql = "insert into user_info (username, id, pwd, email) values (?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userDO.getUsername());
			pstmt.setString(2,  userDO.getId());
			pstmt.setString(3, userDO.getPwd());
			pstmt.setString(4,  userDO.getEmail());
			
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return rowCount;
	}
	
}
