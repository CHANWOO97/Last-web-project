<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp"%>
<%@ include file="sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
label {
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="content mt-3">
		<c:forEach var="m_price" items="${getMonthPrice}">
			<!-- 상단 타이틀 및 필터 폼 -->
			<div class="d-flex justify-content-between align-items-end mb-3">
				<h2 class="mb-0">Lupang ${param.targetMonth}월 정산명세서</h2>
			</div><br>
			<!-- 정산 데이터 폼 -->
			<form action="/admin/insertSettle" method="post">
				<input type="hidden" name="u_id" value="${seller.u_id}"> 
				<input type="hidden" name="sr_id" value="${seller.sr_id}">
				<div class="mb-3">
					<label>판매자 이름</label> <input type="text" class="form-control" value="${seller.on_id}" disabled>
				</div>
				<div class="mb-3">
					<label>사업자등록번호</label> <input type="text" class="form-control" value="${seller.sr_ev}" disabled>
				</div>
				<div class="mb-3">
					<label>주소</label> <input type="text" class="form-control" value="${user.address}" disabled>
				</div>
				<div class="mb-3">
					<label>이메일</label> <input type="text" class="form-control" value="${user.email}" disabled>
				</div>
				<div class="mb-3">
					<label>총 결제금액(vat 포함)</label> 
					<input type="text" class="form-control"
						value="<fmt:formatNumber value='${m_price.total_sum}' type='number' groupingUsed='true' />" readonly> 
						<input type="hidden"
						name="total_amount" value="${m_price.total_sum}">
				</div>
				<div class="mb-3">
					<label>Lupang 수수료(6%)</label> 
					<input type="text" class="form-control"
						value="<fmt:formatNumber value='${m_price.total_sum * 0.06}' type='number' groupingUsed='true' />" readonly> 
						<input type="hidden" name="fee_amount" value="${m_price.total_sum * 0.06}">
				</div>
				<div class="mb-3">
					<label>PG 수수료(3.5%)</label> 
					<input type="text" class="form-control"
						value="<fmt:formatNumber value='${m_price.total_sum * 0.035}' type='number' groupingUsed='true' />" readonly> 
						<input type="hidden" name="pg_fee" value="${m_price.total_sum * 0.035}">
				</div>
				<div class="mb-3">
					<label>정산금액</label> 
					<input type="text" class="form-control"
						value="<fmt:formatNumber value='${m_price.total_sum - (m_price.total_sum * 0.06) - (m_price.total_sum * 0.035)}' type='number' groupingUsed='true' />"
						readonly> 
					<input type="hidden" name="net_amount" value="${m_price.total_sum - (m_price.total_sum * 0.06) - (m_price.total_sum * 0.035)}">
				</div>
				<div class="d-flex justify-content-end">
					<a href="javascript:history.back()" class="btn btn-secondary">뒤로가기</a>
				</div>
			</form>
			<hr class="my-4">
		</c:forEach>
	</div>
</body>
</html>