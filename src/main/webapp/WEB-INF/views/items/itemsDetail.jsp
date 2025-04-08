<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기 | Lupang</title>
<style>
#qt {
	font-size: 18px;
}

#saleprice {
	font-size: 18px;
}
</style>
<script>
    function clk() {
      const price = parseInt(document.getElementById("product-info").dataset.price);
      const qty = parseInt(document.getElementById("quantity").value);
      document.getElementById("qt").innerText = qty;
      document.getElementById("saleprice").innerText = (price * qty).toLocaleString() + "원";
    }

    function innerCart() {
      const itemCode = "${items.i_id}";
      const quantity = parseInt(document.getElementById("quantity").value);
      $.post('/items/innerCart', 'i_id=' + itemCode + '&quantity=' + quantity, function(data) {
        alert(data);
      });
    }

    function submitOrder() {
      const itemCode = "${items.i_id}";
      const quantity = document.getElementById("quantity").value;
      const selectedItem = itemCode + "_" + quantity;
      document.getElementById("selectedItemInput").value = selectedItem;
      document.getElementById("orderForm").submit();
    }
  </script>
</head>

<body class="bg-light">
	<c:if test="${not empty id}">
		<%@ include file="../layout/headerLoginHome.jsp"%>
	</c:if>
	<c:if test="${empty id}">
		<%@ include file="../layout/headerHome.jsp"%>
	</c:if>
	<div class="container py-5">
		<div class="mx-auto p-5 bg-white shadow-lg rounded-4"
			style="max-width: 960px;">
			<div class="row g-5 align-items-center">
				<!-- 좌측: 이미지 -->
				<div class="col-md-5">
					<img src="/resources/images/items_photo/${items.photo}"
						class="img-fluid rounded-3 shadow-sm" alt="${items.name}">
				</div>

				<!-- 우측: 상품 설명 -->
				<div class="col-md-7">
					<h3 class="fw-bold mb-3">${items.name}</h3>
					<p class="mb-2 text-muted">
						<strong>원산지:</strong> ${items.location}
					</p>
					<p class="mb-4">${items.description}</p>

					<div class="mb-3 fs-5">
						<span><strong>총 금액:</strong> <span id="saleprice"
							class="text-danger fw-bold"> <fmt:formatNumber
									value="${items.price}" />원
						</span> </span>
					</div>

					<div class="d-flex align-items-center mb-4">
						<label for="quantity" class="me-3 fw-semibold">수량</label> <input
							type="number" id="quantity" name="quantity" value="1" min="1"
							class="form-control text-center w-25" onchange="clk()">
					</div>
					<!-- 버튼 -->
					<div class="d-grid gap-2">
						<button class="btn btn-outline-primary fw-bold py-2" onclick="innerCart()">🛒 장바구니 담기</button>
						<form id="orderForm" method="post" action="/itemsOrder/order">
							<input type="hidden" name="selectedItems" id="selectedItemInput" />
							<button type="button" class="btn btn-success fw-bold py-2"	onclick="submitOrder()">✅ 지금 구매</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
