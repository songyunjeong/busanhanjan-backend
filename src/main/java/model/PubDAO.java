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

	// 술맛집 입력
	public int insertPubInfo(PubDO pubDO) {
	    int rowCount = 0;
	    int nextPno = getNextPno(); // 'pno+1'을 가져옴

	    sql = "insert into pub (pno, pname, menu, alcohol, category, place, tel, star) values (?, ?, ?, ?, ?, ?, ?, ?)";

	    try {
	        pstmt = conn.prepareStatement(sql);

	        pstmt.setInt(1, nextPno);
	        pstmt.setString(2, pubDO.getPname());
	        pstmt.setString(3, pubDO.getMenu());
	        pstmt.setString(4, pubDO.getAlcohol());
	        pstmt.setString(5, pubDO.getCategory());
	        pstmt.setString(6, pubDO.getPlace());
	        pstmt.setString(7, pubDO.getTel());
	        pstmt.setDouble(8, pubDO.getStar());

	        rowCount = pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null)
	                pstmt.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return rowCount;
	}

	// Pub테이블의 'pno + 1' 을 반환함
	public int getNextPno() {
	    int nextPno = 0;

	    try {
	        // SQL 쿼리: 가장 큰 pno 값을 가져옴
	        String maxPnoQuery = "SELECT MAX(pno) FROM pub";
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(maxPnoQuery);

	        // 결과가 있다면 가장 큰 pno 값을 가져와서 1을 더함
	        if (rs.next()) {
	            nextPno = rs.getInt(1) + 1;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (stmt != null)
	                stmt.close();
	            if (rs != null)
	                rs.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return nextPno;
	}
	
	// 전체 조회
	public ArrayList<PubDO> getPubInfo(boolean filterByStar) {
		ArrayList<PubDO> pubList = new ArrayList<PubDO>();

		if (filterByStar) {
			sql = "SELECT * FROM pub WHERE star >= 4 ORDER BY pcheck, pno DESC";
		} else {
			sql = "SELECT * FROM pub ORDER BY pcheck, pno DESC";
		}

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				PubDO pubDO = new PubDO();
				pubDO.setMenu(rs.getString("menu"));
				pubDO.setPname(rs.getString("pname"));
				pubDO.setAlcohol(rs.getString("alcohol"));
				pubDO.setPlace(rs.getString("place"));
				pubDO.setTel(rs.getString("tel"));
				pubDO.setStar(rs.getDouble("star"));
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

	// 가게 이름 또는 지역으로 검색
	public ArrayList<PubDO> searchPubByKeyword(String searchKeyword, boolean filterByStar) {
		ArrayList<PubDO> pubList = new ArrayList<PubDO>();
		String sql;

		if (filterByStar) {
			sql = "SELECT * FROM pub WHERE (pname LIKE ? OR place LIKE ?) AND star >= 4";
		} else {
			sql = "SELECT * FROM pub WHERE pname LIKE ? OR place LIKE ?";
		}

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchKeyword + "%");
			pstmt.setString(2, "%" + searchKeyword + "%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PubDO pubDO = new PubDO();
				pubDO.setMenu(rs.getString("menu"));
				pubDO.setPname(rs.getString("pname"));
				pubDO.setAlcohol(rs.getString("alcohol"));
				pubDO.setPlace(rs.getString("place"));
				pubDO.setTel(rs.getString("tel"));
				pubDO.setStar(rs.getDouble("star"));
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
	
	// 음식 또는 술 검색
	public ArrayList<PubDO> searchPubByMenu(String searchMenu, String searchAlcohol, boolean filterByStar) {
	    ArrayList<PubDO> pubList = new ArrayList<PubDO>();
	    String sql;

	    if (filterByStar) {
	        sql = "SELECT * FROM pub WHERE menu LIKE ? AND alcohol LIKE ? AND star >= 4";
	    } else {
	        sql = "SELECT * FROM pub WHERE menu LIKE ? AND alcohol LIKE ?";
	    }

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, "%" + searchMenu + "%");
	        pstmt.setString(2, "%" + searchAlcohol + "%");
	        rs = pstmt.executeQuery();

			while (rs.next()) {
				PubDO pubDO = new PubDO();
				pubDO.setMenu(rs.getString("menu"));
				pubDO.setPname(rs.getString("pname"));
				pubDO.setAlcohol(rs.getString("alcohol"));
				pubDO.setPlace(rs.getString("place"));
				pubDO.setTel(rs.getString("tel"));
				pubDO.setStar(rs.getDouble("star"));
				pubList.add(pubDO);
			}

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (rs != null) rs.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return pubList;
	}
}
