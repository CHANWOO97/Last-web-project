<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>루팡! | 장바구니</title>
<%@ include file="../setting/include.jsp"%>        
<script type="text/javascript">
	$(document).ready(function() {
	  updateTotalPrice();
	});
	function showToast(msg) {
	  let toast = $('#toast');
	  toast.text(msg).removeClass('d-none');
	  setTimeout(() => toast.addClass('d-none'), 1500);	  
	}
	function updateTotalPrice() {
	  let total = 0;
	  $('.card-body').each(function () {
		    const isChecked = $(this).find('.item-check').prop('checked');
		    const price = parseInt($(this).find('.quantity-input').data('price')) || 0;
		    const qty = parseInt($(this).find('.quantity-input').val()) || 0;

		    // ✅ 여기에서 바로 개별 상품 금액도 업데이트!
		    $(this).find('.item-total-price').text((price * qty).toLocaleString());

		    if (!isChecked) return; // 체크 안 된 항목은 총합 제외
		    total += price * qty;
	  });
	  $('#total-price').text(total.toLocaleString() + '원');
	};
	$(function (){
	// 수량 변경
	$('.quantity-input').on('change', function(){		
		const i_id = $(this).data('iid');
		const quantity = $(this).val();
		$.post('/cart/updateQuantity', {i_id, quantity}, function(response){			
			if(response === 'success'){
				showToast('수량이 변경되었습니다.');		
				updateTotalPrice(); // ← 새로고침 없이 total만 반영
			} else{
				alert('변경 실패');
			}
		});	
	});
	$('.item-check').on('change', function() {
		  updateTotalPrice();
	});
	});
	$(function() { 
	// 삭제  // form 안에서는 input 태그 권장
	$('.delete-btn').on('click', function(){
		if (!confirm('이 상품을 장바구니에서 제거할까요? 😢')) return;
		const i_id = $(this).data('iid');
		$.post('/cart/deleteItem', {i_id}, function(response){
			if(response === 'success'){
				alert('삭제되었습니다.');
				location.reload();
			} else {
				alert('삭제 실패!');
			}
		})
	});	});
	$(function() { 
	$('#orderForm').on('submit', function(e) {		
	  const checked = $('.item-check:checked');
	  if (checked.length === 0) {
	    alert('주문할 상품을 선택해주세요!');
	    e.preventDefault();
	  }
	});
	});
	// 전체 선택 (querySelectorAll 이용) 
	function toggleSelectAll() {
	    const checkBox = document.querySelectorAll('.item-check');
	    const allChecked = Array.from(checkBox).every(cb => cb.checked);	
	    checkBox.forEach(cb => cb.checked = !allChecked);
	    // 버튼 텍스트 변경
	    const toggleBtn = document.querySelector(".toggleBtn")
	    toggleBtn.value = allChecked ? "🛒 전체 상품 선택하기" : "🛒 전체 상품 선택해제";
	    if (allChecked) {
	    	  toggleBtn.classList.remove("btn-outline-danger");
	    	  toggleBtn.classList.add("btn-outline-secondary");
	    	} else {
	    	  toggleBtn.classList.remove("btn-outline-secondary");
	    	  toggleBtn.classList.add("btn-outline-danger");
	    	}
	    updateTotalPrice(); // 총 금액도 다시 계산
  	}
</script>
</head>
<body class="bg-light">
<div class="container py-5">
  <h1 class="fw-bold mb-4" style="max-width: 960px; margin: 0 auto;">
    <a href="/" class="text-decoration-none text-dark">Lupang</a>
  </h1>
  
  <div class="col-lg-10 mx-auto bg-white p-5 shadow rounded-4">
  
    <!-- 헤더 -->
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h3 class="fw-bold mb-0">🛒 장바구니</h3>
      <small class="text-muted">Step <span class="fw-bold text-primary">02</span> - 장바구니 확인</small>
    </div>

    <!-- 탭 -->
    <ul class="nav nav-tabs mb-4">
      <li class="nav-item">
        <a class="nav-link active fw-semibold" href="#">일반구매 (${fn:length(cartItems)})</a>
      </li>
      <li class="nav-item">
        <a class="nav-link fw-semibold" href="#">정기배송 (0)</a>
      </li>
    </ul>

    <!-- ✅ FORM 시작: 선택 상품 주문용 -->
    <form id="orderForm" method="post" action="/itemsOrder/order">
      <c:set var="total" value="0" />
      <c:forEach var="item" items="${cartItems}">
        <c:set var="itemTotal" value="${item.price * item.quantity}" />
        <c:set var="total" value="${total + itemTotal}" />

        <div class="card mb-3 border-0 shadow-sm" data-iid="${item.i_id}">
          <div class="card-body d-flex align-items-center">
            <input type="checkbox" name="selectedItems" class="form-check-input me-3 mt-1 item-check"
              value="${item.i_id}">

            <img src="/resources/images/items_photo/${item.photo}" width="100" class="me-4 rounded" alt="${item.name}">

            <div class="flex-grow-1">
              <h5 class="fw-bold mb-2">${item.name}</h5>
              <div class="text-danger fs-5 fw-bold">
              	<span class="item-total-price">
                	<fmt:formatNumber value="${item.price * item.quantity}" type="number" />
                </span> 원
              </div>
            </div>

            <div class="d-flex flex-column align-items-end" style="width: 100px;">
              <!-- 토스트 -->
              <div id="toast" class="position-fixed bottom-0 end-0 m-4 px-3 py-2 bg-dark text-white rounded d-none">
                수량이 변경되었습니다.
              </div>
              <input type="number" value="${item.quantity}" min="1"
                class="form-control text-center mb-2 quantity-input"
                data-iid="${item.i_id}" data-price="${item.price}">
              <input type="button" class="btn btn-outline-danger btn-sm delete-btn" data-iid="${item.i_id}" value="삭제">
            </div>
          </div>
        </div>
      </c:forEach>

      <!-- 총 금액 -->
      <div class="bg-light p-4 rounded mt-4 text-end">
        <div class="fs-5 mb-2">총 상품 가격:
          <span id="total-price" class="fw-bold text-primary">
            <fmt:formatNumber value="${total}" type="number" />원
          </span>
        </div>
        <!-- 선택된 상품만 주문 -->
        <input type="submit" class="btn btn-primary px-4 fw-bold" value="🛍 선택 상품 주문하기">
      </div>
    </form>
    <!-- ✅ FORM 끝 -->

    <!-- 전체 상품 주문 (모든 상품 강제 주문용 별도 버튼) 미구현-->
    <div class="text-end mt-2">
      <input type="button" class="btn btn-outline-secondary toggleBtn" onclick="toggleSelectAll()" value="🛒 전체 상품 선택하기">  
    </div>

  </div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>

</html>