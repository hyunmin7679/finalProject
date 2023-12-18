<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

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
	$(function() {
		$(".btnOptionAdd")
				.click(
						function() {
							let $el = $(this).closest(".option-area").find(
									".optionValue-area");
							if ($el.find(".input-group").length >= 5) {
								alert("옵션은 최대 5개까지 가능합니다.");
								return false;
							}
							let $option = $(
									".option-area .optionValue-area .input-group:first-child")
									.clone();

							$option.find("input[type=hidden]").remove();
							$option.find("input[name=optionValues]")
									.removeAttr("value");
							$option.find("input[name=optionValues]").val("");
							$el.append($option);
						});

		$(".option-area")
				.on(
						"click",
						".option-minus",
						function() {
							let $minus = $(this);
							let $el = $minus.closest(".option-area").find(
									".optionValue-area");

							// 수정에서 등록된 자료 삭제
							let mode = "${mode}";
							if (mode === "update"
									&& $minus.parent(".input-group").find(
											"input[name=detailNums]").length === 1) {
								// 저장된 옵션값중 최소 하나는 삭제되지 않도록 설정
								if ($el
										.find(".input-group input[name=detailNums]").length <= 1) {
									alert("옵션값은 최소 하나이상 필요합니다.");
									return false;
								}

								if (!confirm("옵션값을 삭제 하시겠습니까 ? ")) {
									return false;
								}

								let detailNum = $minus.parent(".input-group")
										.find("input[name=detailNums]").val();
								let url = "${pageContext.request.contextPath}/admin/product/deleteOptionDetail";
								$.post(url, {
									detailNum : detailNum
								},
										function(data) {
											if (data.state === "true") {
												$minus.closest(".input-group")
														.remove();
											} else {
												alert("옵션값을 삭제할 수 없습니다.");
											}
										}, "json");

								return false;
							}

							if ($el.find(".input-group").length <= 1) {
								$el.find("input[name=optionValues]").val("");
								return false;
							}

							$minus.closest(".input-group").remove();
						});
	});

	$(function() {
		$(".btnOptionAdd2")
				.click(
						function() {
							let $el = $(this).closest(".option-area2").find(
									".optionValue-area2");
							if ($el.find(".input-group").length >= 5) {
								alert("옵션 값은 최대 5개까지 가능합니다.");
								return false;
							}
							let $option = $(
									".option-area2 .optionValue-area2 .input-group:first-child")
									.clone();

							$option.find("input[type=hidden]").remove();
							$option.find("input[name=optionValues2]")
									.removeAttr("value");
							$option.find("input[name=optionValues2]").val("");
							$el.append($option);
						});

		$(".option-area2")
				.on(
						"click",
						".option-minus2",
						function() {
							let $minus = $(this);
							let $el = $minus.closest(".option-area2").find(
									".optionValue-area2");

							// 수정에서 등록된 자료 삭제
							let mode = "${mode}";
							if (mode === "update"
									&& $minus.parent(".input-group").find(
											"input[name=detailNums2]").length === 1) {
								// 저장된 옵션값중 최소 하나는 삭제되지 않도록 설정
								if ($el
										.find(".input-group input[name=detailNums2]").length <= 1) {
									alert("옵션값은 최소 하나이상 필요합니다.");
									return false;
								}

								if (!confirm("옵션값을 삭제 하시겠습니까 ? ")) {
									return false;
								}

								let detailNum = $minus.parent(".input-group")
										.find("input[name=detailNums2]").val();
								let url = "${pageContext.request.contextPath}/admin/product/deleteOptionDetail";
								$.post(url, {
									detailNum : detailNum
								},
										function(data) {
											if (data.state === "true") {
												$minus.closest(".input-group")
														.remove();
											} else {
												alert("옵션값을 삭제할 수 없습니다.");
											}
										}, "json");

							}

							if ($el.find(".input-group").length <= 1) {
								$el.find("input[name=optionValues2]").val("");
								return false;
							}

							$minus.closest(".input-group").remove();
						});
	});
