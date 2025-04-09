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
<!-- 오늘의 발견  -->
<div class="container">
<h2>오늘의 발견</h2>
<div class="container my-5">
  <div class="row g-4">
    
    <!-- 배너 아이템 (foreach 사용해야함)-->
    <div class="col-md-6">
      <div class="position-relative border rounded overflow-hidden shadow-sm">
        <a href="#" target="_blank">
          <img 
            src="#" 
            alt="배너 이미지 설명" 
            class="img-fluid w-100" 
            style="height: 300px; object-fit: cover;"
          />
          <!-- 바로가기 버튼 -->
          <div class="position-absolute bottom-0 end-0 m-2">
            <span class="btn btn-sm btn-light shadow">구매하기</span>
          </div>
        </a>
      </div>
    </div>
    <!-- 또 다른 배너 아이템 복붙 -->
    <div class="col-md-6">
      <div class="position-relative border rounded overflow-hidden shadow-sm">
        <a href="#" target="_blank">
          <img 
            src="#" 
            alt="배너 이미지 설명" 
            class="img-fluid w-100" 
            style="height: 300px; object-fit: cover;"
          />
          <div class="position-absolute bottom-0 end-0 m-2">
            <span class="btn btn-sm btn-light shadow">구매하기</span>
          </div>
        </a>
      </div>
    </div>

  </div>
  
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>