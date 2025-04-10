<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>상품 등록</title>
  <style>
    .container { max-width: 800px; margin: 50px auto; }
  </style>
</head>
<body>
<div class="container">
  <h3 class="mb-4">🛒 상품 등록</h3>
  <form action="/seller/sellerItmesComplete" method="post" enctype="multipart/form-data">
  <input type="hidden" name="sr_id" value="${seller.sr_id}">
    <!-- 상품명 -->
    <div class="mb-3">
      <label class="form-label">상품명</label>
      <input type="text" name="name" class="form-control" required>
    </div>

    <!-- 카테고리 선택 -->
    <div class="mb-3">
      <label class="form-label">카테고리</label>
      <select name="ic_id" class="form-select" required>
        <option value="${seller.ic_id}">${seller.ic_name}</option>
      </select>
    </div>

    <!-- 사이즈 -->
    <div class="mb-3">
      <label class="form-label">사이즈</label>
      <select name="size" class="form-select">
        <option value="S">S</option>
        <option value="M" selected>M</option>
        <option value="L">L</option>
      </select>
    </div>

    <!-- 가격 -->
    <div class="mb-3">
      <label class="form-label">가격</label>
      <input type="number" name="price" class="form-control" required>
    </div>

    <!-- 재고 -->
    <div class="mb-3">
      <label class="form-label">재고 수량</label>
      <input type="number" name="stock" class="form-control" required>
    </div>
     <!-- 원산지 -->
    <div class="mb-3">
      <label class="form-label">원산지</label>
      <input type="text" name="location" class="form-control" required>
    </div>

    <!-- 사진 업로드 -->
    <div class="mb-3">
      <label class="form-label">상품 이미지</label>
      <input type="file" name="file" class="form-control" required>
    </div>

    <!-- 상세 설명 -->
    <div class="mb-3">
      <label class="form-label">상세 설명</label>
      <textarea name="description" class="form-control" rows="5" required></textarea>
    </div>

    <!-- 제출 버튼 -->
    <div class="d-flex justify-content-end gap-2">
      <button type="submit" class="btn btn-primary">등록하기</button>
      <a href="/user/mypage" class="btn btn-secondary">취소</a>
    </div>
  </form>
</div>
</body>
</html>
