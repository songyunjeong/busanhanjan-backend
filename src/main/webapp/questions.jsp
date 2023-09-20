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
    <link rel="stylesheet" href="./css/questions.css" />
    <script type="module" defer src="./js/questions.js"></script>
  </head>
  <body>
    <header class="header">
      <a href="./index.jsp" class="header__title">
        부산한잔 <i class="fa-solid fa-whiskey-glass"></i>
      </a>
    </header>
    <br />
    <div class="progress">
      <div class="value"></div>
    </div>
    <div class="question-box">
      <div class="number"></div>
      <div class="question"></div>
      <div class="btn btn-gray choice choice1"></div>
      <div class="btn btn-gray choice choice2"></div>
    </div>
  </body>
</html>