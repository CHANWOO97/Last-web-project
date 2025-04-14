<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp" %>
<%@ include file="sidebar.jsp" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 카테고리 관리</title>
<script type="text/javascript">
	function del(ic_name){
		return confirm("정말 "+ic_name+" 카테고리를 삭제하시겠습니까?")
	}
</script>
</head>
<body>
	<div class="content mt-5">
		<h2 class="mb-5">카테고리 관리</h2>
		<!-- 상단: 등록 폼 -->
		<form method="post" action="/admin/categories/add"	class="d-flex gap-2 mb-4">
			<input type="text" name="ic_id" placeholder="카테고리 ID"
				class="form-control" required /> <input type="text" name="ic_name"
				placeholder="카테고리명" class="form-control" required />
			<button class="btn btn-success">등록</button>
		</form>

		<!-- 목록 테이블 -->
		<table class="table table-bordered text-center">
			<thead class="table-dark">
				<tr>
					<th>카테고리 ID</th>
					<th>카테고리명</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cat" items="${categories}">
					<tr>
						<td>${cat.ic_id}</td>
						<td>${cat.ic_name}</td>
						<td>
							<form method="post" action="/admin/categories/delete" class="d-inline" onsubmit="return del('${cat.ic_name}');">
								<input type="hidden" name="ic_id" value="${cat.ic_id}" />
								<button class="btn btn-danger btn-sm">삭제</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>