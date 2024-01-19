<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@600&display=swap');

button {
  border: 0;
  background: none;
  cursor:pointer;
}
.ass{
z-index: 1007;
border-radius: 15px;
background: white;
position: absolute;
right: 140px;
bottom:60px;
width: 220px;
height:40px;
border: 2px solid black;
             
             }
.layer_cont{
position: relative;
}
             
.img_wrap{
position: relative;
}
.main_popup {
  position: fixed;
  z-index: 1005;
  -webkit-box-shadow: 0px 13px 40px -6px #061626;
  box-shadow: 0px 13px 40px -6px #061626;
  top: 20%;
  left: 50%;
  display: none;

  &.on {
    display: block;
    background-color: #fff;
  }

  .img_wrap {
    width: 500px;
    height: 500px;
    display:flex;
    justify-content:center;
    align-items:center;
  }

  .btn_close {
    width: 32px;
    z-index: 1007;
    height: 35px;
    position: absolute;
    top: 5px;
    right: 10px;
    font-size: 0;
    border-top: 0;
    background: none;

    &::before {
      content: "";
      width: 2px;
      height: 32px;
      background-color: #333;
      position: absolute;
      top: 0;
      left: 15px;
      transform: rotate(45deg);
    }
    &::after {
      content: "";
      width: 32px;
      height: 2px;
      background-color: #333;
      position: absolute;
      top: 15px;
      left: 0;
      transform: rotate(45deg);
    }
  }

  .btn_today_close {
    width: 100%;
    height: 45px;
    background-color: #333;
    text-align: center;
    color: #fff;
    font-size: 14px;
    display: block;
    span {
      display: block;
      line-height: 40px;
      vertical-align: bottom;
      opacity: 0.8;
    }
  }
}
/* 커뮤니티글 */  

.card {
  --border-radius: 0.75rem;
  --primary-color: #0A174E;
  --secondary-color: #F5D042;
  width: 300px;
  font-family: "Noto Sans Korean";
  padding: 1rem;
  margin: 30px auto;
  cursor: pointer;
  border-radius: var(--border-radius);
  background: #f1f1f3;
  box-shadow: 0px 8px 16px 0px rgb(0 0 0 / 3%);
  position: relative;
}

.card > * + * {
  margin-top: 1.1em;
}

.card .card__content {
  font-size: 0.86rem;
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-orient: vertical;
  -moz-box-orient: vertical;
  -webkit-box-lines: multiple;
  -moz-box-lines: multiple;
  flex-direction: column;
  max-height: calc(0.86rem * 3); /* (font-size * line-height) * line-clamp */
  text-overflow: ellipsis;
  overflow: hidden;
}

