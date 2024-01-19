<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.product-item {
	cursor: pointer;
	overflow: hidden;
}
.thumbnail-img {
	width: 100%;
	min-height: 210px;
	max-height: 210px;
	vertical-align: top;
	object-fit: cover;
}
</style>

<script type="text/javascript">
$(function(){
	$(".product-item").mouseenter(function(e){
		$(this).find("img").css("transform", "scale(1.05)");
		$(this).find("img").css("overflow", "hidden");
		$(this).find("img").css("transition", "all 0.5s");
	});
	
	$(".product-item").mouseleave(function(e){
		$(this).find("img").css("transform", "scale(1)");
		$(this).find("img").css("transition", "all 0.5s");
	});
});

$(function(){
	$(".product-item").click(function(){
		let productNum = $(this).attr("data-productNum");
		let url = "${pageContext.request.contextPath}/product/buy/"+productNum;
		location.href = url;
	});
});

</script>

<div class="container body-container">
    <div class="inner-page">
		<h2>${dto.categoryName}</h2>
		<c:choose>
			<c:when test="${productUrl<=4}">
				<a href="${pageContext.request.contextPath}/product/1">건식사료</a>&nbsp;&nbsp;&nbsp;&nbsp;	
				<a href="${pageContext.request.contextPath}/product/2">습식사료</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/3">우유/분유</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/4">고양이사료</a>
			</c:when>
			<c:when test="${productUrl<=10}">
				<a href="${pageContext.request.contextPath}/product/5">강아지껌</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/6">육포/사시미</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/7">수제간식</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/8">비스켓/스낵</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/9">캔/파우치</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/10">고양이간식</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/product/11">위생/배변</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/12">건강관리</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/13">장난감</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/14">미용/목욕</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/15">하우스</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/16">급식기/급수기</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/17">의류/액세서리</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath}/product/18">목줄/가슴줄</a>
			</c:otherwise>	
		</c:choose>
		<div class="row mt-1">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<div class="col-md-4 col-lg-3 mt-4">
					<div class="border rounded product-item" data-productNum="${dto.productNum}">
						<img class="thumbnail-img" src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
						<div class="p-2">
							<div class="text-truncate fw-semibold pb-1">
								${dto.productName}
							</div>
							<div class="pb-1">
								<c:if test="${dto.discountRate != 0}">
							  		<label class="fs-5 pe-2 text-danger">${dto.discountRate}%</label>
								</c:if>
							  	<label class="fs-5 pe-2 fw-semibold"><fmt:formatNumber value="${dto.salePrice}"/>원</label>
								<c:if test="${dto.discountRate != 0}">
							  		<label class="fs-6 fw-light text-decoration-line-through"><fmt:formatNumber value="${dto.price}"/>원</label>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<div class="page-navigation mt-5">
			0 1 2
		</div>
		
    </div>
</div>
