<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../setting/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/layout/headerLoginHome.jsp" %>
  <meta charset="UTF-8">
  <title>찜 목록 | My Page</title>
  <style>
    .wishlist-card img {
      width: 100px;
      height: 100px;
      object-fit: cover;
    }
  </style>
</head>
<body class="bg-light">
<div class="container py-5">
  <h2 class="fw-bold mb-4">❤️ 찜한 상품</h2>

  <c:choose>
    <c:when test="${empty wishlist}">
      <p class="text-muted">찜한 상품이 없습니다.</p>
    </c:when>
    <c:otherwise>
      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <c:forEach var="item" items="${wishlist}">
          <div class="col">
            <div class="card wishlist-card shadow-sm">
              <div class="card-body d-flex align-items-center">
                <img src="/resources/images/items_photo/${item.photo}" class="me-3 rounded" alt="${item.name}">
                <div class="flex-grow-1">
                  <h5 class="card-title mb-1">${item.name}</h5>
                  <p class="text-danger fw-bold"><fmt:formatNumber value="${item.price}" /> 원</p>
                  <a href="/items/itemsDetail?i_id=${item.i_id}" class="btn btn-outline-primary btn-sm">상세보기</a>
                  <button class="btn btn-outline-danger btn-sm remove-wishlist" data-iid="${item.i_id}">삭제</button>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<script>
  // 삭제 버튼 클릭 시
  $(document).on('click', '.remove-wishlist', function() {
    const i_id = $(this).data('iid');
    console.log(typeof(i_id))
    if (!confirm('찜 목록에서 제거할까요?')) return;

    $.ajax({
      url: '/wishlist/remove',
      method: 'POST',
      data: { i_id },
      success: function(res) {
        if (res === 'success') {
          alert('삭제되었습니다.');
          location.reload();
        } else {
          alert('삭제 실패');
        }
      }
    });
  });
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>