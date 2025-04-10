<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	max-width: 600px;
	margin: 50px auto;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="mb-4">📄 판매자 신청</h2>
		<form action="/seller/sellerRequest" method="post" enctype="multipart/form-data">
			<input type="hidden" name="u_id" value="${u_id}">
			<div class="mb-3">
				<label class="form-label">대표자 이름</label> <input type="text" name="sr_id" class="form-control" required="required" value="${user.name}">
			</div>
			<div class="mb-3">
				<label class="form-label">사업자등록번호</label> <input type="text" name="sr_ev" class="form-control" required="required">
			</div>
			<div class="mb-3">
				<label class="form-label">증빙자료 업로드 (사업자등록증 사본)</label> <input type="file" name="file" class="form-control" accept=".jpg,.jpeg,.png,.pdf" required>
			</div>
			<!-- 카테고리 선택 -->
			<div class="mb-4">
				<label class="form-label">카테고리 분류</label> <select name="ic_id" class="form-select" required="required">
					<option value="">-- 해당하는 업종을 선택하세요 --</option>
					<c:forEach var="ic" items="${ic_list}">
						<option value="${ic.ic_id}">${ic.ic_name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="d-flex justify-content-between">
				<button type="submit" class="btn btn-primary">신청 제출</button>
				<a href="/user/mypage" class="btn btn-secondary">마이페이지로 돌아가기</a>
			</div>
		</form>
	</div>
</body>
</html>