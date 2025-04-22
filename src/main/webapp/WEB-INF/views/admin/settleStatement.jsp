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
label {
	font-weight: bold;
}
</style>
</head>
<body>
<c:forEach var="m_price" items="${getMonthPrice}">
	<div class="content mt-5">
		<h2 class="mb-4">Lupang ${m_price.month} 정산명세서 발행</h2>
		<form action="/admin/insertSettle" method="post">
			<input type="hidden" name="u_id" value="${seller.u_id}"> 
			<input type="hidden" name="sr_id" value="${seller.sr_id}">
			<div class="mb-3">
				<label>판매자 이름</label> 
				<input type="text" class="form-control" value="${seller.on_id}" disabled>
			</div>
			<div class="mb-3">
				<label>사업자등록번호</label> 
				<input type="text" class="form-control" value="${seller.sr_ev}" disabled>
			</div>
			<div class="mb-3">
				<label>주소</label> 
				<input type="text" class="form-control" value="${user.address}" disabled>
			</div>
			<div class="mb-3">
				<label>총 결제금액(vat 포함)</label> 
				<input type="number" name="total_amount" id="total_amount" class="form-control" value="${m_price.total}" readonly="readonly">
			</div>
			<div class="mb-3">
				<label>Lupang 수수료(6%)</label> 
				<input type="number" name="fee_amount" id="fee_amount" class="form-control" value="500" readonly="readonly">
			</div>
			<div class="mb-3">
				<label>PG 수수료(3.5%)</label> 
				<input type="number" name="pg_fee" id="pg_fee" class="form-control" value="500" readonly="readonly">
			</div>
			<div class="mb-3">
				<label>정산금액</label> 
				<input type="number" name="net_amount" id="net_amount" class="form-control" value="500" readonly="readonly">
			</div>
			<div class="d-flex justify-content-between">
				<button type="submit" class="btn btn-success">정산명세서 발행</button>
				<a href="/admin/settleStatementForm" class="btn btn-secondary">목록으로</a>
			</div>
		</form>
	</div>
		</c:forEach>
</body>
</html>