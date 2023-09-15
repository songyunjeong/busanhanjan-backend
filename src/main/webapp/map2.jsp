<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>부산한잔</title>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4a14ac2ec9df8726fc3ad08ca31d1792&libraries=services"
    ></script>
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=29f6ba3d0320078e3d579bcf1cfd93fb&libraries=services"></script>
    <script src="./js/map2.js" defer></script>
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
    <link rel="stylesheet" href="./css/map2.css" />
  </head>
  <body>
    <header class="header">
      <a href="./index.jsp" class="header__title">
        부산한잔 <i class="fa-solid fa-whiskey-glass"></i>
      </a>
      <div class="option">
        <div>
          <form onsubmit="searchPlaces(); return false;">
            <input
              type="text"
              value="구서동 술집"
              id="keyword"
              autocomplete="off"
            />
            <button type="submit">
              <i class="fa-solid fa-magnifying-glass searchmark"></i>
            </button>
          </form>
        </div>
      </div>
    </header>
    <div class="blackboard"></div>

    <div class="map_wrap">
      <div
        id="map"
        style="
          width: calc(100% - 300px);
          height: 100vh;
          position: relative;
          float: right;
          overflow: hidden;
        "
      ></div>

      <div id="menu_wrap" class="bg_white">
        <ul id="placesList"></ul>
        <div id="pagination"></div>
      </div>
    </div>
  </body>
</html>