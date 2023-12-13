<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.fixed-top { position: fixed; top: 0; left: 0; right: 0; }
.header-top.topbar-scrolled { top: -37px; }
header .navbar.navbar-scrolled { top: 0; padding: 15px; }
header .navbar { padding: 5px 0; top: 37px; z-index: 997; }
main { margin-top: 130px; }
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

	<div class="container-fluid bg-light header-top fixed-top">
		<div class="container">
			<div class="row">
			
				<div class="col">
					<div class="p-2">
						<i class="bi bi-telephone-inbound-fill"></i> +82-1234-1234
					</div>
				</div>
				
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
			<a class="navbar-brand" href="${pageContext.request.contextPath}/"><img style="width: 150px; height: auto;"  alt="My Image" src="${pageContext.request.contextPath}/resources/images/logo.png"></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
				
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto flex-nowrap">
					<!--
					<li class="nav-item">
						<a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/">홈</a>
					</li>
					 -->
					 <!-- 
					<li class="nav-item">
						<a class="nav-link" href="#">가볼만한곳</a>
					</li>
					 -->
					 
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Product
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Dog</a></li>
							<li><a class="dropdown-item" href="#">Cat</a></li>
						</ul>
					</li>
	
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							menu
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">프로그래밍</a></li>
							<li><a class="dropdown-item" href="#">데이터베이스</a></li>
							<li><a class="dropdown-item" href="#">웹 프로그래밍</a></li>
							<li><a class="dropdown-item" href="#">데이터분석 및 AI</a></li>
							<li><a class="dropdown-item" href="#">클라우드 및 기타</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">질문과 답변</a></li>
						</ul>
					</li>
					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							menu
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">자주하는질문</a></li>
							<li><a class="dropdown-item" href="#">공지사항</a></li>
							<li><a class="dropdown-item" href="#">1:1문의</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">이벤트</a></li>
						</ul>
					</li>
					
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							menu
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">일정관리</a></li>
							<li><a class="dropdown-item" href="#">사진첩</a></li>
							<li><a class="dropdown-item" href="#">쪽지함</a></li>
							<li><a class="dropdown-item" href="#">친구관리</a></li>
							<li><a class="dropdown-item" href="#">메일</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">정보수정</a></li>
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