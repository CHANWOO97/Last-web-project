<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="d-flex flex-column min-vh-100">
		<%@ include file="../layout/headerLoginBoardHome.jsp"%>

		<div class="container mt-5 flex-grow-1">
			<h3 class="text-primary mb-4">📨 내 문의 내역</h3>
			<c:choose>
				<c:when test="${not empty myquestionList}">
					<table class="table table-bordered text-center">
						<thead class="table-light">
							<tr>
								<th>번호</th>
								<th>상품명</th>
								<th>문의 내용</th>
								<th>등록일</th>
								<th>답변 상태</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="myquestion" items="${myquestionList}" varStatus="vs">
								<tr>
									<td>${vs.index + 1}</td>
									<td><c:choose>
											<c:when test="${not empty myquestion.itemName}">
												<span class="text-black">${myquestion.itemName}</span>
											</c:when>
											<c:otherwise>
												<span class="text-muted">상품을 선택하지 않았습니다.</span>
											</c:otherwise>
										</c:choose></td>
									<td>${myquestion.content}</td>
									<td>${myquestion.reg_date}</td>
									<td><c:choose>
											<c:when test="${not empty myquestion.answer}">
												<span class="text-success">답변 완료</span>
											</c:when>
											<c:otherwise>
												<span class="text-muted">미답변</span>
											</c:otherwise>
										</c:choose></td>
									<td><a href="/board/questionDetail?q_id=${myquestion.q_id}" class="btn btn-outline-primary btn-sm">보기</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<div class="alert alert-info">문의하신 내역이 없습니다.</div>
				</c:otherwise>
			</c:choose>
			<!-- 페이지네이션 -->
			<nav>
				<ul class="pagination justify-content-center mt-4">
					<c:choose>
						<c:when test="${currentPage <= 1}">
							<li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&laquo;</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="/board/myQuestion?page=${currentPage - 1}"><span aria-hidden="true">&laquo;</span></a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link" href="/board/myQuestion?page=${i}">${i}</a></li>
					</c:forEach>

					<c:choose>
						<c:when test="${currentPage >= totalPage}">
							<li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="/board/myQuestion?page=${currentPage + 1}"><span aria-hidden="true">&raquo;</span></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
		<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
	</div>
</body>
</html>