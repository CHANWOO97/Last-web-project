<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	b { font-size: 18px; }
	.a{color: red; } 
	/*. = class  */
	#qt{font-size: 18px; }
	#abc{font-size: 32px;}
</style>
<script>
function clk() {
  const price = parseInt(${item.price});
  const qty = document.getElementById("quantity").value;
  document.getElementById("qt").innerText = qty;
  document.getElementById("saleprice").innerText = (price * qty).toLocaleString() + "원";
}
</script>
</head>
<body>
	<div class="container text-center">
    <h2 class="text-primary">상품상세보기</h2><br><br>
    <table class="table table-bordered table-info">
 
	    	<tr><td rowspan="5" width="50%"><img alt="" src="/resources/images/items_photo/${items.photo}"></td></tr>
	    	<tr><td valign="middle"><b>상품명 : ${items.name}</b></td></tr>
	    	<tr><td valign="middle">
		               <div id="abc">
		               <b>수량 : <span id="qt">1</span> / 구매금액 : <fmt:formatNumber value="${items.price }"></fmt:formatNumber>원</b></div>
		               </td></tr>	              
	    	<tr><td valign="middle">${items.description }</td></tr>
	    	<tr><td valign="middle">원산지 : ${items.location }</td></tr>
    </table>
    <div align="right">
    <span class="btn btn-info"><input type="number" name="quantity" min="1" max="99" value="1" size="2" id="quantity" onchange="clk()"></span>
    <a class="btn btn-info" href="./items/cart">장바구니</a>
    <a class="btn btn-success" href="./items/sale">구매하기</a>
    </div>
</div>
</body>
</html>