</script>
<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">



		<h4 class="py-3 mb-4">
			<span>&nbsp;&nbsp;</span>상품 관리
		</h4>

		<!-- Product List Widget -->

		<div class="card mb-4">
			<div class="card-widget-separator-wrapper">
				<div class="card-body card-widget-separator">
					<div class="row gy-4 gy-sm-1">
						<div class="col-sm-6 col-lg-3">
							<div
								class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-3 pb-sm-0">
								<div>
									<h6 class="mb-2">올해 판매액</h6>
									<h4 class="mb-2">₩ 얼마얼마</h4>
									<p class="mb-0">
										<span class="text-muted me-2">작년대비 증감 판매액</span><span
											class="badge bg-label-success">+x%</span>
									</p>
								</div>
								<div class="avatar me-sm-4">
									<span class="avatar-initial rounded bg-label-secondary">
										<i class="bx bx-money bx-sm"></i>
									</span>
								</div>
							</div>
							<hr class="d-none d-sm-block d-lg-none me-4">
						</div>
						<div class="col-sm-6 col-lg-3">
							<div
								class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-3 pb-sm-0">
								<div>
									<h6 class="mb-2">프로모션 금액(특가/기획)</h6>
									<h4 class="mb-2">₩ 얼마얼마</h4>
									<p class="mb-0">
										<span class="text-muted me-2">작년대비 증감 프로모션 금액</span><span
											class="badge bg-label-success">+x%</span>
									</p>
								</div>
								<div class="avatar me-lg-4">
									<span class="avatar-initial rounded bg-label-secondary">
										<i class="bx bxs-offer bx-sm"></i>
									</span>
								</div>
							</div>
							<hr class="d-none d-sm-block d-lg-none">
						</div>
						<div class="col-sm-6 col-lg-3">
							<div
								class="d-flex justify-content-between align-items-start border-end pb-3 pb-sm-0 card-widget-3">
								<div>
									<h6 class="mb-2">쿠폰 할인금액</h6>
									<h4 class="mb-2">₩ 얼마얼마</h4>
									<p class="mb-0 text-muted">쿠폰 사용량 x</p>
								</div>
								<div class="avatar me-sm-4">
									<span class="avatar-initial rounded bg-label-secondary">
										<i class="bx bxs-coupon bx-sm"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-lg-3">
							<div class="d-flex justify-content-between align-items-start">
								<div>
									<h6 class="mb-2">총 판매건수</h6>
									<h4 class="mb-2">얼마얼마</h4>
									<p class="mb-0">
										<span class="text-muted me-2">작년대비 판매 증감</span><span
											class="badge bg-label-danger">-x%</span>
									</p>
								</div>
								<div class="avatar">
									<span class="avatar-initial rounded bg-label-secondary">
										<i class="bx bx-package bx-sm"></i>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Product List Table -->
		<div class="card">
			<div class="card-header">
				<h5 class="card-title">분류</h5>
				<div
					class="d-flex justify-content-between align-items-center row py-3 gap-3 gap-md-0">
					<div class="col-md-4 product_status">
						<select id="ProductStatus" class="form-select text-capitalize"><option
								value="">상품 상태</option>
							<option value="ss">상품준비중</option>
							<option value="Scheduled">배송준비중</option>
							<option value="Publish">배송중</option>
							<option value="Inactive">배송완료</option></select>
					</div>
					<div class="col-md-4 product_category">
						<select id="ProductCategory" class="form-select text-capitalize"><option
								value="">카테고리</option>
							<option value="Household">의류</option>
							<option value="Office">산책용품</option>
							<option value="Electronics">리빙</option>
							<option value="Shoes">장난감</option>
							<option value="Accessories">리빙</option>
							<option value="Game">장난감</option></select>
					</div>
					<div class="col-md-4 product_stock">
						<select id="ProductStock" class="form-select text-capitalize"><option
								value="">재고</option>
							<option value="Out_of_Stock">재고 없음</option>
							<option value="In_Stock">재고 있음</option></select>
					</div>
				</div>
			</div>
			<div class="card-datatable table-responsive">
				<div id="DataTables_Table_0_wrapper"
					class="dataTables_wrapper dt-bootstrap5 no-footer">
					<div class="card-header d-flex border-top py-md-0">
						<div class="me-2" style="width: 25%;">
							<div id="DataTables_Table_0_filter" class="dataTables_filter">
								<label style="margin-top: 4%;"> <input type="search"
									class="form-control" placeholder="상품 검색"
									aria-controls="DataTables_Table_0">
								</label>
							</div>
						</div>
						<div style="width: 45%"></div>
						<div
							class="d-flex justify-content-start justify-content-md-end align-items-baseline"
							style="width: 35%;">
							<div
								class="dt-action-buttons d-flex align-items-start align-items-md-center justify-content-sm-center mb-3 mb-sm-0">
								<div class="dataTables_length mb-2 pb-1"
									id="DataTables_Table_0_length">
									<label> <select name="DataTables_Table_0_length"
										aria-controls="DataTables_Table_0"
										class="form-select mt-2 me-2">
											<option value="7">7</option>
											<option value="10">10</option>
											<option value="20">20</option>
											<option value="50">50</option>
											<option value="70">70</option>
											<option value="100">100</option>
									</select>
									</label>
								</div>
								<div class="dt-buttons d-flex flex-wrap ms-2">
									<button class="btn btn-secondary mb-1" type="button"
										data-bs-toggle="offcanvas" data-bs-target="#offcanvasScroll"
										aria-controls="offcanvasScroll">
										<span><i class="bx bx-plus me-0 me-sm-1 mb-1"></i> <span
											class="d-none d-sm-inline-block">상품 추가</span> </span>
									</button>
								</div>
								<div class="offcanvas offcanvas-end" data-bs-scroll="true"
									data-bs-backdrop="false" tabindex="-1" id="offcanvasScroll"
									aria-labelledby="offcanvasScrollLabel">
									<div class="offcanvas-header">
										<button type="button" class="btn-close text-reset"
											data-bs-dismiss="offcanvas" aria-label="Close"></button>
									</div>
									<div class="body-main">

										<form name="productForm" method="post"
											enctype="multipart/form-data">
											<table class="table mt-5 table-form">
												<tr>
													<td class="table-light col-sm-2">카테고리</td>
													<td>
														<div class="row">
															<div class="col-6 pe-1">
																<select name="parentNum" class="form-select">
																	<option value="">:: 메인 카테고리 선택 ::</option>

																	<option value="1">사료</option>

																	<option value="2">간식</option>

																	<option value="3">용품</option>

																</select>
															</div>
															<div class="col-6 ps-1">
																<select name="categoryNum" class="form-select">
																	<option value="">:: 카테고리 선택 ::</option>

																	<option value="5">건식사료</option>

																	<option value="6">습식사료</option>

																	<option value="7">우유/분유</option>

																	<option value="8">고양이사료</option>

																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">상품명</td>
													<td><input type="text" name="productName"
														class="form-control" value=""></td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">상품구분</td>
													<td><select name="special" class="form-select">
															<option value="0">일반상품</option>
															<option value="1">특가상품</option>
															<option value="2">기획상품</option>
													</select></td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">상품가격</td>
													<td><input type="text" name="price"
														class="form-control" value=""></td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">할인율</td>
													<td><input type="text" name="discountRate"
														class="form-control" value=""> <small
														class="form-control-plaintext help-block">할인율이 0인
															경우 상품가격이 판매가격입니다.</small></td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">적립금</td>
													<td><input type="text" name="savedMoney"
														class="form-control" value=""></td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">배송비</td>
													<td><input type="text" name="delivery"
														class="form-control" value=""> <small
														class="form-control-plaintext help-block">배송비가 0인
															경우 무료 배송입니다.</small></td>
												</tr>

												<tr>
													<td class="table-light col-sm-2">상위 옵션</td>
													<td>
														<div class="mb-2">
															<input type="text" name="optionName" class="form-control"
																style="width: 250px;" placeholder="옵션명" value="">

														</div>
														<div class="row option-area">
															<div
																class="col-auto pe-0 d-flex flex-row optionValue-area">


																<div class="input-group pe-1">
																	<input type="text" name="optionValues"
																		class="form-control" style="flex: none; width: 90px;"
																		placeholder="옵션값"> <i
																		class="bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus"></i>
																</div>

															</div>
															<div class="col-auto">
																<button type="button" class="btn btn-light btnOptionAdd">추가</button>
															</div>
														</div> <small class="form-control-plaintext help-block">판매
															상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
													</td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">하위 옵션</td>
													<td>
														<div class="mb-2">
															<input type="text" name="optionName2"
																style="width: 250px;" class="form-control"
																placeholder="옵션명" value="">

														</div>
														<div class="row option-area2">
															<div
																class="col-auto pe-0 d-flex flex-row optionValue-area2">


																<div class="input-group pe-1">
																	<input type="text" name="optionValues2"
																		class="form-control" style="flex: none; width: 90px;"
																		placeholder="옵션값"> <i
																		class="bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus2"></i>
																</div>

															</div>
															<div class="col-auto">
																<button type="button"
																	class="btn btn-light btnOptionAdd2">추가</button>
															</div>
														</div> <small class="form-control-plaintext help-block">판매
															상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
													</td>
												</tr>

												<tr>
													<td class="table-light col-sm-2">상품 진열</td>
													<td>
														<div class="pt-2 pb-2">
															<input type="radio" name="productShow"
																class="form-check-input" id="productShow1" value="1">
															<label class="form-check-label" for="productShow1">상품진열</label>
															&nbsp;&nbsp; <input type="radio" name="productShow"
																class="form-check-input" id="productShow0" value="0">
															<label class="form-check-label" for="productShow0">진열안함</label>
														</div>
													</td>
												</tr>

												<tr>
													<td class="table-light col-sm-2">상품설명</td>
													<td><textarea name="content" id="ir1"
															class="form-control"
															style="max-width: 95%; height: 290px;"></textarea></td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">대표이미지</td>
													<td>
														<div class="thumbnail-viewer">
															<img 
																src="${pageContext.request.contextPath}/resources/images/add_photo.png">
														</div> <input type="file" name="thumbnailFile" accept="image/*"
														class="form-control" style="display: none;">
													</td>
												</tr>

												<tr>
													<td class="table-light col-sm-2">추가이미지</td>
													<td>
														<div class="img-grid">
															<img class="item img-add"
																src="${pageContext.request.contextPath}/resources/images/add_photo.png">
															<c:forEach var="vo" items="${listFile}">
																<img
																	src="${pageContext.request.contextPath}/uploads/product/${vo.filename}"
																	class="item delete-img" data-fileNum="${vo.fileNum}"
																	data-filename="${vo.filename}">
															</c:forEach>
														</div> <input type="file" name="addFiles" accept="image/*"
														multiple class="form-control" style="display: none;">
													</td>
												</tr>

												</tbody>
											</table>

											<table class="table table-borderless">
												<tbody>
													<tr>
														<td class="text-center">

															<button type="button" class="btn btn-dark"
																onclick="submitContents(this.form);">등록완료</button>
															<button type="reset" class="btn btn-light">다시입력</button>
															<button type="button" class="btn btn-light"
																onclick="location.href='/app/admin/product/main';">등록취소</button>

														</td>
													</tr>
											</table>
										</form>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<table
					class="datatables-products table border-top dataTable no-footer dtr-column collapsed"
					id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info"
					style="width: 100%;">
					<thead>
						<tr>
							<th class="control sorting_disabled" rowspan="1" colspan="1"
								style="width: 6px;" aria-label=""></th>
							<th
								class="sorting_disabled dt-checkboxes-cell dt-checkboxes-select-all"
								rowspan="1" colspan="1" style="width: 19px;" data-col="1"
								aria-label=""><input type="checkbox"
								class="form-check-input"></th>
							<th class="sorting sorting_asc" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								style="width: 300px;"
								aria-label="product: activate to sort column descending"
								aria-sort="ascending">상품명</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								style="width: 132px;"
								aria-label="category: activate to sort column ascending">카테고리</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								style="width: 48px;"
								aria-label="sku: activate to sort column ascending">코드</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								style="width: 48px;"
								aria-label="price: activate to sort column ascending">가격</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								style="width: 50px; padding-right: 10px;"
								aria-label="qty: activate to sort column ascending">재고량</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								style="width: 37px;"
								aria-label="status: activate to sort column ascending">상태</th>
							<th class="sorting_disabled" rowspan="1" colspan="1"
								style="width: 0px;" aria-label="Actions"></th>
						</tr>
					</thead>
					<tbody>
						<tr class="odd">
							<td class="control" tabindex="0" style=""></td>
							<td class="  dt-checkboxes-cell"><input type="checkbox"
								class="dt-checkboxes form-check-input"></td>
							<td class="sorting_1">
								<div
									class="d-flex justify-content-start align-items-center product-name">
									<div class="avatar-wrapper">
										<div class="avatar avatar me-2 rounded-2 bg-label-secondary">
											<img src="../../bootstrapTemp/assets/img/avatars/robot.jpg"
												alt="1" class="rounded-2">
										</div>
									</div>
									<div class="d-flex flex-column">
										<h6 class="text-body text-nowrap mb-0">상품명</h6>
										<small class="text-muted text-truncate d-none d-sm-block">상품
											설명</small>
									</div>
								</div>
							</td>
							<td><span class="text-truncate d-flex align-items-center">
									<span
									class="avatar-sm rounded-circle d-flex justify-content-center align-items-center bg-label-info me-2">
										<i class="bx bx-walk"></i>
								</span>Shoes
							</span></td>
							<td><span>31063</span></td>
							<td><span>$125</span></td>
							<td><span>942</span></td>
							<td class="dtr-hidden"><span class="badge bg-label-success"
								text-capitalized="">active</span></td>
							<td class="dtr-hidden">
								<div class="d-inline-block text-nowrap">
									<button class="btn btn-sm btn-icon dropdown-toggle hide-arrow"
										data-bs-toggle="dropdown">
										<i class="bx bx-dots-vertical-rounded me-2"></i>
									</button>
									<div class="dropdown-menu dropdown-menu-end m-0">
										<a href="javascript:0;" class="dropdown-item">수정</a> <a
											href="javascript:0;" class="dropdown-item">삭제</a>
									</div>
								</div>
							</td>
						</tr>
				</table>
				<div class="row mx-2">
					<div class="col-sm-12 col-md-6 mt-4">
						<div class="dataTables_info" id="DataTables_Table_0_info"
							role="status" aria-live="polite">1-7개/100개 중</div>
					</div>
					<div class="col-sm-12 col-md-6 mt-3 " style="padding-left: 14%;">
						<div class="dataTables_paginate paging_simple_numbers"
							id="DataTables_Table_0_paginate">
							<ul class="pagination">
								<li class="paginate_button page-item previous disabled"
									id="DataTables_Table_0_previous"><a
									aria-controls="DataTables_Table_0" aria-disabled="true"
									role="link" data-dt-idx="previous" tabindex="0"
									class="page-link">Previous</a></li>
								<li class="paginate_button page-item active"><a href="#"
									aria-controls="DataTables_Table_0" role="link"
									aria-current="page" data-dt-idx="0" tabindex="0"
									class="page-link">1</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="DataTables_Table_0" role="link" data-dt-idx="1"
									tabindex="0" class="page-link">2</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="DataTables_Table_0" role="link" data-dt-idx="2"
									tabindex="0" class="page-link">3</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="DataTables_Table_0" role="link" data-dt-idx="3"
									tabindex="0" class="page-link">4</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="DataTables_Table_0" role="link" data-dt-idx="4"
									tabindex="0" class="page-link">5</a></li>
								<li class="paginate_button page-item disabled"
									id="DataTables_Table_0_ellipsis"><a
									aria-controls="DataTables_Table_0" aria-disabled="true"
									role="link" data-dt-idx="ellipsis" tabindex="0"
									class="page-link">…</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="DataTables_Table_0" role="link" data-dt-idx="14"
									tabindex="0" class="page-link">15</a></li>
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
</div>
<!-- / Content -->




