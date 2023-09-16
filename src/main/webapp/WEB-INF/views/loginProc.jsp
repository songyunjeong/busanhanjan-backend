<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>부산한잔 - 로그인</title>
		<link
	      rel="icon"
	      href="./images/main/logoicon-cup.ico"
	      type="image/x-icon"
	    />
	    <link rel="stylesheet" href="./css/login.css" />
	    <link
	      rel="stylesheet"
	      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	      integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	      crossorigin="anonymous"
	      referrerpolicy="no-referrer"
	    />
	</head>
	<body>
        <header class="header">
	      <a href="./index.jsp" class="header__title">
	        부산한잔 <i class="fa-solid fa-whiskey-glass"></i>
	      </a>
	      <div class="nav">
	        <div class="nav1"><a href="./index.jsp">Home</a></div>
	        <div class="nav2">
	          <a href="./alcohol.jsp">술이야기</a>
	        </div>
	        <div class="nav3"><a href="./game.jsp">취향테스트</a></div>
	        <div class="nav4">
	          <a href="./map.jsp">지도보기</a>
	        </div>
	        <div class="nav5 nowpage">
	          <a href="./loginController.jsp">로그인</a>
	        </div>
	      </div>
	    </header>
	
		<div class="wrap">
			<div class="login-area">		
				<h2>로그인 되었습니다.</h2><br />
				<h4>[ ${loginId} ]님의 방문을 환영합니다!</h4>
				<br /><br />
				<a href="./loginController.jsp?command=logout">로그아웃</a>
			</div>
		</div>
	</body>
</html>