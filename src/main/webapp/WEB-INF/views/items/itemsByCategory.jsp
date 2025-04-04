<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<style>
.card-text.description {
	font-size: 0.9rem;
	color: #666;
	height: 45px;
	overflow: hidden;
}

.card-img-top {
	height: 200px;
	object-fit: cover;
}
</style>
</head>
<body>
<c:if test="${not empty id }">
	<%@ include file="../layout/headerLoginHome.jsp" %>
</c:if>
<c:if test="${empty id }">
	<%@ include file="../layout/headerHome.jsp" %>
</c:if>

	<div class="container mt-4">
		<h2>${ic_name }</h2>
		<c:choose>
			<c:when test="${empty itemList}">
				<div class="text-center py-5">
					<i class="bi bi-emoji-frown fs-1 text-muted"></i>
					<p class="mt-3 fs-5">해당 카테고리에 등록된 상품이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="row row-cols-1 row-cols-md-3 g-4">
					<c:forEach var="item" items="${itemList}">
						<div class="col">
							<div class="card h-100">
								<img src="/resources/images/items_photo/${item.photo}" class="card-img-top" alt="${item.name}">
								<div class="card-body">
									<h5 class="card-title">${item.name}</h5>
									<p class="card-text description">${item.description}</p>
									<p class="card-text fw-bold text-danger">${item.price}원</p>
									<a href="/items/itemsDetail?i_id=${item.i_id}"
										class="btn btn-outline-primary btn-sm">상세보기</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
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
</html>