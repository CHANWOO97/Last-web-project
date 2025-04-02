<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 상단 네비게이션 바 -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
		<div class="container">
			<a class="navbar-brand" href="/">Lupang</a>

			<div class="ms-auto d-flex gap-3 align-items-center">
				<a class="nav-link" href="./layout/home">로그인</a> <a class="nav-link" href="../user/joinForm">회원가입</a>

				<!-- ✅ dropdown 감싸기 -->
				<div class="dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 고객센터 </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">구매 문의</a></li>
						<li><a class="dropdown-item" href="#">Q&A</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>