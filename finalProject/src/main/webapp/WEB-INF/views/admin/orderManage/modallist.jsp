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
<!-- Modal -->
<div class="modal fade" id="backDropModal" data-bs-backdrop="static"
	tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDialogModalLabel">주문정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="modal-order-detail">
					<div>
						<div class="mt-3">
							<div class="p-3 shadow bg-body rounded">
								<p class="fs-6 fw-semibold mb-0">주문 정보</p>
							</div>
							<div class="mt-3 p-2">
								<table class="table table-bordered mb-1">
									<tbody>
										<tr>
											<td class="table-light" width="105">주문번호</td>
											<td width="150">${order.orderNum}</td>
											<td class="table-light" width="105">주문자</td>
											<td width="150">${order.userName}</td>
											<td class="table-light" width="105">주문일자</td>
											<td width="150">${order.orderDate}</td>
											<td class="table-light" width="120">주문상태</td>
											<td width="150">${order.orderStateInfo}</td>
										</tr>
										<tr>
											<td class="table-light">총금액</td>
											<td class="text-primary"><fmt:formatNumber value="${order.totalMoney}"/></td>
											<td class="table-light">적림금
												<div>사용액</div>
											</td>
											<td class="text-primary">${order.usedSaved}</td>
											<td class="table-light">결제금액</td>
											<td class="text-primary"><fmt:formatNumber value="${order.payment}"/></td>
											<td class="table-light">취소금액</td>
											<td class="text-warning order-cancelAmount"
												data-cancelamount="${order.cancelAmount}"><fmt:formatNumber value="${order.cancelAmount}"/></td>
										</tr>
										<tr>
											<td class="table-light">배송비</td>
											<td class="text-primary"><fmt:formatNumber value="${order.deliveryCharge}"/></td>
											<td class="table-light">배송업체</td>
											<td>${order.deliveryName}</td>
											<td class="table-light">송장번호</td>
											<td>${order.invoiceNumber}</td>
											<td class="table-light">상태변경일</td>
											<td>${order.orderStateDate}</td>
										</tr>
										<tr>
											<td class="table-light">결제구분</td>
											<td>${order.payMethod}</td>
											<td class="table-light">결제카드</td>
											<td>${order.cardName}</td>
											<td class="table-light">결제승인번호</td>
											<td>${order.authNumber}</td>
											<td class="table-light">승인일자</td>
											<td>${order.authDate}</td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>
						<div class="text-end pe-4">
							<button class="btn btn-secondary p-2 m-0 btn-cancel-order" 
							data-orderNum="${order.orderNum}"
							 data-payment="${order.payment}" 
							 data-cancelAmount="${order.cancelAmount}" 
							 data-usedSaved = "${order.usedSaved}" type="button">주문판매취소</button>
						</div>
						<div class="mt-2 border-top pt-2">
							<div class="p-3 shadow bg-body rounded">
								<p class="fs-6 fw-semibold mb-0">주문 상세정보</p>
							</div>
							<div class="mt-3 p-3">
								<div style="max-height: 200px; overflow-y: auto;">
								<table class="table board-list order-detail-list p-0 m-0" style="width: 100%">
									<thead class="table-light m-0" style="text-align: center; font-size:15px; padding: 0">
										<tr>
											<th width="110" style="padding: 0">상세번호</th>
											<th width="100" style="padding: 0">상품명</th>
											<th width="90"style="padding: 0">상품가격</th>
											<th width="90"style="padding: 0">할인가격</th>
											<th width="100"style="padding: 0">쿠폰할인</th>
											<th width="130"style="padding: 0">옵션</th>
											<th width="100"style="padding: 0">수량</th>
											<th width="120"style="padding: 0">주문총금액</th>
											<th width="90"style="padding: 0">적립금</th>
											<th width="90"style="padding: 0">변경</th>											
											<th width="140"style="padding: 0">주문상태</th>
										</tr>
									</thead>
								
									<tbody  style="text-align: center; width: auto; font-size: 12px; ">
								
										<c:forEach var="dto" items="${listDetail}" varStatus="status">

											<tr valign="middle" id="orderDetail-list${dto.orderDetailNum}" data-orderDetailNum="${dto.orderDetailNum}">
												<td>${dto.orderDetailNum}</td>
												<td>${dto.productName}</td>
												<td><fmt:formatNumber value="${dto.price}" /></td>
												<td><fmt:formatNumber value="${dto.salePrice}" /></td>
												<td><fmt:formatNumber value="${dto.couponPrice}" /></td>
												<td>${dto.optionValue} / ${dto.optionValue2}</td>
												<td>${dto.qty}</td>
												<td><fmt:formatNumber value="${dto.productMoney}" /></td>
												<td><fmt:formatNumber value="${dto.savedMoney}" /></td>
												<td><span id="mySpan" class="orderDetailStatus-update" 
														data-orderNum="${order.orderNum}" 
														data-orderState="${order.orderState}"
														data-productMoney="${dto.productMoney}"
														data-orderDetailNum="${dto.orderDetailNum}"
														data-deliveryCharge="${order.deliveryCharge}" 
														data-cancelAmount = "${order.cancelAmount}"
														data-detailState="${dto.detailState}">수정</span></td>
												<td>
												
													${order.orderState==0  && dto.detailState==0?"상품준비중": dto.detailStateInfo}
												
												</td>

											</tr>
										</c:forEach>
									
									</tbody>
									
								</table>
								</div>
								<table class="table table-borderless mb-1">
									<tbody>
										<tr>
											<td width="50%"><strong>배송지 : 인천 서구 청라라임로
													138번길8,201호</strong>
												<div>
													<label>메모 : 배송지 메모입니다.</label>
												</div></td>

											<td class="text-end ">
												<div class="row justify-content-end  delivery-update-area">
													<div class="col-auto">

													<c:if test="${order.orderState==1 }">
														<form class="row text-center" name="invoiceNumberForm">
														<div class="row dropdown">

															<div class="col-3 text-body pt-2 pe-0 me-0"
																style="width: 30%">
																<select name="deliveryName" id="ProductStatus"
																	class="form-select text-capitalize m-0 p-0">
																	<option value="자체배송">자체배송</option>
																	<option value="CJ택배">CJ택배</option>
																	<option value="롯대택배">롯대택배</option>
																</select>
															</div>

															<div class="col text-body pt-2 pe-0 me-0"
																style="width: 50%">
																<input type="text" name="invoiceNumber" class="form-control m-0 p-0"
																	placeholder="송장번호" />
															</div>
															<div class="col ps-0" style="width: 10%">
																	<input type="hidden" name="orderNum" value="${order.orderNum}">
																	<input type="hidden" name="orderState" value="2">
																<button class="btn btn-secondary p-2 m-0 btnInvoiceNumberOk" type="button"
																	id="routeVehicles">발송처리</button>
																
															</div>
														</div>
														</form>
													</c:if>
													
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
    </script>