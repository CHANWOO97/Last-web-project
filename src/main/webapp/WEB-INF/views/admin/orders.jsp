<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp" %>
<%@ include file="sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 주문 관리</title>
</head>
<body>
<div class="content">
    <h2>주문 관리</h2>
	<table class="table table-bordered">
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
	                <td>${order.s_date}</td>
	                <td>${order.s_status}</td>
	                <td>
	                    <form action="/admin/orderUpdate" method="post">
	                        <input type="hidden" name="s_id" value="${order.s_id}" />
	                        <select name="s_status">
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
</div>
</body>
</html>