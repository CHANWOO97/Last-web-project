<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp"%>
<%@ include file="/WEB-INF/views/admin/home/sidebar.jsp" %>
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
		<h2 class="mb-5">${targetMonth}월 정산명세서 목록</h2>
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
				</tr>
			</thead>
			<tbody>
				<c:set var="pageSize" value="10" />
				<c:forEach var="saleList" items="${saleJoinList}" varStatus="vs">
					<tr>
						<td>${(currentPage - 1) * pageSize + vs.index + 1}</td>
						<td>${saleList.u_id}</td>
						<td>${saleList.on_id}</td>
						<td>${saleList.sr_ev}</td>
						<td>${saleList.ic_name}</td>
						<td>
						<!-- 정산금액 계산하기 : 수수료제외!! -->
						<c:set var="totalSum" value="${saleList.total_sum}" />
						<c:set var="fee" value="${totalSum * 0.06}" />
						<c:set var="pgFee" value="${totalSum * 0.035}" />
						<c:set var="net" value="${totalSum - fee - pgFee}" />
						<fmt:formatNumber value="${net}" type="number" maxFractionDigits="0" /></td>
						<td><c:choose>
								<c:when test="${saleList.st_invoice == 'y'}">
									<span class="text-success fw-bold">발행완료</span>
								</c:when>
								<c:when test="${saleList.st_invoice == 'n' || saleList.st_invoice == null}">
									<span class="text-warning fw-bold">미발행</span>
								</c:when>
								<c:when test="${saleList.st_invoice == 'w'}">
									<span class="text-danger fw-bold">발행취소</span>
								</c:when>
							</c:choose></td>
						<td><c:set var="totalAmount">
								<fmt:formatNumber value="${saleList.total_sum}" maxFractionDigits="0" />
							</c:set> <c:choose>
								<c:when test="${saleList.st_invoice eq 'n' || saleList.st_invoice eq null}">
									<form action="/admin/home/salemonthtab/issueAnInvoice?sr_id=${saleList.sr_id}&targetMonth=${targetMonth}" method="post" style="display:inline;">
										<input type="hidden" name="sr_id" value="${saleList.sr_id}" />
										<input type="hidden" name="u_id" value="${saleList.u_id}" />
										<input type="hidden" name="total_amount" value="<fmt:formatNumber value='${saleList.total_sum}' pattern='#' />" />
										<input type="hidden" name="fee_amount" value="<fmt:formatNumber value='${saleList.total_sum * 0.06}' pattern='#' />" />
										<input type="hidden" name="pg_fee" value="<fmt:formatNumber value='${saleList.total_sum * 0.035}' pattern='#' />" />
										<input type="hidden" name="net_amount" value="<fmt:formatNumber value='${saleList.total_sum - (saleList.total_sum * 0.06) - (saleList.total_sum * 0.035)}' pattern='#' />" />
										<input type="hidden" name="st_invoice" value="y" />
										<button type="submit" class="btn btn-sm btn-outline-success">정산서 발행하기</button>
									</form>
								</c:when>
								<c:otherwise>
										<form action="/admin/home/salemonthtab/issueAnInvoice?sr_id=${saleList.sr_id}&targetMonth=${targetMonth}" method="post" style="display:inline;">
												<input type="hidden" name="sr_id" value="${saleList.sr_id}" />
												<input type="hidden" name="u_id" value="${saleList.u_id}" />
												<input type="hidden" name="total_amount" value="<fmt:formatNumber value='${saleList.total_sum}' pattern='#' />" />
												<input type="hidden" name="fee_amount" value="<fmt:formatNumber value='${saleList.total_sum * 0.06}' pattern='#' />" />
												<input type="hidden" name="pg_fee" value="<fmt:formatNumber value='${saleList.total_sum * 0.035}' pattern='#' />" />
												<input type="hidden" name="net_amount" value="<fmt:formatNumber value='${saleList.total_sum - (saleList.total_sum * 0.06) - (saleList.total_sum * 0.035)}' pattern='#' />" />
												<input type="hidden" name="st_invoice" value="y" />
												<button type="submit" class="btn btn-sm btn-outline-danger" onclick="return chk()">정산서 재발행</button>
										</form>
								</c:otherwise>
							</c:choose>
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
						<li class="page-item">
							<a class="page-link" href="/admin/home/salemonthtab/settleStatementForm?page=${currentPage - 1}&targetMonth=${targetMonth}"> 
							<span aria-hidden="true">&laquo;</span></a>
						</li>
					</c:otherwise>
				</c:choose>
				<!-- 숫자 페이지 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link"
						href="/admin/home/salemonthtab/settleStatementForm?page=${i}&targetMonth=${targetMonth}">${i}</a></li>
				</c:forEach>
				<!-- 다음 버튼 -->
				<c:choose>
					<c:when test="${currentPage >= totalPage}">
						<li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/admin/home/salemonthtab/settleStatementForm?page=${currentPage + 1}&targetMonth=${targetMonth}"><span
								aria-hidden="true">&raquo;</span></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
</body>
</html>