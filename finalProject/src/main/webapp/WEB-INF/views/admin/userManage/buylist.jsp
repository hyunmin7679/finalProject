<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="to" items="${purchaselist}" varStatus="status">
	<tr class="even" height="130px;">
		<td class="sorting_1"><a href="app-invoice-preview.html"> <span
				class="fw-medium">${to.ordernum}</span>
		</a></td>
		<td>${to.productName }</td>
		<td><button style="width: 50px; background-color: none;" type="button" class="btn " data-bs-html="true"
				data-toggle="tooltip" data-bs-placement="top" 
				title="<div>주문상태:${to.detailstates}</div>
				<div>주문수량:${to.qty }</div>
				<div>주문날짜:${to.orderdate }</div>">
				<c:if test="${to.detailState<3 || to.detailState==8 || to.detailState==12 }">
				<i class='bx bxs-home'></i>
				</c:if>
				<c:if test="${to.detailState>2 && to.detailState!=8 && to.detailState!=12 && to.detailState!=14 && to.detailState!=9 && to.detailState!=13}">
				<i class='bx bxs-error-circle'></i>
				</c:if>
				<c:if test="${ to.detailState==9 || to.detailState==13 }">
				<i class='bx bxs-x-circle' ></i>
				</c:if>
				<c:if test="${to.detailState==14 }">
				<i class='bx bxs-category-alt'></i>
				</c:if>
				</button></td>
				
		<td>${to.price*to.qty}</td>
		<td>${to.orderdate}</td>
		<td>${to.savedmoney}</td>
	</tr>
</c:forEach>
<tr>
	<td colspan="5">
		<div class="page-navigation">
			${paging}
			<div class="row mx-2">${dataCount}개(${page}/${total_page}페이지)</div>
		</div>
	</td>
</tr>

<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>