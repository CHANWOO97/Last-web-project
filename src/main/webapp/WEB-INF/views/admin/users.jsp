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
	table td, table th {
		text-align: center;
		vertical-align: middle;
	}
</style>
<body>
	<div class="container mt-5">
		<h3 class="mb-4 text-primary">👥 전체 사용자 관리</h3>
		<table class="table table-bordered text-center">
			<thead class="table-light">
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>계정상태</th>
					<th>회원상태</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${adminUserList}">
					<tr>
						<td>${user.u_id}</td>
						<td>${user.name}</td>
						<td>${user.email}</td>
						<td>${user.tel}</td>
						<td><c:choose>
							<c:when test="${user.u_id == 'admin'}">관리자 계정</c:when>	
							<c:when test="${user.seller_role == 'y'}">판매자 계정</c:when>
							<c:when test="${user.seller_role == 'w'}">판매자 등록대기 계정</c:when>
							<c:otherwise>사용자 계정</c:otherwise>
						</c:choose></td>
						<td><c:choose>
							<c:when test="${user.u_id == 'admin'}">관리자</c:when>
							<c:when test="${user.del == 'n'}">정상 회원</c:when>	
							<c:when test="${user.del == 'y'}">삭제 회원</c:when>
						</c:choose></td>
						<td>
							<form action="/admin/updateDel" method="post">
								<input type="hidden" name="u_id" value="${user.u_id}" /> 
								<input type="hidden" name="del" value="${user.del == 'y' ? 'n' : 'y'}" />
								<button type="submit" 
									 class="btn btn-sm ${user.del == 'y' ? 'btn-outline-success' : 'btn-outline-danger'}">
									 ${user.del == 'y' ? '활성' : '삭제'}
								</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 페이지네이션 -->
		<nav>
			<ul class="pagination justify-content-center mt-4">

				<!-- 이전 버튼 -->
				<c:choose>
					<c:when test="${currentPage <= 1}">
						<li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/admin/users?page=${currentPage - 1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:otherwise>
				</c:choose>

				<!-- 숫자 페이지 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link" href="/admin/users?page=${i}">${i}</a></li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:choose>
					<c:when test="${currentPage >= totalPage}">
						<li class="page-item disabled"><a class="page-link" href="#" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="/admin/users?page=${currentPage + 1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</nav>
</body>
</html>