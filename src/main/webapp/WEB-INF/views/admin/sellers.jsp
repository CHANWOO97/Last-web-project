<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp" %>
<%@ include file="sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 판매자 승인 관리</title>
<style>
  .table th {
    background-color: #343a40;
    color: white;
    vertical-align: middle;
  }
  .table td {
    vertical-align: middle;
    white-space: nowrap;
  }
</style>
</head>
<body>
<div class="content mt-5">
  <h2 class="mb-5">판매자 승인 요청 목록</h2>
  <table class="table table-bordered table-hover align-middle text-center">
    <thead>
      <tr>
      	<th>번호</th>
        <th>판매자 ID</th>
        <th>대표자 이름</th>
        <th>사업자번호</th>
        <th>요청일</th>
        <th>카테고리</th>
        <th>증빙자료</th>
        <th>상태</th>
        <th>관리</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="seller" items="${sellerRequests}" varStatus="vs">
        <tr>
          <td>${vs.index + 1}</td>
          <td>${seller.u_id}</td>
          <td>${seller.on_id}</td>
          <td>${seller.sr_ev}</td>
          <td><fmt:formatDate value="${seller.srq_at}" pattern="yyyy-MM-dd" /></td>
          <td>${seller.ic_id}</td>
          <td>
            <a href="/resources/images/seller_photo/${seller.srw_pev}" target="_blank" class="btn btn-sm btn-outline-info">보기</a>
          </td>
          <td>
            <c:choose>
              <c:when test="${seller.seller_role == 'y'}">
                <span class="text-success fw-bold">승인완료</span>
              </c:when>
              <c:when test="${seller.seller_role == 'w'}">
                <span class="text-warning fw-bold">승인대기</span>
              </c:when>
              <c:when test="${seller.seller_role == 'n'}">
                <span class="text-danger fw-bold">승인취소</span>
              </c:when>
            </c:choose>
          </td>
          <td>
            <c:choose>
              <c:when test="${seller.seller_role == 'y'}">
                <a href="/admin/rejectSeller?sr_id=${seller.sr_id}&u_id=${seller.u_id}" class="btn btn-sm btn-outline-danger">승인취소</a>
              </c:when>
              <c:when test="${seller.seller_role == 'w'}">
                <a href="/admin/approveSeller?sr_id=${seller.sr_id}&u_id=${seller.u_id}" class="btn btn-sm btn-outline-success">승인</a>
                <a href="/admin/rejectSeller?sr_id=${seller.sr_id}&u_id=${seller.u_id}" class="btn btn-sm btn-outline-danger">취소</a>
              </c:when>
              <c:when test="${seller.seller_role == 'n'}">
                <a href="/admin/approveSeller?sr_id=${seller.sr_id}&u_id=${seller.u_id}" class="btn btn-sm btn-outline-warning">재승인</a>
              </c:when>
            </c:choose>
          </td>
        </tr>
      </c:forEach>
      <c:if test="${empty sellerRequests}">
        <tr>
          <td colspan="8" class="text-muted">승인 요청이 없습니다.</td>
        </tr>
      </c:if>
    </tbody>
  </table>

  <!-- 페이지네이션 -->
  <nav>
    <ul class="pagination justify-content-center mt-4">
      <c:choose>
        <c:when test="${currentPage <= 1}">
          <li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&laquo;</span></a></li>
        </c:when>
        <c:otherwise>
          <li class="page-item"><a class="page-link" href="/admin/sellers?page=${currentPage - 1}"><span aria-hidden="true">&laquo;</span></a></li>
        </c:otherwise>
      </c:choose>

      <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link" href="/admin/sellers?page=${i}">${i}</a></li>
      </c:forEach>

      <c:choose>
        <c:when test="${currentPage >= totalPage}">
          <li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li>
        </c:when>
        <c:otherwise>
          <li class="page-item"><a class="page-link" href="/admin/sellers?page=${currentPage + 1}"><span aria-hidden="true">&raquo;</span></a></li>
        </c:otherwise>
      </c:choose>
    </ul>
  </nav>
</div>
</body>
</html>