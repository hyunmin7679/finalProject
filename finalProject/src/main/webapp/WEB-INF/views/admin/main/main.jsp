<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Content wrapper -->
<div class="content-wrapper">
	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="row">
			
			<!-- Total Revenue -->
			<div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
				<div class="card h-100">
					<div
						class="card-header d-flex align-items-center justify-content-between pb-0">
						<div class="card-title mb-0">
							<h5 class="m-0 me-2">카테고리별 주문현황</h5>
						</div>
						<div class="dropdown">
							<button class="btn p-0" type="button" id="orederStatistics"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="bx bx-dots-vertical-rounded"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-end"
								aria-labelledby="orederStatistics">
								<a class="dropdown-item" href="javascript:void(0);">새로고침</a> <a
									class="dropdown-item" href="javascript:void(0);">주간</a> <a
									class="dropdown-item" href="javascript:void(0);">월간</a> <a
									class="dropdown-item" href="javascript:void(0);">연간</a>
							</div>
						</div>
					</div>
					<div class="card-body">
						<div
							class="d-flex justify-content-between align-items-center mb-3"
							style="position: relative;">
							<div class="d-flex flex-column align-items-center gap-1">
								<h2 class="mb-2">8,258</h2>
								<span>전체 주문 수</span>
							</div>
							<div id="orderStatisticsChart" style="min-height: 137.55px;">
								<div id="apexchartsekwxz6ji"
									class="apexcharts-canvas apexchartsekwxz6ji apexcharts-theme-light"
									style="width: 130px; height: 137.55px;">
									<svg id="SvgjsSvg1478" width="130" height="137.55"
										xmlns="http://www.w3.org/2000/svg" version="1.1"
										xmlns:xlink="http://www.w3.org/1999/xlink"
										xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg"
										xmlns:data="ApexChartsNS" transform="translate(0, 0)"
										style="background: transparent;">
										<g id="SvgjsG1480"
											class="apexcharts-inner apexcharts-graphical"
											transform="translate(-7, 0)">
										<defs id="SvgjsDefs1479">
										<clipPath id="gridRectMaskekwxz6ji">
										<rect id="SvgjsRect1482" width="150" height="173" x="-4.5"
											y="-2.5" rx="0" ry="0" opacity="1" stroke-width="0"
											stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath>
										<clipPath id="forecastMaskekwxz6ji"></clipPath>
										<clipPath id="nonForecastMaskekwxz6ji"></clipPath>
										<clipPath id="gridRectMarkerMaskekwxz6ji">
										<rect id="SvgjsRect1483" width="145" height="172" x="-2"
											y="-2" rx="0" ry="0" opacity="1" stroke-width="0"
											stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs>
										<g id="SvgjsG1484" class="apexcharts-pie">
										<g id="SvgjsG1485" transform="translate(0, 0) scale(1)">
										<circle id="SvgjsCircle1486" r="44.835365853658544" cx="70.5"
											cy="70.5" fill="transparent"></circle>
										<g id="SvgjsG1487" class="apexcharts-slices">
										<g id="SvgjsG1488"
											class="apexcharts-series apexcharts-pie-series"
											seriesName="Electronic" rel="1" data:realIndex="0">
										<path id="SvgjsPath1489"
											d="M 70.5 10.71951219512195 A 59.78048780487805 59.78048780487805 0 0 1 97.63977353321047 123.7648046533095 L 90.85483014990785 110.44860348998213 A 44.835365853658544 44.835365853658544 0 0 0 70.5 25.664634146341456 L 70.5 10.71951219512195 z"
											fill="rgba(105,108,255,1)" fill-opacity="1"
											stroke-opacity="1" stroke-linecap="butt" stroke-width="5"
											stroke-dasharray="0"
											class="apexcharts-pie-area apexcharts-donut-slice-0"
											index="0" j="0" data:angle="153" data:startAngle="0"
											data:strokeWidth="5" data:value="85"
											data:pathOrig="M 70.5 10.71951219512195 A 59.78048780487805 59.78048780487805 0 0 1 97.63977353321047 123.7648046533095 L 90.85483014990785 110.44860348998213 A 44.835365853658544 44.835365853658544 0 0 0 70.5 25.664634146341456 L 70.5 10.71951219512195 z"
											stroke="#ffffff"></path></g>
										<g id="SvgjsG1490"
											class="apexcharts-series apexcharts-pie-series"
											seriesName="Sports" rel="2" data:realIndex="1">
										<path id="SvgjsPath1491"
											d="M 97.63977353321047 123.7648046533095 A 59.78048780487805 59.78048780487805 0 0 1 70.5 130.28048780487805 L 70.5 115.33536585365854 A 44.835365853658544 44.835365853658544 0 0 0 90.85483014990785 110.44860348998213 L 97.63977353321047 123.7648046533095 z"
											fill="rgba(133,146,163,1)" fill-opacity="1"
											stroke-opacity="1" stroke-linecap="butt" stroke-width="5"
											stroke-dasharray="0"
											class="apexcharts-pie-area apexcharts-donut-slice-1"
											index="0" j="1" data:angle="27" data:startAngle="153"
											data:strokeWidth="5" data:value="15"
											data:pathOrig="M 97.63977353321047 123.7648046533095 A 59.78048780487805 59.78048780487805 0 0 1 70.5 130.28048780487805 L 70.5 115.33536585365854 A 44.835365853658544 44.835365853658544 0 0 0 90.85483014990785 110.44860348998213 L 97.63977353321047 123.7648046533095 z"
											stroke="#ffffff"></path></g>
										<g id="SvgjsG1492"
											class="apexcharts-series apexcharts-pie-series"
											seriesName="Decor" rel="3" data:realIndex="2">
										<path id="SvgjsPath1493"
											d="M 70.5 130.28048780487805 A 59.78048780487805 59.78048780487805 0 0 1 10.71951219512195 70.50000000000001 L 25.664634146341456 70.5 A 44.835365853658544 44.835365853658544 0 0 0 70.5 115.33536585365854 L 70.5 130.28048780487805 z"
											fill="rgba(3,195,236,1)" fill-opacity="1" stroke-opacity="1"
											stroke-linecap="butt" stroke-width="5" stroke-dasharray="0"
											class="apexcharts-pie-area apexcharts-donut-slice-2"
											index="0" j="2" data:angle="90" data:startAngle="180"
											data:strokeWidth="5" data:value="50"
											data:pathOrig="M 70.5 130.28048780487805 A 59.78048780487805 59.78048780487805 0 0 1 10.71951219512195 70.50000000000001 L 25.664634146341456 70.5 A 44.835365853658544 44.835365853658544 0 0 0 70.5 115.33536585365854 L 70.5 130.28048780487805 z"
											stroke="#ffffff"></path></g>
										<g id="SvgjsG1494"
											class="apexcharts-series apexcharts-pie-series"
											seriesName="Fashion" rel="4" data:realIndex="3">
										<path id="SvgjsPath1495"
											d="M 10.71951219512195 70.50000000000001 A 59.78048780487805 59.78048780487805 0 0 1 70.48956633664653 10.719513105630845 L 70.4921747524849 25.664634829223125 A 44.835365853658544 44.835365853658544 0 0 0 25.664634146341456 70.5 L 10.71951219512195 70.50000000000001 z"
											fill="rgba(113,221,55,1)" fill-opacity="1" stroke-opacity="1"
											stroke-linecap="butt" stroke-width="5" stroke-dasharray="0"
											class="apexcharts-pie-area apexcharts-donut-slice-3"
											index="0" j="3" data:angle="90" data:startAngle="270"
											data:strokeWidth="5" data:value="50"
											data:pathOrig="M 10.71951219512195 70.50000000000001 A 59.78048780487805 59.78048780487805 0 0 1 70.48956633664653 10.719513105630845 L 70.4921747524849 25.664634829223125 A 44.835365853658544 44.835365853658544 0 0 0 25.664634146341456 70.5 L 10.71951219512195 70.50000000000001 z"
											stroke="#ffffff"></path></g></g></g>
										<g id="SvgjsG1496" class="apexcharts-datalabels-group"
											transform="translate(0, 0) scale(1)">
										<text id="SvgjsText1497"
											font-family="Helvetica, Arial, sans-serif" x="70.5" y="90.5"
											text-anchor="middle" dominant-baseline="auto"
											font-size="0.8125rem" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-datalabel-label"
											style="font-family: Helvetica, Arial, sans-serif;">Weekly</text>
										<text id="SvgjsText1498" font-family="Public Sans" x="70.5"
											y="71.5" text-anchor="middle" dominant-baseline="auto"
											font-size="1.5rem" font-weight="400" fill="#566a7f"
											class="apexcharts-text apexcharts-datalabel-value"
											style="font-family: &quot;Public Sans&quot;;">38%</text></g></g>
										<line id="SvgjsLine1499" x1="0" y1="0" x2="141" y2="0"
											stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1"
											stroke-linecap="butt" class="apexcharts-ycrosshairs"></line>
										<line id="SvgjsLine1500" x1="0" y1="0" x2="141" y2="0"
											stroke-dasharray="0" stroke-width="0" stroke-linecap="butt"
											class="apexcharts-ycrosshairs-hidden"></line></g>
										<g id="SvgjsG1481" class="apexcharts-annotations"></g></svg>
									<div class="apexcharts-legend"></div>
									<div class="apexcharts-tooltip apexcharts-theme-dark">
										<div class="apexcharts-tooltip-series-group" style="order: 1;">
											<span class="apexcharts-tooltip-marker"
												style="background-color: rgb(105, 108, 255);"></span>
											<div class="apexcharts-tooltip-text"
												style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
												<div class="apexcharts-tooltip-y-group">
													<span class="apexcharts-tooltip-text-y-label"></span><span
														class="apexcharts-tooltip-text-y-value"></span>
												</div>
												<div class="apexcharts-tooltip-goals-group">
													<span class="apexcharts-tooltip-text-goals-label"></span><span
														class="apexcharts-tooltip-text-goals-value"></span>
												</div>
												<div class="apexcharts-tooltip-z-group">
													<span class="apexcharts-tooltip-text-z-label"></span><span
														class="apexcharts-tooltip-text-z-value"></span>
												</div>
											</div>
										</div>
										<div class="apexcharts-tooltip-series-group" style="order: 2;">
											<span class="apexcharts-tooltip-marker"
												style="background-color: rgb(133, 146, 163);"></span>
											<div class="apexcharts-tooltip-text"
												style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
												<div class="apexcharts-tooltip-y-group">
													<span class="apexcharts-tooltip-text-y-label"></span><span
														class="apexcharts-tooltip-text-y-value"></span>
												</div>
												<div class="apexcharts-tooltip-goals-group">
													<span class="apexcharts-tooltip-text-goals-label"></span><span
														class="apexcharts-tooltip-text-goals-value"></span>
												</div>
												<div class="apexcharts-tooltip-z-group">
													<span class="apexcharts-tooltip-text-z-label"></span><span
														class="apexcharts-tooltip-text-z-value"></span>
												</div>
											</div>
										</div>
										<div class="apexcharts-tooltip-series-group" style="order: 3;">
											<span class="apexcharts-tooltip-marker"
												style="background-color: rgb(3, 195, 236);"></span>
											<div class="apexcharts-tooltip-text"
												style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
												<div class="apexcharts-tooltip-y-group">
													<span class="apexcharts-tooltip-text-y-label"></span><span
														class="apexcharts-tooltip-text-y-value"></span>
												</div>
												<div class="apexcharts-tooltip-goals-group">
													<span class="apexcharts-tooltip-text-goals-label"></span><span
														class="apexcharts-tooltip-text-goals-value"></span>
												</div>
												<div class="apexcharts-tooltip-z-group">
													<span class="apexcharts-tooltip-text-z-label"></span><span
														class="apexcharts-tooltip-text-z-value"></span>
												</div>
											</div>
										</div>
										<div class="apexcharts-tooltip-series-group" style="order: 4;">
											<span class="apexcharts-tooltip-marker"
												style="background-color: rgb(113, 221, 55);"></span>
											<div class="apexcharts-tooltip-text"
												style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
												<div class="apexcharts-tooltip-y-group">
													<span class="apexcharts-tooltip-text-y-label"></span><span
														class="apexcharts-tooltip-text-y-value"></span>
												</div>
												<div class="apexcharts-tooltip-goals-group">
													<span class="apexcharts-tooltip-text-goals-label"></span><span
														class="apexcharts-tooltip-text-goals-value"></span>
												</div>
												<div class="apexcharts-tooltip-z-group">
													<span class="apexcharts-tooltip-text-z-label"></span><span
														class="apexcharts-tooltip-text-z-value"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="resize-triggers">
								<div class="expand-trigger">
									<div style="width: 298px; height: 139px;"></div>
								</div>
								<div class="contract-trigger"></div>
							</div>
						</div>
						<ul class="p-0 m-0">
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<span class="avatar-initial rounded bg-label-primary"><i
										class="bx bx-mobile-alt"></i></span>
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">아웃도어</h6>
										<small class="text-muted">의류, 목줄</small>
									</div>
									<div class="user-progress">
										<small class="fw-semibold">x 건</small>
									</div>
								</div>
							</li>
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<span class="avatar-initial rounded bg-label-success"><i
										class="bx bx-closet"></i></span>
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">인도어</h6>
										<small class="text-muted">장난감</small>
									</div>
									<div class="user-progress">
										<small class="fw-semibold">x 건</small>
									</div>
								</div>
							</li>
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<span class="avatar-initial rounded bg-label-info"><i
										class="bx bx-home-alt"></i></span>
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">사료</h6>
										<small class="text-muted">사료 종류</small>
									</div>
									<div class="user-progress">
										<small class="fw-semibold">x 건</small>
									</div>
								</div>
							</li>
							<li class="d-flex">
								<div class="avatar flex-shrink-0 me-3">
									<span class="avatar-initial rounded bg-label-secondary"><i
										class="bx bx-football"></i></span>
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">간식</h6>
										<small class="text-muted">뼈다귀, 츄르</small>
									</div>
									<div class="user-progress">
										<small class="fw-semibold">99 건</small>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-lg-4 order-2 mb-4">
				<div class="card h-100">
					<div
						class="card-header d-flex align-items-center justify-content-between">
						<h5 class="card-title m-0 me-2 mb-5">기타 통계</h5>
						<div class="dropdown">
							<button class="btn p-0" type="button" id="transactionID"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="bx bx-dots-vertical-rounded"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-end mt-2"
								aria-labelledby="transactionID">
								<a class="dropdown-item" href="javascript:void(0);">주간 </a> <a
									class="dropdown-item" href="javascript:void(0);">월간 </a> <a
									class="dropdown-item" href="javascript:void(0);">연간</a>
							</div>
						</div>
					</div>
					<div class="card-body">
						<ul class="p-0 m-0">
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<img
										src="/pet/bootstrapTemp/assets/img/icons/unicons/paypal.png"
										alt="User" class="rounded">
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">선물 수입액</h6>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">+82.6</h6>
										<span class="text-muted">USD</span>
									</div>
								</div>
							</li>
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<img
										src="/pet/bootstrapTemp/assets/img/icons/unicons/wallet.png"
										alt="User" class="rounded">
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">반품 지출액</h6>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">+270.69</h6>
										<span class="text-muted">USD</span>
									</div>
								</div>
							</li>
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<img
										src="/pet/bootstrapTemp/assets/img/icons/unicons/chart.png"
										alt="User" class="rounded">
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">접속자 수</h6>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">+637.91</h6>
										<span class="text-muted">USD</span>
									</div>
								</div>
							</li>
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<img
										src="/pet/bootstrapTemp/assets/img/icons/unicons/cc-success.png"
										alt="User" class="rounded">
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">신규 가입자 수</h6>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">-838.71</h6>
										<span class="text-muted">USD</span>
									</div>
								</div>
							</li>
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<img
										src="/pet/bootstrapTemp/assets/img/icons/unicons/wallet.png"
										alt="User" class="rounded">
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">커뮤니티 글</h6>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">+203.33</h6>
										<span class="text-muted">USD</span>
									</div>
								</div>
							</li>

						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 order-2 mb-4">
				<div class="card h-100">
					<div
						class="card-header d-flex align-items-center justify-content-between">
						<h5 class="card-title m-0 me-2 mb-5">인기 아이콘 순위</h5>
						<div class="dropdown">
							<button class="btn p-0" type="button" id="transactionID"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="bx bx-dots-vertical-rounded"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-end mt-2"
								aria-labelledby="transactionID">
								<a class="dropdown-item" href="javascript:void(0);">주간 </a> <a
									class="dropdown-item" href="javascript:void(0);">월간 </a> <a
									class="dropdown-item" href="javascript:void(0);">연간</a>
							</div>
						</div>
					</div>
					<div class="card-body">
						<ul class="p-0 m-0">
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<img
										src="/pet/bootstrapTemp/assets/img/avatars/hdog.gif"
										alt="User" class="rounded">
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">1번</h6>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">+72개</h6>
									</div>
								</div>
							</li>
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<img
										src="/pet/bootstrapTemp/assets/img/avatars/wcat.gif"
										alt="User" class="rounded">
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">2번</h6>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">+60개</h6>
									</div>
								</div>
							</li>
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<img
										src="/pet/bootstrapTemp/assets/img/avatars/rdog.gif"
										alt="User" class="rounded">
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">3번</h6>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">+55</h6>
									</div>
								</div>
							</li>
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<img
										src="/pet/bootstrapTemp/assets/img/avatars/fcat.gif"
										alt="User" class="rounded">
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">4번</h6>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">+41</h6>
									</div>
								</div>
							</li>
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<img
										src="/pet/bootstrapTemp/assets/img/avatars/bulldog.gif"
										alt="User" class="rounded">
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">5번</h6>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">+27</h6>
									</div>
								</div>
							</li>

						</ul>
					</div>
				</div>
			</div>
			<!--/ Total Revenue -->
			<div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
				<div class="row">

					<!-- </div>
    <div class="row"> -->

				</div>
			</div>
		</div>
		<div class="row">
			<!-- Order Statistics -->
			<div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
				<div class="card">
					<div class="row row-bordered g-0">

						<div class="col-md-8">
							<h5 class="card-header m-0 me-2 pb-3">매출 현황</h5>
							<div id="totalRevenueChart" class="px-2"
								style="min-height: 315px;">
								<div id="apexchartsxcmehofq"
									class="apexcharts-canvas apexchartsxcmehofq apexcharts-theme-light"
									style="width: 461px; height: 300px;">
									<svg id="SvgjsSvg1393" width="461" height="300"
										xmlns="http://www.w3.org/2000/svg" version="1.1"
										xmlns:xlink="http://www.w3.org/1999/xlink"
										xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg"
										xmlns:data="ApexChartsNS" transform="translate(0, 0)"
										style="background: transparent;">
										<foreignObject x="0" y="0" width="461" height="300">
										<div
											class="apexcharts-legend apexcharts-align-left apx-legend-position-top"
											xmlns="http://www.w3.org/1999/xhtml"
											style="right: 0px; position: absolute; left: 0px; top: 4px; max-height: 150px;">
											<div class="apexcharts-legend-series" rel="1"
												seriesname="2021" data:collapsed="false"
												style="margin: 2px 10px;">
												<span class="apexcharts-legend-marker" rel="1"
													data:collapsed="false"
													style="background: rgb(105, 108, 255) !important; color: rgb(105, 108, 255); height: 8px; width: 8px; left: -3px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span
													class="apexcharts-legend-text" rel="1" i="0"
													data:default-text="2021" data:collapsed="false"
													style="color: rgb(161, 172, 184); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">2021</span>
											</div>
											<div class="apexcharts-legend-series" rel="2"
												seriesname="2020" data:collapsed="false"
												style="margin: 2px 10px;">
												<span class="apexcharts-legend-marker" rel="2"
													data:collapsed="false"
													style="background: rgb(3, 195, 236) !important; color: rgb(3, 195, 236); height: 8px; width: 8px; left: -3px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span
													class="apexcharts-legend-text" rel="2" i="1"
													data:default-text="2020" data:collapsed="false"
													style="color: rgb(161, 172, 184); font-size: 12px; font-weight: 400; font-family: Helvetica, Arial, sans-serif;">2020</span>
											</div>
										</div>
										<style type="text/css">
