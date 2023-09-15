// --------------- map ---------------
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
  mapOption = {
    center: new kakao.maps.LatLng(35.24423653345124, 129.08873580149654), // 지도의 중심좌표
    level: 3, // 지도의 확대 레벨
    mapTypeId: kakao.maps.MapTypeId.ROADMAP, // 지도종류
  };

// 지도를 생성한다
var map = new kakao.maps.Map(mapContainer, mapOption);

var mapData = [
  // 0, 1: 지도 좌표
  // 2: 번호  3: 가게 명  4: 위치
  // 5: 카테고리  6: 해쉬
  // 7: 가게 이미지
  // 8: 점수  9: 평점  10: 리뷰 수  11: 찜 수

  [
    35.24423653345124,
    129.08873580149654,
    '1',
    '몰틀리',
    '구서',
    '살얼음맥주',
    '#회식장소, #분위기좋은, #칸막이',
    '몰틀리_구서.png',
    15,
    '0.0',
    0,
    0,
  ],
  [
    35.24591002450552,
    129.08862769480083,
    '2',
    '호맥',
    '구서',
    '맥주, 호프',
    '#배달, #포장',
    '호맥_구서.jpeg',
    15,
    '0.0',
    0,
    0,
  ],
  [
    35.24409924235264,
    129.08938037018723,
    '3',
    '쉼, 어묵 그리고 한잔 술',
    '구서',
    '어묵, 오뎅바',
    '#회식, #배달, #깔끔한, #단체석',
    '쉼_구서.jpeg',
    15,
    '0.0',
    0,
    0,
  ],
  [
    35.244972444425336,
    129.08917210040258,
    '4',
    '역전할머니맥주',
    '구서',
    '맥주, 호프',
    '#맛있는안주, #포장',
    '역전할머니맥주_구서.jpeg',
    15,
    '0.0',
    0,
    0,
  ],
  [
    35.24339226618811,
    129.0879205125658,
    '5',
    '옥수관',
    '구서',
    '곰탕, 한우곰탕',
    '#몸보신, #소주, #칸막이',
    '옥수관_구서.jpeg',
    42,
    '4.7',
    3,
    5,
  ],
  [
    35.24403232635263,
    129.08947202189066,
    '6',
    '해리의 집',
    '구서',
    '삼겹살, 더덕삼겹살',
    '#소주, #아늑한',
    '해리의집_구서.jpeg',
    15,
    '0.0',
    0,
    0,
  ],
  [
    35.244758159203506,
    129.0885349825838,
    '7',
    '마파람해물찜해물탕',
    '구서',
    '해물찜, 해물탕',
    '#식사모임, #무료주차, #배달, #깔끔한',
    '마파람해물찜해물탕_구서.jpeg',
    44,
    '4.4',
    3,
    6,
  ],
];

for (var i = 0; i < mapData.length; i++) {
  // 지도에 마커를 생성하고 표시한다
  var marker = new kakao.maps.Marker({
    position: new kakao.maps.LatLng(mapData[i][0], mapData[i][1]), // 마커의 좌표
    map: map, // 마커를 표시할 지도 객체
  });

  // 커스텀 오버레이를 생성합니다
  var customOverlay = new kakao.maps.CustomOverlay({
    position: new kakao.maps.LatLng(mapData[i][0], mapData[i][1]),
    content: `<div class="marker" id="marker${i}">
                <div class="marker__bar"></div>
                <div class="marker__point">
                  <span class="marker__number">${mapData[i][2]}</span>
                </div>
                <div class="marker__container">
                  <div class="marker__title">${mapData[i][3]}</div>
                  <div class="marker__category">${mapData[i][5]}</div>
                </div>
              </div>`,
  });

  // 커스텀 오버레이를 지도에 표시합니다
  customOverlay.setMap(map);
}

// --------------- list element ---------------
const listContainer = document.getElementById('list');

for (let i = 0; i < mapData.length; i++) {
  const listBox = document.createElement('div');
  listBox.className = 'list__box';
  listBox.id = `list__box${i}`;
  const listContent = document.createElement('div');
  listContent.className = 'list__content';

  const listImg = document.createElement('div');
  listImg.className = 'list__img';
  const image = document.createElement('img');
  image.src = `./images/map/${mapData[i][7]}`;
  listImg.appendChild(image);
  listContent.appendChild(listImg);

  const listInfo = document.createElement('div');
  listInfo.className = 'list__info';
  const listTitle = document.createElement('div');
  listTitle.className = 'list__title';
  listTitle.innerText = `${mapData[i][2]}. ${mapData[i][3]}`;
  const listCategory = document.createElement('div');
  listCategory.className = 'list__category';
  listCategory.innerText = mapData[i][5];
  const listHash = document.createElement('div');
  listHash.className = 'list__hash';
  listHash.innerHTML = mapData[i][6];
  const listRate = document.createElement('div');
  listRate.className = 'list__rate';

  const rate1 = document.createElement('div');
  rate1.className = 'rate1';
  rate1.innerHTML = `${mapData[i][8]}<span>점</span>`;
  const rate2 = document.createElement('div');
  rate2.className = 'rate2';
  rate2.innerText = `${mapData[i][9]} (${mapData[i][10]}명)`;
  const rate3 = document.createElement('div');
  rate3.className = 'rate3';
  rate3.innerText = `${mapData[i][11]}`;
  listRate.appendChild(rate1);
  listRate.appendChild(rate2);
  listRate.appendChild(rate3);

  listInfo.appendChild(listTitle);
  listInfo.appendChild(listCategory);
  listInfo.appendChild(listHash);
  listInfo.appendChild(listRate);
  listContent.appendChild(listInfo);

  listBox.appendChild(listContent);
  listContainer.appendChild(listBox);
}

