<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>구매 문의</title>
</head>
<body>
<%@ include file="../layout/headerLoginBoardHome.jsp"%>
<div class="container mt-5">
  <h3 class="text-primary mb-4">📦 구매 문의</h3>

  <form action="/board/saleQuestion" method="post">
    <!-- 상품명 -->
    <div class="mb-3">
      <label class="form-label">상품명 ${items.name}</label>
      <input type="text" name=i_id class="form-control" value="${items.i_id}" readonly="readonly">
    </div>
    
    
    <!-- 문의자 이름 -->
    <div class="mb-3">
      <label class="form-label">이름</label>
      <input type="text" name="name" class="form-control" required>
    </div>

    <!-- 이메일 -->
    <div class="mb-3">
      <label class="form-label">이메일</label>
      <input type="email" name="email" class="form-control" required>
    </div>

    <!-- 문의 내용 -->
    <div class="mb-3">
      <label class="form-label">문의 내용</label>
      <textarea name="content" class="form-control" rows="6" required></textarea>
    </div>
    <!-- 버튼 -->
    <div class="d-flex justify-content-end gap-2">
      <button type="submit" class="btn btn-primary">문의하기</button>
      <a href="/layout/home" class="btn btn-secondary">취소</a>
    </div>
     </form>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>
