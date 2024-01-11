<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
/* 초기 스타일 설정 */
.highlight {
	color: blue;
	font-weight: bold;
	cursor: pointer;
}
</style>
<%-- <fmt:formatNumber value="${dto.price}" /> --%>

<!-- 내용 -->
<div class="card" style="border: 1px solid lightgray;">

	<div class="card-datatable">
		<div id="DataTables_Table_0_wrapper"
			class="dataTables_wrapper dt-bootstrap5 no-footer">
			<div class="">
				<table class="table board-list order-detail-list p-0 m-0"
					style="width: 100%">
					<thead class="table-light m-0"
						style="text-align: center; font-size: 20px; padding: 10px;">
						<tr>
							<th width="110" style="padding: 0">반품신청일</th>
							<th width="100" style="padding: 0">품목별 주문번호</th>
							<th width="90" style="padding: 0">주문자</th>
							<th width="90" style="padding: 0">상품명</th>

							<th width="130" style="padding: 0">옵션</th>
							<th width="100" style="padding: 0">수량</th>
							<th width="120" style="padding: 0">취소금액</th>
							<th width="90" style="padding: 0">결제수단</th>
							<th width="100" style="padding: 0"><div>상태</div>  
							
							</th>
							<th width="100" style="padding: 0">
								<c:if test="${state =='returnApply' || state =='returnReceipt'}">
									처리	
								</c:if>
								<c:if test="${state =='returnComplete'|| state =='returnNo'}">
									반품처리날짜
								</c:if>
							</th>
							
							<th width="140" style="padding: 0">메모</th>
						</tr>
						
					</thead>

					<tbody style="text-align: center; width: auto; font-size: 12px;">

						<c:forEach var="dto" items="${list}" varStatus="status">

							<tr valign="middle" id="orderDetail-list${dto.orderDetailNum}"
								data-orderDetailNum="${dto.orderDetailNum}">
								<td>
									${dto.reg_date }
								</td>
								<td><div>${dto.orderNum}</div><div>(${dto.orderDetailNum})</div></td>
								<td>${dto.userName}</td>
								<td>${dto.productName}</td>
								<td>${dto.optionValue}/ ${dto.optionValue2}</td>
								<td>${dto.qty}</td>
								<td>
								<fmt:formatNumber value="${dto.cancelCost}" />
								</td>
								<td>${dto.payMethod }</td>
								
								<td>
									<div>${dto.detailStateInfo }</div>
									<c:if test="${state =='returnComplete'|| state =='returnNo'}">
										<div><span id="mySpan" class="orderDetailStatus-update"
										data-PchangeState ="${dto.changeState}"
										data-changeNum="${dto.changeNum}"
										data-orderNum="${dto.orderNum}"
										data-orderDetailNum="${dto.orderDetailNum}"
										data-cancelCost="${dto.cancelCost}">(사진)
									</span></div>
									</c:if>
									
								</td>
								
								<td>
								<c:if test="${state =='returnApply' || state =='returnReceipt'}">
									<span id="mySpan" class="orderDetailStatus-update"
										data-changeNum="${dto.changeNum}"
										data-orderNum="${dto.orderNum}"
										data-orderDetailNum="${dto.orderDetailNum}"
										data-cancelCost="${dto.cancelCost}"
										data-PchangeState ="${dto.changeState}"
										data-deliveryCharge="${dto.deliveryCharge}"
										
										data-usedSaved="${dto.usedSaved}"
										data-savedMoney="${dto.savedMoney}"
										data-memberIdx="${dto.memberIdx}"
										data-detailNum="${dto.detailNum}"
										data-detailNum2="${dto.detailNum2}"
										data-detailNum3="${dto.detailNum3}"
										data-productNum="${dto.productNum }"
										data-couponNum="${dto.couponNum}"
										data-qty="${dto.qty}"
										>변경
									</span>
								</c:if>
								
								<c:if test="${state =='returnComplete'|| state =='returnNo'}">
									<div>${dto.com_date }</div>
								</c:if>
								
								</td>

								<td>
									<div>
										<span>회원&nbsp;&nbsp;&nbsp;&nbsp; </span> <span data-bs-toggle="tooltip"
											data-bs-html="true"
											aria-label="<span>메모<br> 
	         		 					<span class=&quot;fw-medium&quot;>Balance:</span> 0<br> 
	         		 					<span class=&quot;fw-medium&quot;>배송 일자:</span> 11/19/2020</span>"
											data-bs-original-title="<span>메모<br> 
	         		 					<span class=&quot;fw-medium&quot;>
	         		 						${dto.changeSortInfo}
	         		 					</span><br> ">
											
											<span
											class="badge badge-center rounded-pill bg-label-secondary w-px-30 h-px-30 ">
												<i class='bx bx-copy-alt'></i>
										</span>
										</span>
									</div>
									<c:if test="${state == 'returnComplete' || state =='returnNo '}">
									
									<div>
										<span>관리자</span> <span data-bs-toggle="tooltip"
											data-bs-html="true"
											aria-label="<span>메모<br> 
	         		 					<span class=&quot;fw-medium&quot;>Balance:</span> 0<br> 
	         		 					<span class=&quot;fw-medium&quot;>배송 일자:</span> 11/19/2020</span>"
											data-bs-original-title="<span>메모<br> 
	         		 					<span class=&quot;fw-medium&quot;>
	         		 					
	         		 						${dto.adminMemo}
	         		 					
	         		 					</span><br> ">
											
											<span
											class="badge badge-center rounded-pill bg-label-secondary w-px-30 h-px-30 ">
												<i class='bx bx-copy-alt'></i>
										</span>
										</span>
									</div>
									</c:if>
									
								</td>

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

<script>
	// jQuery를 사용하여 이벤트 리스너 등록
	$(document).on("mouseover", ".orderDetailStatus-update", handleMouseOver);
	$(document).on("mouseout", ".orderDetailStatus-update", handleMouseOut);

	// 마우스를 올렸을 때 실행되는 함수
	function handleMouseOver(event) {
		// 클래스를 추가하여 CSS 변경
		$(this).addClass("highlight");
	}

	// 마우스를 내렸을 때 실행되는 함수
	function handleMouseOut() {
		// 클래스를 제거하여 초기 상태로 돌아감
		$(this).removeClass("highlight");
	}

	var tooltipTriggerList = [].slice.call(document
			.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
		return new bootstrap.Tooltip(tooltipTriggerEl)
	});
</script>