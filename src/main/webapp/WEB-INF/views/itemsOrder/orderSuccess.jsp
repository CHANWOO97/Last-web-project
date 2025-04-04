<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>주문 완료 | Lupang</title>
  <%@ include file="../setting/include.jsp" %>
</head>
<body class="bg-light">

<div class="container py-5">
  <div class="text-center bg-white p-5 rounded shadow-sm">
    <h2 class="text-success mb-3">✅ 주문이 완료되었습니다!</h2>
    
    <p class="fs-5">
      주문번호: <strong class="text-primary">${s_id}</strong>
    </p>

    <div class="mt-4">      
      <a href="/" class="btn btn-outline-secondary px-4">홈으로</a>
    </div>
  </div>
</div>

</body>
</html>