<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 | Lupang</title>
</head>
<body class="bg-light">

	<div class="container py-5">
		<h1 class="fw-bold mb-4">
			<a href="/" class="text-decoration-none text-dark">Lupang</a>
		</h1>
		<div class="bg-white p-5 rounded shadow-sm">

			<!-- 주문 완료 메시지 -->
			<c:choose>	
				<c:when test="${sale.s_status == 'n'}">
					<h2 class="text-danger fw-bold mb-4 text-center">❌ 주문이 취소 되었습니다.</h2>
				</c:when>
				<c:otherwise>
					<h2 class="text-success fw-bold mb-4 text-center">✅ 주문이 완료되었습니다!</h2>
				</c:otherwise>
			</c:choose>    		  			
			<!-- 주문 정보 -->
			<!-- 주문 정보 카드 -->
			<div class="card border-0 shadow-sm mb-4">
				<div class="card-header bg-primary text-white fw-bold">
					<i class="bi bi-info-circle-fill me-2"></i> 주문 정보
				</div>
				<div class="card-body">
					<ul class="list-group list-group-flush">
						<li class="list-group-item"><strong>주문번호:</strong> <span
							class="text-primary">${sale.s_id}</span></li>
						<li class="list-group-item"><strong>수령인:</strong>
							${sale.receiver}</li>
						<li class="list-group-item"><strong>연락처:</strong> ${sale.tel}
						</li>
						<li class="list-group-item"><strong>배송 주소:</strong>
							${sale.address}</li>
						<li class="list-group-item"><strong>주문일자:</strong> <fmt:formatDate
								value="${sale.s_date}" pattern="yyyy-MM-dd HH:mm:ss" /></li>
						<li class="list-group-item"><strong>배송 상태:</strong> <c:choose>
								<c:when test="${sale.s_status == 'y'}">
									<span class="badge bg-warning text-dark">배송준비중</span>
								</c:when>
								<c:when test="${sale.s_status == 'd'}">
									<span class="badge bg-info text-dark">📦 배송중</span>
								</c:when>
								<c:when test="${sale.s_status == 'f'}">
									<span class="badge bg-success">✅ 배송완료</span>
								</c:when>
								<c:otherwise>
									<span class="badge bg-secondary">미결제</span>
								</c:otherwise>
							</c:choose></li>
					</ul>
				</div>
			</div>

			<!-- 주문 상품 목록 -->
			<div class="mb-4">
				<h5 class="fw-bold">🛍 주문 상품</h5>
				<c:set var="total" value="0" />
				<c:forEach var="item" items="${saleItems}">
					<c:set var="itemTotal" value="${item.price * item.quantity}" />
					<c:set var="total" value="${total + itemTotal}" />
					<div class="d-flex align-items-center border rounded p-3 mb-2">
						<img src="/resources/images/items_photo/${item.photo}" width="80"
							class="me-3 rounded">
						<div class="flex-grow-1">
							<div class="fw-bold">${item.name}</div>
							<div>${item.price}원× ${item.quantity}개</div>
						</div>
						<div class="fw-bold text-end" style="width: 100px;">
							<fmt:formatNumber value="${itemTotal}" />
							원
						</div>
					</div>
				</c:forEach>
			</div>

			<!-- 총 금액 -->
			<div class="text-end fs-5">
				<strong>총 결제금액: <span class="text-primary fw-bold"><fmt:formatNumber
							value="${total}" />원</span>
				</strong>
			</div>

			<!-- 버튼 -->
			<div class="text-center mt-4">
				<a href="/" class="btn btn-outline-secondary px-4 me-2">홈으로</a> <a
					href="/itemsOrder/orderList" class="btn btn-primary px-4">주문목록</a>
				<c:if test="${sale.s_status == 'n'}">
    				<a href="/itemsOrder/pay?saleId=${sale.s_id}" class="btn btn-danger">💳 결제하기</a>
  				</c:if>
			</div>

		</div>
	</div>

</body>
</html>
