<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .sidebar {
            height: 100vh;
            position: fixed;
            left: 0; top: 0;
            width: 240px;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 12px;
            text-decoration: none;
            color: #ddd;
            display: block;
        }
        .sidebar a:hover {
            background-color: #575d63;
            color: white;
        }
        .content {
            margin-left: 240px;
            padding: 20px;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h4 class="text-center text-white mb-4">관리자 메뉴</h4>
    <a href="/admin/orders">구매 관리</a>
    <a href="/admin/categories">카테고리 관리</a>
    <a href="/admin/items">상품 관리</a>    
    <a href="/admin/sellers">판매자 승인 관리</a>
    <a href="/admin/users">회원 관리</a>
    <a href="/admin/adminForm">관리자 홈</a>
    <a href="/">메인 홈</a>
</div>
</body>
</html>