// --------------- marker event ---------------
for (let i = 0; i < mapData.length; i++) {
  for (let j = 0; j < mapData.length; j++) {
    let marker = document.getElementById(`marker${i}`);
    let markerBar = document.getElementsByClassName('marker__bar');
    let markerPoint = document.getElementsByClassName('marker__point');
    let markerContainer = document.getElementsByClassName('marker__container');
    let listBox = document.getElementById(`list__box${j}`);

    marker.addEventListener('click', (event) => {
      if (i === j) {
        markerBar[i].style.backgroundColor = 'rgb(255, 93, 75)';
        markerPoint[i].style.backgroundColor = 'rgb(255, 93, 75)';
        markerContainer[i].style.border = '1px solid rgb(255, 93, 75)';

        listBox.style.backgroundColor = '#f5f5f5';
        listBox.scrollIntoView({ behavior: 'smooth', block: 'center' });
      } else {
        markerBar[j].style.backgroundColor = 'rgb(36, 95, 198)';
        markerPoint[j].style.backgroundColor = 'rgb(36, 95, 198)';
        markerContainer[j].style.border = '1px solid rgb(14, 61, 144)';

        listBox.style.backgroundColor = '';
      }
    });

    marker.addEventListener('mouseover', (event) => {
      event.currentTarget.parentNode.style.zIndex = '100';
    });

    marker.addEventListener('mouseleave', (event) => {
      event.currentTarget.parentNode.style.zIndex = '1';
    });
  }
}

// --------------- search ---------------
const xMark = document.getElementById('xmark');
const searchTxt = document.getElementById('searchtxt');

xMark.addEventListener('click', () => {
  searchTxt.value = '';
});

/* 자동완성 */
// prettier-ignore
const searchList = [
  '몰틀리', '호맥', '쉼, 어묵 그리고 한잔 술', '역전할머니맥주', '옥수관',
  '해리의 집', '마파람해물찜해물탕'
];
const autoComplete = document.querySelector('.autocomplete');
const blackBoard = document.querySelector('.blackboard');

searchTxt.addEventListener('click', () => {
  autoComplete.style.display = 'block';
  blackBoard.style.display = 'block';
});

blackBoard.addEventListener('click', () => {
  autoComplete.style.display = 'none';
  blackBoard.style.display = 'none';
  searchTxt.value = '';
});

let nowIndex = 0;

searchTxt.onkeyup = (event) => {
  // 검색어
  const value = searchTxt.value.trim();

  // 자동완성 필터링
  const matchDataList = value
    ? searchList.filter((label) => includeByCho(value, label))
    : [];

  switch (event.keyCode) {
    // UP KEY
    case 38:
      nowIndex = Math.max(nowIndex - 1, 0);
      break;

    // DOWN KEY
    case 40:
      nowIndex = Math.min(nowIndex + 1, matchDataList.length - 1);
      break;

    // ENTER KEY
    case 13:
      searchTxt.value = matchDataList[nowIndex] || '';

      // 초기화
      nowIndex = 0;
      matchDataList.length = 0;
      break;

    // 그외 다시 초기화
    default:
      nowIndex = 0;
      break;
  }

  // 리스트 보여주기
  showList(matchDataList, value, nowIndex);
};

const showList = (data, value, nowIndex) => {
  // 초성 정규식으로 변환
  const regex = makeRegexByCho(value);

  autoComplete.innerHTML = data
    .map(
      (label, index) => `
      <div class='${nowIndex === index ? 'active' : ''}'>
        ${label.replace(regex, '<mark>$1</mark>')}
      </div>
    `
    )
    .join('');
};

// prettier-ignore
const CHO_HANGUL = [
  'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ',
  'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ',
];

const HANGUL_START_CHARCODE = '가'.charCodeAt();

const CHO_PERIOD = Math.floor('까'.charCodeAt() - '가'.charCodeAt());
const JUNG_PERIOD = Math.floor('개'.charCodeAt() - '가'.charCodeAt());

function combine(cho, jung, jong) {
  return String.fromCharCode(
    HANGUL_START_CHARCODE + cho * CHO_PERIOD + jung * JUNG_PERIOD + jong
  );
}

// 초성검색
function makeRegexByCho(search = '') {
  const regex = CHO_HANGUL.reduce(
    (acc, cho, index) =>
      acc.replace(
        new RegExp(cho, 'g'),
        `[${combine(index, 0, 0)}-${combine(index + 1, 0, -1)}]`
      ),
    search
  );

  return new RegExp(`(${regex})`, 'g');
}

function includeByCho(search, targetWord) {
  return makeRegexByCho(search).test(targetWord);
}