.apexcharts-legend {
	display: flex;
	overflow: auto;
	padding: 0 10px;
}

.apexcharts-legend.apx-legend-position-bottom, .apexcharts-legend.apx-legend-position-top
	{
	flex-wrap: wrap
}

.apexcharts-legend.apx-legend-position-right, .apexcharts-legend.apx-legend-position-left
	{
	flex-direction: column;
	bottom: 0;
}

.apexcharts-legend.apx-legend-position-bottom.apexcharts-align-left,
	.apexcharts-legend.apx-legend-position-top.apexcharts-align-left,
	.apexcharts-legend.apx-legend-position-right, .apexcharts-legend.apx-legend-position-left
	{
	justify-content: flex-start;
}

.apexcharts-legend.apx-legend-position-bottom.apexcharts-align-center,
	.apexcharts-legend.apx-legend-position-top.apexcharts-align-center {
	justify-content: center;
}

.apexcharts-legend.apx-legend-position-bottom.apexcharts-align-right,
	.apexcharts-legend.apx-legend-position-top.apexcharts-align-right {
	justify-content: flex-end;
}

.apexcharts-legend-series {
	cursor: pointer;
	line-height: normal;
}

.apexcharts-legend.apx-legend-position-bottom .apexcharts-legend-series,
	.apexcharts-legend.apx-legend-position-top .apexcharts-legend-series {
	display: flex;
	align-items: center;
}

