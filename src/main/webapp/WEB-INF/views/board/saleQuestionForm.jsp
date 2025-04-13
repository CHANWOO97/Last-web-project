<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 문의</title>
</head>
<body>
	<%@ include file="../layout/headerLoginBoardHome.jsp"%>
	<div class="container mt-5">
		<h3 class="text-primary mb-4">📦 구매 문의</h3>
		<!-- 문의 상단 멘트 -->
		<div class="p-4 mb-4 border rounded bg-light">
			<h5>
				<strong class="text-dark">루팡의 중심은 항상 <span class="text-primary">고객님</span>입니다.
				</strong>
			</h5>
			<p class="mb-1">
				루팡을 이용하시면서 느끼신 불편사항이나 바라는 점을 알려주세요.<br> 고객님의 소중한 의견으로 한 뼘 더 자라는 루팡이 되겠습니다.
			</p>
			<small class="text-muted">문의량이 많아 답변은 최대 24시간 이상 소요될 수 있습니다.</small>
		</div>
		<form action="/board/saleQues" method="post">
			<!-- 문의자 이름 -->
			<div class="mb-3">
				<label class="form-label">이름</label> <input type="text" name="name" class="form-control" required value="${user.name}">
			</div>
			<!-- 이메일 -->
			<div class="mb-3">
				<label class="form-label">이메일</label> <input type="email" name="email" class="form-control" required value="${user.email}">
			</div>
			<!-- 상품명 선택 내가 구매한 물품에 대해서 문의 가능 -->
			<div class="mb-3">
				<label class="form-label">내가 구매한 상품</label>
				<c:choose>
					<c:when test="${not empty buyItems}">
						<select name="i_id" class="form-select">
							<c:forEach var="item" items="${buyItems}">
								<option value="${item.i_id}">${item.name}/{item.reg_date}</option>
							</c:forEach>
						</select>
					</c:when>
					<c:otherwise>
						<div class="form-control bg-light text-danger">구매한 상품이 없습니다.</div>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- 문의 내용 -->
			<div class="mb-3">
				<label class="form-label">문의 내용</label>
				<textarea name="content" class="form-control" rows="6" required placeholder="문의내용을 작성해주세요"></textarea>
			</div>
			<!-- 버튼 -->
			<div class="d-flex justify-content-end gap-2">
				<button type="submit" class="btn btn-primary">문의하기</button>
				<a href="javascript:history.back()" class="btn btn-secondary">뒤로가기</a>
			</div>
		</form>
	</div>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>
