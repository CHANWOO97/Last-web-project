<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("회원정보가 수정 되었습니다")
			location.href="/user/mypage"
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("회원정보 수정이 취소되었습니다")
			history.go(-1)
		</script>
	</c:if>
</body>
</html>