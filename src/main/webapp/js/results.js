import { results, mbtis } from './data.js'


const mbti = new URLSearchParams(location.search).get('mbti')
const result = results[mbtis[mbti]]


const titleEl = document.querySelector('.page-title')
const characterEl = document.querySelector('.character')
const boxEls = document.querySelectorAll('.box')
const recEls = document.querySelectorAll('.rec')
const lectureEl = document.querySelector('.lecture')



titleEl.innerHTML = result.title
characterEl.src = result.character
boxEls.forEach(function (boxEl, index) {
  boxEl.innerHTML = result.results[index]
})
recEls.forEach(function (recEl, index) {
  recEl.innerHTML = result.recs[index]
})
lectureEl.href = result.lectureUrl
lectureImgEl.src = result.lectureImg
