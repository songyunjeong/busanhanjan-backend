<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>부산한잔</title>

<link rel="icon" href="./images/main/logoicon-cup.ico"
	type="image/x-icon" />
<link rel="stylesheet" href="./css/pub.css" />
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    />
</head>
<body>
	<header class="header">
		<a href="./index.jsp" class="header__title"> 부산한잔 
		<i class="fa-solid fa-whiskey-glass"></i>
		</a>
		<div class="nav">
			<div class="nav1">
				<a href="./index.jsp">Home</a>
			</div>
			<div class="nav2">
				<a href="./alcohol.jsp">술이야기</a>
			</div>
			<div class="nav3">
				<a href="./game.jsp">취향테스트</a>
			</div>
			<div class="nav4">
				<a href="./map2.jsp">지도보기</a>
			</div>
			<div class="nav5">
				<a href="./loginController.jsp">로그인</a>
			</div>
		</div>
	</header>
	
	<div class="contents">
		<h2>가게 등록 및 조회</h2>
		<br />
		<form method="POST">
			<fieldset>
				<legend>가게 검색</legend>
	
				<label for="keyword">이름 또는 지역 </label> <input type="text"
					  name="keyword" id="keyword" /> <input type="submit" value="검색" />
			</fieldset>
		</form>
		<br />
		<form method="POST">
			<fieldset>
				<legend>메뉴 검색</legend>
	
				<label for="menu">메뉴</label> <input type="text" name="menu"
						id="menu" /> <input type="submit" value="검색" />
			</fieldset>
		</form>	
		<br />

		<form method="POST">
			<fieldset>
				<legend>입력</legend>
	
				<label for="star">별점</label>
				<input type="number" name="star" id="star" size="2" /> <label for="pname">이름</label> 
				<input type="text"
					name="pname" id="pname" /> <label for="insert_menu">메뉴</label> <input
					type="text" name="insert_menu" id="insert_menu" /> <label
					for="alcohol">술</label> <input type="text" name="alcohol"
					id="alcohol" />
	
				<!-- 			<label for="category">카테고리</label> -->
				<!-- 			<input type="text" name="category" id="category"/>  -->
	
				<label for="place">주소</label> <input type="text" name="place" id="place" size="50" /> 
				<label for="tel">전화번호</label> <input type="text" name="tel" id="tel" /> <input type="submit" value="입력" />
			</fieldset>
		</form>
		<br />
		<br />

		<h2>가게 목록</h2>
		<label for="filterCheckBox">별점 4점 이상만 보기</label>
		<input type="checkbox" id="filterCheckBox" name="filterByStar"
			value="true">
		<br />
		<table>
			<thead>
				<tr>
					<th>별점</th>
					<th>이름</th>
					<th>주메뉴</th>
					<th>주류</th>
					<th>위치</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pubList}" var="pubDO">
					<c:if test="${not empty param.filterByStar and pubDO.star >= 4}">
						<tr>
							<td>${pubDO.star}</td>
							<td>${pubDO.pname}</td>
							<td>${pubDO.menu}</td>
							<td>${pubDO.alcohol}</td>
							<td>${pubDO.place}</td>
							<td>${pubDO.tel}</td>
						</tr>
					</c:if>
					<c:if test="${empty param.filterByStar}">
						<tr>
							<td>${pubDO.star}</td>
							<td>${pubDO.pname}</td>
							<td>${pubDO.menu}</td>
							<td>${pubDO.alcohol}</td>
							<td>${pubDO.place}</td>
							<td>${pubDO.tel}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
		<br />
		<br />
	</div>
</body>
</html>
