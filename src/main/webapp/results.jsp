<%@ page contentType="text/html; charset=UTF-8" %>
    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>부산한잔</title>

    <link
      rel="icon"
      href="/images/public/logoicon-cup.ico"
      type="image/x-icon"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css"
    />
    <link
      rel="stylesheet"
      as="style"
      crossorigin
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.6/dist/web/variable/pretendardvariable-dynamic-subset.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    />
    <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="./css/results.css" />
    <script defer src="./js/share.js"></script>
    <script type="module" defer src="./js/results.js"></script>
  </head>
  <body>
    <header class="header">
      <a href="./index.jsp" class="header__title">
        부산한잔 <i class="fa-solid fa-whiskey-glass"></i>
      </a>
    </header>

    <h2 class="page-subtitle">나와 맞는 주류는?!</h2>
    <h1 class="page-title"></h1>
    <img src="" alt="술이름" class="character" />
    <div class="result">
      <div class="box"></div>
      <div class="box"></div>
      <div class="box"></div>
      <div class="box"></div>
    </div>

    <div class="result">
      <h3>이런 술은 어떤가요?</h3>
      <div class="recs">
        <div class="rec"></div>
        <div class="rec"></div>
      </div>
    </div>
    <div class="btn btn-green btn-small share-or-copy">결과 공유하기</div>
    <a href="./game.jsp" class="btn btn-gray btn-small"> 다시 테스트하기 </a>
  </body>
</html>