<!-- Footer -->
<footer class="content-footer footer bg-footer-theme">
	<div
		class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
		<div class="mb-2 mb-md-0"></div>
		<div class="d-none d-lg-inline-block"></div>
	</div>
</footer>
<!-- / Footer -->


<div class="content-backdrop fade"></div>
<script type="text/javascript">
// 대표(썸네일) 이미지
$(function(){
	var img = "${dto.thumbnail}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/product/"+img;
		$(".table-form .thumbnail-viewer").empty();
		$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
	}
	
	$(".table-form .thumbnail-viewer").click(function(){
		$("form[name=productForm] input[name=thumbnailFile]").trigger("click");
	});
	
	$("form[name=productForm] input[name=thumbnailFile]").change(function(){
		let file = this.files[0];
		
		if(! file) {
			$(".table-form .thumbnail-viewer").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/product/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { // 파일의 내용을 다 읽었으면
			$(".table-form .thumbnail-viewer").empty();
			$(".table-form .thumbnail-viewer").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});
});

// 수정에서 등록된 추가 이미지 삭제
$(function(){
	$(".delete-img").click(function(){
		if(! confirm("이미지를 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		let $img = $(this);
		let fileNum = $img.attr("data-fileNum");
		let filename = $img.attr("data-filename");
		let url="${pageContext.request.contextPath}/admin/product/deleteFile";
		$.post(url, {fileNum:fileNum, filename:filename}, function(data){
			$img.remove();
		}, "json");
	});
});

// 추가 이미지
$(function(){
	var sel_files = [];
	
	$("body").on("click", ".table-form .img-add", function(){
		$("form[name=productForm] input[name=addFiles]").trigger("click");
	});
	
	$("form[name=productForm] input[name=addFiles]").change(function(){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.productForm.addFiles.files = dt.files;
			
			return false;
		}
		
        for(let file of this.files) {
        	sel_files.push(file);
        	
            const reader = new FileReader();
			const $img = $("<img>", {class:"item img-item"});
			$img.attr("data-filename", file.name);
            reader.onload = e => {
            	$img.attr("src", e.target.result);
            };
			reader.readAsDataURL(file);
            
            $(".img-grid").append($img);
        }
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.productForm.addFiles.files = dt.files;
	});
	
	$("body").on("click", ".table-form .img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.productForm.addFiles.files = dt.files;		
		
		$(this).remove();
	});
});
</script>
