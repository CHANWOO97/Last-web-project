<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>루팡!</title>
</head>
<body>
<c:if test="${not empty id }">
	<%@ include file="./headerLoginHome.jsp" %>
</c:if>
<c:if test="${empty id }">
	<%@ include file="./headerHome.jsp" %>
</c:if>
	<!-- 배너자리  -->
<div id="banner" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#banner" data-bs-slide-to="0"
				class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="1"
				aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#banner" data-bs-slide-to="2"
				aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active b-item" data-bs-interval="3000">
				<img
					src="/resources/images/lupang001.png"
					class="d-block w-100 b-img" alt="..." width="1920" height="450">
				<div class="carousel-caption d-none d-md-block">
				</div>
			</div>
			<div class="carousel-item b-item" data-bs-interval="3000">
				<img
					src="/resources/images/lupang002.png"
					class="d-block w-100 b-img" alt="..." width="1920" height="450">
				<div class="carousel-caption d-none d-md-block">					
				</div>
			</div>
			<div class="carousel-item b-item" data-bs-interval="3000">
				<img
					src="/resources/images/lupang003.png"
					class="d-block w-100 b-img" alt="..." width="1920" height="450">
				<div class="carousel-caption d-none d-md-block">					
				</div>
			</div>
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
  <h2 class="fw-bold mb-4">오늘의 발견</h2>
  <div class="row row-cols-1 row-cols-md-2 g-4">
    <c:forEach var="item" items="${topItems}">
      <div class="col">
        <div class="card border-0 shadow-sm h-100">
          <div class="ratio ratio-16x9 overflow-hidden rounded">
            <img src="/resources/images/items_photo/${item.photo}" 
                 alt="${item.name}" 
                 class="img-fluid object-fit-cover">
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