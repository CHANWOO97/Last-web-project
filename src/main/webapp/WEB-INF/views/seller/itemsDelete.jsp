<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("상품이 삭제되었습니다.")
			location.href="/seller/sellerItemsChk"
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("상품 삭제에 실패했습니다. 다시 시도해주세요.")
			history.go(-1)
		</script>
	</c:if>
</body>
</html>