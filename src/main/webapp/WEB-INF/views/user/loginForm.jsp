<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/css/web.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/web.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
	<main class="form-signin w-100 m-auto">
		<form action="login" method="post">
			<div class="form-floating">
				<input type="text" class="form-control" name="u_id" id="u_id" required="required" autofocus="autofocus"
			class="form-control"> 
				<label for="u_id"><i class="bi bi-file-earmark-person" ></i>아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" name="password" id="password" required="required" autofocus="autofocus"
			class="form-control"> 
				<label for="password"><i class="bi bi-file-lock2"></i>비밀번호</label>
			</div>
			<button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
			<a class="btn btn-warning" href="joinForm">회원가입</a>
			
			<p class="mt-5 mb-3 text-body-secondary">&copy; Lupang Corp. All Rights Reserved.</p>
		</form>
	</main>
</body>
</html>