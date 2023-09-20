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
		String searchPname = request.getParameter("pname");
	
		ArrayList<PubDO> pubList;
	
		// 	System.out.println(searchKeyword + "/" + searchMenu);
	
		// 이름 또는 지역 검색
		if (searchKeyword != null) {
			pubList = pubDAO.searchPubByKeyword(searchKeyword, filterByStar);
			request.setAttribute("pubList", pubList);
		}
	
		// 메뉴 검색
		else if (searchMenu != null) {
			pubList = pubDAO.searchPubByMenu(searchMenu, filterByStar);
			request.setAttribute("pubList", pubList);
	
		}
		// 술맛집 등록
		else if (searchPname != null) {
			PubDO pubDO = new PubDO();
			pubDO.setPname(request.getParameter("pname"));
			pubDO.setMenu(request.getParameter("insert_menu"));
			pubDO.setAlcohol(request.getParameter("alcohol"));
			pubDO.setCategory(request.getParameter("category"));
			pubDO.setPlace(request.getParameter("place"));
			pubDO.setTel(request.getParameter("tel"));
			pubDO.setStar(Double.parseDouble(request.getParameter("star")));
	
			pubDAO.insertPubInfo(pubDO);
			request.setAttribute("pubList", pubDAO.getPubInfo(filterByStar));
		}
	
		// 전체 검색    
		else {
			pubList = pubDAO.getPubInfo(filterByStar);
			request.setAttribute("pubList", pubList);
		}
	
	}
	
	pageContext.forward("/WEB-INF/views/pub.jsp");
%>