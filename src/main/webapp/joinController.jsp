<%@ page contentType="text/html; charset=UTF-8"
		 import="java.util.*, model.*"
%>

<%
	UserInfoDAO userDAO = (UserInfoDAO)session.getAttribute("userDAO");
	
	String viewPath = "./WEB-INF/views/";
	
	if (userDAO == null) {
		userDAO = new UserInfoDAO();
		session.setAttribute("userDAO", userDAO);
	}
	
	if (request.getMethod().equals("POST")) {
		request.setCharacterEncoding("UTF-8");
		
		UserInfoDO userDO = new UserInfoDO();
		userDO.setUsername(request.getParameter("username"));
		userDO.setId(request.getParameter("id"));
		userDO.setPwd(request.getParameter("pwd"));
		userDO.setEmail(request.getParameter("email"));
		
		userDAO.insertUserInfo(userDO);
		
		session.setAttribute("joinId", request.getParameter("id"));
		pageContext.forward(viewPath + "joinProc.jsp");
	}
	
	
	pageContext.forward(viewPath + "join.jsp");
%>