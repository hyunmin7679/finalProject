<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table
	class="datatables-users table border-top dataTable no-footer dtr-column"
	id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info"
	style="width: 100%;">
	<tbody>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr class="odd">
				<td class="  control" tabindex="0"></td>
				<td class="sorting_1">
					<div
						class="d-flex justify-content-start align-items-center user-name">
						<div class="avatar-wrapper">
							<div class="avatar avatar-sm me-3">
								<img
									src="../../bootstrapTemp/assets/img/avatars/blankprofile.png"
									alt="Avatar" class="rounded-circle">
							</div>
						</div>
						<div class="d-flex flex-column">
							<a
								href="${pageContext.request.contextPath}/admin/userManage/userinfo?memberIdx=${dto.memberIdx}"
								class="text-body text-truncate" > <span class="fw-medium">
									${dto.userName}</span>
							</a> <small class="text-muted">${dto.email}</small>
						</div>
					</div>
				</td>
				<td><span class="text-truncate d-flex align-items-center">
						+${dto.regdays}</span></td>
				<td><span class="fw-medium">${dto.ordercount}회</span></td>
				<td>${dto.totalPayment}</td>
				<td>${dto.enabledstate}</td>
				<td>
					<div class="d-inline-block text-nowrap">
						<button class="btn btn-sm btn-icon dropdown-toggle hide-arrow"
							data-bs-toggle="dropdown" >
							<i class="bx bx-dots-vertical-rounded me-2"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-end m-0 trigwrap">
							<button class="dropdown-item sanctrigger" data-bs-target="#editUser"
								data-bs-toggle="modal" data-enablenum="${dto.memberIdx}" 
								data-userName="${dto.userName}" >
								${dto.enabled==1 ? "제재":"해제"}</button>
						</div>
					</div>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
		<div class="modal fade modalwrap" id="editUser" tabindex="-1" role="dialog"
			aria-labelledby="editUserLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 style="margin: auto;" class="modal-title" id="editUserLabel" ></h5>
					</div>
					<div class="modal-body" style="font: bold; margin: auto;">
						<input type="text" name="memberIdx" id="memberIdx" value="" style="display: none;"/>
						<input type="text" name="userName" id="userName" value="" style="display: none;"/>
						<input type="text" name="enabled" id="enabled" value="" style="display: none;"/>
						<div class="mt-2">
							<select class="form-select" id="rereason">
								<option value="" style="text-align: center;">::제재 사유::</option>
								<option value="1" style="text-align: center;">불건전 게시물 등록</option>
								<option value="2" style="text-align: center;">비정상적 로그인</option>
								<option value="3" style="text-align: center;">타계정 도용</option>
								<option value="4" style="text-align: center;">다른 유저 비방</option>
								<option value="5" style="text-align: center;">기타</option>
							</select>
						</div>
						<div class="col-12  mt-3" style="margin: auto;">
							<input style="text-align: center;" type="text" id="rememo"
								name="rememo" class="form-control" placeholder="메모">
						</div>
					</div>
					<div class="modal-footer" style="margin: auto;">
						<button type="button" class="btn btn-danger sancconfirm"
							data-final="" data-finalNum="">확인</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
<div class="row mx-2" style="width: 100%;">
	<div class="col-sm-12 col-md-6 mt-3">
		<div class="dataTables_info" id="DataTables_Table_0_info"
			role="status" aria-live="polite"></div>

	</div>
	<div class="col-sm-12 col-md-6 mt-3">
		<div class="dataTables_paginate paging_simple_numbers"
			id="DataTables_Table_0_paginate">
			<ul class="pagination justify-content-end pe-2">
				<li class="paginate_button page-item previous disabled"
					id="DataTables_Table_0_previous"><a
					aria-controls="DataTables_Table_0" aria-disabled="true" role="link"
					data-dt-idx="previous" tabindex="0" class="page-link">Previous</a></li>
				<li class="paginate_button page-item active"><a href="#"
					aria-controls="DataTables_Table_0" role="link" aria-current="page"
					data-dt-idx="0" tabindex="0" class="page-link">1</a></li>
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
					aria-controls="DataTables_Table_0" role="link" data-dt-idx="next"
					tabindex="0" class="page-link">Next</a></li>
			</ul>
		</div>
	</div>
</div>
