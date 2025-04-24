<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp" %>
<%@ include file="/WEB-INF/views/admin/home/sidebar.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 주문 관리</title>
<style>
	/* Bootstrap 덮어쓰기 */
	table tr:nth-child(even) > td {
		background-color: #f9f9f9 !important;
	}
	table tr:nth-child(odd) > td {
		background-color: #ffffff !important;
	}

	.table th {
	    background-color: #343a40;
	    color: white;
	    vertical-align: middle;
 	 }
	td {
		vertical-align: middle;
		white-space: nowrap;
	}
</style>
</head>
<body>
<div class="content mt-5">
    <h2 class="mb-5">주문 관리</h2>
	<table class="table table-bordered table-hover align-middle text-center">
	    <thead>
	        <tr>
	            <th>주문번호</th>	            
	            <th>주문자</th>
	            <th>전화번호</th>
	            <th>주소</th>
	            <th>총 금액</th>
	            <th>주문일</th>
	            <th>상태</th>
	            <th>변경</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach var="order" items="${orders}">
	            <tr>
	                <td>${order.s_id}</td>
	                <td>${order.customer_name}</td>
	                <td>${order.tel}</td>
	                <td>${order.address}</td>
	                <td>${order.total}</td>
	                <td><fmt:formatDate value="${order.s_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	                <td>${order.s_status}</td>
	                <td>
	                    <form action="/admin/order/orderUpdate" method="post" style="display: flex; align-items: center; gap: 8px; margin: 0;">
	                        <input type="hidden" name="s_id" value="${order.s_id}" />
	                        <select name="s_status" class="form-select form-select-sm" style="width: 100px;">
	                            <option value="n" ${order.s_status == 'n' ? 'selected' : ''}>미결제</option>
	                            <option value="y" ${order.s_status == 'y' ? 'selected' : ''}>결제완료</option>
	                            <option value="d" ${order.s_status == 'd' ? 'selected' : ''}>배송중</option>
	                            <option value="f" ${order.s_status == 'f' ? 'selected' : ''}>배송완료</option>
	                        </select>
	                        <button type="submit" class="btn btn-sm btn-primary">변경</button>
	                    </form>
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
						<li class="page-item disabled"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="?ic_id=${ic_id}&page=${currentPage - 1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

				<!-- 숫자 페이지 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="page-item ${i == currentPage ? 'active' : ''}"><a
						class="page-link" href="?ic_id=${ic_id}&page=${i}">${i}</a></li>
				</c:forEach>

				<!-- 다음 버튼 -->
				<c:choose>
					<c:when test="${currentPage >= totalPage}">
						<li class="page-item disabled"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="?ic_id=${ic_id}&page=${currentPage + 1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</nav>
</div>
</body>
</html>