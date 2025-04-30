<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
  .custom-link {
    text-decoration: none;
  }
  .custom-link:hover {
    text-decoration: underline;
    color: primary;
  }
</style>
</head>
<body>
<div class="modal modal-sheet position-static d-block bg-body-secondary p-4 py-md-5" tabindex="-1">
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">비밀번호 찾기</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<p class="mb-4 text-secondary">본인 이메일로 임시 비밀번호가 전송됩니다.</p>
				<form action="/email/mailToPw" method="post">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="u_id" name="u_id" placeholder="아이디" required autofocus>
						<label for="u_id">아이디</label>
					</div>
					<div class="form-floating mb-3">
						<input type="email" class="form-control" id="email" name="email" 
							placeholder="example@example.com" required
							pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"
							title="이메일 형식은 example@example.com 입니다.">
						<label for="email">이메일</label>
					</div>
					<button class="w-100 mb-2 btn btn-lg rounded-3 btn-success" type="submit">비밀번호 찾기</button>
					<hr class="my-4">
					<a class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" href="/loginForm">로그인 페이지로 돌아가기</a>
					<a class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" href="/email/mailToIdForm">아이디 찾기</a>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
