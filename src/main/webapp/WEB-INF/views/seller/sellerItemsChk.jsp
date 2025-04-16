<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.product-img {
	width: 60px;
	height: 60px;
	object-fit: cover;
	border-radius: 8px;
}

.table-hover tbody tr:hover {
	background-color: #f9f9f9;
}

.line-through {
	text-decoration: line-through;
	color: #dc3545; /* Bootstrap danger color */
}

.admin-delete-msg {
	font-size: 0.85rem;
	color: #dc3545;
	margin-top: 4px;
}
</style>
<script>
	function chk(message) {
		return confirm(message); // 확인 누르면 true, 취소 누르면 false
	}
</script>
<body>
	<div class="container mt-5">
		<h3 class="mb-4 text-primary">📦 내가 등록한 상품</h3>
		<table class="table table-bordered table-hover align-middle text-center">
			<thead class="table-light">
				<tr>
					<th>상품코드</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>사이즈</th>
					<th>재고</th>
					<th>가격</th>
					<th>등록일</th>
					<th>수정</th>
					<th>삭제</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${myItems}">
					<tr>
						<td>${item.i_id}</td>
						<td><img src="/resources/images/items_photo/${item.photo}" alt="상품 이미지" class="product-img"></td>

						<!-- 상품명 + 삭제문구 -->
						<td class="text-start"><c:choose>
								<c:when test="${item.deleted}">
									<div class="line-through">${item.name}</div>
									<div class="admin-delete-msg">관리자에 의해 상품이 삭제되었습니다.</div>
								</c:when>
								<c:otherwise>
					           	 ${item.name}
					          	</c:otherwise>
							</c:choose></td>

						<td>${item.size}</td>
						<td>${item.stock}</td>
						<td><strong> <fmt:formatNumber value="${item.price}" type="number" groupingUsed="true" />원
						</strong></td>
						<td><fmt:formatDate value="${item.reg_date}" pattern="yyyy-MM-dd" /></td>
						<td><a href="/seller/itemsUpdateForm?i_id=${item.i_id}" class="btn btn-sm btn-outline-primary">수정</a></td>
						<td><a href="/seller/itemsDelete?i_id=${item.i_id}" class="btn btn-sm btn-outline-danger" onclick="return chk('정말 삭제하시겠습니까?');">삭제</a></td>
						<!-- 등록상태 -->
						<td><span class="${item.deleted? 'text-danger fw-bold' : 'text-success fw-bold'}"> 
						${item.deleted? '삭제됨' : '등록중'} </span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="mt-4 d-flex justify-content-end gap-2">
			<a href="/seller/sellerItmes?sr_id=${sr_id}" class="btn btn-success">상품등록</a> <a href="/layout/home" class="btn btn-secondary">홈으로</a>
		</div>

		<!-- 페이지네이션 -->
		<nav>
			<ul class="pagination justify-content-center mt-4">

				<!-- 이전 버튼 -->
				<c:choose>
					<c:when test="${currentPage <= 1}">
						<li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="?sr_id=${sr_id}&page=${currentPage - 1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:otherwise>
				</c:choose>

				<!-- 숫자 페이지 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link" href="/seller/sellerItemsChk?sr_id=${sr_id}&page=${i}">${i}</a></li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:choose>
					<c:when test="${currentPage >= totalPage}">
						<li class="page-item disabled"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="?sr_id=${sr_id}&page=${currentPage + 1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</nav>
	</div>
</body>
</html>