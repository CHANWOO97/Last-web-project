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
		<div class="row g-4 align-items-center">
			<!-- 텍스트 영역 (좌측) -->
			<div class="col-md-5">
				<h1 class="display-5 fw-bold">고객센터</h1>
				<p class="lead mb-4">
					무엇을 도와드릴까요?<br>구매 전 상담부터 Q&A까지 한 번에!
				</p>
				<div class="d-grid gap-2 d-md-flex">
					<a href="/board/saleQuestionForm" class="btn btn-primary px-4">구매문의</a> <a href="/board/qAndAForm" class="btn btn-outline-secondary px-4">Q&A</a>
				</div>
			</div>

			<!-- 오른쪽 이미지 영역: col-md-6 전체 사용 -->
			<div class="col-md-6 text-end">
				<img src="/resources/images/board_photo/boardquestion.png" alt="고객센터 이미지" class="img-fluid" style="max-height: 400px; object-fit: contain;">
			</div>
		</div>

		<!-- 최근 문의글 (아래로) -->
		<div class="row mt-4">
			<div class="col-md-12">
				<div class="border rounded p-3 bg-light">
					<h5 class="mb-3">📬 최근 문의글</h5>
					<ul class="list-unstyled mb-0">
						<c:forEach var="q" items="${Q_List}">
							<li class="mb-2">
							<a href="questionDetail?q_id=${q.q_id}">
									<!-- fn:substring(q.content, 0, 20) 문의내용 20글자만 미리보기 -->
									<div class="fw-semibold">${fn:substring(q.content, 0, 20)}</div>
							</a> <small class="text-muted"> <fmt:formatDate value="${q.reg_date}" pattern="yyyy-MM-dd" />
							</small></li>
						</c:forEach>
					</ul>
					<!-- 페이지네이션 -->
					<nav>
						<ul class="pagination justify-content-center mt-4">
							<!-- 이전 버튼 -->
							<c:choose>
								<c:when test="${currentPage <= 1}">
									<li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&laquo;</span></a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="/board/boardForm?page=${currentPage - 1}"><span aria-hidden="true">&laquo;</span></a></li>
								</c:otherwise>
							</c:choose>

							<!-- 숫자 페이지 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link" href="/board/boardForm?page=${i}">${i}</a></li>
							</c:forEach>

							<!-- 다음 버튼 -->
							<c:choose>
								<c:when test="${currentPage >= totalPage}">
									<li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="/board/boardForm?page=${currentPage + 1}"><span aria-hidden="true">&raquo;</span></a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>