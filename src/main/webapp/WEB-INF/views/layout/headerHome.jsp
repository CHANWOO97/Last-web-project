<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/headerhome.css">
</head>
<body>
	<!-- 상단 네비게이션 바 -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
		<div class="container">
			<a class="navbar-brand" href="/">Lupang</a>

			<div class="ms-auto d-flex gap-3 align-items-center">
				<a class="nav-link" href="../user/loginForm">로그인</a> <a
					class="nav-link" href="../user/joinForm">회원가입</a>

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
	<div class="container">
		<div class="lupang-header">
			<!-- 카테고리 드롭다운 버튼 -->
			<div class="dropdown me-3">
				<button
					class="btn btn-primary dropdown-toggle d-flex flex-column align-items-center category-button"
					type="button" data-bs-toggle="dropdown">
					<i class="bi bi-list mb-1"></i> <span style="font-size: 0.85rem;">카테고리</span>
				</button>
				<ul class="dropdown-menu">
					<c:forEach var="ic" items="${ic_list}">
						<li><a class="dropdown-item"
							href="/items/itemsByCategory?ic_id=${ic.ic_id}">${ic.ic_name}</a></li>
					</c:forEach>
				</ul>
			</div>

			<!-- 로고 -->
			<div class="logo me-4">
				<a href="#" class="text-decoration-none fw-bold fs-4">Lupang</a>
			</div>

			<!-- 검색창 -->
			<form class="search-area input-group flex-grow-1 me-4" action="/items/search" method="get">
				<div class="search-area flex-grow-1 me-4">
					<input type="text" name="q" class="form-control" placeholder="찾고 싶은 상품을 검색해보세요!"> 
					<span class="input-group-text"><i class="bi bi-mic"></i></span>
					<button class="input-group-text" type="submit"><i class="bi bi-search"></i></button>
				</div>
			</form>

			<!-- 우측 아이콘 -->
			<div class="icon-group d-flex gap-4">
				<!-- 마이쿠팡 드롭다운 -->
				<div class="dropdown text-center">
					<a class="text-decoration-none text-dark dropdown-toggle" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="bi bi-person fs-4"></i><br> <span
						style="font-size: 0.85rem;">마이쿠팡</span>
					</a>
					<ul class="dropdown-menu text-center">
						<li><a class="dropdown-item" href="/itemsOrder/orderList">주문목록</a></li>
						<li><a class="dropdown-item" href="/itemsOrder/orderCancleList">취소/반품</a></li>
						<li><a class="dropdown-item" href="/items/wishlist">찜리스트</a></li>
					</ul>
				</div>

				<!-- 장바구니 아이콘 -->
				<div class="text-center">
					<a href="/items/itemsCart" class="text-decoration-none text-dark"> <i
						class="bi bi-cart fs-4"></i><br> <span
						style="font-size: 0.85rem;">장바구니</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>