<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp" %>
<%@ include file="sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 사용자 관리</title>
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
<body>
<div class="content mt-5">
    <h2 class="mb-5">회원 관리</h2>
    <table class="table table-bordered table-hover align-middle text-center">
        <thead>
            <tr>
            	<th>번호</th>
                <th>ID</th>
                <th>이름</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>계정상태</th>
                <th>회원상태</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
        	
            <c:forEach var="user" items="${adminUserList}" varStatus="vs">
                <tr>
                	<c:set var="pageSize" value="10" />
                	<!-- currentPage = 현재 페이지, pageSize = 몇개씩 보여줄건지(10개씩), vs.index = 한페이지내에서 번호(0부터 9까지)  -->
						<td>${(currentPage - 1) * pageSize + vs.index + 1}</td>
                    <td>${user.u_id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.tel}</td>
                    <td>
                        <c:choose>
                            <c:when test="${user.u_id == 'admin'}">관리자 계정</c:when>
                            <c:when test="${user.seller_role == 'y'}">판매자 계정</c:when>
                            <c:when test="${user.seller_role == 'w'}">판매자 등록대기</c:when>
                            <c:otherwise>일반 사용자</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <span class="${user.del == 'y' ? 'text-danger fw-bold' : 'text-success fw-bold'}">
                            ${user.del == 'y' ? '삭제됨' : '정상'}
                        </span>
                    </td>
                    <td>
                        <form action="/admin/updateDel" method="post" class="d-inline">
                            <input type="hidden" name="u_id" value="${user.u_id}" />
                            <input type="hidden" name="del" value="${user.del == 'y' ? 'n' : 'y'}" />
                            <button type="submit" class="btn btn-sm ${user.del == 'y' ? 'btn-outline-success' : 'btn-outline-danger'}">
                                ${user.del == 'y' ? '복원하기' : '삭제처리'}
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
                    <li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&laquo;</span></a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="/admin/users?page=${currentPage - 1}"><span aria-hidden="true">&laquo;</span></a></li>
                </c:otherwise>
            </c:choose>

            <!-- 숫자 페이지 -->
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <li class="page-item ${i == currentPage ? 'active' : ''}"><a class="page-link" href="/admin/users?page=${i}">${i}</a></li>
            </c:forEach>

            <!-- 다음 버튼 -->
            <c:choose>
                <c:when test="${currentPage >= totalPage}">
                    <li class="page-item disabled"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="/admin/users?page=${currentPage + 1}"><span aria-hidden="true">&raquo;</span></a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</div>
</body>
</html>