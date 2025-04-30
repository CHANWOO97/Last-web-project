<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
</head>
<body>
<div class="modal modal-sheet position-static d-block bg-body-secondary p-4 py-md-5" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">비밀번호 찾기 결과</h1>
			</div>
			<div class="modal-body p-5 pt-0 text-center">
				<c:if test="${result > 0}">
					<div class="alert alert-success">
						이메일이 성공적으로 전송되었습니다.
					</div>
					<a href="/user/loginForm" class="btn btn-success w-100 rounded-3 mt-3">로그인 페이지 이동</a>
				</c:if>
				
				<c:if test="${result == 0}">
					<div class="alert alert-danger">
						비밀번호 초기화 또는 이메일 전송에 실패했습니다.<br>
						다시 시도해 주세요.
					</div>
					<button class="btn btn-secondary w-100 rounded-3 mt-3" onclick="history.back();">이전 페이지로 돌아가기</button>
				</c:if>
			</div>
		</div>
	</div>
</div>
</body>
</html>