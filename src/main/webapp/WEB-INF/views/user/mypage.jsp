<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .mypage-container {
      max-width: 900px;
      margin: 50px auto;
    }
    .profile-img {
      width: 120px;
      height: 120px;
      object-fit: cover;
      border-radius: 50%;
      border: 4px solid #dee2e6;
    }
    .info-title {
      font-weight: 600;
      color: #495057;
    }
    .info-value {
      color: #212529;
    }
    .profile-card {
      border-radius: 1rem;
      padding: 2rem;
      background: #f8f9fa;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
    }
  </style>
</head>
<body>
	<div class="container mypage-container">
  <div class="profile-card">
    <div class="d-flex align-items-center mb-4">
      <img src="/resources/images/user_photo/${user.photo}" alt="프로필 이미지" class="profile-img me-4">
      <div>
        <h3 class="mb-0">${user.name} 님</h3>
        <small class="text-muted">${user.user_role == 'admin' ? '관리자' : '일반 사용자'}</small>
      </div>
    </div>

    <div class="row g-3">
      <div class="col-md-6">
        <p class="info-title mb-1">아이디</p>
        <p class="info-value">${user.u_id}</p>
      </div>
      <div class="col-md-6">
        <p class="info-title mb-1">이메일</p>
        <p class="info-value">${user.email}</p>
      </div>
      <div class="col-md-6">
        <p class="info-title mb-1">전화번호</p>
        <p class="info-value">${user.tel}</p>
      </div>
      <div class="col-md-6">
        <p class="info-title mb-1">주소</p>
        <p class="info-value">${user.address}</p>
      </div>
      <div class="col-md-6">
        <p class="info-title mb-1">가입일</p>
        <p class="info-value">
          <fmt:formatDate value="${user.reg_date}" pattern="yyyy-MM-dd" />
        </p>
      </div>
      <div class="col-md-6">
        <p class="info-title mb-1">판매자 상태</p>
        <p class="info-value">
          <c:choose>
            <c:when test="${user.seller_role == 'y'}">✅ 판매자 등록 완료</c:when>
            <c:otherwise>일반 사용자</c:otherwise>
          </c:choose>
        </p>
      </div>
    </div>

    <div class="mt-4 d-flex justify-content-end gap-2">
      <a href="/user/editForm" class="btn btn-outline-primary">회원정보 수정</a>
      <a href="/user/logout" class="btn btn-secondary">로그아웃</a>
    </div>
  </div>
</div>
</body>
</html>