.apexcharts-legend-text {
	position: relative;
	font-size: 14px;
}

.apexcharts-legend-text *, .apexcharts-legend-marker * {
	pointer-events: none;
}

.apexcharts-legend-marker {
	position: relative;
	display: inline-block;
	cursor: pointer;
	margin-right: 3px;
	border-style: solid;
}

.apexcharts-legend.apexcharts-align-right .apexcharts-legend-series,
	.apexcharts-legend.apexcharts-align-left .apexcharts-legend-series {
	display: inline-block;
}

.apexcharts-legend-series.apexcharts-no-click {
	cursor: auto;
}

.apexcharts-legend .apexcharts-hidden-zero-series, .apexcharts-legend .apexcharts-hidden-null-series
	{
	display: none !important;
}

.apexcharts-inactive-legend {
	opacity: 0.45;
}
</style></foreignObject>
										<g id="SvgjsG1395"
											class="apexcharts-inner apexcharts-graphical"
											transform="translate(53.80000114440918, 52)">
										<defs id="SvgjsDefs1394">
										<linearGradient id="SvgjsLinearGradient1399" x1="0" y1="0"
											x2="0" y2="1">
										<stop id="SvgjsStop1400" stop-opacity="0.4"
											stop-color="rgba(216,227,240,0.4)" offset="0"></stop>
										<stop id="SvgjsStop1401" stop-opacity="0.5"
											stop-color="rgba(190,209,230,0.5)" offset="1"></stop>
										<stop id="SvgjsStop1402" stop-opacity="0.5"
											stop-color="rgba(190,209,230,0.5)" offset="1"></stop></linearGradient>
										<clipPath id="gridRectMaskxcmehofq">
										<rect id="SvgjsRect1404" width="397.1999988555908"
											height="223.70079907417298" x="-5" y="-3" rx="0" ry="0"
											opacity="1" stroke-width="0" stroke="none"
											stroke-dasharray="0" fill="#fff"></rect></clipPath>
										<clipPath id="forecastMaskxcmehofq"></clipPath>
										<clipPath id="nonForecastMaskxcmehofq"></clipPath>
										<clipPath id="gridRectMarkerMaskxcmehofq">
										<rect id="SvgjsRect1405" width="391.1999988555908"
											height="221.70079907417298" x="-2" y="-2" rx="0" ry="0"
											opacity="1" stroke-width="0" stroke="none"
											stroke-dasharray="0" fill="#fff"></rect></clipPath></defs>
										<rect id="SvgjsRect1403" width="22.125714220319473"
											height="217.70079907417298" x="0" y="0" rx="0" ry="0"
											opacity="1" stroke-width="0" stroke-dasharray="3"
											fill="url(#SvgjsLinearGradient1399)"
											class="apexcharts-xcrosshairs" y2="217.70079907417298"
											filter="none" fill-opacity="0.9"></rect>
										<g id="SvgjsG1425" class="apexcharts-xaxis"
											transform="translate(0, 0)">
										<g id="SvgjsG1426" class="apexcharts-xaxis-texts-g"
											transform="translate(0, -4)">
										<text id="SvgjsText1428"
											font-family="Helvetica, Arial, sans-serif"
											x="27.657142775399343" y="246.70079907417298"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1429">Jan</tspan>
										<title>Jan</title></text>
										<text id="SvgjsText1431"
											font-family="Helvetica, Arial, sans-serif"
											x="82.97142832619804" y="246.70079907417298"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1432">Feb</tspan>
										<title>Feb</title></text>
										<text id="SvgjsText1434"
											font-family="Helvetica, Arial, sans-serif"
											x="138.28571387699674" y="246.70079907417298"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1435">Mar</tspan>
										<title>Mar</title></text>
										<text id="SvgjsText1437"
											font-family="Helvetica, Arial, sans-serif"
											x="193.5999994277954" y="246.70079907417298"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1438">Apr</tspan>
										<title>Apr</title></text>
										<text id="SvgjsText1440"
											font-family="Helvetica, Arial, sans-serif"
											x="248.91428497859408" y="246.70079907417298"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1441">May</tspan>
										<title>May</title></text>
										<text id="SvgjsText1443"
											font-family="Helvetica, Arial, sans-serif"
											x="304.22857052939275" y="246.70079907417298"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1444">Jun</tspan>
										<title>Jun</title></text>
										<text id="SvgjsText1446"
											font-family="Helvetica, Arial, sans-serif"
											x="359.5428560801914" y="246.70079907417298"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1447">Jul</tspan>
										<title>Jul</title></text></g></g>
										<g id="SvgjsG1462" class="apexcharts-grid">
										<g id="SvgjsG1463" class="apexcharts-gridlines-horizontal">
										<line id="SvgjsLine1465" x1="0" y1="0" x2="387.1999988555908"
											y2="0" stroke="#eceef1" stroke-dasharray="0"
											stroke-linecap="butt" class="apexcharts-gridline"></line>
										<line id="SvgjsLine1466" x1="0" y1="43.540159814834595"
											x2="387.1999988555908" y2="43.540159814834595"
											stroke="#eceef1" stroke-dasharray="0" stroke-linecap="butt"
											class="apexcharts-gridline"></line>
										<line id="SvgjsLine1467" x1="0" y1="87.08031962966919"
											x2="387.1999988555908" y2="87.08031962966919"
											stroke="#eceef1" stroke-dasharray="0" stroke-linecap="butt"
											class="apexcharts-gridline"></line>
										<line id="SvgjsLine1468" x1="0" y1="130.6204794445038"
											x2="387.1999988555908" y2="130.6204794445038"
											stroke="#eceef1" stroke-dasharray="0" stroke-linecap="butt"
											class="apexcharts-gridline"></line>
										<line id="SvgjsLine1469" x1="0" y1="174.16063925933838"
											x2="387.1999988555908" y2="174.16063925933838"
											stroke="#eceef1" stroke-dasharray="0" stroke-linecap="butt"
											class="apexcharts-gridline"></line>
										<line id="SvgjsLine1470" x1="0" y1="217.70079907417298"
											x2="387.1999988555908" y2="217.70079907417298"
											stroke="#eceef1" stroke-dasharray="0" stroke-linecap="butt"
											class="apexcharts-gridline"></line></g>
										<g id="SvgjsG1464" class="apexcharts-gridlines-vertical"></g>
										<line id="SvgjsLine1472" x1="0" y1="217.70079907417298"
											x2="387.1999988555908" y2="217.70079907417298"
											stroke="transparent" stroke-dasharray="0"
											stroke-linecap="butt"></line>
										<line id="SvgjsLine1471" x1="0" y1="1" x2="0"
											y2="217.70079907417298" stroke="transparent"
											stroke-dasharray="0" stroke-linecap="butt"></line></g>
										<g id="SvgjsG1406"
											class="apexcharts-bar-series apexcharts-plot-series">
										<g id="SvgjsG1407" class="apexcharts-series" seriesName="2021"
											rel="1" data:realIndex="0">
										<path id="SvgjsPath1409"
											d="M 16.594285665239607 120.62047944450379L 16.594285665239607 62.24819177780151Q 16.594285665239607 52.24819177780151 26.594285665239607 52.24819177780151L 22.719999885559076 52.24819177780151Q 32.719999885559076 52.24819177780151 32.719999885559076 62.24819177780151L 32.719999885559076 62.24819177780151L 32.719999885559076 120.62047944450379Q 32.719999885559076 130.6204794445038 22.719999885559076 130.6204794445038L 26.594285665239607 130.6204794445038Q 16.594285665239607 130.6204794445038 16.594285665239607 120.62047944450379z"
											fill="rgba(105,108,255,0.85)" fill-opacity="1"
											stroke="#ffffff" stroke-opacity="1" stroke-linecap="round"
											stroke-width="6" stroke-dasharray="0"
											class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 16.594285665239607 120.62047944450379L 16.594285665239607 62.24819177780151Q 16.594285665239607 52.24819177780151 26.594285665239607 52.24819177780151L 22.719999885559076 52.24819177780151Q 32.719999885559076 52.24819177780151 32.719999885559076 62.24819177780151L 32.719999885559076 62.24819177780151L 32.719999885559076 120.62047944450379Q 32.719999885559076 130.6204794445038 22.719999885559076 130.6204794445038L 26.594285665239607 130.6204794445038Q 16.594285665239607 130.6204794445038 16.594285665239607 120.62047944450379z"
											pathFrom="M 16.594285665239607 120.62047944450379L 16.594285665239607 120.62047944450379L 32.719999885559076 120.62047944450379L 32.719999885559076 120.62047944450379L 32.719999885559076 120.62047944450379L 32.719999885559076 120.62047944450379L 32.719999885559076 120.62047944450379L 16.594285665239607 120.62047944450379"
											cy="52.24819177780151" cx="68.9085712160383" j="0" val="18"
											barHeight="78.37228766670228" barWidth="22.125714220319473"></path>
										<path id="SvgjsPath1410"
											d="M 71.9085712160383 120.62047944450379L 71.9085712160383 110.14236757411956Q 71.9085712160383 100.14236757411956 81.9085712160383 100.14236757411956L 78.03428543635778 100.14236757411956Q 88.03428543635778 100.14236757411956 88.03428543635778 110.14236757411956L 88.03428543635778 110.14236757411956L 88.03428543635778 120.62047944450379Q 88.03428543635778 130.6204794445038 78.03428543635778 130.6204794445038L 81.9085712160383 130.6204794445038Q 71.9085712160383 130.6204794445038 71.9085712160383 120.62047944450379z"
											fill="rgba(105,108,255,0.85)" fill-opacity="1"
											stroke="#ffffff" stroke-opacity="1" stroke-linecap="round"
											stroke-width="6" stroke-dasharray="0"
											class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 71.9085712160383 120.62047944450379L 71.9085712160383 110.14236757411956Q 71.9085712160383 100.14236757411956 81.9085712160383 100.14236757411956L 78.03428543635778 100.14236757411956Q 88.03428543635778 100.14236757411956 88.03428543635778 110.14236757411956L 88.03428543635778 110.14236757411956L 88.03428543635778 120.62047944450379Q 88.03428543635778 130.6204794445038 78.03428543635778 130.6204794445038L 81.9085712160383 130.6204794445038Q 71.9085712160383 130.6204794445038 71.9085712160383 120.62047944450379z"
											pathFrom="M 71.9085712160383 120.62047944450379L 71.9085712160383 120.62047944450379L 88.03428543635778 120.62047944450379L 88.03428543635778 120.62047944450379L 88.03428543635778 120.62047944450379L 88.03428543635778 120.62047944450379L 88.03428543635778 120.62047944450379L 71.9085712160383 120.62047944450379"
											cy="100.14236757411956" cx="124.22285676683698" j="1" val="7"
											barHeight="30.478111870384218" barWidth="22.125714220319473"></path>
										<path id="SvgjsPath1411"
											d="M 127.22285676683698 120.62047944450379L 127.22285676683698 75.3102397222519Q 127.22285676683698 65.3102397222519 137.22285676683697 65.3102397222519L 133.34857098715645 65.3102397222519Q 143.34857098715645 65.3102397222519 143.34857098715645 75.3102397222519L 143.34857098715645 75.3102397222519L 143.34857098715645 120.62047944450379Q 143.34857098715645 130.6204794445038 133.34857098715645 130.6204794445038L 137.22285676683697 130.6204794445038Q 127.22285676683698 130.6204794445038 127.22285676683698 120.62047944450379z"
											fill="rgba(105,108,255,0.85)" fill-opacity="1"
											stroke="#ffffff" stroke-opacity="1" stroke-linecap="round"
											stroke-width="6" stroke-dasharray="0"
											class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 127.22285676683698 120.62047944450379L 127.22285676683698 75.3102397222519Q 127.22285676683698 65.3102397222519 137.22285676683697 65.3102397222519L 133.34857098715645 65.3102397222519Q 143.34857098715645 65.3102397222519 143.34857098715645 75.3102397222519L 143.34857098715645 75.3102397222519L 143.34857098715645 120.62047944450379Q 143.34857098715645 130.6204794445038 133.34857098715645 130.6204794445038L 137.22285676683697 130.6204794445038Q 127.22285676683698 130.6204794445038 127.22285676683698 120.62047944450379z"
											pathFrom="M 127.22285676683698 120.62047944450379L 127.22285676683698 120.62047944450379L 143.34857098715645 120.62047944450379L 143.34857098715645 120.62047944450379L 143.34857098715645 120.62047944450379L 143.34857098715645 120.62047944450379L 143.34857098715645 120.62047944450379L 127.22285676683698 120.62047944450379"
											cy="65.3102397222519" cx="179.53714231763567" j="2" val="15"
											barHeight="65.3102397222519" barWidth="22.125714220319473"></path>
										<path id="SvgjsPath1412"
											d="M 182.53714231763567 120.62047944450379L 182.53714231763567 14.354015981483457Q 182.53714231763567 4.354015981483457 192.53714231763567 4.354015981483457L 188.66285653795515 4.354015981483457Q 198.66285653795515 4.354015981483457 198.66285653795515 14.354015981483457L 198.66285653795515 14.354015981483457L 198.66285653795515 120.62047944450379Q 198.66285653795515 130.6204794445038 188.66285653795515 130.6204794445038L 192.53714231763567 130.6204794445038Q 182.53714231763567 130.6204794445038 182.53714231763567 120.62047944450379z"
											fill="rgba(105,108,255,0.85)" fill-opacity="1"
											stroke="#ffffff" stroke-opacity="1" stroke-linecap="round"
											stroke-width="6" stroke-dasharray="0"
											class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 182.53714231763567 120.62047944450379L 182.53714231763567 14.354015981483457Q 182.53714231763567 4.354015981483457 192.53714231763567 4.354015981483457L 188.66285653795515 4.354015981483457Q 198.66285653795515 4.354015981483457 198.66285653795515 14.354015981483457L 198.66285653795515 14.354015981483457L 198.66285653795515 120.62047944450379Q 198.66285653795515 130.6204794445038 188.66285653795515 130.6204794445038L 192.53714231763567 130.6204794445038Q 182.53714231763567 130.6204794445038 182.53714231763567 120.62047944450379z"
											pathFrom="M 182.53714231763567 120.62047944450379L 182.53714231763567 120.62047944450379L 198.66285653795515 120.62047944450379L 198.66285653795515 120.62047944450379L 198.66285653795515 120.62047944450379L 198.66285653795515 120.62047944450379L 198.66285653795515 120.62047944450379L 182.53714231763567 120.62047944450379"
											cy="4.354015981483457" cx="234.85142786843437" j="3" val="29"
											barHeight="126.26646346302033" barWidth="22.125714220319473"></path>
										<path id="SvgjsPath1413"
											d="M 237.85142786843437 120.62047944450379L 237.85142786843437 62.24819177780151Q 237.85142786843437 52.24819177780151 247.85142786843437 52.24819177780151L 243.97714208875385 52.24819177780151Q 253.97714208875385 52.24819177780151 253.97714208875385 62.24819177780151L 253.97714208875385 62.24819177780151L 253.97714208875385 120.62047944450379Q 253.97714208875385 130.6204794445038 243.97714208875385 130.6204794445038L 247.85142786843437 130.6204794445038Q 237.85142786843437 130.6204794445038 237.85142786843437 120.62047944450379z"
											fill="rgba(105,108,255,0.85)" fill-opacity="1"
											stroke="#ffffff" stroke-opacity="1" stroke-linecap="round"
											stroke-width="6" stroke-dasharray="0"
											class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 237.85142786843437 120.62047944450379L 237.85142786843437 62.24819177780151Q 237.85142786843437 52.24819177780151 247.85142786843437 52.24819177780151L 243.97714208875385 52.24819177780151Q 253.97714208875385 52.24819177780151 253.97714208875385 62.24819177780151L 253.97714208875385 62.24819177780151L 253.97714208875385 120.62047944450379Q 253.97714208875385 130.6204794445038 243.97714208875385 130.6204794445038L 247.85142786843437 130.6204794445038Q 237.85142786843437 130.6204794445038 237.85142786843437 120.62047944450379z"
											pathFrom="M 237.85142786843437 120.62047944450379L 237.85142786843437 120.62047944450379L 253.97714208875385 120.62047944450379L 253.97714208875385 120.62047944450379L 253.97714208875385 120.62047944450379L 253.97714208875385 120.62047944450379L 253.97714208875385 120.62047944450379L 237.85142786843437 120.62047944450379"
											cy="52.24819177780151" cx="290.16571341923304" j="4" val="18"
											barHeight="78.37228766670228" barWidth="22.125714220319473"></path>
										<path id="SvgjsPath1414"
											d="M 293.16571341923304 120.62047944450379L 293.16571341923304 88.37228766670228Q 293.16571341923304 78.37228766670228 303.16571341923304 78.37228766670228L 299.2914276395525 78.37228766670228Q 309.2914276395525 78.37228766670228 309.2914276395525 88.37228766670228L 309.2914276395525 88.37228766670228L 309.2914276395525 120.62047944450379Q 309.2914276395525 130.6204794445038 299.2914276395525 130.6204794445038L 303.16571341923304 130.6204794445038Q 293.16571341923304 130.6204794445038 293.16571341923304 120.62047944450379z"
											fill="rgba(105,108,255,0.85)" fill-opacity="1"
											stroke="#ffffff" stroke-opacity="1" stroke-linecap="round"
											stroke-width="6" stroke-dasharray="0"
											class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 293.16571341923304 120.62047944450379L 293.16571341923304 88.37228766670228Q 293.16571341923304 78.37228766670228 303.16571341923304 78.37228766670228L 299.2914276395525 78.37228766670228Q 309.2914276395525 78.37228766670228 309.2914276395525 88.37228766670228L 309.2914276395525 88.37228766670228L 309.2914276395525 120.62047944450379Q 309.2914276395525 130.6204794445038 299.2914276395525 130.6204794445038L 303.16571341923304 130.6204794445038Q 293.16571341923304 130.6204794445038 293.16571341923304 120.62047944450379z"
											pathFrom="M 293.16571341923304 120.62047944450379L 293.16571341923304 120.62047944450379L 309.2914276395525 120.62047944450379L 309.2914276395525 120.62047944450379L 309.2914276395525 120.62047944450379L 309.2914276395525 120.62047944450379L 309.2914276395525 120.62047944450379L 293.16571341923304 120.62047944450379"
											cy="78.37228766670228" cx="345.4799989700317" j="5" val="12"
											barHeight="52.248191777801516" barWidth="22.125714220319473"></path>
										<path id="SvgjsPath1415"
											d="M 348.4799989700317 120.62047944450379L 348.4799989700317 101.43433561115265Q 348.4799989700317 91.43433561115265 358.4799989700317 91.43433561115265L 354.6057131903512 91.43433561115265Q 364.6057131903512 91.43433561115265 364.6057131903512 101.43433561115265L 364.6057131903512 101.43433561115265L 364.6057131903512 120.62047944450379Q 364.6057131903512 130.6204794445038 354.6057131903512 130.6204794445038L 358.4799989700317 130.6204794445038Q 348.4799989700317 130.6204794445038 348.4799989700317 120.62047944450379z"
											fill="rgba(105,108,255,0.85)" fill-opacity="1"
											stroke="#ffffff" stroke-opacity="1" stroke-linecap="round"
											stroke-width="6" stroke-dasharray="0"
											class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 348.4799989700317 120.62047944450379L 348.4799989700317 101.43433561115265Q 348.4799989700317 91.43433561115265 358.4799989700317 91.43433561115265L 354.6057131903512 91.43433561115265Q 364.6057131903512 91.43433561115265 364.6057131903512 101.43433561115265L 364.6057131903512 101.43433561115265L 364.6057131903512 120.62047944450379Q 364.6057131903512 130.6204794445038 354.6057131903512 130.6204794445038L 358.4799989700317 130.6204794445038Q 348.4799989700317 130.6204794445038 348.4799989700317 120.62047944450379z"
											pathFrom="M 348.4799989700317 120.62047944450379L 348.4799989700317 120.62047944450379L 364.6057131903512 120.62047944450379L 364.6057131903512 120.62047944450379L 364.6057131903512 120.62047944450379L 364.6057131903512 120.62047944450379L 364.6057131903512 120.62047944450379L 348.4799989700317 120.62047944450379"
											cy="91.43433561115265" cx="400.7942845208304" j="6" val="9"
											barHeight="39.18614383335114" barWidth="22.125714220319473"></path></g>
										<g id="SvgjsG1416" class="apexcharts-series" seriesName="2020"
											rel="2" data:realIndex="1">
										<path id="SvgjsPath1418"
											d="M 16.594285665239607 150.6204794445038L 16.594285665239607 187.22268720378878Q 16.594285665239607 197.22268720378878 26.594285665239607 197.22268720378878L 22.719999885559076 197.22268720378878Q 32.719999885559076 197.22268720378878 32.719999885559076 187.22268720378878L 32.719999885559076 187.22268720378878L 32.719999885559076 150.6204794445038Q 32.719999885559076 140.6204794445038 22.719999885559076 140.6204794445038L 26.594285665239607 140.6204794445038Q 16.594285665239607 140.6204794445038 16.594285665239607 150.6204794445038z"
											fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff"
											stroke-opacity="1" stroke-linecap="round" stroke-width="6"
											stroke-dasharray="0" class="apexcharts-bar-area" index="1"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 16.594285665239607 150.6204794445038L 16.594285665239607 187.22268720378878Q 16.594285665239607 197.22268720378878 26.594285665239607 197.22268720378878L 22.719999885559076 197.22268720378878Q 32.719999885559076 197.22268720378878 32.719999885559076 187.22268720378878L 32.719999885559076 187.22268720378878L 32.719999885559076 150.6204794445038Q 32.719999885559076 140.6204794445038 22.719999885559076 140.6204794445038L 26.594285665239607 140.6204794445038Q 16.594285665239607 140.6204794445038 16.594285665239607 150.6204794445038z"
											pathFrom="M 16.594285665239607 150.6204794445038L 16.594285665239607 150.6204794445038L 32.719999885559076 150.6204794445038L 32.719999885559076 150.6204794445038L 32.719999885559076 150.6204794445038L 32.719999885559076 150.6204794445038L 32.719999885559076 150.6204794445038L 16.594285665239607 150.6204794445038"
											cy="177.22268720378878" cx="68.9085712160383" j="0" val="-13"
											barHeight="-56.60220775928498" barWidth="22.125714220319473"></path>
										<path id="SvgjsPath1419"
											d="M 71.9085712160383 150.6204794445038L 71.9085712160383 208.99276711120606Q 71.9085712160383 218.99276711120606 81.9085712160383 218.99276711120606L 78.03428543635778 218.99276711120606Q 88.03428543635778 218.99276711120606 88.03428543635778 208.99276711120606L 88.03428543635778 208.99276711120606L 88.03428543635778 150.6204794445038Q 88.03428543635778 140.6204794445038 78.03428543635778 140.6204794445038L 81.9085712160383 140.6204794445038Q 71.9085712160383 140.6204794445038 71.9085712160383 150.6204794445038z"
											fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff"
											stroke-opacity="1" stroke-linecap="round" stroke-width="6"
											stroke-dasharray="0" class="apexcharts-bar-area" index="1"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 71.9085712160383 150.6204794445038L 71.9085712160383 208.99276711120606Q 71.9085712160383 218.99276711120606 81.9085712160383 218.99276711120606L 78.03428543635778 218.99276711120606Q 88.03428543635778 218.99276711120606 88.03428543635778 208.99276711120606L 88.03428543635778 208.99276711120606L 88.03428543635778 150.6204794445038Q 88.03428543635778 140.6204794445038 78.03428543635778 140.6204794445038L 81.9085712160383 140.6204794445038Q 71.9085712160383 140.6204794445038 71.9085712160383 150.6204794445038z"
											pathFrom="M 71.9085712160383 150.6204794445038L 71.9085712160383 150.6204794445038L 88.03428543635778 150.6204794445038L 88.03428543635778 150.6204794445038L 88.03428543635778 150.6204794445038L 88.03428543635778 150.6204794445038L 88.03428543635778 150.6204794445038L 71.9085712160383 150.6204794445038"
											cy="198.99276711120606" cx="124.22285676683698" j="1"
											val="-18" barHeight="-78.37228766670228"
											barWidth="22.125714220319473"></path>
										<path id="SvgjsPath1420"
											d="M 127.22285676683698 150.6204794445038L 127.22285676683698 169.80662327785492Q 127.22285676683698 179.80662327785492 137.22285676683697 179.80662327785492L 133.34857098715645 179.80662327785492Q 143.34857098715645 179.80662327785492 143.34857098715645 169.80662327785492L 143.34857098715645 169.80662327785492L 143.34857098715645 150.6204794445038Q 143.34857098715645 140.6204794445038 133.34857098715645 140.6204794445038L 137.22285676683697 140.6204794445038Q 127.22285676683698 140.6204794445038 127.22285676683698 150.6204794445038z"
											fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff"
											stroke-opacity="1" stroke-linecap="round" stroke-width="6"
											stroke-dasharray="0" class="apexcharts-bar-area" index="1"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 127.22285676683698 150.6204794445038L 127.22285676683698 169.80662327785492Q 127.22285676683698 179.80662327785492 137.22285676683697 179.80662327785492L 133.34857098715645 179.80662327785492Q 143.34857098715645 179.80662327785492 143.34857098715645 169.80662327785492L 143.34857098715645 169.80662327785492L 143.34857098715645 150.6204794445038Q 143.34857098715645 140.6204794445038 133.34857098715645 140.6204794445038L 137.22285676683697 140.6204794445038Q 127.22285676683698 140.6204794445038 127.22285676683698 150.6204794445038z"
											pathFrom="M 127.22285676683698 150.6204794445038L 127.22285676683698 150.6204794445038L 143.34857098715645 150.6204794445038L 143.34857098715645 150.6204794445038L 143.34857098715645 150.6204794445038L 143.34857098715645 150.6204794445038L 143.34857098715645 150.6204794445038L 127.22285676683698 150.6204794445038"
											cy="159.80662327785492" cx="179.53714231763567" j="2"
											val="-9" barHeight="-39.18614383335114"
											barWidth="22.125714220319473"></path>
										<path id="SvgjsPath1421"
											d="M 182.53714231763567 150.6204794445038L 182.53714231763567 191.5767031852722Q 182.53714231763567 201.5767031852722 192.53714231763567 201.5767031852722L 188.66285653795515 201.5767031852722Q 198.66285653795515 201.5767031852722 198.66285653795515 191.5767031852722L 198.66285653795515 191.5767031852722L 198.66285653795515 150.6204794445038Q 198.66285653795515 140.6204794445038 188.66285653795515 140.6204794445038L 192.53714231763567 140.6204794445038Q 182.53714231763567 140.6204794445038 182.53714231763567 150.6204794445038z"
											fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff"
											stroke-opacity="1" stroke-linecap="round" stroke-width="6"
											stroke-dasharray="0" class="apexcharts-bar-area" index="1"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 182.53714231763567 150.6204794445038L 182.53714231763567 191.5767031852722Q 182.53714231763567 201.5767031852722 192.53714231763567 201.5767031852722L 188.66285653795515 201.5767031852722Q 198.66285653795515 201.5767031852722 198.66285653795515 191.5767031852722L 198.66285653795515 191.5767031852722L 198.66285653795515 150.6204794445038Q 198.66285653795515 140.6204794445038 188.66285653795515 140.6204794445038L 192.53714231763567 140.6204794445038Q 182.53714231763567 140.6204794445038 182.53714231763567 150.6204794445038z"
											pathFrom="M 182.53714231763567 150.6204794445038L 182.53714231763567 150.6204794445038L 198.66285653795515 150.6204794445038L 198.66285653795515 150.6204794445038L 198.66285653795515 150.6204794445038L 198.66285653795515 150.6204794445038L 198.66285653795515 150.6204794445038L 182.53714231763567 150.6204794445038"
											cy="181.5767031852722" cx="234.85142786843437" j="3"
											val="-14" barHeight="-60.956223740768436"
											barWidth="22.125714220319473"></path>
										<path id="SvgjsPath1422"
											d="M 237.85142786843437 150.6204794445038L 237.85142786843437 152.39055935192107Q 237.85142786843437 162.39055935192107 247.85142786843437 162.39055935192107L 243.97714208875385 162.39055935192107Q 253.97714208875385 162.39055935192107 253.97714208875385 152.39055935192107L 253.97714208875385 152.39055935192107L 253.97714208875385 150.6204794445038Q 253.97714208875385 140.6204794445038 243.97714208875385 140.6204794445038L 247.85142786843437 140.6204794445038Q 237.85142786843437 140.6204794445038 237.85142786843437 150.6204794445038z"
											fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff"
											stroke-opacity="1" stroke-linecap="round" stroke-width="6"
											stroke-dasharray="0" class="apexcharts-bar-area" index="1"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 237.85142786843437 150.6204794445038L 237.85142786843437 152.39055935192107Q 237.85142786843437 162.39055935192107 247.85142786843437 162.39055935192107L 243.97714208875385 162.39055935192107Q 253.97714208875385 162.39055935192107 253.97714208875385 152.39055935192107L 253.97714208875385 152.39055935192107L 253.97714208875385 150.6204794445038Q 253.97714208875385 140.6204794445038 243.97714208875385 140.6204794445038L 247.85142786843437 140.6204794445038Q 237.85142786843437 140.6204794445038 237.85142786843437 150.6204794445038z"
											pathFrom="M 237.85142786843437 150.6204794445038L 237.85142786843437 150.6204794445038L 253.97714208875385 150.6204794445038L 253.97714208875385 150.6204794445038L 253.97714208875385 150.6204794445038L 253.97714208875385 150.6204794445038L 253.97714208875385 150.6204794445038L 237.85142786843437 150.6204794445038"
											cy="142.39055935192107" cx="290.16571341923304" j="4"
											val="-5" barHeight="-21.770079907417298"
											barWidth="22.125714220319473"></path>
										<path id="SvgjsPath1423"
											d="M 293.16571341923304 150.6204794445038L 293.16571341923304 204.6387511297226Q 293.16571341923304 214.6387511297226 303.16571341923304 214.6387511297226L 299.2914276395525 214.6387511297226Q 309.2914276395525 214.6387511297226 309.2914276395525 204.6387511297226L 309.2914276395525 204.6387511297226L 309.2914276395525 150.6204794445038Q 309.2914276395525 140.6204794445038 299.2914276395525 140.6204794445038L 303.16571341923304 140.6204794445038Q 293.16571341923304 140.6204794445038 293.16571341923304 150.6204794445038z"
											fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff"
											stroke-opacity="1" stroke-linecap="round" stroke-width="6"
											stroke-dasharray="0" class="apexcharts-bar-area" index="1"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 293.16571341923304 150.6204794445038L 293.16571341923304 204.6387511297226Q 293.16571341923304 214.6387511297226 303.16571341923304 214.6387511297226L 299.2914276395525 214.6387511297226Q 309.2914276395525 214.6387511297226 309.2914276395525 204.6387511297226L 309.2914276395525 204.6387511297226L 309.2914276395525 150.6204794445038Q 309.2914276395525 140.6204794445038 299.2914276395525 140.6204794445038L 303.16571341923304 140.6204794445038Q 293.16571341923304 140.6204794445038 293.16571341923304 150.6204794445038z"
											pathFrom="M 293.16571341923304 150.6204794445038L 293.16571341923304 150.6204794445038L 309.2914276395525 150.6204794445038L 309.2914276395525 150.6204794445038L 309.2914276395525 150.6204794445038L 309.2914276395525 150.6204794445038L 309.2914276395525 150.6204794445038L 293.16571341923304 150.6204794445038"
											cy="194.6387511297226" cx="345.4799989700317" j="5" val="-17"
											barHeight="-74.01827168521882" barWidth="22.125714220319473"></path>
										<path id="SvgjsPath1424"
											d="M 348.4799989700317 150.6204794445038L 348.4799989700317 195.9307191667557Q 348.4799989700317 205.9307191667557 358.4799989700317 205.9307191667557L 354.6057131903512 205.9307191667557Q 364.6057131903512 205.9307191667557 364.6057131903512 195.9307191667557L 364.6057131903512 195.9307191667557L 364.6057131903512 150.6204794445038Q 364.6057131903512 140.6204794445038 354.6057131903512 140.6204794445038L 358.4799989700317 140.6204794445038Q 348.4799989700317 140.6204794445038 348.4799989700317 150.6204794445038z"
											fill="rgba(3,195,236,0.85)" fill-opacity="1" stroke="#ffffff"
											stroke-opacity="1" stroke-linecap="round" stroke-width="6"
											stroke-dasharray="0" class="apexcharts-bar-area" index="1"
											clip-path="url(#gridRectMaskxcmehofq)"
											pathTo="M 348.4799989700317 150.6204794445038L 348.4799989700317 195.9307191667557Q 348.4799989700317 205.9307191667557 358.4799989700317 205.9307191667557L 354.6057131903512 205.9307191667557Q 364.6057131903512 205.9307191667557 364.6057131903512 195.9307191667557L 364.6057131903512 195.9307191667557L 364.6057131903512 150.6204794445038Q 364.6057131903512 140.6204794445038 354.6057131903512 140.6204794445038L 358.4799989700317 140.6204794445038Q 348.4799989700317 140.6204794445038 348.4799989700317 150.6204794445038z"
											pathFrom="M 348.4799989700317 150.6204794445038L 348.4799989700317 150.6204794445038L 364.6057131903512 150.6204794445038L 364.6057131903512 150.6204794445038L 364.6057131903512 150.6204794445038L 364.6057131903512 150.6204794445038L 364.6057131903512 150.6204794445038L 348.4799989700317 150.6204794445038"
											cy="185.9307191667557" cx="400.7942845208304" j="6" val="-15"
											barHeight="-65.3102397222519" barWidth="22.125714220319473"></path></g>
										<g id="SvgjsG1408" class="apexcharts-datalabels"
											data:realIndex="0"></g>
										<g id="SvgjsG1417" class="apexcharts-datalabels"
											data:realIndex="1"></g></g>
										<line id="SvgjsLine1473" x1="0" y1="0" x2="387.1999988555908"
											y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1"
											stroke-linecap="butt" class="apexcharts-ycrosshairs"></line>
										<line id="SvgjsLine1474" x1="0" y1="0" x2="387.1999988555908"
											y2="0" stroke-dasharray="0" stroke-width="0"
											stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line>
										<g id="SvgjsG1475" class="apexcharts-yaxis-annotations"></g>
										<g id="SvgjsG1476" class="apexcharts-xaxis-annotations"></g>
										<g id="SvgjsG1477" class="apexcharts-point-annotations"></g></g>
										<g id="SvgjsG1448" class="apexcharts-yaxis" rel="0"
											transform="translate(15.80000114440918, 0)">
										<g id="SvgjsG1449" class="apexcharts-yaxis-texts-g">
										<text id="SvgjsText1450"
											font-family="Helvetica, Arial, sans-serif" x="20" y="53.5"
											text-anchor="end" dominant-baseline="auto" font-size="13px"
											font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-yaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1451">30</tspan>
										<title>30</title></text>
										<text id="SvgjsText1452"
											font-family="Helvetica, Arial, sans-serif" x="20"
											y="97.0401598148346" text-anchor="end"
											dominant-baseline="auto" font-size="13px" font-weight="400"
											fill="#a1acb8"
											class="apexcharts-text apexcharts-yaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1453">20</tspan>
										<title>20</title></text>
										<text id="SvgjsText1454"
											font-family="Helvetica, Arial, sans-serif" x="20"
											y="140.5803196296692" text-anchor="end"
											dominant-baseline="auto" font-size="13px" font-weight="400"
											fill="#a1acb8"
											class="apexcharts-text apexcharts-yaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1455">10</tspan>
										<title>10</title></text>
										<text id="SvgjsText1456"
											font-family="Helvetica, Arial, sans-serif" x="20"
											y="184.1204794445038" text-anchor="end"
											dominant-baseline="auto" font-size="13px" font-weight="400"
											fill="#a1acb8"
											class="apexcharts-text apexcharts-yaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1457">0</tspan>
										<title>0</title></text>
										<text id="SvgjsText1458"
											font-family="Helvetica, Arial, sans-serif" x="20"
											y="227.66063925933838" text-anchor="end"
											dominant-baseline="auto" font-size="13px" font-weight="400"
											fill="#a1acb8"
											class="apexcharts-text apexcharts-yaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1459">-10</tspan>
										<title>-10</title></text>
										<text id="SvgjsText1460"
											font-family="Helvetica, Arial, sans-serif" x="20"
											y="271.200799074173" text-anchor="end"
											dominant-baseline="auto" font-size="13px" font-weight="400"
											fill="#a1acb8"
											class="apexcharts-text apexcharts-yaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan1461">-20</tspan>
										<title>-20</title></text></g></g>
										<g id="SvgjsG1396" class="apexcharts-annotations"></g></svg>
									<div class="apexcharts-tooltip apexcharts-theme-light">
										<div class="apexcharts-tooltip-title"
											style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div>
										<div class="apexcharts-tooltip-series-group" style="order: 1;">
											<span class="apexcharts-tooltip-marker"
												style="background-color: rgb(105, 108, 255);"></span>
											<div class="apexcharts-tooltip-text"
												style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
												<div class="apexcharts-tooltip-y-group">
													<span class="apexcharts-tooltip-text-y-label"></span><span
														class="apexcharts-tooltip-text-y-value"></span>
												</div>
												<div class="apexcharts-tooltip-goals-group">
													<span class="apexcharts-tooltip-text-goals-label"></span><span
														class="apexcharts-tooltip-text-goals-value"></span>
												</div>
												<div class="apexcharts-tooltip-z-group">
													<span class="apexcharts-tooltip-text-z-label"></span><span
														class="apexcharts-tooltip-text-z-value"></span>
												</div>
											</div>
										</div>
										<div class="apexcharts-tooltip-series-group" style="order: 2;">
											<span class="apexcharts-tooltip-marker"
												style="background-color: rgb(3, 195, 236);"></span>
											<div class="apexcharts-tooltip-text"
												style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
												<div class="apexcharts-tooltip-y-group">
													<span class="apexcharts-tooltip-text-y-label"></span><span
														class="apexcharts-tooltip-text-y-value"></span>
												</div>
												<div class="apexcharts-tooltip-goals-group">
													<span class="apexcharts-tooltip-text-goals-label"></span><span
														class="apexcharts-tooltip-text-goals-value"></span>
												</div>
												<div class="apexcharts-tooltip-z-group">
													<span class="apexcharts-tooltip-text-z-label"></span><span
														class="apexcharts-tooltip-text-z-value"></span>
												</div>
											</div>
										</div>
									</div>
									<div
										class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
										<div class="apexcharts-yaxistooltip-text"></div>
									</div>
								</div>
							</div>
							<div class="resize-triggers">
								<div class="expand-trigger">
									<div style="width: 659px; height: 377px;"></div>
								</div>
								<div class="contract-trigger"></div>
							</div>
							<div class="resize-triggers">
								<div class="expand-trigger">
									<div style="width: 478px; height: 377px;"></div>
								</div>
								<div class="contract-trigger"></div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card-body">
								<div class="text-center">
									<div class="dropdown">
										<button class="btn btn-sm btn-outline-primary dropdown-toggle"
											type="button" id="growthReportId" data-bs-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">2022</button>
										<div class="dropdown-menu dropdown-menu-end"
											aria-labelledby="growthReportId">
											<a class="dropdown-item" href="javascript:void(0);">2022</a>
											<a class="dropdown-item" href="javascript:void(0);">2021</a>
											<a class="dropdown-item" href="javascript:void(0);">2020</a>
										</div>
									</div>
								</div>
							</div>
							<div id="growthChart" style="min-height: 154.875px;">
								<div id="apexchartsn21j8txpk"
									class="apexcharts-canvas apexchartsn21j8txpk apexcharts-theme-light"
									style="width: 239px; height: 154.875px;">
									<svg id="SvgjsSvg1501" width="239" height="154.875"
										xmlns="http://www.w3.org/2000/svg" version="1.1"
										xmlns:xlink="http://www.w3.org/1999/xlink"
										xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg"
										xmlns:data="ApexChartsNS" transform="translate(0, 0)"
										style="background: transparent;">
										<g id="SvgjsG1503"
											class="apexcharts-inner apexcharts-graphical"
											transform="translate(12.5, -25)">
										<defs id="SvgjsDefs1502">
										<clipPath id="gridRectMaskn21j8txpk">
										<rect id="SvgjsRect1505" width="222" height="285" x="-3"
											y="-1" rx="0" ry="0" opacity="1" stroke-width="0"
											stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath>
										<clipPath id="forecastMaskn21j8txpk"></clipPath>
										<clipPath id="nonForecastMaskn21j8txpk"></clipPath>
										<clipPath id="gridRectMarkerMaskn21j8txpk">
										<rect id="SvgjsRect1506" width="220" height="287" x="-2"
											y="-2" rx="0" ry="0" opacity="1" stroke-width="0"
											stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath>
										<linearGradient id="SvgjsLinearGradient1511" x1="1" y1="0"
											x2="0" y2="1">
										<stop id="SvgjsStop1512" stop-opacity="1"
											stop-color="rgba(105,108,255,1)" offset="0.3"></stop>
										<stop id="SvgjsStop1513" stop-opacity="0.6"
											stop-color="rgba(255,255,255,0.6)" offset="0.7"></stop>
										<stop id="SvgjsStop1514" stop-opacity="0.6"
											stop-color="rgba(255,255,255,0.6)" offset="1"></stop></linearGradient>
										<linearGradient id="SvgjsLinearGradient1522" x1="1" y1="0"
											x2="0" y2="1">
										<stop id="SvgjsStop1523" stop-opacity="1"
											stop-color="rgba(105,108,255,1)" offset="0.3"></stop>
										<stop id="SvgjsStop1524" stop-opacity="0.6"
											stop-color="rgba(105,108,255,0.6)" offset="0.7"></stop>
										<stop id="SvgjsStop1525" stop-opacity="0.6"
											stop-color="rgba(105,108,255,0.6)" offset="1"></stop></linearGradient></defs>
										<g id="SvgjsG1507" class="apexcharts-radialbar">
										<g id="SvgjsG1508">
										<g id="SvgjsG1509" class="apexcharts-tracks">
										<g id="SvgjsG1510"
											class="apexcharts-radialbar-track apexcharts-track" rel="1">
										<path id="apexcharts-radialbarTrack-0"
											d="M 73.83506097560974 167.17541022773656 A 68.32987804878049 68.32987804878049 0 1 1 142.16493902439026 167.17541022773656"
											fill="none" fill-opacity="1" stroke="rgba(255,255,255,0.85)"
											stroke-opacity="1" stroke-linecap="butt"
											stroke-width="17.357317073170734" stroke-dasharray="0"
											class="apexcharts-radialbar-area"
											data:pathOrig="M 73.83506097560974 167.17541022773656 A 68.32987804878049 68.32987804878049 0 1 1 142.16493902439026 167.17541022773656"></path></g></g>
										<g id="SvgjsG1516">
										<g id="SvgjsG1521"
											class="apexcharts-series apexcharts-radial-series"
											seriesName="Growth" rel="1" data:realIndex="0">
										<path id="SvgjsPath1526"
											d="M 73.83506097560974 167.17541022773656 A 68.32987804878049 68.32987804878049 0 1 1 175.95555982735613 100.85758285229481"
											fill="none" fill-opacity="0.85"
											stroke="url(#SvgjsLinearGradient1522)" stroke-opacity="1"
											stroke-linecap="butt" stroke-width="17.357317073170734"
											stroke-dasharray="5"
											class="apexcharts-radialbar-area apexcharts-radialbar-slice-0"
											data:angle="234" data:value="78" index="0" j="0"
											data:pathOrig="M 73.83506097560974 167.17541022773656 A 68.32987804878049 68.32987804878049 0 1 1 175.95555982735613 100.85758285229481"></path></g>
										<circle id="SvgjsCircle1517" r="54.65121951219512" cx="108"
											cy="108" class="apexcharts-radialbar-hollow"
											fill="transparent"></circle>
										<g id="SvgjsG1518" class="apexcharts-datalabels-group"
											transform="translate(0, 0) scale(1)" style="opacity: 1;">
										<text id="SvgjsText1519" font-family="Public Sans" x="108"
											y="123" text-anchor="middle" dominant-baseline="auto"
											font-size="15px" font-weight="500" fill="#566a7f"
											class="apexcharts-text apexcharts-datalabel-label"
											style="font-family: &quot;Public Sans&quot;;">Growth</text>
										<text id="SvgjsText1520" font-family="Public Sans" x="108"
											y="99" text-anchor="middle" dominant-baseline="auto"
											font-size="22px" font-weight="500" fill="#566a7f"
											class="apexcharts-text apexcharts-datalabel-value"
											style="font-family: &quot;Public Sans&quot;;">78%</text></g></g></g></g>
										<line id="SvgjsLine1527" x1="0" y1="0" x2="216" y2="0"
											stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1"
											stroke-linecap="butt" class="apexcharts-ycrosshairs"></line>
										<line id="SvgjsLine1528" x1="0" y1="0" x2="216" y2="0"
											stroke-dasharray="0" stroke-width="0" stroke-linecap="butt"
											class="apexcharts-ycrosshairs-hidden"></line></g>
										<g id="SvgjsG1504" class="apexcharts-annotations"></g></svg>
									<div class="apexcharts-legend"></div>
								</div>
							</div>
							<div class="text-center fw-semibold pt-3 mb-2">62% 매출 성장</div>

							<div
								class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
								<div class="d-flex">
									<div class="me-2">
										<span class="badge bg-label-primary p-2"><i
											class="bx bx-dollar text-primary"></i></span>
									</div>
									<div class="d-flex flex-column">
										<small>2023</small>
										<h6 class="mb-0">$32.5k</h6>
									</div>
								</div>
								<div class="d-flex">
									<div class="me-2">
										<span class="badge bg-label-info p-2"><i
											class="bx bx-wallet text-info"></i></span>
									</div>
									<div class="d-flex flex-column">
										<small>2022</small>
										<h6 class="mb-0">$41.2k</h6>
									</div>
								</div>
							</div>
							<div class="resize-triggers">
								<div class="expand-trigger">
									<div style="width: 240px; height: 377px;"></div>
								</div>
								<div class="contract-trigger"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 order-1">
				<div class="row">
					<div class="col-lg-6 col-md-12 col-6 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="card-title d-flex align-items-start justify-content-between">
									<div class="avatar flex-shrink-0">
										<img src="/pet/bootstrapTemp/assets/img/icons/unicons/chart-success.png" alt="chart success" class="rounded">
									</div>
								</div>
								<span class="fw-semibold d-block mb-1">2023 매출액</span>
								<h3 class="card-title mb-2">$12,628</h3>
								<small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +72.80%</small>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-6 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="card-title d-flex align-items-start justify-content-between">
									<div class="avatar flex-shrink-0">
										<img src="/pet/bootstrapTemp/assets/img/icons/unicons/wallet-info.png" alt="Credit Card" class="rounded">
									</div>
								</div>
								<span class="fw-semibold d-block mb-1">2023 수익</span>
								<h3 class="card-title text-nowrap mb-1">$4,679</h3>
								<small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.42%</small>
							</div>
						</div>
					</div>
					<div class="col-6 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="card-title d-flex align-items-start justify-content-between">
									<div class="avatar flex-shrink-0">
										<img src="/pet/bootstrapTemp/assets/img/icons/unicons/paypal.png" alt="Credit Card" class="rounded">
									</div>
								</div>
								<span class="fw-semibold d-block mb-1">2023 지출액</span>
								<h3 class="card-title text-nowrap mb-2">$2,456</h3>
								<small class="text-danger fw-semibold"><i class="bx bx-down-arrow-alt"></i> -14.82%</small>
							</div>
						</div>
					</div>
					<div class="col-6 mb-4">
						<div class="card">
							<div class="card-body">
								<div class="card-title d-flex align-items-start justify-content-between">
									<div class="avatar flex-shrink-0">
										<img src="/pet/bootstrapTemp/assets/img/icons/unicons/cc-primary.png" alt="Credit Card" class="rounded">
									</div>
								</div>
								<span class="fw-semibold d-block mb-1">2023 거래금액</span>
								<h3 class="card-title mb-2">$14,857</h3>
								<small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.14%</small>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ Transactions -->
		</div>
	</div>
	<!-- / Content -->

	<!-- Footer -->
	<footer class="content-footer footer bg-footer-theme">
		<div
			class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
			<div class="mb-2 mb-md-0">
				©
				<script>
					document.write(new Date().getFullYear());
				</script>
				, made with ❤️ by <a href="https://themeselection.com"
					target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
			</div>
			<div>
				<a href="https://themeselection.com/license/"
					class="footer-link me-4" target="_blank">License</a> <a
					href="https://themeselection.com/" target="_blank"
					class="footer-link me-4">More Themes</a> <a
					href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
					target="_blank" class="footer-link me-4">Documentation</a> <a
					href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
					target="_blank" class="footer-link me-4">Support</a>
			</div>
		</div>
	</footer>
	<!-- / Footer -->

	<div class="content-backdrop fade"></div>
</div>