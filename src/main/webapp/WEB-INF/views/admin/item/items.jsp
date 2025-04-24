<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp" %>
<%@ include file="sidebar.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 상품 관리</title>
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
  .product-img {
    width: 60px;
    height: 60px;
    object-fit: cover;
    border-radius: 6px;
  }
</style>
</head>
<body>
<body>
<div class="content mt-5">
    <h2 class="mb-5">상품 관리</h2>
    <table class="table table-bordered table-hover align-middle text-center">
        <thead>
            <tr>
                <th>상품코드</th>
                <th>상품명</th>
                <th>카테고리</th>
                <th>가격</th>
                <th>재고</th>
                <th>판매자</th>
                <th>상태</th>
                <th>삭제 여부</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${adminItemsList}">
                <tr>
                    <td>${item.i_id}</td>
                    <td>${item.name}</td>
                    <td>${item.ic_name}</td>
                    <td><fmt:formatNumber value="${item.price}" /></td>
                    <td>${item.stock}</td>
                    <td>${item.on_id != null ? item.on_id : '판매자없음'}</td>
                    <td>
                        <span class="${item.deleted ? 'text-danger fw-bold' : 'text-success fw-bold'}">
                            ${item.deleted ? '삭제됨' : '등록중'}
                        </span>
                    </td>
                    <td>
                        <form action="/admin/updateItemStatus" method="post" class="d-inline">
                            <input type="hidden" name="i_id" value="${item.i_id}" />
                            <input type="hidden" name="deleted" value="${!item.deleted}" />
                            <button type="submit" class="btn btn-sm ${item.deleted ? 'btn-outline-success' : 'btn-outline-danger'}">
                                ${item.deleted ? '복원하기' : '삭제처리'}
                            </button>
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

</body>
</html>