<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록 | 마이페이지</title>
</head>
<body class="bg-light">
	<div class="container py-5">
		<h1 class="fw-bold mb-4" style="max-width: 960px; margin: 0 auto;">
			<a href="/" class="text-decoration-none text-dark">Lupang</a>
		</h1>
		<div class="col-lg-10 mx-auto bg-white p-5 shadow rounded-4">

			<h2 class="fw-bold mb-4">📦 주문 목록</h2>

			<c:forEach var="order" items="${orderList}">
				<div class="card mb-3 shadow-sm">
					<div class="card-body d-flex align-items-center">
						<img src="/resources/images/items_photo/${order.photo}"
							width="80" class="me-4 rounded">
						<div class="flex-grow-1">
							<h5 class="fw-bold">${order.name}</h5>
							<div class="text-muted">
								주문일시: <fmt:formatDate value="${order.s_date}" pattern="yyyy-MM-dd HH:mm:ss" />
							</div>
							<div class="text-danger fw-semibold">
								총 금액: <fmt:formatNumber value="${order.total}" type="number" /> 원
							</div>
						</div>
						<div>
							<a href="/mypage/orderDetail?saleId=${order.s_id}"
								class="btn btn-outline-primary btn-sm">상세보기</a>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="text-end mt-4">
				<a href="/" class="btn btn-secondary px-4">🏠 홈으로</a>
			</div>
		</div>
		<!-- 페이지네이션 -->
		<nav>
			<ul class="pagination justify-content-center mt-4">

				<!-- 이전 버튼 -->
				<c:choose>
					<c:when test="${currentPage <= 1}">
						<li class="page-item disabled"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="?ic_id=${ic_id}&page=${currentPage - 1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

				<!-- 숫자 페이지 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a
						class="page-link" href="?ic_id=${ic_id}&page=${i}">${i}</a></li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:choose>
					<c:when test="${currentPage >= totalPage}">
						<li class="page-item disabled"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="?ic_id=${ic_id}&page=${currentPage + 1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</nav>
	</div>
</body>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</html>