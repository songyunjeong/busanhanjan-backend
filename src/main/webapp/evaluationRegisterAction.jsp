<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="evaluation.*, util.*"%>

<%
	
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	String lectureName = null;
	String professorName = null;
	int lectureYear = 0;
	String semesterDivide = null;
	String lectureDivide = null;
	String evaluationTitle = null;
	String evaluationContent = null;
	String totalScore = null;
	String creditScore = null;
	String comfortableScore = null;
	String lectureScore = null;
	
	if(request.getParameter("lectureName") != null)
		lectureName = request.getParameter("lectureName");
	if(request.getParameter("professorName") != null)
		professorName = request.getParameter("professorName");
	if(request.getParameter("lectureYear") != null) {
		try {
			lectureYear = Integer.parseInt(request.getParameter("lectureYear"));
		} catch(Exception e) {
			System.out.println("연도 데이터 오류");
		}
	}
	if(request.getParameter("semesterDivide") != null)
		semesterDivide = request.getParameter("semesterDivide");
	if(request.getParameter("lectureDivide") != null)
		lectureDivide = request.getParameter("lectureDivide");
	if(request.getParameter("evaluationTitle") != null)
		evaluationTitle = request.getParameter("evaluationTitle");
	if(request.getParameter("evaluationContent") != null)
		evaluationContent = request.getParameter("evaluationContent");
	if(request.getParameter("totalScore") != null)
		totalScore = request.getParameter("totalScore");
	if(request.getParameter("creditScore") != null)
		creditScore = request.getParameter("creditScore");
	if(request.getParameter("comfortableScore") != null)
		comfortableScore = request.getParameter("comfortableScore");
	if(request.getParameter("lectureScore") != null)
		lectureScore = request.getParameter("lectureScore");
	
	if(lectureName == null || professorName == null || lectureYear == 0 || semesterDivide == null || lectureDivide == null || evaluationTitle == null || evaluationContent == null || totalScore == null || creditScore == null || comfortableScore == null || lectureScore == null || evaluationTitle.equals("") || evaluationContent.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	EvaluationDAO evaluationDAO = new EvaluationDAO();
	int result = evaluationDAO.write(new Evaluation(0, userID, lectureName, professorName, lectureYear, semesterDivide, lectureDivide, evaluationTitle, evaluationContent, totalScore, creditScore, comfortableScore, lectureScore, 0));
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('등록 실패했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'review.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>