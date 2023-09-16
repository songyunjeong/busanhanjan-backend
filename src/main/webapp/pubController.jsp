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
	boolean filterByStar = Boolean.parseBoolean(request.getParameter("filterByStar"));
	ArrayList<PubDO> pubList = pubDAO.searchPubByKeyword(searchKeyword, filterByStar);
	request.setAttribute("pubList", pubList);
} 

pageContext.forward("/WEB-INF/views/pub.jsp");
%>

