<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, body {
	height: 100%;
	margin: 0;
}

body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

main {
	flex: 1;
}

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
	<main class="container py-5">
		<div class="row g-4">
			<!-- 왼쪽 텍스트 -->
			<div class="col-md-6">
				<h1 class="display-5 fw-bold">고객센터</h1>
				<p class="lead mb-4">
					무엇을 도와드릴까요?<br>구매 전 상담부터 Q&A까지 한 번에!
				</p>
				<div class="d-grid gap-2 d-md-flex">
					<a href="/board/saleQuestionForm" class="btn btn-primary px-4">구매문의</a> <a href="/board/qAndAForm" class="btn btn-outline-secondary px-4">Q&A</a>
				</div>
			</div>
			<!-- 오른쪽 최근 문의 -->
			<div class="col-md-10">
				<div class="border rounded p-3 bg-light">
					<h5 class="mb-3">📬 최근 문의글</h5>
					<ul class="list-unstyled mb-0">
						<c:forEach var="q" items="${Q_List}">
							<li class="mb-2">
							<!-- fn:substring(q.content, 0, 30) → 문의 내용을 30자만 미리보기 -->
								<div class="fw-semibold">${fn:substring(q.content, 0, 30)}</div> 
							<small class="text-muted"> 
								<fmt:formatDate value="${q.reg_date}" pattern="yyyy-MM-dd" />
							</small>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>