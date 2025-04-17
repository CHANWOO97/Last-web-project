<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<title>답변 작성</title>
<style>
  .form-label {
    font-weight: bold;
    margin-top: 10px;
  }
</style>
<body>
<div class="container mt-5">
  <h3 class="mb-4 text-primary">📨 문의 답변</h3>

  <c:forEach var="q" items="${questionListByq_id}">
    <form action="/admin/approveQuestion" method="post">
      <input type="hidden" name="q_id" value="${q.q_id}" />
      <input type="hidden" name="answer_state" value="y" />

      <div class="mb-3">
        <label class="form-label">회원 ID</label>
        <input type="text" class="form-control" value="${q.u_id}" readonly />
      </div>

      <div class="mb-3">
        <label class="form-label">문의자 이름</label>
        <input type="text" class="form-control" value="${q.name}" readonly />
      </div>

      <div class="mb-3">
        <label class="form-label">상품명</label>
        <input type="text" class="form-control" value="${itemName}" readonly />
      </div>

      <div class="mb-3">
        <label class="form-label">문의 내용</label>
        <textarea class="form-control" rows="3" readonly>${q.content}</textarea>
      </div>

      <div class="mb-3">
        <label class="form-label">답변 작성</label>
        <textarea name="answer" class="form-control" rows="6" placeholder="답변을 입력하세요">${q.answer}</textarea>
      </div>

      <button type="submit" class="btn btn-success">답변 등록</button>
      <a href="/admin/question" class="btn btn-secondary">취소</a>
    </form>
  </c:forEach>

</div>
</body>
</html>
</html>