<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.toggle-menu {
	display: none;
	transition: all 0.3s ease;
}

.toggle-menu.show {
	display: block;
}
</style>
</head>
<body>
	<%@ include file="../layout/headerLoginBoardHome.jsp"%>
	<div class="container py-5">
		<div class="row align-items-center">
			<!-- 왼쪽 텍스트 -->
			<div class="col-md-6">
				<h1 class="display-5 fw-bold">고객센터</h1>
				<p class="lead">무엇을 도와드릴까요? 구매 전 상담부터 Q&A까지 한 번에!</p>
				<div class="d-grid gap-2 d-md-flex">
					<a href="/board/saleQuestionForm" class="btn btn-primary me-md-2">구매문의</a> 
					<a href="/board/qAndAForm" class="btn btn-outline-secondary">Q&A</a>
				</div>
			</div>
			<!-- 오른쪽 이미지 (미리보기 영역) -->
			<div class="col-md-6 text-center">
				<img src="https://getbootstrap.com/docs/5.3/examples/heroes/bootstrap-themes.png" class="img-fluid rounded shadow" alt="Preview Image">
			</div>
		</div>
	</div>
</body>
</html>