<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>부산한잔</title>
    <link rel="icon" href="/images/public/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="css/alcohol.css" />
    <script src="js/alcohol.js" charset="UTF-8"></script>
    <link
      rel="icon"
      href="./images/main/logoicon-cup.ico"
      type="image/x-icon"
    />
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
        <div class="nav2 nowpage">
          <a href="./alcohol.jsp">술이야기</a>
        </div>
        <div class="nav3"><a href="./game.jsp">취향테스트</a></div>
        <div class="nav4">
          <a href="./map.jsp">지도보기</a>
        </div>
        <div class="nav5">
          <a href="./loginController.jsp">로그인</a>
        </div>
      </div>
    </header>

    <div class="category">
      <div id="clickText1">탁주</div>
      <div id="clickText2">약주,청주</div>
      <div id="clickText3">과실주</div>
      <div id="clickText4">증류주</div>
      <div id="clickText5">리큐르/기타주류</div>
    </div>

    <div class="wrap">
      <div>
        <div class="alcohol_img"><img src="./images/alcohol/고향춘.jpg" /></div>
        <div class="alcohol_txt">
          <div class="alcohol_title">고향춘</div>
          <ul class="alcohol_info">
            <li>제조사 : 술빚는 전가네</li>
            <li>
              주원료 :
              포천쌀9.6%,찹쌀19.2%향미참쌀9.6%,전가네이화곡3.8%,정제수57.8%.
            </li>
            <li>규격/도수 : 350ml / 10%</li>
            <li>
              제품특징 : 쌀가루 누룩(이화곡)으로 빚은 과일향과 단맛이 조화를
              이룬 탁주이다.
            </li>
          </ul>
        </div>
      </div>

      <div>
        <div class="alcohol_img">
          <img src="./images/alcohol/쌀은원래달다.jpg" />
        </div>
        <div class="alcohol_txt">
          <div class="alcohol_title">쌀은 원래 달다</div>
          <ul class="alcohol_info">
            <li>제조사 : 인천탁주</li>
            <li>
              주원료 : 쌀(국내산) 36.28%함유, 국, 효모, 혼합제제(효모가루, 유당)
            </li>
            <li>규격/도수 : 500ml / 9%</li>
            <li>
              제품특징 : 자연의 맛 그대로, 소중한 분과 함께하는 고품격 프리미엄
              막걸리 쌀은 원래 달다는 합성감미료를 전혀 사용하지 않고 오직
              국내산 쌀로만 단맛을 구현한 프리미엄 막걸리입니다. 쌀은원래 달다는
              이화주 전통방식을 현대적으로 재해석하여 맛과 풍미가 가득한
              생막걸리입니다.
            </li>
          </ul>
        </div>
      </div>

      <div>
        <div class="alcohol_img">
          <img src="./images/alcohol/소성주.jpeg" />
        </div>
        <div class="alcohol_txt">
          <div class="alcohol_title">소성주</div>
          <ul class="alcohol_info">
            <li>제조사 : 인천탁주</li>
            <li>
              주원료 : 정제수, 쌀(국내산), 국(밀함유), 팽화미(국내산), 올리고당,
              효모, 아스파담(감미료, 페닐알라딘 함유), 구연산
            </li>
            <li>규격/도수 : 750ml / 6%</li>
            <li>
              제품특징 : 소성주플러스 막걸리는 국내산 쌀과 한국 식품 연구원
              우리술 연구팀과 공동개발한 국내산. 전통 누룩의 우수효모로 만든
              인천탁주에서 개발한 프리미엄.
            </li>
          </ul>
        </div>
      </div>

      <div>
        <div class="alcohol_img"><img src="./images/alcohol/삼해주.jpg" /></div>
        <div class="alcohol_txt">
          <div class="alcohol_title">삼해주</div>
          <ul class="alcohol_info">
            <li>제조사 : 선인양조</li>
            <li>주원료 : 양주쌀, 누룩, 정제수</li>
            <li>규격/도수 : 500ml / 15%</li>
            <li>
              제품특징 : 삼해 주는 고려 시대부터 이어져 온 서울지역의
              전통주입니다. 원래 궁중에서 의식이나 행사 사용하거나 사대부 집안의
              가양주로 애용되다가 조선시대에 큰 사랑을 받았습니다. 15도 도수가
              느껴지지 않을 만큼 부드러우며 단맛, 신맛 등이 적당히 잘 어우러지고
              뒷맛도 깔끔합니다.
            </li>
          </ul>
        </div>
      </div>

      <div>
        <div class="alcohol_img">
          <img src="./images/alcohol/홍매반개주.jpg" />
        </div>
        <div class="alcohol_txt">
          <div class="alcohol_title">홍매 반개주</div>
          <ul class="alcohol_info">
            <li>제조사 : 술빚는 전가네</li>
            <li>
              주원료 : 포천쌀45.02%,국산팥4.5%,전가네 누로룩4.5%,정제수45.98%.
            </li>
            <li>규격/도수 : 500ml / 15%</li>
            <li>
              제품특징 : 팥을 원료로 세 번 빚은 삼양주. 창경궁의 500년된 홍매가
              반쯤 피었을 때의 빛깔을 닮았다고 이름 붙인 약주이다.
            </li>
          </ul>
        </div>
      </div>

      <div>
        <div class="alcohol_img">
          <img src="./images/alcohol/산정호수.jpg" />
        </div>
        <div class="alcohol_txt">
          <div class="alcohol_title">산정호주</div>
          <ul class="alcohol_info">
            <li>제조사 : 술빚는 전가네</li>
            <li>
              주원료 : 포천쌀45.02%,흑미찹쌀4.5%,전가네 누로룩4.5%,정제수45.9%.
            </li>
            <li>규격/도수 : 500ml / 15%</li>
            <li>
              제품특징 : 흑미 찹쌀로 빚은 삼양주. 마치 가을 산정호수에 비친 붉은
              단풍이 연상되는 빛과 달달한 맛에 그윽한 향이 있는 술이다.
            </li>
          </ul>
        </div>
      </div>

      <div>
        <div class="alcohol_img"><img src="./images/alcohol/보령주.jpg" /></div>
        <div class="alcohol_txt">
          <div class="alcohol_title">보령주</div>
          <ul class="alcohol_info">
            <li>제조사 : 영농조합법인 보령전통주</li>
            <li>주원료 : 정제수,백미(국내산)12%,찹쌀(국내산)37%,누록(밀)</li>
            <li>규격/도수 : 750ml / 15%</li>
            <li>
              제품특징 : 저온에서 충분히 발효 숙성되어 부드러운 맛과 깔끔한
              청량감을 느낄 수 있는 전통주 고유의 맛과 향을 느낄 수 있습니다.
            </li>
          </ul>
        </div>
      </div>

      <div>
        <div class="alcohol_img">
          <img src="./images/alcohol/대담1호약주.jpg" />
        </div>
        <div class="alcohol_txt">
          <div class="alcohol_title">대담 1호 약주</div>
          <ul class="alcohol_info">
            <li>제조사 : 대밭고을</li>
            <li>주원료 : 국산 쌀, 국산 전통 누룩, 물, 대잎</li>
            <li>규격/도수 : 500ml / 15%</li>
            <li>
              제품특징 : 막걸리 단맛을 내는 인공감미료(아스파탐) 사용하지
              않습니다. 오로지 쌀의 단맛으로만 맛을 낸 대밭고을의 약주입니다.
            </li>
          </ul>
        </div>
      </div>

      <div>
        <div class="alcohol_img">
          <img src="./images/alcohol/화전일취.jpg" />
        </div>
        <div class="alcohol_txt">
          <div class="alcohol_title">화전 일취</div>
          <ul class="alcohol_info">
            <li>제조사 : 농업회사법인주식회사지시울</li>
            <li>주원료 : 쌀,누룩,정제수,꽃22종</li>
            <li>규격/도수 : 500ml / 18%</li>
            <li>
              제품특징 : 화전일취18 백화 제조는 일 년 내내, 꽃이 피는 사계절
              동안 양조장에서 피어나는 꽃들을 따 모아 말리는 것부터 시작합니다.
              다양한 꽃을 넣어 한 모금 한 모금이 꽃을 머금은 듯한 풍미를 줍니다.
            </li>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>