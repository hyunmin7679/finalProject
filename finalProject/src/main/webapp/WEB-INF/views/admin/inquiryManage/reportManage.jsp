<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!-- / Navbar -->



<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">


		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">신고관리 /</span> 신고 게시물 조회 
		</h4>
		<div class="row">


			<div class="col-xl-6">

				<div class="nav-align-top mb-4" style="width: 1360px;">

					<ul class="nav nav-pills mb-3 nav-fill" role="tablist"
						style="width: 500px;">
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link active" role="tab"
								data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home"
								aria-controls="navs-pills-justified-home" aria-selected="false"
								tabindex="-1">
								<i class="tf-icons bx bx-home me-1"></i> 신고 당한 게시물 <span
									class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger ms-1">3</span>
							</button>
						</li>
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link " role="tab"
								data-bs-toggle="tab"
								data-bs-target="#navs-pills-justified-profile"
								aria-controls="navs-pills-justified-profile"
								aria-selected="true">
								<i class="tf-icons bx bx-user me-1"></i> 신고처리 게시물
							</button>
						</li>
						<!-- 
        <li class="nav-item" role="presentation">
          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-messages" aria-controls="navs-pills-justified-messages" aria-selected="false" tabindex="-1"><i class="tf-icons bx bx-message-square me-1"></i></button>
        </li>
         -->
					</ul>
					<div class="tab-content" style="width: 1380px;">

						<div class="tab-pane fade active show"
							id="navs-pills-justified-home" role="tabpanel">



							<div class=" text-nowrap">
								<table class="table table-bordered" style="width: 1330px;">
									<thead>
										<tr class="text-center" style="background-color: gray;">
											<th colspan="5">조회하기</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="width: 6%; text-align: center;"> <span
												class="fw-medium">카테고리</span></td>
											<td colspan="4">

												<div
													class="d-flex justify-content-between align-items-center row gap-md-0">

													<div class="col-4 product_status" style="width: 300px;">
														<select id="ProductStatus"
															class="form-select text-capitalize">
															<option value="">카테고리전체</option>
														</select>
													</div>
												</div>
											</td>

										</tr>
										<tr>
											<td style="text-align: center;"><span
												class="fw-medium">기간</span></td>
											<td colspan="4">

												<div
													class="d-flex justify-content-between align-items-center row gap-md-0">

													<div class="col-4 product_status" style="width: 300px;">
														<select id="ProductStatus"
															class="form-select text-capitalize">
															<option value="">등록일자</option>
														</select>
													</div>
													<div class="col product_category">
														<div class="row">
															<div class="col-2 col-2">
																<input class="form-control" type="date">
															</div>
															<i style="width: 30px;"
																class='bx bx-minus col-1 pt-2 pe-4'></i>
															<div class="col-2 col-2">
																<input class="form-control" type="date">
															</div>
														</div>
													</div>
												</div>
											</td>

										</tr>
										<tr>
											<td style="text-align: center;"> <span
												class="fw-medium">게시글찾기</span></td>
											<td colspan="4">

												<div
													class="d-flex justify-content-between align-items-center row gap-md-0">

													<div class="col-4 product_status" style="width: 300px;">
														<select id="ProductStatus"
															class="form-select text-capitalize">
															<option value="">제목</option>
															<option value="">유저아이디</option>
														</select>
													</div>
													<div class="col product_category">
														<input class="form-control" type="text" name="#" value="">
													</div>
												</div>
											</td>

										</tr>
									</tbody>
								</table>
								<div class="text-center pb-0 pt-3"><button class="btn btn-secondary" style="width: 100px;">검색</button> </div> 
							</div>
							<!--/ Bordered Table -->

					
							<br />
							<!--  @@@@@@@@@@@@@@@@@@@ -->
							<div class="card">
							<div class="card-title m-0 pb-3">
								<h5 class="m-0 me-2">검색결과(1)</h5>
							</div>

							<div class="card" style="border: 1px solid lightgray;">

								<div class="card-datatable">
									<div id="DataTables_Table_0_wrapper"
										class="dataTables_wrapper dt-bootstrap5 no-footer">
										<div class="">
											<table
												class="dt-route-vehicles table dataTable no-footer dtr-column"
												id="DataTables_Table_0"
												aria-describedby="DataTables_Table_0_info"
												style="width: 1330px;">
												<thead class="border-top">
													<tr>
														<th class="control sorting_disabled dtr-hidden"
															rowspan="1" colspan="1"
															style="width: 0px; display: none;" aria-label=""></th>

														<th class="sorting sorting_asc" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 154px;"
															aria-label="location: activate to sort column descending"
															aria-sort="ascending">등록일</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 150px;"
															aria-label="starting route: activate to sort column ascending">카테고리
														</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 300px;"
															aria-label="starting route: activate to sort column ascending">게시글제목
														</th>
														<th class="w-20 sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 100px;"
															aria-label="progress: activate to sort column ascending">상태</th>
														<th class="w-20 sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 100px;"
															aria-label="progress: activate to sort column ascending">자세히보기</th>
													</tr>
												</thead>
												<tbody>
													<tr class="odd">
														<td class="  control" tabindex="0" style="display: none;"></td>

														<td><div class="text-body">2012-12-12</div></td>
														<td><div class="text-body">카테고리</div></td>
														<td><div class="text-body">김현민</div></td>
														<td><div class="text-body">표시</div></td>
														<td><div class="text-body">
																<button type="button"
																	style="font-size: 13px; width: 50px;"
																	class="btn btn-primary m-0 p-0" data-bs-toggle="modal"
																	data-bs-target="#backDropModal">
																	보기<i class='bx bx-right-arrow-alt'></i>
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
														<li class="paginate_button page-item active"><a
															href="#" aria-controls="DataTables_Table_0" role="link"
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

	</div>


						<div class="tab-pane fade " id="navs-pills-justified-profile"
							role="tabpanel">
					<div class=" text-nowrap">
								<table class="table table-bordered" style="width: 1330px;">
									<thead>
										<tr class="text-center" style="background-color: gray;">
											<th colspan="5">조회하기</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="width: 6%; text-align: center;"> <span
												class="fw-medium">카테고리</span></td>
											<td colspan="4">

												<div
													class="d-flex justify-content-between align-items-center row gap-md-0">

													<div class="col-4 product_status" style="width: 300px;">
														<select id="ProductStatus"
															class="form-select text-capitalize">
															<option value="">카테고리전체</option>
														</select>
													</div>
												</div>
											</td>

										</tr>
										<tr>
											<td style="text-align: center;"><span
												class="fw-medium">기간</span></td>
											<td colspan="4">

												<div
													class="d-flex justify-content-between align-items-center row gap-md-0">

													<div class="col-4 product_status" style="width: 300px;">
														<select id="ProductStatus"
															class="form-select text-capitalize">
															<option value="">등록일자</option>
														</select>
													</div>
													<div class="col product_category">
														<div class="row">
															<div class="col-2 col-2">
																<input class="form-control" type="date">
															</div>
															<i style="width: 30px;"
																class='bx bx-minus col-1 pt-2 pe-4'></i>
															<div class="col-2 col-2">
																<input class="form-control" type="date">
															</div>
														</div>
													</div>
												</div>
											</td>

										</tr>
										<tr>
											<td style="text-align: center;"> <span
												class="fw-medium">게시글찾기</span></td>
											<td colspan="4">

												<div
													class="d-flex justify-content-between align-items-center row gap-md-0">

													<div class="col-4 product_status" style="width: 300px;">
														<select id="ProductStatus"
															class="form-select text-capitalize">
															<option value="">제목</option>
															<option value="">유저아이디</option>
														</select>
													</div>
													<div class="col product_category">
														<input class="form-control" type="text" name="#" value="">
													</div>
												</div>
											</td>

										</tr>
									</tbody>
								</table>
								<div class="text-center pb-0 pt-3"><button class="btn btn-secondary" style="width: 100px;">검색</button> </div> 
							</div>
							<!--/ Bordered Table -->


							<br />
							<!--  @@@@@@@@@@@@@@@@@@@ -->
							<div class="card-title m-0 pb-3">
								<h5 class="m-0 me-2">검색결과(1)</h5>
							</div>

						<div class="card" style="border: 1px solid lightgray;">

								<div class="card-datatable">
									<div id="DataTables_Table_0_wrapper"
										class="dataTables_wrapper dt-bootstrap5 no-footer">
										<div class="">
											<table
												class="dt-route-vehicles table dataTable no-footer dtr-column"
												id="DataTables_Table_0"
												aria-describedby="DataTables_Table_0_info"
												style="width: 1330px;">
												<thead class="border-top">
													<tr>
														<th class="control sorting_disabled dtr-hidden"
															rowspan="1" colspan="1"
															style="width: 0px; display: none;" aria-label=""></th>

														<th class="sorting sorting_asc" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 154px;"
															aria-label="location: activate to sort column descending"
															aria-sort="ascending">등록일</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 150px;"
															aria-label="starting route: activate to sort column ascending">카테고리
														</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 300px;"
															aria-label="starting route: activate to sort column ascending">게시글제목
														</th>
														</th>
														<th class="w-20 sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 100px;"
															aria-label="progress: activate to sort column ascending">상태</th>
														<th class="w-20 sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 100px;"
															aria-label="progress: activate to sort column ascending">자세히보기</th>
													</tr>
												</thead>
												<tbody>
													<tr class="odd">
														<td class="  control" tabindex="0" style="display: none;"></td>

														<td><div class="text-body">2012-12-12</div></td>
														<td><div class="text-body">카테고리</div></td>
														<td><div class="text-body">김현민</div></td>
														<td><div class="text-body">숨김</div></td>
														<td><div class="text-body">
																<button type="button"
																	style="font-size: 13px; width: 50px;"
																	class="btn btn-primary m-0 p-0" data-bs-toggle="modal"
																	data-bs-target="#backDropModal">
																	보기<i class='bx bx-right-arrow-alt'></i>
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
														<li class="paginate_button page-item active"><a
															href="#" aria-controls="DataTables_Table_0" role="link"
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
						<!--  
        <div class="tab-pane fade" id="navs-pills-justified-messages" role="tabpanel">
          <p>
            Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies cupcake gummi
            bears
            cake chocolate.
          </p>
          <p class="mb-0">
            Cake chocolate bar cotton candy apple pie tootsie roll ice cream apple pie brownie cake. Sweet roll icing
            sesame snaps caramels danish toffee. Brownie biscuit dessert dessert. Pudding jelly jelly-o tart brownie
            jelly.
          </p>
        </div> -->

					</div>

				</div>
			</div>
			<!--/ User Content -->
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="backDropModal" data-bs-backdrop="static"
	tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDialogModalLabel">신고상세보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="modal-order-detail">



					<div>
						

						<div class="mt-2 border-top pt-2">
							<div class="mt-3 p-3">

								<table class="table board-list order-detail-list">
									<thead class="table-light"">
										<tr>
											<th width="50">번호</th>
											<th width="290">신고사유</th>
											<th width="290">신고내용</th>
											<th width="290">신고일</th>
										</tr>
									</thead>

									<tbody style=" width: auto;">
										<tr valign="middle" id="orderDetail-list5">
											<td>1</td>
											<td>고구마</td>
											<td>1,000,000</td>
											<td>2021/12/12</td>
											
										</tr>

									</tbody>
								</table>
								<table class="table table-borderless mb-1">
									<tbody>
										<tr>
											
											<td class="text-end">
												<div class="row justify-content-end delivery-update-area">
													<div class="col-auto">
														<button type="button"
															class="btn btn-primary btn-delivery-order"
															data-ordernum="202312091000000003" data-orderstate="2">게시글숨김 / 숨겨져있으면 표시로 </button>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- /Modal -->

<!-- / Content -->




<!-- Footer -->
<footer class="content-footer footer bg-footer-theme"> </footer>
<!-- / Footer -->

<!-- Content wrapper -->