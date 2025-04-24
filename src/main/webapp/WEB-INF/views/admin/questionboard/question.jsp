<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp"%>
<%@ include file="sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.form-control {
	min-width: 300px;
}
</style>
</head>
<body>
<script type="text/javascript">
	function chk() {
		const result = confirm("답변이 완료된 문의입니다. 수정하시겠습니까?");
		if (result) {
			return true;
		} else {
			return false;
		}
	}
</script>
	<div class="content mt-5">
		<h2 class="mb-5">구매 문의 관리</h2>
		<table class="table table-bordered table-hover align-middle text-center">
			<thead>
				<tr>
					<th>번호</th>
					<th>회원 ID</th>
					<th>문의자 이름</th>
					<th>상품명</th>
					<th>문의 내용</th>
					<th>답변</th>
					<th>문의일</th>
					<th>답변 처리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="q" items="${QuestionListPage}" varStatus="vs">
					<tr>
						<c:set var="pageSize" value="10" />
						<!-- currentPage = 현재 페이지, pageSize = 몇개씩 보여줄건지(10개씩), vs.index = 한페이지내에서 번호(0부터 9까지)  -->
						<td>${(currentPage - 1) * pageSize + vs.index + 1}</td>
						<td>${q.u_id}</td>
						<td>${q.name}</td>
						<td>${q.itemName}</td>
						<td class="text-start">${q.content}</td>
						<c:choose>
							<c:when test="${q.answer_state == 'n'}">
								<td class="text-start"></td>
							</c:when>
							<c:otherwise>
								<td class="text-start">${q.answer}
							</c:otherwise>
						</c:choose>
						<td><fmt:formatDate value="${q.reg_date}" pattern="yyyy-MM-dd" /></td>
						<!-- 답변 처리 버튼 -->
						<td><c:choose>
								<c:when test="${q.answer_state == 'n'}">
									<a href="/admin/approveQuestionForm?q_id=${q.q_id}&u_id=${q.u_id}&itemName=${q.itemName}" 
									class="btn btn-sm btn-outline-danger">답변하기</a>
								</c:when>
								<c:when test="${q.answer_state == 'y'}">
									<a href="/admin/rejectQuestionForm?q_id=${q.q_id}&u_id=${q.u_id}&itemName=${q.itemName}" 
									class="btn btn-sm btn-outline-success" onclick="return chk()">답변완료</a>	
								</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
				<c:if test="${empty QuestionListPage}">
					<tr>
						<td colspan="8" class="text-muted">등록된 문의가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<!-- 페이지네이션 -->
		<nav>
			<ul class="pagination justify-content-center mt-4">
				<!-- 이전 버튼 -->
				<c:choose>
					<c:when test="${currentPage <= 1}">
						<li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&laquo;</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/admin/question?page=${currentPage - 1}"><span aria-hidden="true"> &laquo;</span></a></li>
					</c:otherwise>
				</c:choose>
				<!-- 숫자 페이지 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link" href="/admin/question?page=${i}">${i}</a></li>
				</c:forEach>
				<!-- 다음 버튼 -->
				<c:choose>
					<c:when test="${currentPage >= totalPage}">
						<li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/admin/question?page=${currentPage + 1}"><span aria-hidden="true"> &raquo;</span></a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
</body>
</html>