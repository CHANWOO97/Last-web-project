<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
<div class="modal modal-sheet position-static d-block bg-body-secondary p-4 py-md-5" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">아이디 찾기</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form action="/email/mailToId" method="post">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="name" name="name" placeholder="이름" required>
						<label for="name">이름</label>
					</div>
					<div class="form-floating mb-3">
						<input type="tel" class="form-control" id="tel" name="tel" placeholder="010-1111-1234"
							pattern="010-\d{3,4}-\d{4}" title="전화 형식은 010-1111-1234 입니다." required>
						<label for="tel">전화번호</label>
					</div>
					<button class="w-100 mb-2 btn btn-lg rounded-3 btn-success" type="submit">아이디 찾기</button>
					<hr class="my-4">
					<a class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" href="/email/mailToPwForm">비밀번호 찾기</a>
					<a class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" href="/user/loginForm">로그인 페이지로 돌아가기</a>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>