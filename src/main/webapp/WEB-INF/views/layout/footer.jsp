<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- /WEB-INF/views/layout/footer.jsp -->
<footer class="bg-dark text-white py-4 mt-5">
  <div class="container">
    <div class="row">

      <!-- 회사 정보 -->
      <div class="col-md-4 mb-3">
        <h5 class="fw-bold">Lupang</h5>
        <p class="small">
          믿고 살 수 있는 스마트 쇼핑몰<br>
          언제나 당신의 일상을 응원합니다 💚
        </p>
      </div>

      <!-- 퀵 링크 -->
      <div class="col-md-4 mb-3">
        <h6 class="fw-bold">바로가기</h6>
        <ul class="list-unstyled small">
          <li><a href="/" class="text-white text-decoration-none">홈</a></li>
          <li><a href="/items/itemsByCategory?ic_id=fashion" class="text-white text-decoration-none">카테고리</a></li>
          <li><a href="/mypage/wishlist" class="text-white text-decoration-none">찜 목록</a></li>
          <li><a href="/mypage/orderList" class="text-white text-decoration-none">주문내역</a></li>
        </ul>
      </div>

      <!-- 연락처 -->
      <div class="col-md-4 mb-3">
        <h6 class="fw-bold">고객센터</h6>
        <p class="small mb-1">평일 10:00 ~ 18:00 (점심 13~14시)</p>
        <p class="small mb-0">📞 1544-0000</p>
        <p class="small">✉️ help@lupang.com</p>
      </div>

    </div>

    <hr class="border-light">
    <div class="text-center small">
      &copy; 2025 Lupang. All rights reserved.
    </div>
  </div>
</footer>
</html>