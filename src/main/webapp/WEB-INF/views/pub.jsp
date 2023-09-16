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
<!-- 			<label for="pno">번호: </label> -->
<!-- 			<input type="number" name="pno" id="pno" required />  -->
			
			<label for="keyword">이름 또는 지역</label>
			<input type="text" name="keyword" id="keyword" required /> 
			
<!-- 			<label for="place">주소: </label> -->
<!-- 			<input type="text" name="place" id="place" required /> -->
<!-- 			<input type="submit" value="등록" /> -->
			<input type="submit" value="검색" />
		</fieldset>
	<hr />

<!-- 	<h3>가게 목록</h3> -->
<!-- 	<ul> -->
<!-- 			<li class="pub-info">번호 | 가게명 | 주소 | 전화번호 | 별점</li> -->
<%-- 		<c:forEach items="${pubList}" var="pubDO"> --%>
<%-- 			<li class="pub-info">${pubDO.pno} | ${pubDO.pname} | ${pubDO.place} | ${pubDO.tel} | ${pubDO.star}</li> --%>
<%-- 		</c:forEach> --%>
<!-- 	</ul> -->

<!--  <h3>가게 목록</h3> -->
<!--     <table> -->
<!--         <thead> -->
<!--             <tr> -->
<!--                 <th>번호</th> -->
<!--                 <th>가게명</th> -->
<!--                 <th>주소</th> -->
<!--                 <th>전화번호</th> -->
<!--                 <th>별점</th> -->
<!--             </tr> -->
<!--         </thead> -->
<!--         <tbody> -->
<%--             <c:forEach items="${pubList}" var="pubDO"> --%>
<!--                 <tr> -->
<%--                     <td>${pubDO.pno}</td> --%>
<%--                     <td>${pubDO.pname}</td> --%>
<%--                     <td>${pubDO.place}</td> --%>
<%--                     <td>${pubDO.tel}</td> --%>
<%--                     <td>${pubDO.star}</td> --%>
<!--                 </tr> -->
<%--             </c:forEach> --%>
<!--         </tbody> -->
<!--     </table> -->

  <h3>가게 목록</h3>
        <label for="filterCheckBox">별점 4점 이상만 보기</label>
        <input type="checkbox" id="filterCheckBox" name="filterByStar" value="true">
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>가게명</th>
                    <th>주소</th>
                    <th>전화번호</th>
                    <th>별점</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${pubList}" var="pubDO">
                    <c:if test="${not empty param.filterByStar and pubDO.star >= 4}">
                        <tr>
                            <td>${pubDO.pno}</td>
                            <td>${pubDO.pname}</td>
                            <td>${pubDO.place}</td>
                            <td>${pubDO.tel}</td>
                            <td>${pubDO.star}</td>
                        </tr>
                    </c:if>
                    <c:if test="${empty param.filterByStar}">
                        <tr>
                            <td>${pubDO.pno}</td>
                            <td>${pubDO.pname}</td>
                            <td>${pubDO.place}</td>
                            <td>${pubDO.tel}</td>
                            <td>${pubDO.star}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </tbody>
        </table>
    </form>

</body>
</html>
