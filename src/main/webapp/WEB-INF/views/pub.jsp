<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>pub</title>

<style>
    /* 표 스타일링 */
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        /* 목록 스타일링 */
        .pub-info {
            list-style: none;
        }

        /* 가게 목록 제목 스타일링 */
        .pub-info:first-child {
            font-weight: bold;
        }
</style>


</head>
<body>
	<h2>가게 등록 및 조회</h2>
	<hr />
	<form method="POST">
		<fieldset>
			<legend>가게 검색</legend>

			<label for="keyword">이름 또는 지역</label>
			<input type="text" name="keyword" id="keyword"/> 
			
			<input type="submit" value="검색" />
		</fieldset>
		</form>

	<hr />
	<form method="POST">
		<fieldset>
			<legend>메뉴 검색</legend>
			
			<label for="menu">메뉴</label>
			<input type="text" name="menu" id="menu"/> 
			
			<input type="submit" value="검색" />
		</fieldset>
		</form>
	<hr />

	<form method="POST">
		<fieldset>
			<legend>입력</legend>
<!-- 이름, 메뉴, 술, 카테고리, 주소, 전화번호, 별점, 좋아요, 관리자확인, 홈페이지, 사진링크 			 -->
				
			<label for="pname">이름</label>
			<input type="text" name="pname" id="pname"/> 
			
			<label for="insert_menu">메뉴</label>
			<input type="text" name="insert_menu" id="insert_menu"/> 

			<label for="alcohol">술</label>
			<input type="text" name="alcohol" id="alcohol"/> 

			<label for="category">카테고리</label>
			<input type="text" name="category" id="category"/> 

			<label for="place">주소</label>
			<input type="text" name="place" id="place"/> 

			<label for="tel">전화번호</label>
			<input type="text" name="tel" id="tel"/> 

			<label for="star">별점</label>
			<input type="number" name="star" id="star"/> 

			<input type="submit" value="입력" />
		</fieldset>
		</form>
	<hr />

  <h3>가게 목록</h3>
        <label for="filterCheckBox">별점 4점 이상만 보기</label>
        <input type="checkbox" id="filterCheckBox" name="filterByStar" value="true">
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
</body>
</html>
