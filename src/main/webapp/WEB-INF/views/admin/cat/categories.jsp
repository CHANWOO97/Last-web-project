<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp" %>
<%@ include file="/WEB-INF/views/admin/home/sidebar.jsp" %>        
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
		<div class="card shadow-sm p-3 mb-4" style="max-width: 800px;">
			<form method="post" action="/admin/cat/categories/add"	class="row g-2 align-items-center">
				<div class="col-md-4">
					<label class="form-label mb-1 fw-semibold">카테고리 ID</label> <input
						type="text" name="ic_id" value="${newIc_id}" readonly
						class="form-control-plaintext fw-bold text-secondary">
				</div>
				<div class="col-md-5">
					<label class="form-label mb-1 fw-semibold">카테고리명</label> <input
						type="text" name="ic_name" class="form-control"
						placeholder="예: 생활용품" required>
				</div>
				<div class="col-md-3 d-grid">
					<label class="form-label invisible">제출</label>
					<!-- 높이 맞춤용 -->
					<button class="btn btn-success fw-bold">등록</button>
				</div>
			</form>
		</div>
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
							<form method="post" action="/admin/cat/categories/delete" class="d-inline" onsubmit="return del('${cat.ic_name}');">
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