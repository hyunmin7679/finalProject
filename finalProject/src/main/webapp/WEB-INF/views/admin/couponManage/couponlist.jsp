<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<table class="dt-route-vehicles table dataTable no-footer dtr-column"
	id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info"
	style="width: 100%;">
	<thead class="border-top">
		<tr>
			<th class="control sorting_disabled dtr-hidden" rowspan="1"
				colspan="1" style="width: 0px; display: none;" aria-label=""></th>

			<th class="sorting sorting_asc" tabindex="0"
				aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
				style="width: 154px;"
				aria-label="location: activate to sort column descending"
				aria-sort="ascending">쿠폰코드</th>
			<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0"
				rowspan="1" colspan="1" style="width: 247px;"
				aria-label="starting route: activate to sort column ascending">사용카테고리</th>
			<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0"
				rowspan="1" colspan="1" style="width: 247px;"
				aria-label="starting route: activate to sort column ascending">쿠폰이름
			</th>
			<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0"
				rowspan="1" colspan="1" style="width: 130px;"
				aria-label="ending route: activate to sort column ascending">할인율
			</th>
			<th class="w-20 sorting" tabindex="0"
				aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
				style="width: 260px;"
				aria-label="progress: activate to sort column ascending">시작일</th>
			<th class="w-20 sorting" tabindex="0"
				aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
				style="width: 260px;"
				aria-label="progress: activate to sort column ascending">종료일</th>
			<th class="w-20 sorting" tabindex="0"
				aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
				style="width: 130px;"
				aria-label="progress: activate to sort column ascending">지급수</th>
			<th class="w-20 sorting" tabindex="0"
				aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
				style="width: 130px;"
				aria-label="progress: activate to sort column ascending">사용수</th>
				
			<c:if test="${category eq 'all' || category eq 'open'}">	
			<th class="w-20 sorting" tabindex="0"
				aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
				style="width: 160px;"
				aria-label="progress: activate to sort column ascending">발급상태</th>
			</c:if>
			
			<c:if test="${category eq 'end'}">	
				<th class="w-20 sorting" tabindex="0"
				aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
				style="width: 100px;"
				aria-label="progress: activate to sort column ascending">삭제</th>
			</c:if>
		</tr>

	</thead>
	<tbody>
	<c:forEach var="dto" items="${list}" varStatus="status">
		<tr class="odd">
			<td class="  control" tabindex="0" style="display: none;"></td>

			<td><div class="text-body">${dto.couponCode}</div></td>
			<td>
				<div class="text-body">
					<c:if test="${dto.categoryNum == 22}">
						모두
					</c:if>
					<c:if test="${dto.categoryNum == 1}">
						건식사료
					</c:if>
					<c:if test="${dto.categoryNum == 2}">
						습식사료
					</c:if>
					<c:if test="${dto.categoryNum == 3}">
						우유/분유
					</c:if>
					<c:if test="${dto.categoryNum == 4}">
						고양이사료
					</c:if>
					<c:if test="${dto.categoryNum == 5}">
						강아지껌
					</c:if>
					<c:if test="${dto.categoryNum == 6}">
						육포/사시미
					</c:if>
					<c:if test="${dto.categoryNum == 7}">
						수제간식
					</c:if>
					<c:if test="${dto.categoryNum == 8}">
						비스켓/스낵
					</c:if>
					<c:if test="${dto.categoryNum == 9}">
						캔/파우치
					</c:if>
					<c:if test="${dto.categoryNum == 10}">
						고양이간식
					</c:if>
					<c:if test="${dto.categoryNum == 11}">
						위생/배변
					</c:if>
					<c:if test="${dto.categoryNum == 12}">
						건강관리
					</c:if>
					<c:if test="${dto.categoryNum == 13}">
						장난감
					</c:if>
					<c:if test="${dto.categoryNum == 14}">
						미용/목욕
					</c:if>
					<c:if test="${dto.categoryNum == 15}">
						하우스
					</c:if>
					<c:if test="${dto.categoryNum == 16}">
						급식기/급수기
					</c:if>
					<c:if test="${dto.categoryNum == 17}">
						의류/액세서리
					</c:if>
					<c:if test="${dto.categoryNum == 18}">
						목줄/가슴줄
					</c:if>
					
				</div>
			</td>
			<td><div class="text-body">${dto.couponName }</div></td>
			<td>
				<div class="m-0 p-0">${dto.couponDiscount }%</div>
			</td>
			<td><div class="text-body">${dto.startCouponDate}</div></td>
			<td><div class="text-body">${dto.endCouponDate}</div></td>
			<td><div class="text-body">${dto.issuedCoupon }</div></td>
			<td><div class="text-body">${dto.useCoupon }</div></td>
			<c:if test="${category eq 'all' || category eq 'open'}">
			<td><div class="text-body">발급가능</div></td>
			</c:if>
			<c:if test="${category eq 'end'}">
			<td>
				<div class="text-body">
					<button class="btn btn-sm btn-icon delete-record me-2 deleteCoupon" data-couponNum="${dto.couponNum}">
						<i class="bx bx-trash"></i>
					</button>
				</div>
			</td>
			</c:if>

		</tr>
		<!--  -->
	</c:forEach>


	</tbody>
</table>

<div class="row d-flex align-items-center">

	<div class="col-sm-12 col-md-6"
		style="padding-left: 500px; padding-top: 10px;">
		<div class="dataTables_paginate paging_simple_numbers"
			id="DataTables_Table_0_paginate">
			<ul class="pagination">
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
