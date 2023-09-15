function submitSearch() {
  var searchInput = document.getElementById("url-b824").value;
  if (searchInput.trim() === "") {
      return; // 검색어가 빈 칸이면 작동 취소
  }

var searchUrl = "https://www.google.com/search?q=" + encodeURIComponent(searchInput);
  window.location.href = searchUrl;
}  

// Enter 키를 누를 때 submit 버튼 동작과 같도록 처리
document.getElementById("url-b824").addEventListener("keydown", function (event) {
  if (event.key === "Enter") {
      event.preventDefault(); // 기본 동작(새로고침) 방지
      submitSearch();
  }
});
// 페이지 로드 시 검색어 초기화
document.addEventListener("DOMContentLoaded", function () {
  document.getElementById("url-b824").value = "";
});
// 페이지 이동 시 검색어 초기화
window.addEventListener("unload", function () {
  document.getElementById("url-b824").value = "";
});