.card .card__title {
  padding: 0;
  font-size: 1.3rem;
  font-weight: bold;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.card .card__date {
  color: #6e6b80;
  font-size: 0.8rem;
}

.card .card__arrow {
  position: absolute;
  background: var(--primary-color);
  padding: 0.4rem;
  border-top-left-radius: var(--border-radius);
  border-bottom-right-radius: var(--border-radius);
  bottom: 0;
  right: 0;
  transition: 0.2s;
  display: flex;
  justify-content: center;
  align-items: center;
}

.card svg {
  transition: 0.2s;
}

/* hover */
.card:hover .card__title {
  color: var(--primary-color);
  text-decoration: underline;
}

.card:hover .card__arrow {
  background: var(--secondary-color);
}

.card:hover .card__arrow svg {
  transform: translateX(3px);
}

</style>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/styles/responsive.css">
<div class="super_container">


	<div class="fs_menu_overlay"></div>
	

	<!-- Slider -->

	<div class="main_slider mt-1"
		style="background-image:url(${pageContext.request.contextPath}/resources/images/상품메인.png)">
		<div class="container fill_height">
			<div class="row align-items-center fill_height">
				<div class="col">
					<div class="main_slider_content">
						<h6>2023 New Year Collection</h6>
						<h1>Get up to 30% Off New Arrivals</h1>
						<div class="red_button shop_now_button">
							<a href="#">shop now</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Banner -->

	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="banner_item align-items-center"
						style="background-image:url(${pageContext.request.contextPath}/resources/images/상품배너2.jpg)">
						<div class="banner_category">
							<a href="categories.html">feed</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="banner_item align-items-center"
						style="background-image:url(${pageContext.request.contextPath}/resources/images/상품배너3.jpg)">
						<div class="banner_category">
							<a href="categories.html">Supplies</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="banner_item align-items-center"
						style="background-image:url(${pageContext.request.contextPath}/resources/images/상품배너1.jpg)">
						<div class="banner_category">
							<a href="categories.html">snack</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  -->
	<!-- New Arrivals -->

	<div class="new_arrivals">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>New Arrivals</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col text-center">
					<div class="new_arrivals_sorting">
						<ul
							class="arrivals_grid_sorting clearfix button-group filters-button-group">
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked"
								data-filter="*">ALL</li>
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
								data-filter=".women">사료</li>
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
								data-filter=".accessories">간식</li>
							<li
								class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center"
								data-filter=".men">용품</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="product-grid"
						data-isotope="{ &quot;itemSelector&quot;: &quot;.product-item&quot;, &quot;layoutMode&quot;: &quot;fitRows&quot; }"
						style="position: relative; height: 300px;">

						<!-- Product 1 -->
						<c:forEach var="vo" items="${productList}" varStatus="status">
						<div class="product-item * ${vo.categoryNum <= 4 ? 'women' : vo.categoryNum <= 10 ? 'accessories' : 'men'}"
							style="position: absolute; left: 0px; top: 0px; ">
							<div class="product discount product_filter"
								style="border-right: 1px solid rgb(233, 233, 233); height: 300px;">
								<div class="product_image">
									<img style="height: 150px;"
										src="${pageContext.request.contextPath}/uploads/product/${vo.thumbnail}">
								</div>
								<c:if test="${vo.discountRate > 0 }">
								<div
									class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
									<span>${vo.discountRate}%</span>
								</div>
								</c:if>
								<div class="product_info">
									<h6 class="product_name">
										<a href="${pageContext.request.contextPath}/product/buy/${vo.productNum}">${vo.productName }</a>
									</h6>
									<c:if test="${vo.discountRate > 0}">
									<div class="product_price">
									<span class="me-2">₩${vo.price}</span><br>₩${vo.salePrice}
									</div>
									</c:if>
									<c:if test="${vo.discountRate==0}">
									<div class="product_price">
										₩${vo.price}
									</div>
									</c:if>
								</div>
							</div>
							<div class="red_button add_to_cart_button mt-3">
								<a href="${pageContext.request.contextPath}/product/buy/${vo.productNum}">add to cart</a>
							</div>
						</div>
						</c:forEach>						
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Deal of the week -->

	<div class="deal_ofthe_week">
		<div class="row align-items-center">
			<div class="col-lg-6">
				<div class="deal_ofthe_week_img">
					<img
						src="${pageContext.request.contextPath}/resources/images/상품배너2.jpg">
				</div>
			</div>
			<div class="col-lg-6 text-right deal_ofthe_week_col">
				<div
					class="deal_ofthe_week_content d-flex flex-column align-items-center float-right">
					<div class="section_title">
						<h2>Deal Of The Week</h2>
					</div>
					<ul class="timer">
						<li
							class="d-inline-flex flex-column justify-content-center align-items-center">
							<div id="day" class="timer_num">03</div>
							<div class="timer_unit">Day</div>
						</li>
						<li
							class="d-inline-flex flex-column justify-content-center align-items-center">
							<div id="hour" class="timer_num">15</div>
							<div class="timer_unit">Hours</div>
						</li>
						<li
							class="d-inline-flex flex-column justify-content-center align-items-center">
							<div id="minute" class="timer_num">45</div>
							<div class="timer_unit">Mins</div>
						</li>
						<li
							class="d-inline-flex flex-column justify-content-center align-items-center">
							<div id="second" class="timer_num">23</div>
							<div class="timer_unit">Sec</div>
						</li>
					</ul>
					<div class="red_button deal_ofthe_week_button">
						<a href="#">shop now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Best Sellers -->

<div class="best_sellers">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				<div class="section_title new_arrivals_title">
					<h2>Best Sellers</h2>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col">
				<div class="product_slider_container">
					<div
						class="owl-carousel owl-theme product_slider owl-loaded owl-drag">
						<div class="owl-stage-outer">
							<div class="owl-stage"
								style="transform: translate3d(-255px, 0px, 0px); transition: all 0s ease 0s; width: 2550px;">
								<div class="owl-item" style="width: 255px;">
									<div class="owl-item product_slider_item">
										<div class="product-item">
											<div class="product discount">
												<div class="product_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/불독전용사이즈2_001.jpg">
												</div>
												<div class="favorite favorite_left"></div>
												<div
													class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
													<span>-$20</span>
												</div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">Fujifilm X100T 16 MP Digital
															Camera (Silver)</a>
													</h6>
													<div class="product_price">
														$520.00<span>$590.00</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item active" style="width: 255px;">
									<div class="owl-item product_slider_item">
										<div class="product-item women">
											<div class="product">
												<div class="product_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/사료1.png">
												</div>
												<div class="favorite"></div>
												<div
													class="product_bubble product_bubble_left product_bubble_green d-flex flex-column align-items-center">
													<span>new</span>
												</div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">Samsung CF591 Series Curved
															27-Inch FHD Monitor</a>
													</h6>
													<div class="product_price">$610.00</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item active" style="width: 255px;">
									<div class="owl-item product_slider_item">
										<div class="product-item women">
											<div class="product">
												<div class="product_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/불독전용사이즈2_001.jpg">
												</div>
												<div class="favorite"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">Blue Yeti USB Microphone
															Blackout Edition</a>
													</h6>
													<div class="product_price">$120.00</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item" style="width: 255px;">
									<div class="owl-item product_slider_item">
										<div class="product-item accessories">
											<div class="product">
												<div class="product_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/사료1.png">
												</div>
												<div
													class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
													<span>sale</span>
												</div>
												<div class="favorite favorite_left"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">DYMO LabelWriter 450 Turbo
															Thermal Label Printer</a>
													</h6>
													<div class="product_price">$410.00</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item" style="width: 255px;">
									<div class="owl-item product_slider_item">
										<div class="product-item women men">
											<div class="product">
												<div class="product_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/불독전용사이즈2_001.jpg">
												</div>
												<div class="favorite"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">Pryma Headphones, Rose Gold
															&amp; Grey</a>
													</h6>
													<div class="product_price">$180.00</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item" style="width: 255px;">
									<div class="owl-item product_slider_item">
										<div class="product-item accessories">
											<div class="product discount">
												<div class="product_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/사료1.png">
												</div>
												<div class="favorite favorite_left"></div>
												<div
													class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
													<span>-$20</span>
												</div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">Fujifilm X100T 16 MP Digital
															Camera (Silver)</a>
													</h6>
													<div class="product_price">
														$520.00<span>$590.00</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item" style="width: 255px;">
									<div class="owl-item product_slider_item">
										<div class="product-item women">
											<div class="product">
												<div class="product_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/불독전용사이즈2_001.jpg">
												</div>
												<div class="favorite"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">Samsung CF591 Series Curved
															27-Inch FHD Monitor</a>
													</h6>
													<div class="product_price">$610.00</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item" style="width: 255px;">
									<div class="owl-item product_slider_item">
										<div class="product-item accessories">
											<div class="product">
												<div class="product_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/사료1.png">
												</div>
												<div class="favorite"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">Blue Yeti USB Microphone
															Blackout Edition</a>
													</h6>
													<div class="product_price">$120.00</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item" style="width: 255px;">
									<div class="owl-item product_slider_item">
										<div class="product-item men">
											<div class="product">
												<div class="product_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/불독전용사이즈2_001.jpg">
												</div>
												<div
													class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
													<span>sale</span>
												</div>
												<div class="favorite favorite_left"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">DYMO LabelWriter 450 Turbo
															Thermal Label Printer</a>
													</h6>
													<div class="product_price">$410.00</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item" style="width: 255px;">
									<div class="owl-item product_slider_item">
										<div class="product-item men">
											<div class="product">
												<div class="product_image">
													<img
														src="${pageContext.request.contextPath}/resources/images/사료1.png">
												</div>
												<div class="favorite"></div>
												<div class="product_info">
													<h6 class="product_name">
														<a href="single.html">Pryma Headphones, Rose Gold
															&amp; Grey</a>
													</h6>
													<div class="product_price">$180.00</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="owl-nav disabled">
							<div class="owl-prev">prev</div>
							<div class="owl-next">next</div>
						</div>
						<div class="owl-dots disabled"></div>
					</div>

					<!-- Slider Navigation -->

					<div
						class="product_slider_nav_left product_slider_nav d-flex align-items-center justify-content-center flex-column">
						<i class="fa fa-chevron-left" aria-hidden="true"></i>
					</div>
					<div
						class="product_slider_nav_right product_slider_nav d-flex align-items-center justify-content-center flex-column">
						<i class="fa fa-chevron-right" aria-hidden="true"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  -->
	<!-- Benefit -->

	<div class="benefit">
		<div class="container">
			<div class="row benefit_row">
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon">
							<i class="fa fa-truck" aria-hidden="true"></i>
						</div>
						<div class="benefit_content">
							<h6>free shipping</h6>
							<p>Suffered Alteration in Some Form</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon">
							<i class="fa fa-money" aria-hidden="true"></i>
						</div>
						<div class="benefit_content">
							<h6>cach on delivery</h6>
							<p>The Internet Tend To Repeat</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon">
							<i class="fa fa-undo" aria-hidden="true"></i>
						</div>
						<div class="benefit_content">
							<h6>45 days return</h6>
							<p>Making it Look Like Readable</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon">
							<i class="fa fa-clock-o" aria-hidden="true"></i>
						</div>
						<div class="benefit_content">
							<h6>opening all week</h6>
							<p>8AM - 09PM</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Blogs -->

	<div class="blogs">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title">
						<h2>최신 커뮤니티 글</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach var="dto" items="${list}" varStatus="status">
					<div class="card" onclick="location.href='${pageContext.request.contextPath}/bbs/main?communityNum=${dto.communityNum}&pageNo=1&categoryNum=${dto.categoryNum}'">
					    <h3 class="card__title">${dto.subject}</h3>
					    <div class="card__content" style="font-size: 0.86rem;">
				            <script>
				                var content = "${dto.content}";
				                var maxLength = 200; // 최대 길이 설정
				                var truncated = content.length > maxLength ? content.substring(0, maxLength) + "..." : content;
				                document.write(truncated);
				            </script>
				        </div>
					    <div class="card__date">${dto.reg_date}</div>
					    <div class="card__arrow">
					        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" height="15" width="15">
					            <path fill="#fff" d="M13.4697 17.9697C13.1768 18.2626 13.1768 18.7374 13.4697 19.0303C13.7626 19.3232 14.2374 19.3232 14.5303 19.0303L20.3232 13.2374C21.0066 12.554 21.0066 11.446 20.3232 10.7626L14.5303 4.96967C14.2374 4.67678 13.7626 4.67678 13.4697 4.96967C13.1768 5.26256 13.1768 5.73744 13.4697 6.03033L18.6893 11.25H4C3.58579 11.25 3.25 11.5858 3.25 12C3.25 12.4142 3.58579 12.75 4 12.75H18.6893L13.4697 17.9697Z"></path>
					        </svg>
					    </div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
	

<div class="main_popup">
	<div class="layer_cont">
		<div class="img_wrap"><div>
			<img class="img-fluid rounded my-4"
				src="${pageContext.request.contextPath}/bootstrapTemp/assets/img/images/55555.jpg" height="100%"
				width="100%" alt="User avatar" /></div></div>
			<button class="btn_close">close</button>
		<button class="ass" onclick="location.href='${pageContext.request.contextPath}/event/main'" >이벤트 보러가기</button>
		<div class="btn_wrap">
			<button class="btn_today_close">
				<span>오늘 하루 보지 않기</span>
			</button>
			<!-- 그냥 닫기 --->
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/easing/easing.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>

</body>



<script>
	var toggleMainPopup = function() {

		/* 쿠키 제어 함수 정의 */
		var handleCookie = {
			// 쿠키 쓰기
			// 이름, 값, 만료일
			setCookie : function(name, val, exp) {
				var date = new Date();

				// 만료 시간 구하기(exp를 ms단위로 변경)
				date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
				console.log(name + "=" + val + ";expires=" + date.toUTCString()
						+ ";path=/");

				// 실제로 쿠키 작성하기
				document.cookie = name + "=" + val + ";expires="
						+ date.toUTCString() + ";";
			},
			// 쿠키 읽어오기(정규식 이용해서 가져오기)
			getCookie : function(name) {
				var value = document.cookie.match("(^|;) ?" + name
						+ "=([^;]*)(;|$)");
				return value ? value[2] : null;
			}
		};
		console.log(handleCookie.getCookie("today"));

		// 쿠키 읽고 화면 보이게
		if (handleCookie.getCookie("today") == "y") {
			$(".main_popup").removeClass("on");
		} else {
			$(".main_popup").addClass("on");
		}

		// 오늘하루 보지 않기 버튼
		$(".main_popup").on("click", ".btn_today_close", function() {
			handleCookie.setCookie("today", "y", 1);
			$(this).parents(".main_popup.on").removeClass("on");
		});

		// 일반 버튼
		$(".main_popup").on("click", ".btn_close", function() {
			$(this).parents(".main_popup.on").removeClass("on");
		});
	}

	$(function() {
		toggleMainPopup();
	});
</script>

