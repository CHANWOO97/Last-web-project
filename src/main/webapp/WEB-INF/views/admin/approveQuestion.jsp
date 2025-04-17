<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp"%>
<!DOCTYPE html>
<html>
</head><body>
	<c:if test="${result == 1 }">
		<script type="text/javascript">
			alert("답변이 정상적으로 등록되었습니다.")
			location.href="/admin/question"
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("답변 등록에 실패했습니다.")
			history.go(-1)
		</script>
	</c:if>
</body>
</html>