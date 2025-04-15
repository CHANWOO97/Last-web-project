<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("✅상품 등록 상태 수정 완료...")
			location.href="/admin/items"
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("❌주문 상태 수정 실패...")
			history.go(-1)
		</script>
	</c:if>
</body>
</html>