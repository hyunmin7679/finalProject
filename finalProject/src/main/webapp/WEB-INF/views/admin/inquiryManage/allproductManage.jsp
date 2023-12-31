<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!-- / Navbar -->



<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">


		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">주문관리 /</span> 전체주문조회
		</h4>


		<!-- On route vehicles Table -->
		<div class="col-12 order-5">
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<div class="card-title mb-0 pb-3">
				<h5 class="m-0 me-2">상품주문관리</h5>
			</div>

			<!-- Bordered Table -->
			<div class="card">
				<div class="card-body">
					<div class="table-responsive text-nowrap">
						<table class="table table-bordered" style="width: 1330px;">
							<thead>
								<tr class="text-center" style="background-color: gray;">
									<th colspan="5">전체주문조회</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="width: 6%; text-align: center;"><span
										class="fw-medium">검색어</span></td>
									<td colspan="4">

										<div
											class="d-flex justify-content-between align-items-center row gap-md-0">

											<div class="col-4 product_status" style="width: 300px;">
												<select id="ProductStatus"
													class="form-select text-capitalize">
													<option value="">주문번호</option>
												</select>
											</div>
											<div class="col product_category">
												<input class="form-control" type="text" name="#" value="">
											</div>
										</div>
									</td>

								</tr>
								<tr>
									<td style="text-align: center;"><span class="fw-medium">기간</span></td>
									<td colspan="4">

										<div
											class="d-flex justify-content-between align-items-center row gap-md-0">

											<div class="col-4 product_status" style="width: 300px;">
												<select id="ProductStatus"
													class="form-select text-capitalize">
													<option value="">주문일자</option>
												</select>
											</div>
											<div class="col product_category">
												<div class="row">
													<div class="col-2 col-2">
														<input class="form-control" type="date">
													</div>
													<i style="width: 30px;" class='bx bx-minus col-1 pt-2 pe-4'></i>
													<div class="col-2 col-2">
														<input class="form-control" type="date">
													</div>
												</div>
											</div>
										</div>
									</td>

								</tr>
								<tr>
									<td style="text-align: center;"><span class="fw-medium">상품</span></td>
									<td colspan="4">

										<div
											class="d-flex justify-content-between align-items-center row gap-md-0">

											<div class="col-4 product_status" style="width: 300px;">
												<select id="ProductStatus"
													class="form-select text-capitalize">
													<option value="">상품명</option>
												</select>
											</div>
											<div class="col product_category">
												<input class="form-control" type="text" name="#" value="">
											</div>
										</div>
									</td>

								</tr>
								<tr>
									<td style="text-align: center;"><span class="fw-medium">주문상태</span></td>

									<td colspan="4"><span><input type="radio" name="chk_info" value="HTML" />전체</span> 
									<span><input type="radio" name="chk_info" value="HTML" />상품준비중</span> <span>
									<input type="radio" name="chk_info" value="HTML" />배송준비중</span> <span>
									<input type="radio" name="chk_info" value="HTML" />배송보류</span> <span>
									<input type="radio" name="chk_info" value="HTML" />배송대기</span> <span>
									<input type="radio" name="chk_info" value="HTML" />배송중</span> <span>
									<input type="radio" name="chk_info" value="HTML" />배송완료</span></td>
								</tr>


							</tbody>

						</table>
						<div class="text-center pb-0 pt-3">
							<button class="btn btn-secondary" style="width: 100px;">검색</button>
						</div>
					</div>
				</div>
			</div>
			<!--/ Bordered Table -->

			<br />
			<!--  @@@@@@@@@@@@@@@@@@@ -->
			<div class="card-title m-0 pb-3">
				<h5 class="m-0 me-2">검색결과(1)</h5>
			</div>

			<div class="card">
				<div
					class="card-header d-flex align-items-center justify-content-between">
					<!-- <div class="dropdown">
						<button class="btn btn-secondary p-2 m-0" type="button"
							id="routeVehicles">배송중 처리</button>
						<button class="btn btn-label-dark p-2 m-0" type="button"
							id="routeVehicles">상품준비중 처리</button>
					</div> -->
				</div>
				<div class="card-datatable">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper dt-bootstrap5 no-footer">
						<div class="table-responsive">
							<table
								class="dt-route-vehicles table dataTable no-footer dtr-column"
								id="DataTables_Table_0"
								aria-describedby="DataTables_Table_0_info"
								style="width: 1360px;">
								<thead class="border-top">
									<tr>
										<th class="control sorting_disabled dtr-hidden" rowspan="1"
											colspan="1" style="width: 0px; display: none;" aria-label=""></th>
										<th
											class="sorting_disabled dt-checkboxes-cell dt-checkboxes-select-all"
											rowspan="1" colspan="1" style="width: 18px;" data-col="1"
											aria-label=""><input type="checkbox"
											class="form-check-input"></th>
										<th class="sorting sorting_asc" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 154px;"
											aria-label="location: activate to sort column descending"
											aria-sort="ascending">주문일자
											<div>(결제일)</div>
										</th>
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 247px;"
											aria-label="starting route: activate to sort column ascending">주문번호
										</th>
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 247px;"
											aria-label="starting route: activate to sort column ascending">주문자
										</th>
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 245px;"
											aria-label="ending route: activate to sort column ascending">운송장번호
										</th>
										<th class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 217px;"
											aria-label="warnings: activate to sort column ascending">배송비</th>
										<th class="w-20 sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 280px;"
											aria-label="progress: activate to sort column ascending">상품명/옵션</th>
										<th class="w-20 sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 100px;"
											aria-label="progress: activate to sort column ascending">수량</th>

										<th class="w-20 sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 280px;"
											aria-label="progress: activate to sort column ascending">상품구매금액</th>
										<th class="w-20 sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 280px;"
											aria-label="progress: activate to sort column ascending">총결제금액</th>
										<th class="w-20 sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 40px;"
											aria-label="progress: activate to sort column ascending">메모</th>
									</tr>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="  control" tabindex="0" style="display: none;"></td>
										<td class="  dt-checkboxes-cell"><input type="checkbox"
											class="dt-checkboxes form-check-input"></td>
										<td><div class="text-body">2012-12-12 13:12:15</div>

											<div class="text-body">(2012-12-12 13:14:15)</div></td>
										<td><div class="text-body">9910091151</div></td>
										<td><div class="text-body">김현민</div></td>
										<td>
											<div class="m-0 p-0"></div>
										</td>
										<td><div class="text-body">2000원</div></td>
										<td><div class="text-body">바나나/검정</div></td>
										<td><div class="text-body text-center">1</div></td>
										<td><div class="text-body">2000원</div></td>
										<td><div class="text-body">2000원</div></td>
										<td><div class="text-body">
												<button type="button" class="btn p-0 m-0"
													data-bs-toggle="modal" data-bs-target="#basicModal">
													<i class="menu-icon tf-icons bx bx-copy"></i>
												</button>
											</div></td>
									</tr>
									

								</tbody>
							</table>
						</div>
						<div class="row d-flex align-items-center">

							<div class="col-sm-12 col-md-6"
								style="padding-left: 500px; padding-top: 10px;">
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
											aria-controls="DataTables_Table_0" role="link"
											data-dt-idx="1" tabindex="0" class="page-link">2</a></li>
										<li class="paginate_button page-item "><a href="#"
											aria-controls="DataTables_Table_0" role="link"
											data-dt-idx="2" tabindex="0" class="page-link">3</a></li>
										<li class="paginate_button page-item "><a href="#"
											aria-controls="DataTables_Table_0" role="link"
											data-dt-idx="3" tabindex="0" class="page-link">4</a></li>
										<li class="paginate_button page-item "><a href="#"
											aria-controls="DataTables_Table_0" role="link"
											data-dt-idx="4" tabindex="0" class="page-link">5</a></li>
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
		<!--/ On route vehicles Table -->


	</div>
	<!-- / Content -->
	<!-- modal -->
	<div class="modal fade" id="basicModal" tabindex="-1"
		style="display: none;" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel1">구매자 배송메시지</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">

					<h6>배송메제시</h6>
				</div>

			</div>
		</div>
	</div>
	<!-- /modal -->


	


	<div class="content-backdrop fade"></div>
</div>