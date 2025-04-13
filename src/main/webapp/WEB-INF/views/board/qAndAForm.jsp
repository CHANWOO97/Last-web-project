<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.faq-container {
	max-width: 800px;
	margin: 60px auto;
}

.accordion-button {
	font-weight: 500;
}

.accordion-button::after {
	font-size: 1rem;
}

.accordion-item {
	border-radius: 10px;
	overflow: hidden;
	margin-bottom: 15px;
	border: 1px solid #dee2e6;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.04);
}

.accordion-button:not(.collapsed) {
	background-color: #e9f3ff;
	color: #0d6efd;
}
</style>
</head>
<body>
	<%@ include file="../layout/headerLoginBoardHome.jsp"%>
	<div class="container faq-container">
		<h3 class="mb-4 text-primary">
			<i class="bi bi-question-circle-fill"></i> 자주 묻는 질문 (FAQ)
		</h3>

		<div class="accordion" id="faqAccordion">

			<div class="accordion-item">
				<h2 class="accordion-header" id="heading1">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1">🚚 배송은 얼마나 걸리나요?</button>
				</h2>
				<div id="collapse1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
					<div class="accordion-body">
						보통 <strong>1~3일 내</strong>에 도착합니다. 도서산간 지역은 추가 소요될 수 있습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="heading2">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2">🔄 교환/반품은 어떻게 하나요?</button>
				</h2>
				<div id="collapse2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
					<div class="accordion-body">
						마이쿠팡 &gt; 주문목록에서 <strong>교환/반품 신청</strong>을 할 수 있습니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="heading3">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3">❌ 주문 취소는 어떻게 하나요?</button>
				</h2>
				<div id="collapse3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
					<div class="accordion-body">
						결제 완료 후 <strong>배송 전 상태</strong>에서는 주문목록에서 취소가 가능합니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="heading4">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4">👤 회원 탈퇴는 어떻게 하나요?</button>
				</h2>
				<div id="collapse4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
					<div class="accordion-body">
						마이쿠팡 &gt; 마이페이지에서 <strong>탈퇴하기</strong> 버튼을 누르시면 됩니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="heading5">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse5">🏡 배송지를 변경하고 싶어요.</button>
				</h2>
				<div id="collapse5" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
					<div class="accordion-body">
						배송 준비 상태 전까지는 <strong>주문목록</strong>에서 주소 변경이 가능합니다.
					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="heading6">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse6">🙋 비회원도 주문이 가능한가요?</button>
				</h2>
				<div id="collapse6" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
					<div class="accordion-body">
						아니오, 비회원은 주문할 수 없습니다. 단, 상품은 확인 할 수 있습니다.
					</div>
				</div>
			</div>
			<div class="d-flex justify-content-end gap-2">
				<a href="javascript:history.back()" class="btn btn-secondary">뒤로가기</a>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>