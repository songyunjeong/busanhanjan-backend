<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*, model.*"%>

<%
PubDAO pubDAO = (PubDAO) session.getAttribute("pubDAO");

if (pubDAO == null) {
	pubDAO = new PubDAO();
	session.setAttribute("pubDAO", pubDAO);
}

if (request.getMethod().equals("POST")) {
	request.setCharacterEncoding("UTF-8");

	String searchKeyword = request.getParameter("keyword");
	String searchMenu = request.getParameter("menu");
	boolean filterByStar = Boolean.parseBoolean(request.getParameter("filterByStar"));

	ArrayList<PubDO> pubList;

	// 	System.out.println(searchKeyword + "/" + searchMenu);

	// 이름 또는 지역 검색
	if (searchKeyword != null) {
		pubList = pubDAO.searchPubByKeyword(searchKeyword, filterByStar);
	}

	// 메뉴 검색
	else if (searchMenu != null) {
		pubList = pubDAO.searchPubByMenu(searchMenu, filterByStar);

		// 전체 검색    
	} else {
		pubList = pubDAO.getPubInfo();
	}

	request.setAttribute("pubList", pubList);
}

pageContext.forward("/WEB-INF/views/pub.jsp");
%>

