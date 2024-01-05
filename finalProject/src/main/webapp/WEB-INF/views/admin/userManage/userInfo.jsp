<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!-- Content wrapper -->
<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="py-3 mb-4">
			<span>&nbsp;&nbsp;</span>상세 페이지
		</h4>
		<div class="row">
			<div class="col-xl-4 col-lg-5 col-md-5 order-1 order-md-0">
				<div class="card mb-4">
					<c:forEach var="dto" items="${list}" varStatus="status">
						<div class="card-body">
							<div class="user-avatar-section">
								<div class=" d-flex align-items-center flex-column">
									<img class="img-fluid rounded my-4"
										src="../../bootstrapTemp/assets/img/avatars/robot.jpg"
										height="110" width="110" alt="User avatar" />
									<div class="user-info text-center">
										<h4 class="mb-2">${dto.userName}</h4>
										<div class="memberIdx" style="display: none;">${dto.memberIdx }</div>
										<img class="img-fluid rounded my-4"
											src="../../bootstrapTemp/assets/img/avatars/robot.jpg"
											height="50" width="50" alt="User avatar" />
									</div>
								</div>
							</div>
							<div class="d-flex justify-content-around flex-wrap my-4 py-3">
								<div class="d-flex align-items-start me-4 mt-3 gap-3">
									<span class="badge bg-label-warning p-2 rounded"><i
										class='bx bx-dollar-circle bx-sm'></i></span>
									<div>
										<h5 class="mb-0">${dto.totalPayment}</h5>
										<span>구매 금액</span>
									</div>
								</div>
								<div class="d-flex align-items-start mt-3 gap-3">
									<span class="badge bg-label-warning p-2 rounded"><i
										class='bx bx-coin bx-sm'></i></span>
									<div>
										<h5 class="mb-0">${dto.userPoint}POINT</h5>
										<span>마일리지</span>
									</div>
								</div>
							</div>
							<h5 class="pb-2 border-bottom mb-4">세부정보</h5>
							<div class="info-container">
								<ul class="list-unstyled">
									<li class="mb-3"><span class="fw-medium me-2">아이디:</span>
										<span>${dto.userId}</span></li>
									<li class="mb-3"><span class="fw-medium me-2">Email:</span>
										<span>${dto.email}</span></li>
									<li class="mb-3"><span class="fw-medium me-2">회원
											상태:</span> <span class="badge bg-label-success">${dto.enabledstate }</span></li>
									<li class="mb-3"><span class="fw-medium me-2">회원
											구분:</span> <span>${dto.memberstate}</span></li>
									<li class="mb-3"><span class="fw-medium me-2">전화번호:</span>
										<span>${dto.tel}</span></li>
									<li class="mb-3"><span class="fw-medium me-2">우편번호:</span>
										<span>${dto.zip}</span></li>
									<li class="mb-3"><span class="fw-medium me-2">주소:</span> <span>${dto.addr1}</span>
									</li>
									<li class="mb-3"><span class="fw-medium me-2">상세주소:</span>
										<span>${dto.addr2}</span></li>
								</ul>
							</div>

						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-xl-8 col-lg-7 col-md-7 order-0 order-md-1">
				<div class="card mb-4">
					<h5 class="card-header mt-3">&nbsp;&nbsp;구매 성향</h5>
					<div class="table" style="width: 100%;">
						<div id="DataTables_Table_0_wrapper"
							class="dataTables_wrapper dt-bootstrap5 no-footer">
							<div
								class="d-flex justify-content-between align-items-center flex-column flex-sm-row mx-4 row me-2"
								style="width: 100%; padding-right: 4%;">
								<div
									class="ps-0 me-2 col-sm-4 col-12 d-flex align-items-center justify-content-sm-start "
									style="width: 100%;">
									<div class="dataTables_length" id="DataTables_Table_0_length"
										style="width: 100%;">
										<table
											class="table datatable-project border-top dataTable no-footer dtr-column"
											id="DataTables_Table_0"
											aria-describedby="DataTables_Table_0_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th class="sorting sorting_desc fs-6" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="3" colspan="1"
														style="width: 40%;"
														aria-label="Project: activate to sort column ascending"
														aria-sort="descending">카테고리</th>
													<th class="text-nowrap sorting_disabled fs-6" rowspan="3"
														colspan="1" style="width: 30%;" aria-label="Total Task">구매건수</th>
													<th class="sorting fs-6" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="3" colspan="1"
														style="width: 30%;"
														aria-label="Progress: activate to sort column ascending">만족도</th>
												</tr>

											</thead>
											<c:forEach var="vo" items="${catanaly}" varStatus="status">
												<tbody>
													<tr class="odd">
														<td class="sorting_1">
															<div
																class="d-flex justify-content-left align-items-center">
																<div class="avatar-wrapper">
																	<div class="avatar avatar-sm me-3">
																		<img
																			src="../../bootstrapTemp/assets/img/avatars/robot.jpg"
																			alt="Project Image" class="rounded-circle">
																	</div>
																</div>
																<div class="d-flex flex-column">
																	<span class="text-truncate fw-medium">${vo.category_description }</span>
																	<small class="text-muted">${vo.category_big }</small>
																</div>
															</div>
														</td>
														<td style="align-items: center;">${vo.category_count}</td>
														<td>
															<div class="d-flex flex-column">
																<small class="mb-1">${vo.average_score}%</small>
																<div class="progress w-100 me-3" style="height: 6px;">
																	<div
																		class="progress-bar bg-${vo.average_score >= 80 ? 'success' : vo.average_score >= 60 ? 'info' : vo.average_score >= 40 ? 'warning' : 'danger'}"
																		style="width: ${vo.average_score}%"
																		aria-valuenow="100" aria-valuemin="0"
																		aria-valuemax="100"></div>
																</div>
															</div>
														</td>
													</tr>
												</tbody>
											</c:forEach>
										</table>
										<div class="d-flex justify-content-between mx-4 row mt-3 "
											style="width: 100%;">
											<div class="col-sm-12 col-md-6">
												<div class="dataTables_info" id="DataTables_Table_0_info"
													role="status" aria-live="polite">1-10개/15개 중</div>
											</div>
											<div class="col-sm-12 col-md-6" style="padding-left: 15%;">
												<div class="dataTables_paginate paging_simple_numbers"
													id="DataTables_Table_0_paginate">
													<ul class="pagination">
														<li class="paginate_button page-item previous disabled"
															id="DataTables_Table_0_previous"><a
															aria-controls="DataTables_Table_0" aria-disabled="true"
															role="link" data-dt-idx="previous" tabindex="0"
															class="page-link">Previous</a></li>
														<li class="paginate_button page-item active"><a
															href="#" aria-controls="DataTables_Table_0" role="link"
															aria-current="page" data-dt-idx="0" tabindex="0"
															class="page-link">1</a></li>
														<li class="paginate_button page-item "><a href="#"
															aria-controls="DataTables_Table_0" role="link"
															data-dt-idx="1" tabindex="0" class="page-link">2</a></li>
														<li class="paginate_button page-item next"
															id="DataTables_Table_0_next"><a href="#"
															aria-controls="DataTables_Table_0" role="link"
															data-dt-idx="next" tabindex="0" class="page-link">Next</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<h5 class="card-header mt-3">&nbsp;&nbsp;구매 목록</h5>
							<div class="card mb-4">
								<div class="table-responsive">
									<div id="DataTables_Table_1_wrapper"
										class="dataTables_wrapper dt-bootstrap5 no-footer">
										<div class="row mx-4"></div>
										<table
											class="table datatable-invoice border-top dataTable no-footer dtr-column"
											id="DataTables_Table_1"
											aria-describedby="DataTables_Table_1_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th class="sorting sorting_desc" tabindex="0"
														aria-controls="DataTables_Table_1" rowspan="1" colspan="1"
														style="width: 15%;"
														aria-label="ID: activate to sort column ascending"
														aria-sort="descending">주문번호</th>
													<th class="sorting sorting_desc" tabindex="0"
														aria-controls="DataTables_Table_1" rowspan="1" colspan="1"
														style="width: 25%;"
														aria-label="ID: activate to sort column ascending"
														aria-sort="descending">상품명</th>
													<th class="sorting" tabindex="0"
														aria-controls="DataTables_Table_1" rowspan="1" colspan="1"
														style="width: 15%;"
														aria-label=": activate to sort column ascending">주문상태</th>
													<th class="sorting" tabindex="0"
														aria-controls="DataTables_Table_1" rowspan="1" colspan="1"
														style="width: 10%;"
														aria-label="Total: activate to sort column ascending">금액</th>
													<th class="sorting" tabindex="0"
														aria-controls="DataTables_Table_1" rowspan="1" colspan="1"
														style="width: 20%;"
														aria-label="Issued Date: activate to sort column ascending">주문날짜</th>
													<th class="sorting_disabled" rowspan="1" colspan="1"
														style="width: 20%; padding-left: 20px;"
														aria-label="Actions">마일리지</th>
												</tr>
											</thead>
											<c:forEach var="to" items="${purchaselist}"
												varStatus="status">
												<tbody>
													<tr class="even">
														<td class="sorting_1"><a
															href="app-invoice-preview.html"> <span
																class="fw-medium">${to.ordernum}</span>
														</a></td>
														<td>${to.productName }</td>
														<td><span data-bs-toggle="tooltip"
															data-bs-html="true"
															aria-label="<span>배송완료<br> 
	         		 			<span class=&quot;fw-medium&quot;>Balance:</span> 0<br> 
	         		 			<span class=&quot;fw-medium&quot;>배송 일자:</span> 11/19/2020</span>"
															data-bs-original-title="<span>배송완료<br> 
	         		 			<span class=&quot;fw-medium&quot;>배송금액:</span> $20<br> 
	         		 			<span class=&quot;fw-medium&quot;>배송일자:</span> 11/19/2020</span>">
																<span
																class="badge badge-center rounded-pill bg-label-secondary w-px-30 h-px-30 ">
																	<i class="bx bx-package bx-xs"></i>
															</span>
														</span></td>
														<td>${to.price}</td>
														<td>${to.orderdate}</td>
														<td>${to.savedmoney}</td>
													</tr>
												</tbody>
											</c:forEach>
										</table>
										<div class="row ">
											<div
												class="col-md-12 col-lg-5 text-center text-lg-start pb-md-2 pb-lg-0 mt-3 ms-3 ps-4">
												<div class="dataTables_info" id="DataTables_Table_1_info"
													role="status" aria-live="polite">1-10개/15개 중</div>
											</div>
											<div
												class="col-md-12 col-lg-6 mt-3 d-flex justify-content-center justify-content-lg-end">
												<div class="dataTables_paginate paging_simple_numbers"
													id="DataTables_Table_1_paginate">
													<ul class="pagination">
														<li class="paginate_button page-item previous disabled"
															id="DataTables_Table_1_previous"><a
															aria-controls="DataTables_Table_1" aria-disabled="true"
															role="link" data-dt-idx="previous" tabindex="0"
															class="page-link">Previous</a></li>
														<li class="paginate_button page-item active"><a
															href="#" aria-controls="DataTables_Table_1" role="link"
															aria-current="page" data-dt-idx="0" tabindex="0"
															class="page-link">1</a></li>
														<li class="paginate_button page-item next"
															id="DataTables_Table_1_next"><a href="#"
															aria-controls="DataTables_Table_1" role="link"
															data-dt-idx="next" tabindex="0" class="page-link">Next</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
		    	} else if(jqXHR.status === 402) {
		    		alert('권한이 없습니다.');
		    		return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	} else if(jqXHR.status === 410) {
		    		alert('삭제된 게시물입니다.');
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



</script>