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
		let url = "${pageContext.request.contextPath}/product/"+productNum;
		location.href = url;
	});
});

</script>

<div class="container body-container">
    <div class="inner-page">
		<h2>${productUrl}</h2>
		<div class="row mt-1">
				<div class="col-md-4 col-lg-3 mt-4">
					<div class="border rounded product-item" data-productNum="1"  style="background-color: #fff;">
						<img class="thumbnail-img" src="${pageContext.request.contextPath}/resources/images/logo.png">
						<div class="p-2">
							<div class="text-truncate fw-semibold pb-1">
								애착인형 쓰페샤루
							</div>
							<div class="pb-1">
							  		<label class="fs-5 pe-2 text-danger">10%</label>
							  	<label class="fs-5 pe-2 fw-semibold"><fmt:formatNumber value="450"/>원</label>
							  		<label class="fs-6 fw-light text-decoration-line-through"><fmt:formatNumber value="500"/>원</label>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-4 col-lg-3 mt-4">
					<div class="border rounded product-item" data-productNum="1"  style="background-color: #fff;">
						<img class="thumbnail-img" src="${pageContext.request.contextPath}/resources/images/logo.png">
						<div class="p-2">
							<div class="text-truncate fw-semibold pb-1">
								애착인형 하이브리드
							</div>
							<div class="pb-1">
							  		<label class="fs-5 pe-2 text-danger">10%</label>
							  	<label class="fs-5 pe-2 fw-semibold"><fmt:formatNumber value="450"/>원</label>
							  		<label class="fs-6 fw-light text-decoration-line-through"><fmt:formatNumber value="500"/>원</label>
							</div>
						</div>
					</div>
				</div>
		</div>
		
		<div class="page-navigation mt-5">
			0 1 2
		</div>
		
    </div>
</div>