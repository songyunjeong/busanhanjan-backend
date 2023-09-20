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
		
//      가게번호(pno)는 primary key이므로
//		회원이 술맛집을 등록할때 pno가 반드시 입력이 되어야한다.
//			
//		pno가 자동으로 1씩 증가해서 pub테이블에
//		저장되도록 구현할 계획이고 (또는 다른 효율적 방안이 있으면 변경)
//	
//		그 전까지 임시로 pno의 제약조건을 없애고 사용한다.
//		
//		임시 코드임..	
//		int nextPno = 0;
//
//		try {
//			// SQL 쿼리: 가장 큰 pno 값을 가져옴
//			String maxPnoQuery = "SELECT MAX(pno) FROM pub";
//			stmt = conn.createStatement();
//			rs = stmt.executeQuery(maxPnoQuery);
//
//			// 결과가 있다면 가장 큰 pno 값을 가져와서 1을 더함
//			if (rs.next()) {
//				nextPno = rs.getInt(1) + 1;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			// 리소스 해제
//			try {
//				if (stmt != null)
//					stmt.close();
//				if (rs != null)
//					rs.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//
//		try {
//			String pnoPlus = "CREATE SEQUENCE pub_sequence START WITH nextPno INCREMENT BY 1 NOCACHE NOCYCLE";
//			stmt = conn.createStatement();
//			stmt.executeQuery(pnoPlus);
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//		finally {
//			// 리소스 해제
//			try {
//				if (stmt != null)
//					stmt.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}

	// 술맛집 입력
	public int insertPubInfo(PubDO pubDO) {
		int rowCount = 0;

		sql = "insert into pub (pname, menu, alcohol, category, place, tel, star) values (?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, pubDO.getPname());
			pstmt.setString(2, pubDO.getMenu());
			pstmt.setString(3, pubDO.getAlcohol());
			pstmt.setString(4, pubDO.getCategory());
			pstmt.setString(5, pubDO.getPlace());
			pstmt.setString(6, pubDO.getTel());
			pstmt.setDouble(7, pubDO.getStar());

			rowCount = pstmt.executeUpdate();

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
		return rowCount;
	}

	// 전체 조회
	public ArrayList<PubDO> getPubInfo(boolean filterByStar) {
		ArrayList<PubDO> pubList = new ArrayList<PubDO>();

		if (filterByStar) {
			sql = "SELECT * FROM pub WHERE star >= 4";
		} else {
			sql = "SELECT * FROM pub";
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

	// 메뉴로 검색
	public ArrayList<PubDO> searchPubByMenu(String searchMenu, boolean filterByStar) {
		ArrayList<PubDO> pubList = new ArrayList<PubDO>();
		String sql;

		if (filterByStar) {
			sql = "SELECT * FROM pub WHERE menu LIKE ? AND star >= 4";
		} else {
			sql = "SELECT * FROM pub WHERE menu LIKE ?";
		}

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchMenu + "%");
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
}
