package model;

import java.sql.*;
import java.util.*;

public class PubDAO {
// 초기화
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private String sql;

	public PubDAO() {
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

	// 데이터 입력
	public int insertPubInfo(PubDO pubDO) {
		int rowCount = 0;
		sql = "insert into pub (pno, pname, place) values (?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pubDO.getPno());
			pstmt.setString(2, pubDO.getPname());
			pstmt.setString(3, pubDO.getPlace());

			rowCount = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return rowCount;
	}

	public ArrayList<PubDO> getPubInfo() {
		ArrayList<PubDO> pubList = new ArrayList<PubDO>();
		sql = "select pno, pname, place, tel, star from pub";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				PubDO pubDO = new PubDO();
				pubDO.setPno(rs.getInt("pno"));
				pubDO.setPname(rs.getString("pname"));
				pubDO.setPlace(rs.getString("place"));
				pubDO.setTel(rs.getString("tel"));
				pubDO.setStar(rs.getLong("star"));
				pubList.add(pubDO);
			}
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
		return pubList;
	}

	public ArrayList<PubDO> searchPubByKeyword(String searchKeyword, boolean filterByStar) {
	    ArrayList<PubDO> pubList = new ArrayList<PubDO>();
	    String sql;

	    if (filterByStar) {
	        sql = "SELECT pno, pname, place, tel, star FROM pub WHERE (pname LIKE ? OR place LIKE ?) AND star >= 4";
	    } else {
	        sql = "SELECT pno, pname, place, tel, star FROM pub WHERE pname LIKE ? OR place LIKE ?";
	    }

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, "%" + searchKeyword + "%");
	        pstmt.setString(2, "%" + searchKeyword + "%");
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            PubDO pubDO = new PubDO();
	            pubDO.setPno(rs.getInt("pno"));
	            pubDO.setPname(rs.getString("pname"));
	            pubDO.setPlace(rs.getString("place"));
	            pubDO.setTel(rs.getString("tel"));
	            pubDO.setStar(rs.getLong("star"));
	            pubList.add(pubDO);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (pstmt != null) {
	            try {
	                pstmt.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return pubList;
	}
}
