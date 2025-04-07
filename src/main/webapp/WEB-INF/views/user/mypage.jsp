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
	<script>
		function PasswordMatch() {
			const pw = document.getElementById("password").value;
			const pwCheck = document.getElementById("password2").value;
			const msg = document.getElementById("pwMatchMsg");
			const submitBtn = document.querySelector("input[type='submit']");

			if (pw === "" || pwCheck === "") {
				msg.textContent = "";
				submitBtn.disabled = false;
				return;
			}

			if (pw === pwCheck) {
				msg.textContent = "비밀번호가 일치합니다.";
				msg.classList.remove("text-danger");
				msg.classList.add("text-success");
				submitBtn.disabled = false;
			} else {
				msg.textContent = "비밀번호가 일치하지 않습니다.";
				msg.classList.remove("text-success");
				msg.classList.add("text-danger");
				submitBtn.disabled = true;
			}
		}
	</script>
	<form action="/user/mypageEdit" method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
		<input type="hidden" name="u_id" value="${user.u_id}"> 
		<input type="hidden" name="reg_date" value="${user.reg_date}">
		<div class="container mypage-container">
			<div class="profile-card">
				<div class="d-flex align-items-center mb-4">
					<label for="fileInput"> <img id="preview" src="/resources/images/user_photo/${user.photo}" alt="프로필 이미지" class="profile-img me-4"
						style="cursor: pointer;">
					</label> <input type="file" id="fileInput" name="file" style="display: none;" onchange="previewImage(this)">
					<div>
						<h3 class="mb-0">${user.name}님</h3>
						<small class="text-muted">${user.user_role == 'admin' ? '관리자' : '일반 사용자'}</small>
					</div>
				</div>
			</div>
			<p>
			<div class="row g-3">
				<div class="col-md-6">
					<p class="info-title mb-1">아이디</p>
					<p class="info-value">${user.u_id}</p>
				</div>
				<div class="col-md-6">
					<p class="info-title mb-1">가입일</p>
					<p class="info-value" class="form-control">
						<fmt:formatDate value="${user.reg_date}" pattern="yyyy-MM-dd" />
					</p>
				</div>
				<div class="col-md-6">
					<p class="info-title mb-1">비밀번호</p>
					<p class="info-value">
						<input type="password" name="password" id="password" class="form-control">
					</p>
				</div>
				<div class="col-md-6">
					<p class="info-title mb-1">비밀번호 확인</p>
					<p class="info-value">
						<input type="password" id="password2" class="form-control" oninput="PasswordMatch()"> 
						<small id="pwMatchMsg" class="text-danger"></small>
					</p>
				</div>
				<div class="col-md-6">
					<p class="info-title mb-1">이메일</p>
					<p class="info-value">
						<input type="text" name="email" value="${user.email}" class="form-control">
					</p>
				</div>
				<div class="col-md-6">
					<p class="info-title mb-1">전화번호</p>
					<p class="info-value">
						<input type="text" name="tel" value="${user.tel}" class="form-control">
					</p>
				</div>
				<div class="col-md-6">
					<p class="info-title mb-1">주소</p>
					<p class="info-value">
						<input type="text" name="address" value="${user.address}" class="form-control">
					</p>
				</div>
				<div class="col-md-6">
					<p class="info-title mb-1">판매자 상태</p>
					<p class="info-value" class="form-control">
						<c:choose>
							<c:when test="${user.seller_role == 'y'}">✅ 판매자 등록 완료</c:when>
							<c:otherwise>판매자 신청가능</c:otherwise>
						</c:choose>
					</p>
				</div>
				<div class="mt-4 d-flex justify-content-end gap-2">
					<input type="submit" value="회원정보 수정" class="btn btn-primary"> 
					<a href="/layout/home" class="btn btn-secondary">뒤로가기</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>