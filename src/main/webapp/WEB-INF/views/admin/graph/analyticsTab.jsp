<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"></head>
<body>
<%
    String uri = request.getRequestURI(); // 현재 경로 추출
%>
	<h2>루팡 관리자 페이지</h2>
    <p>좌측 메뉴를 통해 원하는 관리 기능을 선택하세요.</p>
<ul class="nav nav-tabs mb-4">
    <li class="nav-item">
        <a class="nav-link <%= uri.contains("/admin/home/adminForm") ? "active" : "" %>" href="/admin/home/adminForm">
            전체 유저 인기 상품
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link <%= uri.contains("/admin/home/salemonthtab/analytics2") ? "active" : "" %>" href="/admin/home/salemonthtab/analytics2">
            월 매출 통계
        </a>
    </li>
    <%-- <li class="nav-item">
        <a class="nav-link <%= uri.contains("/admin/home/analytics3") ? "active" : "" %>" href="/admin/home/analytics3">
            카테고리별 비율
        </a>
    </li> --%>
</ul>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>
</html>