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
			<!-- 상단 타이틀 및 필터 폼 -->
			<div class="d-flex justify-content-between align-items-end mb-3">
				<h2 class="mb-0">Lupang 정산명세서</h2>
			</div><br>
			<!-- 정산 데이터 폼 -->
			<form action="/admin/insertSettle" method="post">
				<input type="hidden" name="u_id" value="${settleStatement.u_id}"> 
				<input type="hidden" name="sr_id" value="${settleStatement.sr_id}">
				<div class="mb-3">
					<label>판매자 이름</label> <input type="text" class="form-control" value="${settleStatement.on_id}" disabled>
				</div>
				<div class="mb-3">
					<label>사업자등록번호</label> <input type="text" class="form-control" value="${settleStatement.sr_ev}" disabled>
				</div>
				<div class="mb-3">
					<label>주소</label> <input type="text" class="form-control" value="${settleStatement.address}" disabled>
				</div>
				<div class="mb-3">
					<label>이메일</label> <input type="text" class="form-control" value="${settleStatement.email}" disabled>
				</div>
				<div class="mb-3">
					<label>총 결제금액(vat 포함)</label> 
						<input type="text" class="form-control"	value="<fmt:formatNumber value='${settleStatement.total_sum}' 
						type='number' groupingUsed='true' />" readonly> 
						<input type="hidden" name="total_amount" value="${settleStatement.total_amount}">
				</div>
				<div class="mb-3">
					<label>Lupang 수수료(6%)</label> 
					<input type="text" class="form-control"
						value="<fmt:formatNumber value='${settleStatement.fee_amount}' type='number' groupingUsed='true' />" readonly> 
						<input type="hidden" name="fee_amount" value="${settleStatement.fee_amount}">
				</div>
				<div class="mb-3">
					<label>PG 수수료(3.5%)</label> 
					<input type="text" class="form-control"
						value="<fmt:formatNumber value='${settleStatement.pg_fee}' type='number' groupingUsed='true' />" readonly> 
						<input type="hidden" name="pg_fee" value="${settleStatement.pg_fee}">
				</div>
				<div class="mb-3">
					<label>정산금액</label> 
					<input type="text" class="form-control"
						value="<fmt:formatNumber value='${settleStatement.net_amount}' type='number' groupingUsed='true' />"
						readonly> 
					<input type="hidden" name="net_amount" value="${settleStatement.net_amount}">
				</div>
				<div class="d-flex justify-content-end">
					<a href="javascript:history.back()" class="btn btn-secondary">뒤로가기</a>
				</div>
			</form>
			<hr class="my-4">
	</div>
</body>
</html>