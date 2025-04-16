<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp"%>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.container {
	max-width: 1000px;
	margin: 50px auto;
}

.table-hover tbody tr:hover {
	background-color: #f9f9f9;
}
</style>
</head>
<body>
	<div class="container">
		<h3 class="text-primary mb-4">🧾 판매자 승인 요청 목록</h3>
		<input type="hidden" name="sr_id" value="${seller.sr_id}">
		<table class="table table-bordered table-hover text-center align-middle">
			<thead class="table-light">
				<tr>
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
				<c:forEach var="seller" items="${sellerRequests}">
					<tr>
						<td>${seller.u_id}</td>
						<td>${seller.on_id}</td>
						<td>${seller.sr_ev}</td>
						<td><fmt:formatDate value="${seller.srq_at}" pattern="yyyy-MM-dd" /></td>
						<td>${seller.ic_id}</td>
						<td><a href="/resources/images/seller_photo/${seller.srw_pev}" target="_blank" class="btn btn-sm btn-outline-info">보기</a></td>
						<td><c:choose>
								<c:when test="${seller.seller_role == 'y'}">
									<!-- 판매자 승인 완료 상태 -->
									<a class="nav-link">판매자 승인완료</a>
								</c:when>
								<c:when test="${seller.seller_role == 'w'}">
									<!-- 승인 취소상태 -->
									<a class="nav-link"">판매자 승인대기</a>
								</c:when>
								<c:when test="${seller.seller_role == 'n'}">
									<!-- 승인 취소상태 -->
									<a class="nav-link"">판매자 승인취소</a>
								</c:when>
							</c:choose></td>
							<td>
							<c:choose>
								<c:when test="${seller.seller_role == 'y'}">
									<!-- 판매자 승인 완료 상태 -->
									<a href="/admin/rejectSeller?sr_id=${seller.sr_id}&u_id=${seller.u_id}" class="btn btn-sm btn-danger">승인취소</a>
								</c:when>
								<c:when test="${seller.seller_role == 'w'}">
									<!-- 판매자 승인 대기중일 때 -->
									<a href="/admin/approveSeller?sr_id=${seller.sr_id}&u_id=${seller.u_id}" class="btn btn-sm btn-success">승인</a>
									<a href="/admin/rejectSeller?sr_id=${seller.sr_id}&u_id=${seller.u_id}" class="btn btn-sm btn-danger">승인취소</a>
								</c:when>
								<c:when test="${seller.seller_role == 'n'}">
									<!-- 판매자 승인 완료 상태 -->
									<a href="/admin/approveSeller?sr_id=${seller.sr_id}&u_id=${seller.u_id}" class="btn btn-sm btn-warning">재승인</a>
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
	</div>
	<!-- 페이지네이션 -->
		<nav>
			<ul class="pagination justify-content-center mt-4">

				<!-- 이전 버튼 -->
				<c:choose>
					<c:when test="${currentPage <= 1}">
						<li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/admin/sellers?page=${currentPage - 1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:otherwise>
				</c:choose>

				<!-- 숫자 페이지 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link" href="/admin/sellers?page=${i}">${i}</a></li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:choose>
					<c:when test="${currentPage >= totalPage}">
						<li class="page-item disabled"><a class="page-link" href="#" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/admin/sellers?page=${currentPage + 1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</nav>
</body>
</html>