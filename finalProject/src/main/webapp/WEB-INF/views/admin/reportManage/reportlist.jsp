<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
						id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info"
						style="width: 100%;">
						<thead class="border-top">
							<tr>
								<th class="control sorting_disabled dtr-hidden" rowspan="1"
									colspan="1" style="width: 0px; display: none;" aria-label=""></th>

								<th class="sorting sorting_asc" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 60px;"
									aria-label="location: activate to sort column descending"
									aria-sort="ascending">게시글등록일</th>
								<th class="sorting sorting_asc" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 80px;"
									aria-label="location: activate to sort column descending"
									aria-sort="ascending">유저ID</th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 300px;"
									aria-label="starting route: activate to sort column ascending">게시글제목
								</th>
								<th class="w-20 sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 100px;"
									aria-label="progress: activate to sort column ascending">상태</th>
								<th class="w-20 sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 100px;"
									aria-label="progress: activate to sort column ascending">자세히보기</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr class="odd">
								<td class="  control" tabindex="0" style="display: none;"></td>

								<td><div class="text-body">${dto.preg_date }</div></td>
								<td><div class="text-body">${dto.userName }</div></td>
								<td><div class="text-body">${dto.productName }</div></td>
								<td><div class="text-body">표시/숨김</div></td>
								<td><div class="text-body">
										<button type="button" style="font-size: 13px; width: 50px;"
											class="btn btn-primary m-0 p-0" data-bs-toggle="modal"
											data-bs-target="#backDropModal">
											보기<i class='bx bx-right-arrow-alt'></i>
										</button>
									</div></td>
							</tr>
						</c:forEach>
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
									<thead class="table-light">
										<tr>
											<th width="100">번호</th>
											<th width="290">신고사유</th>
											<th width="290">신고내용</th>
											<th width="290">신고일</th>
										</tr>
									</thead>

									<tbody style="width: auto;">
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
															data-ordernum="202312091000000003" data-orderstate="2">게시글숨김
															/ 숨겨져있으면 표시로</button>
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




