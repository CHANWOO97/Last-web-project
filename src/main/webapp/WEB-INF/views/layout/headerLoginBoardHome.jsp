<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/headerhome.css">
<style>
a { /* 로그인 및 로그아웃 부분 <a>로 감쌌을때 나오는 밑줄과 파란색 글씨 변경 */
	text-decoration: none;
	color: black;
}
</style>
</head>
<script>
	function showAlert() {
		alert("판매자 신청이 완료되어 승인 대기 중입니다.");
		return false;
	}
</script>
<body>
	<!-- 상단 네비게이션 바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
		<div class="container">
			<a class="navbar-brand" href="/">Lupang</a>
			<div class="ms-auto d-flex gap-3 align-items-center">
				<c:if test="${empty id }">
					<!-- 로그인 되었을때 로그인/회원가입 보이기 -->
					<a class="nav-link" href="../user/loginForm">로그인</a>
					<a class="nav-link" href="../user/joinForm">회원가입</a>
				</c:if>
				<c:if test="${not empty id}">
					<!-- 로그인 되었을때 로그아웃 보이기 -->
					<c:if test="${id != 'admin'}">
						<a class="nav-link" href="../user/logout">로그아웃</a>
						<c:choose>
							<c:when test="${seller_role == 'y'}">
								<!-- 판매자 승인 완료 상태 -->
								<a class="nav-link" href="/seller/sellerItemsChk">내 상품 보러가기</a>
							</c:when>
							<c:when test="${seller_role == 'w'}">
								<!-- 승인 대기중일 때 -->
								<a class="nav-link text-secondary" href="#" onclick="return showAlert();">판매자 신청</a>
							</c:when>
							<c:otherwise>
								<!-- 아직 신청 안 한 상태 -->
								<a class="nav-link" href="/seller/sellerRequestForm">판매자 신청</a>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${id == 'admin'}">
						<!-- 'admin'으로 로그인 되었을때 관리자페이지 보이기 -->
						<a class="nav-link" href="/user/logout">로그아웃</a>
						<a class="nav-link" href="/admin/home/adminForm">관리자페이지</a>
					</c:if>
				</c:if>
				<!-- ✅ dropdown 감싸기 -->
				<div class="dropdown">
					<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 고객센터 </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="/board/boardForm">구매 문의</a></li>
						<li><a class="dropdown-item" href="/board/boardForm">Q&A</a></li>
						<c:if test="${id != null}"> <!-- 로그인 되어있으면 -->
						<li><a class="dropdown-item" href="/board/myQuestion">내 문의 내역</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>