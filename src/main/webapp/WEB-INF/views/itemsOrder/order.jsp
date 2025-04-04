<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루팡!! 주문하기</title>
<%@ include file="../setting/include.jsp"%>
</head>
<body>
<%@ include file="../layout/headerLoginHome.jsp" %>

<div class="container py-5">
  <h2 class="text-center text-primary mb-4">🧾 주문서</h2>

  <!-- 상품 카드 -->
  <div class="mb-4">
    <c:forEach var="item" items="${saleItems}">
      <div class="card mb-3 shadow-sm">
        <div class="card-body d-flex align-items-center">
          <img src="/resources/images/items_photo/${item.photo}" width="100" class="me-4 rounded" alt="${item.name}">
          <div>
            <h5 class="fw-bold mb-2">${item.name}</h5>
            <p class="mb-0">
              <fmt:formatNumber value="${item.price}" />원 × ${item.quantity}개
            </p>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>

  <!-- 총 결제금액 -->
  <c:set var="total" value="0" />
  <c:forEach var="item" items="${saleItems}">
    <c:set var="total" value="${total + (item.price * item.quantity)}" />
  </c:forEach>

  <div class="bg-light p-4 rounded mb-5">
    <h5 class="text-end mb-0">
      총 결제금액: <span class="text-primary fw-bold fs-4">
        <fmt:formatNumber value="${total}" />원
      </span>
    </h5>
  </div>

  <!-- 주문자 정보 -->
  <form action="/itemsOrder/orderSuccess" method="post">
    <div class="row mb-3">
      <div class="col-md-6">
        <label for="receiver" class="form-label fw-bold">수령인 이름</label>
        <input type="text" class="form-control" name="receiver" id="receiver" value="${user.name}" required>
      </div>
      <div class="col-md-6">
        <label for="tel" class="form-label fw-bold">연락처</label>
        <input type="text" class="form-control" name="tel" id="tel" value="${user.tel}" required>
      </div>
    </div>

    <div class="mb-4">
      <label for="address" class="form-label fw-bold">배송 주소</label>
      <input type="text" class="form-control" name="address" id="address" value="${user.address}" required>
    </div>

    <!-- hidden 상품 정보 -->
    <c:forEach var="item" items="${saleItems}">
      <input type="hidden" name="selectedItems" value="${item.i_id}_${item.quantity}" />
    </c:forEach>
    <input type="hidden" name="total" value="${total}" />

    <!-- 버튼 -->
    <div class="text-end">
      <button type="submit" class="btn btn-success px-4 py-2 fw-bold">
        ✅ 주문하기
      </button>
    </div>
  </form>
</div>	
</body>
</html>