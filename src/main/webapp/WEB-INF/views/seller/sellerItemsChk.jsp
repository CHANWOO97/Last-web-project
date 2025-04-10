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
</style>
<script>
  function chk(message) {
    return confirm(message); // 확인 누르면 true, 취소 누르면 false
  }
</script>
</head>
<body>
	<div class="container mt-5">
		<h3 class="mb-4 text-primary">📦 내가 등록한 상품</h3>
		<table class="table table-bordered table-hover align-middle text-center">
			<thead class="table-light">
				<tr>
					<th>상품코드</th><th>이미지</th><th>상품명</th><th>사이즈</th>
					<th>재고</th><th>가격</th><th>등록일</th><th>수정</th><th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${myItems}">
					<tr>
						<td>${item.i_id}</td>
						<td><img src="/resources/images/items_photo/${item.photo}" alt="상품 이미지" class="product-img"></td>
						<td class="text-start">${item.name}</td>
						<td>${item.size}</td>
						<td>${item.stock}</td>
						<td><strong><fmt:formatNumber value="${item.price}" type="number" groupingUsed="true" />원</strong></td>
						<td><fmt:formatDate value="${item.reg_date}" pattern="yyyy-MM-dd" /></td>
						<td><a href="/seller/itemsUpdateForm?i_id=${item.i_id}" class="btn btn-sm btn-outline-primary">수정</a></td>
						<td><a href="/seller/itemsDelete?i_id=${item.i_id}" class="btn btn-sm btn-outline-danger" onclick="return chk('정말 삭제하시겠습니까?');">삭제</a></td>
					</tr>
				</c:forEach>
				<c:if test="${empty myItems}">
					<tr>
						<td colspan="9" class="text-center text-muted">등록된 상품이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<div class="mt-4 d-flex justify-content-end gap-2">
			<a href="/layout/home" class="btn btn-secondary">홈으로</a>
		</div>
	</div>
</body>
</html>