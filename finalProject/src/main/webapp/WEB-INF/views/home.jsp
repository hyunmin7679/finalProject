<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
* { padding: 0; margin: 0;}

.font {font-size: 12px; color: gray;} 

.gif {width: 700px; height: 600px;}

</style>

<div class="container">

	<!-- 캐러셀 -->
	<div id="carouselExampleRide" class="carousel slide" data-bs-ride="true">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="${pageContext.request.contextPath}/resources/images/상품배너1.PNG" class="d-block w-100" style="max-height: 600px;">
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/resources/images/상품배너2.PNG" class="d-block w-100" style="max-height: 600px;">
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/resources/images/상품배너3.PNG" class="d-block w-100" style="max-height: 600px;">
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/resources/images/상품배너4.PNG" class="d-block w-100" style="max-height: 600px;">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	
	
	
	
	<!-- 신상 아이템 (포이치로 돌리면 될듯) -->
	<div class="container body-container">
    	<div class="inner-page">
			<div style="margin-top: 100px;">
				<h4 style="font-weight: bold;">신상 아이템<span class="font"> | NEW ITEM TOP 5</span></h4>
			</div>
			<div class="row mt-1">
				<div class="col-md-auto col-lg-3 mt-4">
					<div class="border rounde dproduct-item " data-productNum="${dto.productNum}">
						<img class="thumbnail-img" src="${pageContext.request.contextPath}/resources/images/사료1.png" width="300px;">
						<div class="p-2">
							<div class="text-truncate fw-semibold pb-1">
								사료1-상품명
							</div>
							<div class="pb-1">
								<c:if test="${dto.discountRate != 0}">
							  		<label class="fs-5 pe-2 text-danger">10% (할인률)</label>
								</c:if>
							  	<label class="fs-5 pe-2 fw-semibold"><fmt:formatNumber value="${dto.salePrice}"/>원</label>
								<c:if test="${dto.discountRate != 0}">
							  		<label class="fs-6 fw-light text-decoration-line-through"><fmt:formatNumber value="${dto.price}"/>원</label>
								</c:if>
							</div>
						</div>
					</div>
				</div>			
			</div>
		</div>
	</div>
	
	<div style="margin-bottom: 100px; margin-top: 100px;">
		<img alt="웹배너1" src="${pageContext.request.contextPath}/resources/images/웹배너1.PNG" width="100%" height="180px;">
	</div>

		<div class="body-container">
			<div style="float: left;">
				<img class="gif" src="${pageContext.request.contextPath}/resources/images/크리스마스.gif">
			</div>
		<div style="float: right;">
			<img src="${pageContext.request.contextPath}/resources/images/크리스마스상품1.jpg" style="width: 430px; height: 550px;"> 
			<p class="d-grid gap-2 mx-auto mt-1"><button type="button" class="btn btn-success">상품보러가기</button><p>
		</div>
	</div>
	






</div>
	
	
