<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp"%>
<%@ include file="sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<script type="text/javascript">
	function chk() {
		const result = confirm("발행이 완료된 정산서입니다. 재발행하시겠습니까?");
		if (result) {
			return true;
		} else {
			return false;
		}
	}
</script>
<body>
	<div class="content mt-5">
		<h2 class="mb-5">${year_month}월정산명세서목록</h2>
		<table class="table table-bordered table-hover align-middle text-center">
			<thead>
				<tr>
					<th>번호</th>
					<th>판매자 ID</th>
					<th>판매자 이름</th>
					<th>사업자등록번호</th>
					<th>카테고리</th>
					<th>정산금액</th>
					<th>발행상태</th>
					<th>관리</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="pageSize" value="10" />
				<c:forEach var="seller" items="${sellerList}" varStatus="vs">
					<tr>
						<td>${(currentPage - 1) * pageSize + vs.index + 1}</td>
						<td>${seller.u_id}</td>
						<td>${seller.on_id}</td>
						<td>${seller.sr_ev}</td>
						<td>${seller.ic_name}</td>
						<td><fmt:formatNumber value="${seller.total_sum}" type="number" groupingUsed="true" /></td>
						<td><c:choose>
								<c:when test="${stsm == 'y'}">
									<span class="text-success fw-bold">발행완료</span>
								</c:when>
								<c:when test="${stsm == 'w'}">
									<span class="text-warning fw-bold">미발행</span>
								</c:when>
								<c:when test="${stsm == 'n'}">
									<span class="text-danger fw-bold">발행취소</span>
								</c:when>
							</c:choose></td>
						<td><c:set var="totalAmount">
								<!-- maxFractionDigits="0" => 정수로 변환 -->
								<fmt:formatNumber value="${seller.total_sum}" maxFractionDigits="0" />
							</c:set>
								<c:choose>
										<c:when test="${seller.st_invoice eq 'w'}">
											<form action="/admin/settleStatementGo" method="post" style="display: inline;">
												<input type="hidden" name="sr_id" value="${seller.sr_id}" /> 
												<input type="hidden" name="u_id" value="${seller.u_id}" /> 
												<input type="hidden" name="year_month" value="${year_month}" /> 
												<input type="hidden" name="page" value="${page}" /> 
												<input type="hidden" name="total_sum" value="${seller.total_sum}" />
												<button type="submit" class="btn btn-sm btn-outline-success">정산서 발행하기</button>
											</form></td>
										</c:when>
									<c:otherwise>
										<a href="/admin/ReSettleStatementGo?sr_id=${seller.sr_id}" class="btn btn-sm btn-outline-danger" onclick="return chk()">정산서 재발행</a>
									</c:otherwise>
								</c:choose>
					
						<td><a href="/admin/settleStatement?sr_id=${seller.sr_id}" class="btn btn-sm btn-outline-primary">상세보기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이지네이션 -->
		<nav>
			<ul class="pagination justify-content-center mt-4">
				<!-- 이전 버튼 -->
				<c:choose>
					<c:when test="${currentPage <= 1}">
						<li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&laquo;</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/admin/settleStatementForm?year_month=${year_month}&page=${currentPage - 1}"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:otherwise>
				</c:choose>
				<!-- 숫자 페이지 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link" href="/admin/settleStatementForm?year_month=${year_month}&page=${i}">${i}</a></li>
				</c:forEach>
				<!-- 다음 버튼 -->
				<c:choose>
					<c:when test="${currentPage >= totalPage}">
						<li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/admin/settleStatementForm?year_month=${year_month}&page=${currentPage + 1}"><span aria-hidden="true">&raquo;</span></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
</body>
</html>