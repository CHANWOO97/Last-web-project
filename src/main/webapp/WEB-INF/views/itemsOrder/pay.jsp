<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>결제하기 | Lupang</title>
  <%@ include file="../setting/include.jsp"%>
  <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> <!-- 아임포트 JS SDK -->
</head>
<body class="bg-light">

<div class="container py-5">
  <div class="bg-white p-5 rounded shadow-sm">

    <h2 class="mb-4 text-success fw-bold">💳 결제하기</h2>

    <!-- 주문 정보 -->
    <div class="mb-4">
      <p><strong>주문번호:</strong> ${s_id}</p>
      <p><strong>총 결제금액:</strong>
        <span class="text-primary fs-4"><fmt:formatNumber value="${sale.total}" />원</span></p>
    </div>

    <!-- 결제 수단 선택 -->
    <div class="mb-4">
      <label class="form-label fw-bold">결제 수단을 선택해주세요</label>
      <div class="d-flex gap-2">
        <input type="button" class="btn btn-outline-secondary pg-btn" data-pg="kakaopay" value="카카오페이">
        <input type="button" class="btn btn-outline-secondary pg-btn" data-pg="tosspayments" value="토스">
        <input type="button" class="btn btn-outline-secondary pg-btn" data-pg="html5_inicis" value="카드결제">
      </div>
    </div>

    <!-- 결제 실행 버튼 -->
    <div class="text-end mt-5">
      <input type="button" id="payBtn" class="btn btn-success px-4 py-2 fw-bold" value="✅ 결제하기">     
    </div>

  </div>
</div>

<!-- 최신 SDK만 유지 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
const IMP = window.IMP;
IMP.init("imp11142041"); // 아임포트 가맹점 식별코드

let selectedPG = "tosspayments"; // 기본값

// ✅ 결제 수단 선택 버튼 클릭 시 스타일 + PG 설정
document.querySelectorAll(".pg-btn").forEach(btn => {
  btn.addEventListener("click", function () {
    selectedPG = this.dataset.pg;

    document.querySelectorAll(".pg-btn").forEach(b =>
      b.classList.remove("btn-secondary", "text-white")
    );
    this.classList.add("btn-secondary", "text-white");
  });
});

// ✅ 결제 버튼 클릭
document.getElementById("payBtn").addEventListener("click", function () {
  const uid = "ORDER_" + new Date().getTime(); // 유니크 주문번호

  const paymentData = {
    pg: selectedPG,
    pay_method: "card",
    merchant_uid: uid,
    name: "Lupang 상품 결제",
    amount: ${sale.total},
    buyer_email: "${email}",
    buyer_name: "${sale.receiver}",
    buyer_tel: "${sale.tel}",
    buyer_addr: "${sale.address}",
   // m_redirect_url: "http://localhost:8080/itemsOrder/orderSuccess" // 모바일 리디렉션
    m_redirect_url:	"https://httpbin.org/get"
  };

  // ✅ 신모듈용 채널키 (토스, 유플 등)
  //if ("tosspayments".includes(selectedPG)) {
  //  paymentData.channelKey = "channel-key-928be15b-0c71-4947-8983-c9a62aaa2a4e"; 
  //}
  // 신모듈(m_redirect_url) 환경에서는 이 콜백 무시됨
  if (selectedPG === "tosspayments") {
	  paymentData.channelKey = "channel-key-928be15b-0c71-4947-8983-c9a62aaa2a4e"; 
  }
  // ✅ 결제 요청
  IMP.request_pay(paymentData, function (rsp) {
	 console.log("결제 요청 결과:", rsp);

    // 구버전 PG인 경우에만 콜백 확인
    if (rsp.success || rsp.imp_uid) {
    // 👉 imp_uid가 존재하면 결제 성공으로 간주
    const redirectUrl = "/itemsOrder/orderSuccess"
                      + "?saleId=${s_id}"
                      + "&imp_uid=" + rsp.imp_uid
                      + "&merchant_uid=" + rsp.merchant_uid;
    location.href = redirectUrl;
  } else {
    alert("결제가 실패했습니다: " + rsp.error_msg);
  }
  });
});
</script>
</body>
</html>