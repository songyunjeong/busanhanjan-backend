<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>부산한잔 - 회원가입</title>
    <link
      rel="icon"
      href="./images/main/logoicon-cup.ico"
      type="image/x-icon"
    />
    <link rel="stylesheet" href="./css/join.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
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
          <a href="./map2.jsp">지도보기</a>
        </div>
        <div class="nav5 nowpage">
          <a href="./joinController.jsp">회원가입</a>
        </div>
      </div>
    </header>
    <div class="wrap">
      <div class="join-area">
      	<form method="POST">
      	<fieldset>
      		<legend>회원가입</legend>
      		
      		<label for="username">이름</label>
      		<input type="text" name="username" id="username" required /><br />
	      	
	      	<label for="id">아이디</label>
	      	<input type="text" name="id" id="id" required /><br />
	      	
	      	<label for="pwd">비밀번호</label>
	      	<input type="password" name="pwd" id="pwd" required /><br />
	      	
	      	<label for="email">이메일</label>
	      	<input type="email" name="email" id="email" required /><br />
      	</fieldset>
      	<br />
      	
      	<input type="hidden" name="command" value="join" />
        <input type="submit" value="회원가입" />
      	</form>
      </div>
    </div>
  </body>
</html>