<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
* { padding: 0; margin: 0;}

body {background-color: white;} 

.font {font-size: 12px; color: gray;} 


.sp--addon-302 {
}

.sp--width[scope="box"] {
    width: var(--width-box);
}
.sp--width {
    width: var(--width);
    margin: 0 auto;
}
.sp--box[gap] {
}
.sp--box {
    flex: 1;
    display: block;
    margin: 0 auto;
}
.sp--addon-302 .sp--box > ul > li {
    min-width: 0;
}
.sp--box[grid="2"] > ul > li {
    flex-basis: 50%;
}
.sp--box[grid] > ul > li {
    flex: none;
}
.sp--box[gap^="xl"] > ul > li {
    padding: var(--padding-xl);
}
.sp--box > ul > li {
    position: relative;
}
li {
    list-style: none;
}
.swiper-thumbnail {
    position: relative;
    width: 100%;
    /* height: 100%; */
    overflow: hidden;
}
element.style {
    transition-duration: 0ms;
    transform: translate3d(-606px, 0px, 0px);
}
.swiper-wrapper {
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
}
.swiper-container-android .swiper-slide, .swiper-wrapper {
    transform: translate3d(0px,0,0);
}
.swiper-wrapper {
    position: relative;
    width: 100%;
    /* height: 100%; */
    z-index: 1;
    display: flex;
    transition-property: transform;
    box-sizing: content-box;
}
.sp--addon-302 .swiper-container[banner="left"] .swiper-slide[banner="left"], .sp--addon-302 .swiper-container[banner="right"] .swiper-slide[banner="right"] {
    display: flex;
    height: auto;
    visibility: visible;
}
.sp--addon-302 .swiper-container .swiper-slide {
    display: none;
}
.sp--addon-302 .swiper-container[banner="left"] .swiper-slide[banner="left"], .sp--addon-302 .swiper-container[banner="right"] .swiper-slide[banner="right"] {
    display: flex;
    height: auto;
    visibility: visible;
}
.sp--addon-302 .swiper-container .swiper-slide {
    display: none;
}
.swiper-container .swiper-slide-active {
    z-index: 9;
}
</style>

<div class="container">

	<!-- 캐러셀 -->
	<div id="carouselExampleRide" class="carousel slide" data-bs-ride="true">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="${pageContext.request.contextPath}/resources/images/배너1.png" class="d-block w-100" style="max-height: 600px;">
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/resources/images/배너2.png" class="d-block w-100" style="max-height: 600px;">
	    </div>
	    <div class="carousel-item">
	      <img src="${pageContext.request.contextPath}/resources/images/cat.png" class="d-block w-100" style="max-height: 600px;">
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
	

