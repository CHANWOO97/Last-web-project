<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.product-card {
	border: 1px solid #dee2e6;
	border-radius: 10px;
	padding: 15px;
	transition: box-shadow 0.2s ease-in-out;
}

.product-card:hover {
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.product-img {
	width: 100%;
	height: 180px;
	object-fit: cover;
	border-radius: 8px;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<h3 class="mb-4">📦 내가 등록한 상품</h3>
		<div class="row g-4">
			<c:forEach var="item" items="${myItems}">
				<div class="col-md-4">
					<div class="product-card">
						<img src="/resources/images/item/${item.photo}" class="product-img mb-2" alt="상품 이미지">
						<h5>${item.name}</h5>
						<p class="text-muted">${item.size}/ ${item.stock}개 보유</p>
						<p>
							<strong>${item.price}원</strong>
						</p>
						<a href="/items/detail?i_id=${item.i_id}" class="btn btn-outline-primary btn-sm">상세 보기</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>