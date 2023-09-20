package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class EvaluationDAO {
	public int write (Evaluation evaluation) {
		String sql = "INSERT INTO evaluation VALUES(?, null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		String seqSql = "select evaluation_seq.NEXTVAL from dual";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(seqSql);
			rs.next();
			int seq = rs.getInt(1);
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.setString(2, evaluation.getLectureName().replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(3, evaluation.getProfessorName().replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setInt(4, evaluation.getLectureYear());
			pstmt.setString(5, evaluation.getSemesterDivide().replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(6, evaluation.getLectureDivide().replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(7, evaluation.getEvaluationTitle().replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(8, evaluation.getEvaluationContent().replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(9, evaluation.getTotalScore().replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(10, evaluation.getCreditScore().replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(11, evaluation.getComfortableScore().replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(12, evaluation.getLectureScore().replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\r\n", "<br>"));  
		     
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); }
			catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); }
			catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); }
			catch (Exception e) { e.printStackTrace(); }
		}
		return -1; //데이터 베이스 오류
	}
	
	public ArrayList<Evaluation> getList (String lectureDivide, String searchType, String search, int pageNumber) {
		if(lectureDivide.equals("전체") ) 
			lectureDivide = "";
		ArrayList<Evaluation> evaluationList = null;
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(searchType.equals("최신순")) {
				sql = "SELECT * FROM evaluation WHERE lectureDivide LIKE ? AND lectureName || professorName || evaluationTitle || evaluationContent LIKE "
						+ "? ORDER BY evaluationID";
			} else if (searchType.equals("추천순")) {
				sql = "SELECT * FROM evaluation WHERE lectureDivide LIKE ? AND lectureName || professorName || evaluationTitle || evaluationContent LIKE "
						+ "? ORDER BY likeCount";
			}
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + lectureDivide + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();
			evaluationList = new ArrayList<Evaluation>();
			while(rs.next()) {
				Evaluation evaluation = new Evaluation(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13),
						rs.getInt(14)
				);
				evaluationList.add(evaluation);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); }
			catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); }
			catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); }
			catch (Exception e) { e.printStackTrace(); }
		}
		return evaluationList; //데이터 베이스 오류
	}
	
	public int like(String evaluationID) {
		String sql = "UPDATE evaluation SET likeCount = likeCount + 1 WHERE evaluationID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); }
			catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); }
			catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); }
			catch (Exception e) { e.printStackTrace(); }
		}
		return -1; 
	}
	
	public int delete(String evaluationID) {
		String sql = "DELETE FROM evaluation WHERE evaluationID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); }
			catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); }
			catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); }
			catch (Exception e) { e.printStackTrace(); }
		}
		return -1; 
	}
	
	public String getUserID(String evaluationID) {
		String sql = "SELECT userID FROM evaluation WHERE evaluationID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
			rs = pstmt.executeQuery();
			if(rs.next())
				return rs.getString(1);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try { if(conn != null) conn.close(); }
			catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); }
			catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); }
			catch (Exception e) { e.printStackTrace(); }
		}
		return null; 
	}
}
