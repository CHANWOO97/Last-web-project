<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
	<c:if test="${result == 2 }">
		<script type="text/javascript">
			alert("판매자 승인을 취소했습니다.")
			location.href="/admin/sellers"
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("판매자 승인취소에 실패했습니다.")
			history.go(-1)
		</script>
	</c:if>
</body>
</html>