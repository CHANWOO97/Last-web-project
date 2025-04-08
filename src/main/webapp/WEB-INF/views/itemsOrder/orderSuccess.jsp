<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp" %>
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
    <h2 class="text-success fw-bold mb-4 text-center">✅ 주문이 완료되었습니다!</h2>

    <!-- 주문 정보 -->
    <div class="mb-4">
      <p><strong>주문번호:</strong> <span class="text-primary">${sale.s_id}</span></p>
      <p><strong>수령인:</strong> ${sale.receiver}</p>
      <p><strong>연락처:</strong> ${sale.tel}</p>
      <p><strong>배송 주소:</strong> ${sale.address}</p>
      <p><strong>주문일자:</strong> <fmt:formatDate value="${sale.s_date}" pattern="yyyy-MM-dd hh:mm:ss" /></p>
      <p><strong>결제상태:</strong> 
        <c:choose>
          <c:when test="${sale.s_status == 'y'}">결제완료</c:when>
          <c:otherwise>미결제</c:otherwise>
        </c:choose>
      </p>
    </div>

    <!-- 주문 상품 목록 -->
    <div class="mb-4">
      <h5 class="fw-bold">🛍 주문 상품</h5>
      <c:set var="total" value="0" />
      <c:forEach var="item" items="${saleItems}">
        <c:set var="itemTotal" value="${item.price * item.quantity}" />
        <c:set var="total" value="${total + itemTotal}" />
        <div class="d-flex align-items-center border rounded p-3 mb-2">
          <img src="/resources/images/items_photo/${item.photo}" width="80" class="me-3 rounded">
          <div class="flex-grow-1">
            <div class="fw-bold">${item.name}</div>
            <div>${item.price}원 × ${item.quantity}개</div>
          </div>
          <div class="fw-bold text-end" style="width: 100px;">
            <fmt:formatNumber value="${itemTotal}" />원
          </div>
        </div>
      </c:forEach>
    </div>

    <!-- 총 금액 -->
    <div class="text-end fs-5">
      <strong>총 결제금액: 
        <span class="text-primary fw-bold"><fmt:formatNumber value="${total}" />원</span>
      </strong>
    </div>

    <!-- 버튼 -->
    <div class="text-center mt-4">
      <a href="/" class="btn btn-outline-secondary px-4 me-2">홈으로</a>
      <a href="/itemsOrder/orderList" class="btn btn-primary px-4">주문목록</a>
    </div>

  </div>
</div>

</body>
</html>
