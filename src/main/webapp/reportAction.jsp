<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.PrintWriter, javax.mail.internet.*, javax.mail.*"%>
<%@ page import="util.*"%>

<%

	// UserDAO userDAO = new UserDAO();
	String userID = null;

	request.setCharacterEncoding("UTF-8");
	String reportTitle = null;
	String reportContent = null;
	if(request.getParameter("reportTitle") != null)
		reportTitle = request.getParameter("reportTitle");
	if(request.getParameter("reportContent") != null)
		reportContent = request.getParameter("reportContent");

	if(reportTitle == null || reportContent == null || reportTitle.equals("") || reportContent.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('정상적으로 신고되었습니다.');");
	script.println("location.href = 'review.jsp'");
	script.println("</script>");
	script.close();
	return;
%>