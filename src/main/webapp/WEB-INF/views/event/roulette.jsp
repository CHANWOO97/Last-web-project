<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../setting/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>룰렛 이벤트</title>
  <link rel="stylesheet" href="/resources/css/event.css">
</head>
<body>
<h1>아이묭 굿즈 이벤트 룰렛</h1>
<div class="roulette_container">
  <div class="roulette_screen">
    <div class="point">
      <img src="/resources/images/event_photo/pointer.png" alt="포인터">
    </div>
    <div class="roulette_box">
      <div id="rouletteWheel" class="roulette-wheel">
        <img src="/resources/images/event_photo/roulette.jpg" alt="룰렛 이미지">
      </div>
    </div>
    <div id="spinBtn" class="spin-area"></div>
  </div>

  <div id="resultModal" class="modal">
    <div class="result_text">
      <h3 id="resultText">당첨 결과</h3>
      <img id="resultImg" src=""><br><br>
      <button onclick="closeModal()">확인</button>
    </div>
  </div>
</div>
<video class="reels-video" controls preload="metadata" poster="/resources/images/event_photo/aim01.jpg">
  <source src="/resources/images/event_photo/aim04.mp4" type="video/mp4">
  브라우저가 비디오 태그를 지원하지 않습니다.
</video>
<script>
const spinBtn = document.getElementById("spinBtn");
const roulette = document.getElementById("rouletteWheel");
const modal = document.getElementById("resultModal");
const resultText = document.getElementById("resultText");
const resultImg = document.getElementById("resultImg");

const PRIZE_NAMES = ["보스턴백", "재떨이", "후드집업", "꽝","티셔츠 (블랙)", "수건", "티셔츠 (화이트)", "AIMTAG 세트"];
const startOffset = 30;
let totalRotation = 0;
let spinning = false;

spinBtn.addEventListener("click", handleSpin);

function handleSpin() {
  if (spinning) return;
  spinning = true;
  spinBtn.style.pointerEvents = "none";

  fetch("/event/spin", {
    method: "POST",
    headers: { "Content-Type": "application/json" }
  })
    .then(res => res.json())
    .then(handleResult)
    .catch(err => {
      alert("오류가 발생했습니다.");
      console.error(err);
      spinning = false;
      spinBtn.style.pointerEvents = "auto";
    });
}

function handleResult(data) {
  console.log("[🎯 서버 응답 데이터]", data);
  if (!data.success) {
    alert(data.message);
    spinning = false;
    spinBtn.style.pointerEvents = "auto";
    return;
  } 

  const index = PRIZE_NAMES.indexOf(data.itemName);
  const degPer = 360 / PRIZE_NAMES.length;
  const baseDeg = 360 - index * degPer - degPer / 2 + startOffset;      // 정중앙 정렬용
  totalRotation = 360 * (5 + Math.floor(Math.random() * 3)) + baseDeg;

  // 🔥 회전 초기화 위치 설정 (일부러 멀리 시작 → transition 강제 트리거)
  roulette.style.transition = "none";
  roulette.style.transform = "rotate(" + (totalRotation - 720).toFixed(2) + "deg)";
	
	//2. 살짝 늦춰서 애니메이션 트리거 (프레임 분리)
  setTimeout(() => {
    roulette.style.transition = "transform 4s ease-out";
    roulette.style.transform = "rotate(" + totalRotation.toFixed(2) + "deg)";
  }, 0);

  setTimeout(() => {
    resultText.innerText = data.itemName === "꽝" ? "꽝! 다음 기회에!" : `🎉 ${data.itemName} 당첨!`;
    resultImg.src = "/resources/images/event_photo/" + data.photo;
    modal.style.display = "flex";
    spinning = false;
    spinBtn.style.pointerEvents = "auto";
  }, 4250);
}

function closeModal() {
  modal.style.display = "none";
}

document.addEventListener("keydown", (e) => {
  if (e.key === "Escape") closeModal();
});
</script>
</body>
</html>
