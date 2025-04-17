<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>루팡!</title>
<link rel="stylesheet" href="/resources/css/home.css">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
</head>
<body>
<c:if test="${not empty id }">
	<%@ include file="./headerLoginHome.jsp" %>
</c:if>
<c:if test="${empty id }">
	<%@ include file="./headerHome.jsp" %>
</c:if>
	<!-- 배너자리  -->
	<c:set var="images" value="${fn:split('lupang001.png,lupang002.png,lupang003.png,아이묭_001.png', ',')}" />
	<div id="banner" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <c:forEach var="img" items="${images}" varStatus="status">
	      <div class="carousel-item ${status.first ? 'active' : ''} b-item" data-bs-interval="3000">
	        <img src="/resources/images/banner/${img}" class="d-block w-100 b-img" alt="..." width="1920" height="450">
	        <div class="carousel-caption d-none d-md-block">
	          <!-- 필요시 여기에 설명 추가 -->
	        </div>
	      </div>
	    </c:forEach>
	  </div>
	
	<button class="carousel-control-prev" type="button"
		data-bs-target="#banner" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#banner" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
</div>
<!-- 오늘의 발견 -->
<div class="container my-5">
  <h2 class="fw-bold mb-3">오늘의 발견</h2>
  <p class="text-muted" style="margin-top: -5px;">루팡 유저들이 가장 추천하는 아이템</p>
  <div class="row row-cols-1 row-cols-md-4 g-4">
    <c:forEach var="item" items="${topItems}" varStatus="vs">
      <div class="col position-relative">
      	<!-- 🏅 순위 뱃지 -->
	    <span class="rank-badge ${vs.index == 0 ? 'gold' : vs.index == 1 ? 'silver' : vs.index == 2 ? 'bronze' : ''}">
		  ${vs.index + 1}위
		</span>
	    
		  <div class="card border-0 shadow-sm h-100">
		    <div class="overflow-hidden rounded" style="aspect-ratio: 4 / 3;">
		      <img src="/resources/images/items_photo/${item.photo}" alt="${item.name}" class="w-100 h-100 object-fit-cover">
		    </div>
		    <div class="card-body d-flex justify-content-between align-items-center">
		      <h5 class="card-title mb-0 text-truncate" style="max-width: 70%;">${item.name}</h5>
		      <a href="/items/itemsDetail?i_id=${item.i_id}" class="btn btn-sm btn-outline-dark">구매하기</a>
		    </div>
		  </div>
		</div>
    </c:forEach>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>