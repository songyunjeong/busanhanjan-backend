<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter, java.util.ArrayList, java.net.URLEncoder" %>
<%@ page import="evaluation.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>리뷰 쓰기</title>
<!-- bootstrap CSS 추가 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- custom CSS 추가 -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String lectureDivide = "전체";
	String searchType = "최신순";
	String search = "";
	int pageNumber = 0;
	
	if(request.getParameter("lectureDivide") != null) 
		lectureDivide = request.getParameter("lectureDivide");
	if(request.getParameter("searchType") != null) 
		searchType = request.getParameter("searchType");
	if(request.getParameter("search") != null) 
		search = request.getParameter("search");
	if(request.getParameter("pageNumber") != null) 
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch(Exception e) {
			System.out.println("검색 페이지 번호 오류");
			
		}

%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">리뷰 쓰기</a>

			<form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
				<input type="text" name="search" class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search"/>
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</nav>
	<section class="container">
		<form method="get" action="./index.jsp" class="form-inline mt-3">
			<select name="lectureDivide" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="술" <% if(lectureDivide.equals("술")) out.println("selected"); %>>술</option>
				<option value="안주" <% if(lectureDivide.equals("안주")) out.println("selected"); %>>안주</option>
				<option value="식사" <% if(lectureDivide.equals("식사")) out.println("selected"); %>>식사</option>
			</select>
			<select name="searchType" class="form-control mx-1 mt-2">
				<option value="최신순">최신순</option>
				<option value="추천순" <% if(lectureDivide.equals("추천순")) out.println("selected"); %>>추천순</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요."/>
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고</a>
		</form>
<%
	ArrayList<Evaluation> evaluationList = new ArrayList<Evaluation>();
	evaluationList = new EvaluationDAO().getList(lectureDivide, searchType, search, pageNumber);
	if(evaluationList != null) 
		for(int i = 0; i < evaluationList.size(); i++) {
			if(i == 5) break;
			Evaluation evaluation = evaluationList.get(i);
%>
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<span style="color: red;"><%= evaluation.getLectureDivide() %></span> <br/>
					
					<div class="col-8 text-left" ><%= evaluation.getLectureName()%>&nbsp;<small><%= evaluation.getProfessorName()%></small></div>
						
					<!--   col-4 text-righ float-right-->
					<div class="col-3 text-right">
						종합<span style="color: red;"><%= evaluation.getTotalScore() %></span>
					</div>
				</div>
			</div>
		
			<div class="card-body">
				<h5 class="card-title">
					<%= evaluation.getEvaluationTitle() %>&nbsp;<small>(<%= evaluation.getLectureYear()%>년 <%= evaluation.getSemesterDivide()%>)</small>
				</h5>
				<p class="card-text"><%= evaluation.getEvaluationContent()%>
				<div class="row">
					<div class="col-9 text-left">
						맛<span style="color:red;"><%= evaluation.getCreditScore()%></span>
						분위기<span style="color:red;"><%= evaluation.getComfortableScore()%></span>
						가격<span style="color:red;"><%= evaluation.getLectureScore()%></span>
						<span style="color: green;">(추천 : <%= evaluation.getLikeCount()%>)</span>
					</div>
					<div class="col-3 text-right">
						<a onclick="return confirm('추천하시겠습니까?')" href="./likeAction.jsp?evaluationID=<%= evaluation.getEvaluationID()%>">추천</a>
						<a onclick="return confirm('삭제하시겠습니까?')" href="./deleteAction.jsp?evaluationID=<%= evaluation.getEvaluationID()%>">삭제</a>
					</div>
				</div>
			</div>
		</div>
<%
	}
%>
	</section>
	<ul class="pagination justify-content-center mt-3">
		<li class="page-item">
<%
	 if(pageNumber <= 0) {
%>
			<a class="page-link disabled">이전</a>
<%		 
	 } else {
%>
	<a class="page-link" href="./index.jsp?lectureDivide=<%=URLEncoder.encode(lectureDivide, "UTF-8") %>&searchType=
	<%= URLEncoder.encode(searchType, "UTF-8") %>&search=<%= URLEncoder.encode(search, "UTF-8")%>&pageNumber=
	<%= pageNumber - 1 %>">이전</a>
<%
	 }
%>
		</li>
		<li>
<%
//	 if(evaluationList.size() < 6) {
%>
	<!-- <a class="page-link disabled">다음</a> -->
<%		 
//	 } else {
%>
	<a class="page-link" href="./index.jsp?lectureDivide=
	<%=URLEncoder.encode(lectureDivide, "UTF-8") %>&searchType=<%= URLEncoder.encode(searchType, "UTF-8") %>
	&search=<%= URLEncoder.encode(search, "UTF-8")%>&pageNumber=<%= pageNumber + 1 %>">다음</a>
<%
//	 }
%>		
		</li>
	</ul>
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">평가 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./evaluationRegisterAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>가게명 및 술이름</label>
								<input type="text" name="lectureName" class="form-control" maxlength="20"/>
							</div>
							<div class="form-group col-sm-6">
								<label>위치 및 가격</label>
								<input type="text" name="professorName" class="form-control" maxlength="20"/>
							</div>
						</div>
						
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>방문년도</label>
								<select name="lectureYear" class="form-control">
									<option value="2011">2011</option>
									<option value="2012">2012</option>
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018" >2018</option>
									<option value="2019">2019</option>
									<option value="2020">2020</option>
									<option value="2021">2021</option>
									<option value="2022">2022</option>
									<option value="2023"selected>2023</option>
								</select>
							</div>
						
							<div class="form-group col-sm-4">
								<label>날짜</label>
								
								
								<select name="semesterDivide" class="form-control">
									<option value="봄" selected>봄</option>
									<option value="여름">여름</option>
									<option value="가을">가을</option>
									<option value="겨울">겨울</option>
									
									
								</select> 
							</div>
							<div class="form-group col-sm-4">
								<label>구분</label>
								<select name="lectureDivide" class="form-control">
									<option value="술" selected>술</option>
									<option value="안주">안주</option>
									<option value="식사">식사</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="evaluationTitle" class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="evaluationContent" class="form-control" maxlength="2048" style="height:180px;"></textarea>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-3">
								<label>종합</label>
								<select name="totalScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>맛</label>
								<select name="creditScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>분위기</label>
								<select name="comfortableScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>가격</label>
								<select name="lectureScore" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">신고하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./reportAction.jsp" method="post">
						<div class="form-group">
							<label>신고 제목</label>
							<input type="text" name="reportTitle" class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>신고 내용</label>
							<textarea name="reportContent" class="form-control" maxlength="2048" style="height:180px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-danger">신고하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2023 1조 STATUS CODE 200 Rights Reserved.
	</footer>
	<!-- jQuery 추가 -->
	<script src="./js/jquery.min.js"></script>
	<!-- pooper 추가 -->
	<script src="./js/popper.js"></script>
	<!-- bootstrap.js 추가 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>