<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../layout/headerLoginBoardHome.jsp"%>
	<div class="container mt-5">
		<h3 class="text-primary mb-4">📦 구매 문의 상세</h3>
		<c:forEach var="question" items="${question}">
			<div class="border rounded p-4 bg-white">
				<!-- 문의 정보 -->
				<div class="mb-3">
					<label class="form-label fw-bold">이름</label>
					<div class="form-control bg-light">${question.name}</div>
				</div>

				<div class="mb-3">
					<label class="form-label fw-bold">이메일</label>
					<div class="form-control bg-light">${question.email}</div>
				</div>
				<div class="mb-3">
					<label class="form-label fw-bold">문의 날짜</label>
					<div class="form-control bg-light">${question.reg_date}</div>
				</div>

				<div class="mb-3">
					<label class="form-label fw-bold">문의 내용</label>
					<div class="form-control bg-light" style="min-height: 100px;">${question.content}</div>
				</div>

				<!-- 관리자 답변 -->
				<div class="mb-3">
					<label class="form-label fw-bold">답변</label>
					<c:choose>
						<c:when test="${not empty question.answer}">
							<div class="form-control bg-white border-success" style="min-height: 100px;">${question.answer}</div>
						</c:when>
						<c:otherwise>
							<div class="form-control bg-light text-muted">아직 답변이 등록되지 않았습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>

				<!-- 뒤로가기 버튼 -->
				<div class="d-flex justify-content-end">
					<a href="/board/boardForm" class="btn btn-secondary">목록으로</a>
				</div>
			</div>
		</c:forEach>
	</div>

	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>