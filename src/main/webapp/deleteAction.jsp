<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.PrintWriter"%>
<%@ page import="util.*, evaluation.*, likey.*"%>

<%
	
	request.setCharacterEncoding("UTF-8");
	String evaluationID = null;
	 if(request.getParameter("evaluationID") != null)
		evaluationID = request.getParameter("evaluationID");
	
	EvaluationDAO evaluationDAO = new EvaluationDAO();
	//if(userID.equals(evaluationDAO.getUserID(evaluationID))) {
		int result = new EvaluationDAO().delete(evaluationID);
		if(result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제가 완료되었습니다.');");
			script.println("location.href = 'review.jsp'");
			script.println("</script>");
			script.close();
			return;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
  
%>