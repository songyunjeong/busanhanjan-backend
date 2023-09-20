<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:useBean id="userInfoDAO" class="model.UserInfoDAO" scope="session" />

<%
	if (request.getMethod().equals("POST")) {
		request.setCharacterEncoding("UTF-8");
	}

	String viewPath = "./WEB-INF/views/";
	String command = request.getParameter("command");
	String message = "";
	String status = "";
	
	// 로그인 메시지	
	if (session.getAttribute("message") != null) {
		message = (String)session.getAttribute("message");
	}
	
	// 로그인, 로그아웃
	if (session.getAttribute("loginId") == null) {
		if (request.getMethod().equals("GET")) {
			pageContext.forward(viewPath + "login.jsp");
		} else if (request.getMethod().equals("POST") && command != null && command.equals("login")) {
			if (userInfoDAO.checkLogin(request.getParameter("id"), request.getParameter("pwd"))) {
				session.setAttribute("loginId", request.getParameter("id"));
				pageContext.forward(viewPath + "loginProc.jsp");
			} else {
				session.setAttribute("message", "로그인 실패했습니다. 아이디와 비밀번호를 확인해주세요.");
				pageContext.forward(viewPath + "login.jsp");
			}
		}
	} else if (command != null && command.equals("logout")) {
		session.invalidate();
		response.sendRedirect("loginController.jsp");
	} else {
		pageContext.forward(viewPath + "loginProc.jsp");
	}
%>