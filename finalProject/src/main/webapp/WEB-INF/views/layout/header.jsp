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


nav {background: #003166;}
nav ul {
    font-size: 0;
    margin: 0;
    padding: 0;
}
nav ul li {
    display: inline-block;
    position: relative;
}
nav ul li a {
    color: #fff;
    display: block;
    font-size: 14px;
    padding: 15px 14px;
    transition: 0.3s linear;
    text-decoration:none;
}
nav ul li a:hover {  text-decoration:none;}
nav ul li:hover { background: #003166; }
nav ul li ul {
    display: none;
    position: absolute;
    width: 250px;
}
nav ul li ul li {
    border-top: 1px solid #444;
    display: block;
}
nav ul li ul li:first-child { border-top: none; }
nav ul li ul li a {
    background: #373737;
    display: block;
    padding: 10px 14px;
    text-decoration: none;
}
nav ul li ul li a:hover {text-decoration:none; background: #126d9b; }
nav .fa.fa-angle-down { margin-left: 6px; }


.hicon{ padding-right: 150px;}



</style>

<script src="//code.jquery.com/jquery.min.js"></script>
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
<div class="">
	<div class="">
		<div class="row">
			
			<div class="col">
				
				
				<div class="d-flex justify-content-between">
					<a class="pt-3 pb-3 ps-5" href="${pageContext.request.contextPath}/"><img style="width: 250px; height: 60px;"  alt="logo" src="${pageContext.request.contextPath}/resources/images/logo.png"></a>
					
					<c:choose>
						<c:when test="${empty sessionScope.member}">
							<div class="hicon align-bottom pt-5">
								<a href="javascript:dialogLogin();" title="로그인"><i class="bi bi-lock p-2"></i></a>
								<a href="${pageContext.request.contextPath}/member/member" title="회원가입"><i class="bi bi-person-plus p-2"></i></a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="hicon align-bottom pt-5">
								<a href="${pageContext.request.contextPath}/member/logout" title="로그아웃"><i class="bi bi-unlock p-2"></i></a>
								<a href="#" title="쪽지" class="position-relative">
									<i class="bi bi-bell p-2"></i>
									<span class="new-noteCount position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary" style="font-size: 6px;"></span>
								</a>
								<c:if test="${sessionScope.member.membership>50}">
									<a href="${pageContext.request.contextPath}/admin" title="관리자"><i class="bi bi-gear p-2"></i></a>
								</c:if>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>

	<nav>
    <div class="container">	
        <ul>		 
			<li class='sub-menu'>
				<a href="#">
					사료<i class='fa fa-angle-down'></i>
				</a>
				<ul>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/1">건식사료</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/2">습식사료</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/3">우유/분유</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/4">고양이사료</a></li>
				</ul>
			</li>
			<li class='sub-menu'>
				<a href="#">
					간식<i class='fa fa-angle-down'></i>
				</a>
				<ul>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/5">강아지껌</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/6">육포/사시미</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/7">수제간식</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/8">비스켓/스낵</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/9">캔/파우치</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/10">고양이간식</a></li>
				</ul>
			</li>
			<li class='sub-menu'>
				<a href="#">
					용품<i class='fa fa-angle-down'></i>
				</a>
				<ul>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/11">위생/배변</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/12">건강관리</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/13">장난감</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/14">미용/목욕</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/15">하우스</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/16">급식기/급수기</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/17">의류/액세서리</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/product/18">목줄/가슴줄</a></li>
				</ul>
			</li>
			
			<li class='sub-menu'>
				<a href="#">
                     |
                </a>
			</li>
			
			<li class='sub-menu'>
				<a href="#">
                     Community<i class='fa fa-angle-down'></i>
                </a>
                <ul>
                	<li><a href="#">나눔</a></li>
					<li><a href="#">상담</a></li>
                    <li><a href="#">자유</a></li>
                    <li><a href="#">산책메이트</a></li>
                </ul>
			</li>
			
			<li class='sub-menu'>
				<a href="#">
					Event<i class='fa fa-angle-down'></i>
				</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/event/main">이벤트</a></li>
                </ul>
			</li>
			
			<li class='sub-menu'>
				<a href="#">
					Service Center<i class='fa fa-angle-down'></i>
				</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/faq/main">FAQ</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">문의사항</a></li>

				</ul>
			</li>
			
			<li class='sub-menu'>
				<a href="#">
                	MyPage<i class='fa fa-angle-down'></i>
                </a>
               	<ul>
                    <li><a href="#">회원정보</a></li>
                    <li><a href="#">내활동</a></li>
                    <li><a href="#">장바구니</a></li>
                    <li><a href="#">위시리스트</a></li>
                    <li><a href="${pageContext.request.contextPath}/myPage/paymentList">주문내역</a></li>
                    <li><a href="#">친구목록</a></li>
                    <li><a href="#">포인트/쿠폰</a></li>
                 	</ul>
             </li>
			
		</ul>
    </div>
</nav>

<script>
// 메뉴바 슬라이드
$('nav li').hover(
        function() {
            $('ul', this).stop().slideDown(200);
        },
        function() {
            $('ul', this).stop().slideUp(200);
        }
    );

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
