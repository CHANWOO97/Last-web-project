<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp"%>
<%@ include file="/WEB-INF/views/admin/home/sidebar.jsp"%>
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
	<script>
	function submitSettleForm() {
		if (!confirm("정산명세서를 메일로 발송하시겠습니까?")) {
			return false;
		}

		const formData = $("#settleForm").serialize();

		$.ajax({
			type: "POST",
			url: "/admin/home/salemonthtab/settleInvoiceMsg",
			data: formData,
			success: function(data) {
				alert("메일이 성공적으로 발송되었습니다!");
				location.href = "/admin/home/salemonthtab/settleStatementForm?page=1&targetMonth=${targetMonth}";
			},
			error: function(xhr, status, error) {
				alert("메일 발송에 실패했습니다.");
				console.error("에러:", error);
			}
		});

		return false;
	}
</script>
	<div class="content mt-3">
		<!-- 상단 타이틀 및 필터 폼 -->
 			<div class="d-flex justify-content-between align-items-end mb-3">
 				<h2 class="mb-0">${targetMonth}월 Lupang 정산명세서</h2>
 			</div><br>
 			<!-- 정산 데이터 폼 -->
 			<form id="settleForm">
 				<input type="hidden" name="u_id" value="${settleInvoice.u_id}"> 
 				<input type="hidden" name="sr_id" value="${settleInvoice.sr_id}">
 				<div class="mb-3">
 					<label>판매자 이름</label> <input type="text" name="on_id" class="form-control" value="${settleInvoice.on_id}" disabled>
 				</div>
 				<div class="mb-3">
 					<label>사업자등록번호</label> <input type="text" name="sr_ev" class="form-control" value="${settleInvoice.sr_ev}" disabled>
 				</div>
 				<div class="mb-3">
 					<label>주소</label> <input type="text" name="address" class="form-control" value="${settleInvoice.address}" disabled>
 				</div>
 				<div class="mb-3">
 					<label>이메일</label> <input type="text" name="email" class="form-control" value="${settleInvoice.email}" disabled>
 				</div>
 				<div class="mb-3">
 					<label>총 결제금액(vat 포함)</label> 
 					<input type="text" class="form-control"	value="<fmt:formatNumber value='${settleInvoice.total_amount}' 
 						type='number' groupingUsed='true' />" readonly> 
 					<input type="hidden" name="total_amount" value="${settleInvoice.total_amount}">
 				</div>
 				<div class="mb-3">
 					<label>Lupang 수수료(6%)</label> 
 					<input type="text" class="form-control"
 						value="<fmt:formatNumber value='${settleInvoice.fee_amount}' type='number' groupingUsed='true' />" readonly> 
 					<input type="hidden" name="fee_amount" value="${settleInvoice.fee_amount}">
 				</div>
 				<div class="mb-3">
 					<label>PG 수수료(3.5%)</label> 
 					<input type="text" class="form-control"
 						value="<fmt:formatNumber value='${settleInvoice.pg_fee}' type='number' groupingUsed='true' />" readonly> 
 					<input type="hidden" name="pg_fee" value="${settleInvoice.pg_fee}">
 				</div>
 				<div class="mb-3">
 					<label>정산금액</label> 
 					<input type="text" class="form-control"
 						value="<fmt:formatNumber value='${settleInvoice.net_amount}' type='number' groupingUsed='true' />" readonly> 
 					<input type="hidden" name="net_amount" value="${settleInvoice.net_amount}">
 				</div>
 				<div class="d-flex justify-content-end">
 					<input type="button" class="btn btn-primary" value="정산명세서 메일발송" onclick="submitSettleForm()" />
 					<a href="javascript:history.back()" class="btn btn-secondary ms-2">뒤로가기</a>
 				</div>
 			</form>
 			<hr class="my-4">
	</div>
</body>
</html>