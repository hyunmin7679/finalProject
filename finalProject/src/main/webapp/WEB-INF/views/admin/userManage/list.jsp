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
						<c:if test="${dto.enabled==1 }">
						<button class="dropdown-item sanctrigger" data-bs-target="#editUser"
								data-bs-toggle="modal" data-enablenum="${dto.memberIdx}" 
							data-enabled="${dto.enabled}" data-userName="${dto.userName}" >
								제재</button>
						</c:if>
						<c:if test="${dto.enabled==0 }">
						<button class="dropdown-item unsanctrigger" data-bs-target="#editUser2"
								data-bs-toggle="modal" data-enablenum="${dto.memberIdx}" 
							data-enabled="${dto.enabled}" data-userName="${dto.userName}" >
								해제</button>
						</c:if>
							
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
		<div class="modal fade modalwrap" id="editUser2" tabindex="-1" role="dialog"
			aria-labelledby="editUserLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 style="margin: auto;" class="modal-title" id="editUserLabel2" ></h5>
					</div>
					<div class="modal-body" style="font: bold; margin: auto;">
						<input type="text" name="memberIdx" id="memberIdx" value="" style="display: none;"/>
						<input type="text" name="userName" id="userName" value="" style="display: none;"/>
						<input type="text" name="enabled" id="enabled" value="" style="display: none;"/>
						<div class="mt-2">
							
						</div>
						<div class="col-12  mt-3" style="margin: auto;">
						
						</div>
					</div>
					<div class="modal-footer" style="margin: auto;">
						<button type="button" class="btn btn-danger unsancconfirm"
							data-final="" data-finalNum="">확인</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>

<div class="page-navigation" >
	${paging}
<div class="row mx-2">
${dataCount}개(${page}/${total_page}페이지)
</div>		
</div>