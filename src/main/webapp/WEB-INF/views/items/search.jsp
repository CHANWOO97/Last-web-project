<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${q} - 검색 결과 | Lupang</title>
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
  <c:if test="${not empty id}">
    <%@ include file="../layout/headerLoginHome.jsp" %>
  </c:if>
  <c:if test="${empty id}">
    <%@ include file="../layout/headerHome.jsp" %>
  </c:if>

  <div class="container mt-5">
    <h3 class="mb-4">🔍 <span class="text-primary fw-bold">"${q}"</span> 검색 결과</h3>

    <c:choose>
      <c:when test="${empty itemList}">
        <div class="text-center py-5">
          <i class="bi bi-search fs-1 text-muted"></i>
          <p class="mt-3 fs-5">"${q}"에 대한 검색 결과가 없습니다.</p>
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
                  <p class="card-text fw-bold text-danger">
                    <fmt:formatNumber value="${item.price}" /> 원
                  </p>
                  <a href="/items/itemsDetail?i_id=${item.i_id}" class="btn btn-outline-primary btn-sm">상세보기</a>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>

        <!-- ✅ 페이지네이션 -->
        <nav class="mt-4">
          <ul class="pagination justify-content-center">
            <c:if test="${currentPage > 1}">
              <li class="page-item">
                <a class="page-link" href="?q=${q}&page=${currentPage - 1}">&laquo;</a>
              </li>
            </c:if>
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
              <li class="page-item ${i == currentPage ? 'active' : ''}">
                <a class="page-link" href="?q=${q}&page=${i}">${i}</a>
              </li>
            </c:forEach>
            <c:if test="${currentPage < totalPage}">
              <li class="page-item">
                <a class="page-link" href="?q=${q}&page=${currentPage + 1}">&raquo;</a>
              </li>
            </c:if>
          </ul>
        </nav>
      </c:otherwise>
    </c:choose>
  </div>
</body>
</html>