<div class="sp--addon-302">
    <div class="sp--width" scope="box">

        <br><br><br><br><!-- 내부 컨테이너 --><div class="sp--box" grid="2" gap="xl">
            <ul><!-- 좌측 슬라이더 --><li pandassi-banner-group="ready" pandassi-banner-group-code="7f1dd97f900ec3d0967f">
                    <div class="swiper-container swiper-custom-pagination swiper-container-initialized swiper-container-horizontal sp--initialized-slider" banner="left" page="false" arrow="false" data-type="custom-pagination" data-chain="sp--addon-302--slider" data-swiper="
                            loop = true
                            speed = 666
                            slidesPerView = 1
                            loopedSlides = 1
                            autoplay-delay = 5000
                            autoplay-status = stop
                            navigation-prevEl = .swiper-navigation>.arrows>.prev
                            navigation-nextEl = .swiper-navigation>.arrows>.next
                            pagination-el = .swiper-navigation>.page
                        " count="2">
                        <div class="swiper-thumbnail"><div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-606px, 0px, 0px);" id="swiper-wrapper-53eb330ed3bbdbe7" aria-live="polite"><div class="swiper-slide swiper-slide-duplicate swiper-slide-prev swiper-slide-duplicate-next" pandassi-banner="ready" =""="" banner="left" area="9" theme="black" data-swiper-slide-index="1" style="width: 606px;" role="group" aria-label="1 / 4">
                                <a href="/category/훈련용품/101/" target="_self" class="sp--addon-302--banner">
                                    <div class="sp--addon-302--layer"><dt>반려동물 오뚝이 노즈워크볼</dt><dd>전기나 건전지를 사용하지 않고 안전하게~<br> 흔들흔들~ 중심을 잡아주는 무게추로 <br> 오뚝이처럼 쓰러지지 않고 계속 굴러다녀요!<br></dd><span>MORE</span></div>
                                    <span><img src="https://puppydog.co.kr/web/upload/appfiles/0zdpAngaKBFnlCcCqpCU4A/08e1e6bb386c703b58260d1eceb51e88.jpg"></span>
                                </a>
                            </div>
                            <div class="swiper-slide swiper-slide-active" pandassi-banner="ready" =""="" banner="left" area="7" theme="black" data-swiper-slide-index="0" style="width: 606px;" role="group" aria-label="2 / 4">
                                <a href="/category/훈련용품/101/" target="_self" class="sp--addon-302--banner">
                                    <div class="sp--addon-302--layer"><dt>반려동물 오뚝이 간식볼</dt><dd>반려동물을 위한 재미있는 간식볼<br>흔들흔들~ 쓰러지지 않는 오뚝이 간식볼</dd><span>MORE</span></div>
                                    <span><img src="https://puppydog.co.kr/web/upload/appfiles/0zdpAngaKBFnlCcCqpCU4A/3d8b061f7fc36c97ceecad86b72a698b.jpg"></span>
                                </a>
                            </div><div class="swiper-slide swiper-slide-next swiper-slide-duplicate-prev" pandassi-banner="ready" =""="" banner="left" area="9" theme="black" data-swiper-slide-index="1" style="width: 606px;" role="group" aria-label="3 / 4">
                                <a href="/category/훈련용품/101/" target="_self" class="sp--addon-302--banner">
                                    <div class="sp--addon-302--layer"><dt>반려동물 오뚝이 노즈워크볼</dt><dd>전기나 건전지를 사용하지 않고 안전하게~<br> 흔들흔들~ 중심을 잡아주는 무게추로 <br> 오뚝이처럼 쓰러지지 않고 계속 굴러다녀요!<br></dd><span>MORE</span></div>
                                    <span><img src="https://puppydog.co.kr/web/upload/appfiles/0zdpAngaKBFnlCcCqpCU4A/08e1e6bb386c703b58260d1eceb51e88.jpg"></span>
                                </a>
                            </div>
                        <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" pandassi-banner="ready" =""="" banner="left" area="7" theme="black" data-swiper-slide-index="0" style="width: 606px;" role="group" aria-label="4 / 4">
                                <a href="/category/훈련용품/101/" target="_self" class="sp--addon-302--banner">
                                    <div class="sp--addon-302--layer"><dt>반려동물 오뚝이 간식볼</dt><dd>반려동물을 위한 재미있는 간식볼<br>흔들흔들~ 쓰러지지 않는 오뚝이 간식볼</dd><span>MORE</span></div>
                                    <span><img src="https://puppydog.co.kr/web/upload/appfiles/0zdpAngaKBFnlCcCqpCU4A/3d8b061f7fc36c97ceecad86b72a698b.jpg"></span>
                                </a>
                            </div></div><div class="swiper-button"><div class="swiper-button-prev"></div><div class="swiper-button-next"></div></div></div>
                        <div class="swiper-navigation" dir="ltr">
                            <span class="page swiper-pagination-clickable swiper-pagination-bullets">
                                <button class="swiper-pagination-bullet swiper-pagination-bullet-customize swiper-pagination-bullet-active" tabindex="0"><span>1</span><i></i></button>
                            
                                <button class="swiper-pagination-bullet swiper-pagination-bullet-customize" tabindex="0"><span>2</span><i></i></button>
                            </span>
                            <span class="arrows">
                                <button class="arrow prev" tabindex="0" aria-label="Previous slide" aria-controls="swiper-wrapper-53eb330ed3bbdbe7"><i class="sp--icon" ico="arrow-thin" rotate="horizontal"></i></button>
                                <button class="arrow next" tabindex="0" aria-label="Next slide" aria-controls="swiper-wrapper-53eb330ed3bbdbe7"><i class="sp--icon" ico="arrow-thin"></i></button>
                            </span>
                        </div>
                    <div class="swiper-pagination"></div><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                </li><!-- // -->

                <!-- 우측 슬라이더 -->
                <li pandassi-banner-group="ready" pandassi-banner-group-code="7f1dd97f900ec3d0967f">
                    <div class="swiper-container swiper-custom-pagination swiper-container-initialized swiper-container-horizontal sp--initialized-slider" banner="right" page="false" arrow="false" data-type="custom-pagination" data-chain="sp--addon-302--slider">
                        " count="2">
                        <div class="swiper-thumbnail"><div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-606px, 0px, 0px);" id="swiper-wrapper-c69710be5081d529c" aria-live="polite"><div class="swiper-slide swiper-slide-duplicate swiper-slide-prev swiper-slide-duplicate-next" pandassi-banner="ready" =""="" banner="right" area="1" theme="black" data-swiper-slide-index="1" style="width: 606px;" role="group" aria-label="1 / 4">
                                <a href="/category/하우스텐트/110/" target="_self" class="sp--addon-302--banner">
                                    <div class="sp--addon-302--layer"><dt>반려동물 호박 동굴하우스</dt><dd>새근새근 잠드는 멍이에게는 아늑한 하우스~<br>숨기 좋아하는 냥이에게는 따듯한 숨숨집으로~</dd><span>MORE VIEW</span></div>
                                    <span><img src="https://puppydog.co.kr/web/upload/appfiles/0zdpAngaKBFnlCcCqpCU4A/abd3d32ac5d94e1a9aad50e06888c48e.jpg"></span>
                                </a>
                            </div>
                            <div class="swiper-slide swiper-slide-active" pandassi-banner="ready" =""="" banner="right" area="3" theme="black" data-swiper-slide-index="0" style="width: 606px;" role="group" aria-label="2 / 4">
                                <a href="/category/하우스텐트/110/" target="_self" class="sp--addon-302--banner">
                                    <div class="sp--addon-302--layer"><dt>반려동물 인디언 텐트하우스</dt><dd>집에서는 갬성캠핑 느낌 물씬~ <br>반려견과 떠나는 여행에서 편안하고 아늑한 잠자리!</dd><span>GO~</span></div>
                                    <span><img src="https://puppydog.co.kr/web/upload/appfiles/0zdpAngaKBFnlCcCqpCU4A/c8cdb5564306fb000dbfd4e053e77d97.jpg"></span>
                                </a>
                            </div><div class="swiper-slide swiper-slide-next swiper-slide-duplicate-prev" pandassi-banner="ready" =""="" banner="right" area="1" theme="black" data-swiper-slide-index="1" style="width: 606px;" role="group" aria-label="3 / 4">
                                <a href="/category/하우스텐트/110/" target="_self" class="sp--addon-302--banner">
                                    <div class="sp--addon-302--layer"><dt>반려동물 호박 동굴하우스</dt><dd>새근새근 잠드는 멍이에게는 아늑한 하우스~<br>숨기 좋아하는 냥이에게는 따듯한 숨숨집으로~</dd><span>MORE VIEW</span></div>
                                    <span><img src="https://puppydog.co.kr/web/upload/appfiles/0zdpAngaKBFnlCcCqpCU4A/abd3d32ac5d94e1a9aad50e06888c48e.jpg"></span>
                                </a>
                            </div>
                        <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active" pandassi-banner="ready" =""="" banner="right" area="3" theme="black" data-swiper-slide-index="0" style="width: 606px;" role="group" aria-label="4 / 4">
                                <a href="/category/하우스텐트/110/" target="_self" class="sp--addon-302--banner">
                                    <div class="sp--addon-302--layer"><dt>반려동물 인디언 텐트하우스</dt><dd>집에서는 갬성캠핑 느낌 물씬~ <br>반려견과 떠나는 여행에서 편안하고 아늑한 잠자리!</dd><span>GO~</span></div>
                                    <span><img src="https://puppydog.co.kr/web/upload/appfiles/0zdpAngaKBFnlCcCqpCU4A/c8cdb5564306fb000dbfd4e053e77d97.jpg"></span>
                                </a>
                            </div></div><div class="swiper-button"><div class="swiper-button-prev"></div><div class="swiper-button-next"></div></div></div>
                        <div class="swiper-navigation" dir="ltr">
                            <span class="page swiper-pagination-clickable swiper-pagination-bullets">
                                <button class="swiper-pagination-bullet swiper-pagination-bullet-customize swiper-pagination-bullet-active" tabindex="0"><span>1</span><i></i></button>
                            
                                <button class="swiper-pagination-bullet swiper-pagination-bullet-customize" tabindex="0"><span>2</span><i></i></button>
                            </span>
                            <span class="arrows">
                                <button class="arrow prev" tabindex="0" aria-label="Previous slide" aria-controls="swiper-wrapper-c69710be5081d529c"><i class="sp--icon" ico="arrow-thin" rotate="horizontal"></i></button>
                                <button class="arrow next" tabindex="0" aria-label="Next slide" aria-controls="swiper-wrapper-c69710be5081d529c"><i class="sp--icon" ico="arrow-thin"></i></button>
                            </span>
                        </div>
                    <div class="swiper-pagination"></div><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
                </li><!-- // -->

            </ul></div><!-- // -->

        <br></div>
</div>




</div>
	
	
