<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:useBean id="loginBean" class="model.LoginBean" scope="session" />

<%
	if (request.getMethod().equals("POST")) {
		request.setCharacterEncoding("UTF-8");
	}

	String viewPath = "./WEB-INF/views/";
	String command = request.getParameter("command");
	String message = "";
	String status = "";
	
	if (session.getAttribute("loginId") == null) {
		if (request.getMethod().equals("GET")) {
			pageContext.forward(viewPath + "login.jsp");
		} else if (request.getMethod().equals("POST") && command != null && command.equals("login")) {
			if (loginBean.checkLogin(request.getParameter("id"), request.getParameter("pwd"))) {
				session.setAttribute("loginId", request.getParameter("id"));
				session.setAttribute("message", loginBean.getId() + "님의 방문을 환영합니다!");
				pageContext.forward(viewPath + "loginProc.jsp");
			} else {
				session.setAttribute("message", "로그인 실패했습니다. 아이디와 비밀번호를 확인해주세요.");
				pageContext.forward(viewPath + "login.jsp");
				/* response.sendRedirect("loginController.jsp"); */
			}
		}
	} else if (command != null && command.equals("logout")) {
		session.invalidate();
		response.sendRedirect("loginController.jsp");
	} else {
		pageContext.forward(viewPath + "loginProc.jsp");
	}

	// 로그인 메시지	
	if (session.getAttribute("message") != null) {
		message = (String)session.getAttribute("message");
	}
%>