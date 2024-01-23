<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 주문상세 -->
			<div class="mt-1 p-2 border-bottom payment-list">
				<div class="p-2">
					<div class="fs-6 fw-semibold text-black-50"><label>${vo.productName}</label><label></label></div>
				</div>
				<div class="col-auto">
					<img class="border rounded md-img" src="${pageContext.request.contextPath}/uploads/product/${vo.thumbnail}">
				</div>
						<div class="row">
							<div class="pt-1 pb-2">
								<label class="text-black-50">${vo.orderDate} 구매</label>
							</div>
						<div class="col">
							<div class="pt-1">
								옵션 : ${vo.optionValue} / ${vo.optionValue2}
							</div>
							<div class="pt-1">
								<label>주문수량 : ${vo.qty}개 &nbsp; |</label>
							</div>
							<div class="pt-1 pb-2">
								<label>총 구매금액 : <fmt:formatNumber value="${vo.productMoney}"/>원</label>
							</div>
							<div class="pt-2 border-top">
								받는사람 : ${vo.recipientName} 
							</div>
							<div class="pt-1">
								전화번호 : ${vo.tel} 
							</div>
							<div class="pt-1 pb-2">
								배송지 : ( ${vo.zip} ) ${vo.addr1} ${vo.addr2}
							</div>
							<c:if test="${vo.cancelCost > 0}">
								<div class="pt-2 border-top">
									<label>총 취소금액 : <fmt:formatNumber value="${vo.cancelCost}"/>원</label>
								</div>	
								<div class="pt-1">
									취소처리일자 : ${ vo.com_date == null ? '처리중' : vo.com_date} 
								</div>
							</c:if>
						</div>
					</div>
				</div>
				