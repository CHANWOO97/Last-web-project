<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<!-- Bootstrap CSS -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      .b-example-divider {
  width: 100%;
  height: 3rem;
  background-color: rgba(0, 0, 0, .1);
  border: solid rgba(0, 0, 0, .15);
  border-width: 1px 0;
  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
}
.custom-link {
  text-decoration: none; /* 기본 상태에서는 밑줄 없음 */
}

.custom-link:hover {
  text-decoration: underline; /* hover 시 밑줄 생김 */
  color: primary;
}
</style>
</head>
<div class="modal modal-sheet position-static d-block bg-body-secondary p-4 py-md-5" tabindex="-1" role="dialog" id="modalSignin">
	<div class="modal-dialog" role="document">
		<div class="modal-content rounded-4 shadow">
			<div class="modal-header p-5 pb-4 border-bottom-0">
				<h1 class="fw-bold mb-0 fs-2">로그인</h1>
			</div>
			<div class="modal-body p-5 pt-0">
				<form action="login" method="post">
					<div class="form-floating">
						<input type="text" class="form-control" name="u_id" id="u_id" required="required" autofocus="autofocus" class="form-control"> <label
							for="u_id">아이디</label>
					</div><br>
					<div class="form-floating">
						<input type="password" class="form-control" name="password" id="password" required="required" autofocus="autofocus" class="form-control">
						<label for="password">비밀번호</label>
					</div><br>				
					<!-- 아이디/비밀번호 찾기 링크 -->
					<!-- <h2 class="fs-5 mb-3" onclick="location.href='/findAccount'" style="cursor: pointer;">아이디 비밀번호 찾기</h2> -->
	                <div class="d-flex justify-content-between">
	                    <a href="/email/mailToIdForm" class="btn text-secondary custom-link">아이디 찾기</a>
	                    <a href="/email/mailToPwForm" class="btn text-secondary custom-link">비밀번호 찾기</a>
	                </div>
					<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">로그인</button>
					<hr class="my-4">
					<a class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" href="joinForm">회원가입</a>
					
				</form>
			</div>
		</div>
	</div>
</div>
<div class="b-example-divider"></div>
</form>
</body>
</html>