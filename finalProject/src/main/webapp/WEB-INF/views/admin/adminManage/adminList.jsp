<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">

		<h4 class="py-3 mb-4">
			<span>&nbsp;&nbsp;</span>관리자 리스트
		</h4>


		<!-- Users List Table -->
		<div class="card">
			<div class="card-header border-bottom">
				<h5 class="card-title">계정 분류</h5>
			</div>
			<div class="card-datatable">
				<div id="DataTables_Table_0_wrapper"
					class="dataTables_wrapper dt-bootstrap5 no-footer">
					<div class="row mx-2">
						<div class="col-md-2">
							<div class="me-3">
								<div class="dataTables_length" id="DataTables_Table_0_length">

								</div>
							</div>
						</div>
						<div class="col-md-10">
							<div
								class="dt-action-buttons text-xl-end text-lg-start text-md-end text-start d-flex align-items-center justify-content-end flex-md-row flex-column mb-3 mb-md-0">
								<div id="DataTables_Table_0_filter" class="dataTables_filter">
									<label> <input type="search" class="form-control"
										placeholder="검색" aria-controls="DataTables_Table_0">
									</label>
								</div>
							</div>
						</div>
					</div>
					<table
						class="datatables-users table border-top dataTable no-footer dtr-column"
						id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info"
						style="width: 100%;">
						<thead>
							<tr>
								<th class="control sorting_disabled dtr-hidden" rowspan="1"
									colspan="1" style="width: 0px;" aria-label=""></th>
								<th class="sorting sorting_desc" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 268px;"
									aria-label="User: activate to sort column ascending"
									aria-sort="descending">사원</th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 129px;"
									aria-label="Role: activate to sort column ascending">입사일자</th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 161px;"
									aria-label="Billing: activate to sort column ascending">직급</th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 81px;"
									aria-label="Status: activate to sort column ascending">직원상태</th>
								<th class="sorting_disabled" rowspan="1" colspan="1"
									style="width: 106px;" aria-label="Actions"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${list}" varStatus="status">
								<tr class="odd">
									<td class="  control" tabindex="0"></td>
									<td class="sorting_1">
										<div
											class="d-flex justify-content-start align-items-center user-name">
											<div class="avatar-wrapper">
												<div class="avatar avatar-sm me-3">
													<img src="../../bootstrapTemp/assets/img/avatars/robot.jpg"
														alt="Avatar" class="rounded-circle">
												</div>
											</div>
											<div class="d-flex flex-column">
											<c:if test="${sessionScope.member.membership>90}">
												<a href="${pageContext.request.contextPath}/admin/adminManage/adminMypage?memberIdx=${dto.memberIdx}"
													class="text-body text-truncate"> <span
													class="fw-medium">${dto.userName}</span>
												</a>
											</c:if>
											<c:if test="${sessionScope.member.membership<90}">	
												<a
													class="text-body text-truncate"> <span
													class="fw-medium">${dto.userName}</span>
												</a>
											</c:if>
												<c:if test="${!empty dto.email}">
													<small class="text-muted">${dto.email}</small>
												</c:if>
											</div>
										</div>
									</td>
									<td><span class="text-truncate d-flex align-items-center">
											${dto.register_date}</span></td>
									<td>${dto.workstate }</td>
									<td><span class="badge bg-label-success">${dto.worknow }</span>
									</td>
									<td>
										<div class="d-inline-block text-nowrap">
											<button
												class="btn btn-sm btn-icon dropdown-toggle hide-arrow"
												data-bs-toggle="dropdown">
												<i class="bx bx-dots-vertical-rounded me-2"></i>
											</button>
											<div class="dropdown-menu dropdown-menu-end m-0">
												<a href="javascript:;" class="dropdown-item text-danger">삭제</a>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row mx-2" style="width: 100%;">
						<div class="col-sm-12 col-md-6 mt-3">
						</div>
						<div class="col-sm-12 col-md-6 mt-3">
							<div class="dataTables_paginate paging_simple_numbers"
								id="DataTables_Table_0_paginate">
								<ul class="pagination justify-content-end pe-2">
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
	
	<footer class="content-footer footer bg-footer-theme">
		<div
			class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
			<div class="mb-2 mb-md-0"></div>
			<div class="d-none d-lg-inline-block"></div>
		</div>
	</footer>
	<!-- / Footer -->


	<div class="content-backdrop fade"></div>
</div>

