export const questions = [
  {
    number: '01',
    question: '나는 쉬는 시간에.... ',
    choices: [
      { text: '혼자서 술마시는게 꿀잼<br>', value: 'i' },
      { text: '친구들 불러서 왁자지껄 하게 놀기', value: 'e' }
    ]
  },
  {
    number: '02',
    question: '내일은 술을 잔득 먹기로 한 날, <br>전날 잠들기 전 나는?',
    choices: [
      { text: '할일은 다 했고<br> 숙취해소제 챙겨놔야지~', value: 's' },
      { text: '와 신난다<br> 오늘도 놀아야지 ', value: 'n' }
    ]
  },
  {
    number: '03',
    question: '술친구가 <br> 오늘은 거절을?',
    choices: [
      { text: '일하면서 많이 힘들었나?<br> 걱정되네.', value: 'f' },
      { text: '아 어제도 술먹었나<br>뭐하냐고 물어봐야지.', value: 't' }
    ]
  },
  {
    number: '04',
    question: '친구들과 오랜만에 만나기로 함! 나는?',
    choices: [
      { text: '오랜만에 만나는거니깐 장소가 중요해!<br>어디갈지 알아보자', value: 'j' },
      { text: '낼 근처에서 찾아보다가<br> 아무데나 들어가면 되겠지 ?', value: 'p' }
    ]
  },
  {
    number: '05',
    question: '첫 새 친구를 만난다!<br>나의 행동은?',
    choices: [
      { text: '안녕하세요ㅎㅎ 잘 부탁드려요~<br>(수줍수줍)', value: '' },
      { text: '안녕하세요! 저는 몇살이구요~,<br>MBTI는 ~~ (빨리 친해져야지) ', value: '' }
    ]
  },

]
export const results = [
  {
    title: '술 마실 날은<br>내가 정해!',
    character: 'images/game/img2.jpg',
    results: [
      '혼자서도 잘해요!',
      '무엇이든 잘하고 싶어요.<br>일중독 취미중독 여행중독!',
      '자유로운 술 분위기가 좋아요!<br>하지만 약속이 있으면 약속을 지켜요',
      '리더십 있다는 소리를 자주 들어요.<br>메뉴고르는데 거침없죠'
    ],
   // 맥주
    recs: ['라거', '위트에일']
  },
  {
    title: '술마시러 가자!!<br>추진력 업',
    character: 'images/game/img4.jpg',
    results: [
      '친구들의 멘탈 지킴이!<br>두루두루 친한 파워 인싸!',
      '술게임 술자리 이야기!<br>분위기 업!',
      '이벤트들은 빠질수 없죠', 
      '여러명이서 다양하게 마시는게 좋아요'
    ],// 동동주

    recs: ['동동주', '막걸리']
  },
  {
    title: '우리는 <br>낭만파!',
    character: 'images/game/img5.jpg',
    results: [
      '다양한 주제에 관심이 많아요.<br>모든 게 궁금해요!',
      '가끔 거절을 못해서 약속이 잡힐때가 있지만..!<br>괜찮아요~',
      '평소에 바쁘면 예민할때도 있지만,<br>술자리서 털어버리죠!',
      '맛있는 안주, 감성 주점도 좋아요'
    ], // 소주
    recs: ['처음처럼', '참이슬']
    
  },
  {
    title: '술자리<br>토크!',
    character: 'images/game/img3.jpg',
    results: [
      '다양한 주제에 관심이 많아요!',
      '술자리에서 진지한 이야기를 하면 즐거워요.',
      '꿈이 커요!<br>언젠간 집에 친구들을 초대해서 성대하게 놀꺼에요~',
      '누구랑 마시느냐가 중요해요 '
      
    ], // 와인
   
    recs: ['레드 와인', '화이트 와인']
  }
  
]
export const mbtis = {
  entj: 0,
  entp: 0,
  estp: 0,
  esfp: 0,
  esfj: 1,
  enfj: 1,
  infp: 2,
  isfp: 2,
  isfj: 2,
  infj: 2,
  estj: 3,
  istp: 3,
  intj: 3,
  intp: 3,
  istj: 3,
  enfp: 1
}
