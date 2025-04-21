<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp" %>
<%@ include file="sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>루팡 쇼핑몰 관리자 페이지</title>
</head>
<body>
<!-- 본문 콘텐츠 -->
<div class="content">       
	<!-- 탭 메뉴 -->
	<%@ include file="/WEB-INF/views/admin/graph/analyticsTab.jsp" %>
	<canvas id="popularityChart" width="800" height="350"></canvas>
	<script>
	  const ctx = document.getElementById('popularityChart').getContext('2d');
	  const chart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	      labels: [<c:forEach var="item" items="${topItems}" varStatus="i">
	                  '${item.name}'<c:if test="${!i.last}">,</c:if>
	               </c:forEach>],
	      datasets: [{
	        label: '구매 수',
	        data: [<c:forEach var="item" items="${topItems}" varStatus="i">
	                  ${item.count}<c:if test="${!i.last}">,</c:if>
	               </c:forEach>],
	        borderWidth: 1
	      }]
	    },
	    options: {
	      responsive: true,
	      plugins: {
	        legend: { display: false },
	        title: {
	          display: true,
	          text: '가장 많이 구매된 상품 TOP 5'
	        }
	      },
	      scales: {
	        y: { beginAtZero: true }
	      }
	    }
	  });
	</script>
</div>
</body>
</html>