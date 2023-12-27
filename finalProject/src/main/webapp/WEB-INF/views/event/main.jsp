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

.items {
	text-align: center;
}

.item {
	display: inline-block;
	width: 100%;
	height: 210px;
	position: relative;
	border: 1px solid #ced4da;
}

.item img {
	position: absolute;
	border-radius: 5px;
	left: 0;
	width: 100%;
	height: 300px;
	display: block;
	overflow: hidden
}

.caption {
	width: inherit;
	height: inherit;
	background-color: rgba(0, 0, 0, 0.7);
	position: absolute;
	top: 0;
	left: 0;
	color: #fff;
	padding: 20px;
	box-sizing: border-box;
	opacity: 0;
	transition: 0.5s;
}

.caption a {
	color: #fff;
	background-color: #333;
	text-decoration: none;
	padding: 7px;
	border-radius: 3px;
}

.caption a:hover {
	background-color: #fff;
	color: #000;
}

.item:hover .caption {
	opacity: 1;
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
		let url = "${pageContext.request.contextPath}/event/article";// +productNum
		location.href = url;
	});
});

</script>

<div class="container body-container">
	<h2>이벤트</h2>
    <div class="inner-page">
		<div class="row mt-1">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<div class="col-md-4 col-lg-3 mt-4 rounded">
					<div class="border rounded product-item item" data-productNum="1"  style="background-color: #fff;">
						<img class="thumbnail-img" src="${pageContext.request.contextPath}/uploads/event/${dto.imageFileName}">
						<div class="caption">
								<a>${dto.subject}</a>
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