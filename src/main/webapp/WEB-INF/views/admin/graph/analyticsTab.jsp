<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"></head>
<body>
	<h2>루팡 관리자 페이지</h2>
    <p>좌측 메뉴를 통해 원하는 관리 기능을 선택하세요.</p>
	<ul class="nav nav-tabs mb-4">
		<li class="nav-item"><a class="nav-link active"	href="/admin/adminForm">전체 유저 인기 상품</a></li>
		<!-- 수정 -->
		<li class="nav-item"><a class="nav-link" href="/admin/analytics2">일일 매출 통계</a></li>
		<li class="nav-item"><a class="nav-link" href="/admin/analytics3">카테고리별 비율</a></li>
		<!-- 수정 -->
	</ul>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<canvas id="popularityChart" width="800" height="350"></canvas>
</body>
</html>