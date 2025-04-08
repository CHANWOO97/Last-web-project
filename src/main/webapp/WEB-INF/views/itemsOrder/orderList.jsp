<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>주문 목록 | 마이페이지</title>
</head>
<body class="bg-light">
<div class="container py-5">
  <h1 class="fw-bold mb-4">
    <a href="/" class="text-decoration-none text-dark">Lupang</a>
  </h1>
  <div class="bg-white p-5 rounded shadow-sm">

    <h2 class="fw-bold mb-4">📦 주문 목록</h2>

    <table class="table table-bordered align-middle text-center">
      <thead class="table-light">
        <tr>
          <th>주문일</th>
          <th>주문번호</th>
          <th>총 결제금액</th>
          <th>상태</th>
          <th>상세보기</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="order" items="${orderList}">
          <tr>
            <td><fmt:formatDate value="${order.s_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${order.s_id}</td>
            <td>
              <fmt:formatNumber value="${order.total}" /> 원
            </td>
            <td>
              <c:choose>
                <c:when test="${order.s_status == 'y'}">
                  <span class="text-success fw-bold">결제완료</span>
                </c:when>
                <c:otherwise>
                  <span class="text-danger">미결제</span>
                </c:otherwise>
              </c:choose>
            </td>
            <td>
              <a href="/itemsOrder/orderSuccess?saleId=${order.s_id}" class="btn btn-outline-primary btn-sm">상세보기</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <div class="text-end mt-4">
      <a href="/" class="btn btn-secondary px-4">🏠 홈으로</a>
    </div>

  </div>
</div>
</body>
</html>