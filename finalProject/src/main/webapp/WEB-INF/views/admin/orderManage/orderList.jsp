<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!-- 내용 -->
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
								style="width: 20%;"
								aria-label="location: activate to sort column descending"
								aria-sort="ascending">주문일자 (결제일)</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								style="width: 15%;"
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
								aria-label="ending route: activate to sort column ascending">주문상태
							</th>
							<th class="w-20 sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								style="width: 180px;"
								aria-label="progress: activate to sort column ascending">결제금액</th>

							<th class="w-20 sorting text-center" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								style="width: 180px;"
								aria-label="progress: activate to sort column ascending">주문수량</th>
							<th class="w-20 sorting text-center" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								style="width: 180px;"
								aria-label="progress: activate to sort column ascending">취소건수</th>



							<th class="w-20 sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								style="width: 100px;"
								aria-label="progress: activate to sort column ascending">변경</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr class="odd">
								<td class="  control" tabindex="0" style="display: none;"></td>

								<td><div class="text-body">${dto.orderDate}</div></td>
								<td><div class="text-body">${dto.orderNum}</div></td>
								<td><div class="text-body">${dto.userName}</div></td>
								<td>
									<div class="m-0 p-0">${dto.orderStateInfo}</div>
								</td>
								<td><div class="text-body ">
										<fmt:formatNumber value="${dto.payment}" />
									</div></td>
								<td><div class="text-body text-center">${dto.totalQty}</div></td>
								<td><div class="text-body text-center">${dto.detailCancelCount}</div></td>
								<td><div class="text-body">
										<button type="button" style="font-size: 13px; width: 50px;"
											class="btn btn-primary m-0 p-0 detailList"
											data-bs-toggle="modal" data-bs-target=""
											data-orderNum="${dto.orderNum}">
											처리<i class='bx bx-right-arrow-alt'></i>
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
						${paging}
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- /내용 -->