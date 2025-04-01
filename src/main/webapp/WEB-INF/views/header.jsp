<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- path : 프로젝트 명  /ch06 -->
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${path }/resources/icofont/icofont.min.css">
<link rel="stylesheet" href="${path }/resources/icofont_person/icofont.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	.err { color: red; font-weight: bold;}

	.btn-edit {
   	 	border-radius: 5px; /* 모서리 둥글게 */
   	 	padding: 8px 16px; /* 여백 */
   	 	font-size: 14px; /* 폰트 크기 */
   	 	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
   	 	transition: background-color 0.3s ease; /* 배경색 전환 효과 */
	}

	.btn-edit:hover {
	    background-color: #e67e22; /* 마우스 오버 시 배경색 변경 */
	}
</style>