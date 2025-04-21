<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp"%>
<%@ include file="sidebar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <style>
  .table th {
    background-color: #343a40;
    color: white;
    vertical-align: middle;
  }
  .table td {
    vertical-align: middle;
    white-space: nowrap;
  }
</style>
</head>
<script type="text/javascript">
	function chk() {
		const result = confirm("발행이 완료된 정산서입니다. 재발행하시겠습니까?");
		if (result) {
			return true;
		} else {
			return false;
		}
	}
</script>
<body>
<div class="content mt-5">
    <h2 class="mb-5">정산명세서 발행 목록</h2>

    <table class="table table-bordered table-hover align-middle text-center">
        <thead>
            <tr>
                <th>번호</th>              
                <th>판매자 ID</th>
                <th>판매자 이름</th>
                <th>사업자등록번호</th>
                <th>카테고리</th>
                <th>정산일자</th>
                <th>정산금액</th>
                <th>발행상태</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="pageSize" value="10" />
            <c:forEach var="seller" items="${sellerList}" varStatus="vs">
                <tr>
                    <td>${(currentPage - 1) * pageSize + vs.index + 1}</td>
                    <td>${seller.u_id}</td>
                    <td>${seller.on_id}</td>
                    <td>${seller.sr_ev}</td>
                    <td>${seller.ic_name}</td>
                   	<td>
                   	<td>
                        <td><c:choose>
								<c:when test="${seller.sr_state eq 'y'}">
									<a href="/admin/settleStatement?sr_id=${seller.sr_id}" 
									class="btn btn-sm btn-outline-danger">정산서 발행하기</a>
								</c:when>
								<c:when test="${seller.sr_state eq 'n'}">
									<a href="/admin/ReSettleStatement?sr_id=${seller.sr_id}" 
									class="btn btn-sm btn-outline-success" onclick="return chk()">재발행</a>	
								</c:when>
							</c:choose></td>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <!-- 페이지네이션 -->
    <nav>
        <ul class="pagination justify-content-center mt-4">
            <!-- 이전 버튼 -->
            <c:choose>
                <c:when test="${currentPage <= 1}">
                    <li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&laquo;</span></a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="/admin/settleStatementForm?page=${currentPage - 1}"><span aria-hidden="true">&laquo;</span></a></li>
                </c:otherwise>
            </c:choose>

            <!-- 숫자 페이지 -->
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link" href="/admin/settleStatementForm?page=${i}">${i}</a></li>
            </c:forEach>

            <!-- 다음 버튼 -->
            <c:choose>
                <c:when test="${currentPage >= totalPage}">
                    <li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="/admin/settleStatementForm?page=${currentPage + 1}"><span aria-hidden="true">&raquo;</span></a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</div>
</body>
</html>