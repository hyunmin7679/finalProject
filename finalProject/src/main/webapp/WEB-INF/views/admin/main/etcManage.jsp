<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
										<h6 class="mb-0">+<fmt:formatNumber value="${giftProduct}"/></h6>
										<span class="text-muted">원</span>
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
										<h6 class="mb-0">+<fmt:formatNumber value="${returnProduct}"/></h6>
										<span class="text-muted">원</span>
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
										<h6 class="mb-0">접속자 수 
										</h6>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">+${currentCount}</h6>
										<span class="text-muted">명</span>
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
										<h6 class="mb-0">${dailyresult}</h6>
										<span class="text-muted">명</span>
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
										<h6 class="mb-0">${allCommunity }</h6>
										<span class="text-muted">전체</span>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">${yestCommunity }</h6>
										<span class="text-muted">오늘(기준)</span>
									</div>
								</div>
							</li>

						</ul>
					</div>
				</div>