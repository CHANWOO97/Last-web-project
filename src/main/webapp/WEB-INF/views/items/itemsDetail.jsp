<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기 | Lupang</title>
<style>
#qt {
	font-size: 18px;
}

#saleprice {
	font-size: 18px;
}
</style>
<script>
    function clk() {
      const price = parseInt(document.getElementById("product-info").dataset.price);
      const qty = parseInt(document.getElementById("quantity").value);
      document.getElementById("qt").innerText = qty;
      document.getElementById("saleprice").innerText = (price * qty).toLocaleString() + "원";
    }

    function innerCart() {
      const itemCode = "${items.i_id}";
      const quantity = parseInt(document.getElementById("quantity").value);
      $.post('/items/innerCart', 'i_id=' + itemCode + '&quantity=' + quantity, function(data) {
        alert(data);
      });
    }

    function submitOrder() {
      const itemCode = "${items.i_id}";
      const quantity = document.getElementById("quantity").value;
      const selectedItem = itemCode + "_" + quantity;
      document.getElementById("selectedItemInput").value = selectedItem;
      document.getElementById("orderForm").submit();
    }
	// Ajax 토글 코드 (찜 추가 / 삭제)
    $(function() {
    	  $('.wishlist-btn').on('click', function () {
    	    const button = $(this);
    	    const i_id = button.data('iid');
    		console.log('데이터 타입', typeof(i_id))
    		console.log('i_id = ', i_id)
    	    $.ajax({
    	      url: '/wishlist/toggle',
    	      type: 'POST',
    	      data: { i_id },
    	      success: function(response) {
    	        if (response.status === 'added') {
    	          button.addClass('btn-danger').removeClass('btn-outline-danger');
    	          button.html('<i class="bi bi-heart-fill"></i>');
    	        } else if (response.status === 'removed') {
    	          button.removeClass('btn-danger').addClass('btn-outline-danger');
    	          button.html('<i class="bi bi-heart"></i>');
    	        }
    	        else {
    		          alert('로그인이 필요합니다 😥');
    		    }
		      },
		      error: function () {
		    	 alert('요청 중 오류가 발생했습니다 😥');        
		      }
    	    });
    	  });
    	});
  </script>
</head>

<body class="bg-light">
	<c:if test="${not empty id}">
		<%@ include file="../layout/headerLoginHome.jsp"%>
	</c:if>
	<c:if test="${empty id}">
		<%@ include file="../layout/headerHome.jsp"%>
	</c:if>
	<div class="container py-5">
		<div class="mx-auto p-5 bg-white shadow-lg rounded-4" style="max-width: 960px;">
		  <c:choose>
		    <c:when test="${items.deleted eq true}">
		      <div class="text-center py-5">
		        <i class="bi bi-exclamation-triangle-fill text-warning fs-1 mb-3"></i>
		        <h4 class="fw-bold mb-3">이 상품은 더 이상 판매되지 않습니다.</h4>
		        <p class="text-muted">관리자에 의해 삭제된 상품입니다. 다른 상품을 확인해보세요.</p>
		        <a href="/items/itemsByCategory?ic_id=${items.ic_id }" class="btn btn-outline-secondary mt-4">상품 목록으로 이동</a>
		      </div>
		    </c:when>
		    <c:otherwise>
		      <div class="row g-5 align-items-center">
		        <!-- 좌측: 이미지 -->
		        <div class="col-md-5">
		          <img src="/resources/images/items_photo/${items.photo}" class="img-fluid rounded-3 shadow-sm" alt="${items.name}">
		        </div>
		
		        <!-- 우측: 상품 설명 + 버튼 -->
		        <div class="col-md-7">
		          <h3 class="fw-bold mb-3">${items.name}</h3>
		          <p class="mb-2 text-muted"><strong>원산지:</strong> ${items.location}</p>
		          <p class="mb-4">${items.description}</p>
		
		          <div class="mb-3 fs-5">
		            <strong>총 금액:</strong>
		            <span id="saleprice" class="text-danger fw-bold">
		              <fmt:formatNumber value="${items.price}" />원
		            </span>
		          </div>
		
		          <div class="d-flex align-items-center mb-4">
		            <label for="quantity" class="me-3 fw-semibold">수량</label>
		            <input type="number" id="quantity" name="quantity" value="1" min="1"
		                   class="form-control text-center w-25" onchange="clk()">
		          </div>
		
		          <div class="d-grid gap-2">
		            <div class="d-flex align-items-center gap-2 flex-wrap">
		              <!-- 찜하기 버튼 -->
		              <button type="button" class="btn ${isWishlisted ? 'btn-danger' : 'btn-outline-danger'} wishlist-btn d-flex align-items-center justify-content-center px-3 py-2"
		                      data-iid="${items.i_id}">
		                <i class="bi ${isWishlisted ? 'bi-heart-fill' : 'bi-heart'} fs-5"></i>
		              </button>
		
		              <!-- 장바구니 담기 버튼 -->
		              <button type="button" class="btn btn-outline-primary fw-bold px-3 py-2" onclick="innerCart()">
		                🛒 장바구니 담기
		              </button>
		
		              <!-- 지금 구매 버튼 -->
		              <form id="orderForm" method="post" action="/itemsOrder/order" class="mb-0">
		                <input type="hidden" name="selectedItems" id="selectedItemInput" />
		                <button type="button" class="btn btn-success fw-bold px-3 py-2" onclick="submitOrder()">
		                  ✅ 지금 구매
		                </button>
		              </form>
		            </div>
		          </div>
		        </div>
		      </div>
		    </c:otherwise>
		  </c:choose>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>
