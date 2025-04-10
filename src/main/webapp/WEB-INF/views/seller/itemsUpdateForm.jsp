<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<style>
.container {
	max-width: 800px;
	margin: 50px auto;
}
</style>
<script type="text/javascript">
	function previewImage(event) {
		const reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("preview").src = e.target.result;
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
</head>
<body>
	<div class="container">
		<h3 class="mb-4 text-primary">✏️ 상품 수정</h3>

		<form action="/seller/itemsUpdate" method="post" enctype="multipart/form-data">
			<!-- 수정 시 상품코드 필요 -->
			<input type="hidden" name="i_id" value="${item.i_id}"> <input type="hidden" name="sr_id" value="${seller.sr_id}">

			<!-- 상품명 -->
			<div class="mb-3">
				<label class="form-label">상품명</label> <input type="text" name="name" class="form-control" required value="${item.name}">
			</div>

			<!-- 카테고리 -->
			<div class="mb-3">
				<label class="form-label">카테고리</label> <select name="ic_id" class="form-select" required>
					<option value="${item.ic_id}">${seller.ic_name}</option>
				</select>
			</div>

			<!-- 사이즈 -->
			<div class="mb-3">
				<label class="form-label">사이즈</label> <select name="size" class="form-select">
					<option value="S" ${item.size == 'S' ? 'selected' : ''}>S</option>
					<option value="M" ${item.size == 'M' ? 'selected' : ''}>M</option>
					<option value="L" ${item.size == 'L' ? 'selected' : ''}>L</option>
				</select>
			</div>

			<!-- 가격 -->
			<div class="mb-3">
				<label class="form-label">가격</label> <input type="number" name="price" class="form-control" required value="${item.price}">
			</div>

			<!-- 재고 -->
			<div class="mb-3">
				<label class="form-label">재고 수량</label> <input type="number" name="stock" class="form-control" required min="1" max="99" value="${item.stock}">
			</div>

			<!-- 원산지 -->
			<div class="mb-3">
				<label class="form-label">원산지</label> <input type="text" name="location" class="form-control" required value="${item.location}">
			</div>
			<!-- 숨겨진 프로필 이미지 업로드 input -->
			<input type="file" id="fileInput" name="file" style="display: none;" onchange="previewImage(event)">
			<div class="form-label">
				<div class="d-flex align-items-center mb-4">
					<!-- 클릭 가능한 이미지 (object-fit: cover; = 이미지 안찌그러지게)-->
					<img id="preview" src="/resources/images/items_photo/${item.photo}" alt="프로필 이미지" class="profile-img me-4" onclick="document.getElementById('fileInput').click();" 
						style="cursor: pointer; width: 200px; height: 200px; object-fit: cover;">
					<div></div>
				</div>
			</div>
			<!-- 상세 설명 -->
			<div class="mb-3">
				<label class="form-label">상세 설명</label>
				<textarea name="description" class="form-control" rows="5" required>${item.description}</textarea>
			</div>

			<!-- 제출 버튼 -->
			<div class="d-flex justify-content-end gap-2">
				<button type="submit" class="btn btn-primary">수정 완료</button>
				<a href="javascript:history.back()" class="btn btn-secondary">뒤로가기</a>
			</div>
		</form>
	</div>
</body>
</html>
