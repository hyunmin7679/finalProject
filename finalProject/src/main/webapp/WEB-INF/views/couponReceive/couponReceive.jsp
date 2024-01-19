<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.card {
	width: 300px;
	height: 200px;
	background-color: #F5D042;
	background-image: linear-gradient(43deg, #F5D042 0%, #466093 46%, #FFCC70 100%);
	border-radius: 8px;
	color: white;
	overflow: hidden;
	position: relative;
	transform-style: preserve-3d;
	perspective: 1000px;
	transition: all 0.5s cubic-bezier(0.23, 1, 0.320, 1);
	cursor: pointer;
}

.card-content {
	padding: 20px;
	position: relative;
	z-index: 1;
	display: flex;
	flex-direction: column;
	gap: 10px;
	color: white;
	align-items: center;
	justify-content: center;
	text-align: center;
	height: 100%;
}

.card-content .card-title {
	font-size: 24px;
	font-weight: 700;
	color: inherit;
	text-transform: uppercase;
}

.card-content .card-para {
	color: inherit;
	opacity: 0.8;
	font-size: 14px;
}

.card:hover {
	transform: rotateY(10deg) rotateX(10deg) scale(1.05);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.card:before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: linear-gradient(transparent, rgba(0, 0, 0, 0.1));
	transition: transform 0.5s cubic-bezier(0.23, 1, 0.320, 1);
	z-index: 1;
}

.card:hover:before {
	transform: translateX(-100%);
}

.card:after {
	content: "";
	position: absolute;
	top: 0;
	right: 0;
	width: 100%;
	height: 100%;
	background: linear-gradient(transparent, rgba(0, 0, 0, 0.1));
	transition: transform 0.5s cubic-bezier(0.23, 1, 0.320, 1);
	z-index: 1;
}

.card:hover:after {
	transform: translateX(100%);
}

button {
	width: 165px;
	height: 62px;
	cursor: pointer;
	color: #fff;
	font-size: 17px;
	border-radius: 1rem;
	border: none;
	position: relative;
	background: #100720;
	transition: 0.1s;
}

button::after {
	content: '';
	width: 100%;
	height: 100%;
	background-image: radial-gradient(circle farthest-corner at 10% 20%, rgba(255, 94, 247, 1)
		17.8%, rgba(2, 245, 255, 1) 100.2%);
	filter: blur(15px);
	z-index: -1;
	position: absolute;
	left: 0;
	top: 0;
}

button:active {
	transform: scale(0.9) rotate(3deg);
	background: radial-gradient(circle farthest-corner at 10% 20%, rgba(255, 94, 247, 1)
		17.8%, rgba(2, 245, 255, 1) 100.2%);
	transition: 0.5s;
}

h1 {
	height: 100px;
}

h1 span {
	position: relative;
	top: 20px;
	display: inline-block;
	animation: bounce .3s ease infinite alternate;
	font-family: 'Titan One', cursive;
	font-size: 50px;
	color: #000000;
	text-shadow: 0 1px 0 #CCC, 0 2px 0 #CCC, 0 3px 0 #CCC, 0 4px 0 #CCC, 0
		5px 0 #CCC, 0 6px 0 transparent, 0 7px 0 transparent, 0 8px 0
		transparent, 0 9px 0 transparent, 0 10px 10px rgba(0, 0, 0, .4);
}

h1 span:nth-child(2) {
	animation-delay: .1s;
}

h1 span:nth-child(3) {
	animation-delay: .2s;
}

h1 span:nth-child(4) {
	animation-delay: .3s;
}

h1 span:nth-child(5) {
	animation-delay: .4s;
}

h1 span:nth-child(6) {
	animation-delay: .5s;
}

h1 span:nth-child(7) {
	animation-delay: .6s;
}

h1 span:nth-child(8) {
	animation-delay: .7s;
}

@
keyframes bounce { 100% {
	top: -20px;
	text-shadow: 0 1px 0 #CCC, 0 2px 0 #CCC, 0 3px 0 #CCC, 0 4px 0 #CCC, 0
		5px 0 #CCC, 0 6px 0 #CCC, 0 7px 0 #CCC, 0 8px 0 #CCC, 0 9px 0 #CCC, 0
		50px 25px rgba(0, 0, 0, .2);
}
}
</style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

<div class="container body-container">


	<h1 class="animate__animated animate__fadeInLeftBig">
		<span>쿠</span> <span>폰</span> <span>목</span> <span>록</span> <span>(${dataCount})</span>
	</h1>
	

	<div class="inner-page">
		<div class="row mt-1">

			<c:forEach var="dto" items="${list}" varStatus="status">
				<div class="col-md-4 col-lg-3 mt-4 rounded">
					<div class="card">
						<div class="card-content">
							<p class="card-title" style="color: black;">${dto.couponName}</p>
							<p class="card-para" style="margin-bottom: 0px;">
								사용카테고리 :
								<c:if test="${dto.categoryNum == 22}">
						모두
					</c:if>
								<c:if test="${dto.categoryNum == 1}">
						건식사료
					</c:if>
								<c:if test="${dto.categoryNum == 2}">
						습식사료
					</c:if>
								<c:if test="${dto.categoryNum == 3}">
						우유/분유
					</c:if>
								<c:if test="${dto.categoryNum == 4}">
						고양이사료
					</c:if>
								<c:if test="${dto.categoryNum == 5}">
						강아지껌
					</c:if>
								<c:if test="${dto.categoryNum == 6}">
						육포/사시미
					</c:if>
								<c:if test="${dto.categoryNum == 7}">
						수제간식
					</c:if>
								<c:if test="${dto.categoryNum == 8}">
						비스켓/스낵
					</c:if>
								<c:if test="${dto.categoryNum == 9}">
						캔/파우치
					</c:if>
								<c:if test="${dto.categoryNum == 10}">
						고양이간식
					</c:if>
								<c:if test="${dto.categoryNum == 11}">
						위생/배변
					</c:if>
								<c:if test="${dto.categoryNum == 12}">
						건강관리
					</c:if>
								<c:if test="${dto.categoryNum == 13}">
						장난감
					</c:if>
								<c:if test="${dto.categoryNum == 14}">
						미용/목욕
					</c:if>
								<c:if test="${dto.categoryNum == 15}">
						하우스
					</c:if>
								<c:if test="${dto.categoryNum == 16}">
						급식기/급수기
					</c:if>
								<c:if test="${dto.categoryNum == 17}">
						의류/액세서리
					</c:if>
								<c:if test="${dto.categoryNum == 18}">
						목줄/가슴줄
					</c:if>
							</p>
							<p class="card-para" style="margin-bottom: 0px;">${dto.startCouponDate }
								~ ${dto.endCouponDate }</p>
							<p class="card-title" style="margin-bottom: 0px;">${dto.couponDiscount}%</p>
							<button type="button" class="receiveCoupon"
								data-couponnum="${dto.couponNum}">발급받기</button>
						</div>

					</div>
				</div>
			</c:forEach>




		</div>

		<div class="page-navigation mt-5">${paging }</div>

	</div>
</div>


<script type="text/javascript">
function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}


$('.receiveCoupon').click(function () {
	
	let couponNum = $(this).attr("data-couponnum");
	let url = '${pageContext.request.contextPath}/couponreceive/couponCom';
	let query = 'couponNum='+couponNum;
	
	const fn =function(data){
		console.log(data.state+'asdasd');
		console.log(data);
		if(data.state == 'true'){
			alert('쿠폰을 발급받으였읍니다.')
		}else if(data.state == 'false'){
			alert('이미 지급 받은 쿠폰이십니다.')
		}
		
	};
	
	ajaxFun(url, "post", query, "json", fn);
});


</script>