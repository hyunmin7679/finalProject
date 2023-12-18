<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style type="text/css">
.fixed-top { position: fixed; top: 0; left: 0; right: 0; }
.header-top.topbar-scrolled { top: -37px; }
header .navbar.navbar-scrolled { top: 0; padding: 15px; }
header .navbar { padding: 5px 0; top: 37px; z-index: 997;  background: #fff; }
header .header-top{ background: #fff; }
main { margin-top: 130px; }
li{ padding-left: 5px; padding-right: 5px;}

</style>

<script type="text/javascript">
$(function(){
	$(window).scroll(function() {
		if ($(this).scrollTop() > 100) {
			$('.navbar').addClass('navbar-scrolled');
			$('.header-top').addClass('topbar-scrolled');
		} else {
			$('.navbar').removeClass('navbar-scrolled');
			$('.header-top').removeClass('topbar-scrolled');
		}
	});

	if ($(window).scrollTop() > 100) {
		$('.navbar').addClass('navbar-scrolled');
		$('.header-top').addClass('topbar-scrolled');
	}
});
</script>

	<div class="container-fluid header-top fixed-top">
		<div class="container">
			<div class="row">
				
				<div class="col">
					<div class="d-flex justify-content-end">
						<c:choose>
							<c:when test="${empty sessionScope.member}">
								<div class="p-2">
									<a href="javascript:dialogLogin();" title="로그인"><i class="bi bi-lock"></i></a>
								</div>
								<div class="p-2">
									<a href="${pageContext.request.contextPath}/member/member" title="회원가입"><i class="bi bi-person-plus"></i></a>
								</div>	
							</c:when>
							<c:otherwise>
								<div class="p-2">
									<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃"><i class="bi bi-unlock"></i></a>
								</div>					
								<div class="p-2">
									<a href="#" title="쪽지" class="position-relative">
										<i class="bi bi-bell"></i>
										<span class="new-noteCount position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary" style="font-size: 6px;"></span>
									</a>
								</div>
								<c:if test="${sessionScope.member.membership>50}">
									<div class="p-2">
										<a href="${pageContext.request.contextPath}/admin" title="관리자"><i class="bi bi-gear"></i></a>
									</div>					
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<nav class="navbar navbar-expand-lg navbar-light fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img style="width: 250px; height: 60px;"  alt="logo" src="${pageContext.request.contextPath}/resources/images/logo.png"></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
				
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto flex-nowrap">
					 
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							사료
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/dog/main">건식사료</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">습식사료</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">우유/분유</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">고양이사료</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							간식
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/dog/main">강아지껌</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">육포/사시미</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">수제간식</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">비스켓/스낵</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">캔/파우치</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">고양이간식</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							용품
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/dog/main">위생/배변</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">건강관리</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">장난감</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">미용/목욕</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">하우스</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">급식기/급수기</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">의류/액세서리</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/cat/main">목줄/가슴줄</a></li>
						</ul>
					</li>
					
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="navbarDropdown" style="none" >
		                     |
		                </a>
					
					
					<li class="nav-item dropdown">
						
						<a class="nav-link" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		                     Community
		                </a>
		                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                	<li><a class="dropdown-item" href="#">나눔</a></li>
							<li><a class="dropdown-item" href="#">상담</a></li>
		                    <li><a class="dropdown-item" href="#">자유</a></li>
		                    <li><a class="dropdown-item" href="#">산책로 추천</a></li>
		                    <li><a class="dropdown-item" href="#">산책메이트</a></li>
		                </ul>

					</li>
					
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Event
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/event/main">이벤트</a></li>
	                    </ul>

					</li>
					
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Service Center
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/faq/main">FAQ</a></li>
		                    <li><a class="dropdown-item" href="#">공지사항</a></li>
		                    <li><a class="dropdown-item" href="#">문의사항</a></li>

						</ul>
					</li>
					
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		                	MyPage
		                </a>
	                	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		                    <li><a class="dropdown-item" href="#">회원정보</a></li>
		                    <li><a class="dropdown-item" href="#">내활동</a></li>
		                    <li><a class="dropdown-item" href="#">장바구니</a></li>
		                    <li><a class="dropdown-item" href="#">위시리스트</a></li>
		                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/myPage/paymentList">주문내역</a></li>
		                    <li><a class="dropdown-item" href="#">친구목록</a></li>
		                    <li><a class="dropdown-item" href="#">포인트/쿠폰</a></li>
		                    <li><a class="dropdown-item" href="#">배송지관리</a></li>
	                  	</ul>
		             </li>
					
				</ul>
			</div>
			
		</div>
	</nav>
<script type="text/javascript">
// 이미지 소스 배열
var imageSources = [
    "${pageContext.request.contextPath}/uploads/img/dd.PNG",
    "${pageContext.request.contextPath}/uploads/img/qq.PNG",
    "${pageContext.request.contextPath}/uploads/img/ww.PNG",
    "${pageContext.request.contextPath}/uploads/img/zz.PNG"
];

var currentImageIndex = 0;

function getNextImageSource() {
    // 배열에서 차례대로 이미지 소스 선택
    var nextImageSource = imageSources[currentImageIndex];

    // 다음 이미지 인덱스 설정 (마지막 이미지면 처음으로 돌아감)
    currentImageIndex = (currentImageIndex + 1) % imageSources.length;

    return nextImageSource;
}

function init() {
    document.addEventListener("click", function (event) {
        var clickedElement = event.target;
        var ignoredTags = ['A', 'BUTTON', 'INPUT', 'UL', 'LI', 'IMG','SPAN','I'];

        // 클릭된 요소가 무시할 태그에 속한다면 리턴
        if (ignoredTags.includes(clickedElement.tagName)) {
            return;
        }

        event.preventDefault(); // 기본 동작 중단

        var x = event.x;
        var y = event.y;

        var img = document.createElement("img");
        img.setAttribute("src", getNextImageSource());
        img.setAttribute("alt", "문서 아이템");
        img.className = "dynamicImage";

        // 초기 크기 설정
        img.style.width = "100px";
        img.style.height = "100px";

        img.style.position = "fixed";
        img.style.left = (x - 32) + "px"; // 이미지 중심을 클릭한 위치로 이동
        img.style.top = (y - 32) + "px"; // 이미지 중심을 클릭한 위치로 이동

        document.body.appendChild(img);

        fadeInImage(img);

       

        // 마우스 클릭 후 2초 후에 이미지 삭제
        setTimeout(function () {
            fadeOutImage(img);
        }, 150);
    });
}

function fadeInImage(element) {
    element.style.display = "block";
    setTimeout(function () {
        element.style.opacity = 1;
    }, 100); // Delay needed to trigger transition
}

function fadeOutImage(element) {
    element.style.opacity = 0;
    setTimeout(function () {
        element.style.display = "none";
        document.body.removeChild(element);
    }, 1000);
}

document.addEventListener("DOMContentLoaded", init);


</script>