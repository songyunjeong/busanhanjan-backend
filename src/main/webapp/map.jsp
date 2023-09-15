<%@ page contentType="text/html; charset=UTF-8" %>
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>부산한잔</title>
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=4a14ac2ec9df8726fc3ad08ca31d1792"></script>
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=29f6ba3d0320078e3d579bcf1cfd93fb"></script>
    <script src="./js/map.js" defer></script>
    <link
      rel="icon"
      href="/images/public/logoicon-cup.ico"
      type="image/x-icon"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
      integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="./css/map.css" />
  </head>
  <body>
    <header class="header">
      <a href="./index.jsp" class="header__title">
        부산한잔 <i class="fa-solid fa-whiskey-glass"></i>
      </a>
      <div class="header__search">
        <input
          type="text"
          id="searchtxt"
          class="searchtxt"
          placeholder="지역, 음식 또는 식당명 입력"
          autocomplete="off"
          value="구서동"
        />
        <div class="autocomplete"><span>최근 검색어</span></div>
        <button><i id="xmark" class="fa-solid fa-xmark xmark"></i></button>
        <button><i class="fa-solid fa-magnifying-glass searchmark"></i></button>
      </div>
    </header>
    <div class="blackboard"></div>

    <div id="list">
      <!-- 
      <div class="list__box">
        <div class="list_content">
          <div class="list__img">
            <img src="" alt="">
          </div>
          <div class="list__info">
            <div class="list__title"></div>
            <div class="list__category"></div>
            <div class="list__hash"></div>
            <div class="list__rate">
              <div class="rate1"></div>
              <div class="rate2"></div>
              <div class="rate3"></div>
            </div>
          </div>
        </div>
      </div>
      -->
    </div>

    <div id="map" style="width: calc(100% - 450px); height: 100vh"></div>
  </body>
</html>