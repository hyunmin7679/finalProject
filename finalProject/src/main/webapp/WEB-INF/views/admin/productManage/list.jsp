<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="dto" items="${list}" varStatus="status">
	<tr class="odd" height="90px;">
		<td class="sorting_1">
			<div
				class="d-flex justify-content-start align-items-center product-name">
				<div class="avatar-wrapper">
					<div class="avatar avatar me-2 rounded-2 bg-label-secondary">
						<img
							src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}"
							alt="1" class="rounded-2">
					</div>
				</div>
				<div class="d-flex flex-column">
					<h6 class="text-body text-nowrap mb-0">
						<a style="color: black;"
							href="${pageContext.request.contextPath}/admin/productManage/update?productNum=${dto.productNum}">${dto.productName}</a>
					</h6>
					<small class="text-muted text-truncate d-none d-sm-block"></small>
				</div>
			</div>
		</td>
		<td><span class="text-truncate d-flex align-items-center"
			style="width: 40px;"> </span><c:if test="${dto.categoryNum == 22}">
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
					</c:if></td>
		<td><span>${dto.productNum}</span></td>
		<td><span
			style="font-size: smaller; display: ${dto.discountRate>0?'':'none'};"
			class=text-danger>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.discountRate>0 ? dto.discountRate : '' }${dto.discountRate>0? '%':'' }</span>
			<span
			${dto.discountRate>0? 'style="text-decoration: line-through; font-size: smaller" class=text-danger' : '' }>${dto.price}
		</span> <span>${dto.discountRate > 0 ? Math.round((100 - dto.discountRate) * 0.01 * dto.price) : ''}</span>
		</td>
		<td><span>${dto.totalStock}</span></td>
		<td style="display: none;">${dto.discountRate}</td>
		<td width="200px;"><strong style="text-align: center;">${dto.optionName1=='기본'? '없음' : dto.optionName1}</strong>
			<div style="text-align: center; margin-bottom: none;">${dto.optionValue1=='기본'? '' : dto.optionValue1}</div></td>
		<td width="200px;"><strong style="text-align: center;">${dto.optionName2=='기본'? '없음' : dto.optionName2}</strong>
			<div style="text-align: center;">${dto.optionValue2=='기본'? '' : dto.optionValue2}</div></td>
		<td class="dtr-hidden"><span
			class="badge bg-label-${dto.specialState=='일반'? 'success' : dto.specialState=='특가'? 'warning' : 'primary'}">${dto.specialState}</span></td>
		<td class="dtr-hidden">
			<div class="d-inline-block text-nowrap">
				<button class="btn btn-sm btn-icon dropdown-toggle hide-arrow"
					data-bs-toggle="dropdown">
					<i class="bx bx-dots-vertical-rounded me-2"></i>
				</button>
				<div class="dropdown-menu dropdown-menu-end m-0 update-delete">
					<button id="deleteButton" class="dropdown-item sanctrigger"
						data-productNumd="${dto.productNum}"
						class="dropdown-item text-danger"
						onclick="deleteProduct(${dto.productNum})">삭제</button>
					<button id="stockButton" class="dropdown-item stocktrigger"
						data-bs-target="#insertStock" data-bs-toggle="modal"
						data-productNum="${dto.productNum}"
						data-detailNumber1="${dto.detailNum1}"
						data-detailNumber2="${dto.detailNum2}"
						data-optionName1="${dto.optionName1}"
						data-optionValue1="${dto.optionValue1}"
						data-optionName2="${dto.optionName2}"
						data-optionValue2="${dto.optionValue2}"
						data-productName="${dto.productName}"
						class="dropdown-item text-danger">재고</button>
				</div>
			</div>
		</td>
	</tr>


</c:forEach>
<tr>
<td>
<div class="row mx-2">
<div class="page-navigation justify-content-center"  >
	${paging}
</div>		
${dataCount}개(${page}/${total_page}페이지)
</div>
</td>
</tr>

