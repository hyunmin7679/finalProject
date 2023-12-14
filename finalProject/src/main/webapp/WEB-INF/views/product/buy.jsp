<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<div class="container">
	<div class="body-container">	
		<div class="body-main">
<div class="row mt-4">
				<div class="col-md-6 border border-end-0 pt-2">
					<div class="row gx-1 rounded">
						<div class="col lg-img">
							<img class="w-100 h-100" src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
						</div>
					</div>
					<div class="row gx-1 mt-2 p-1">
						<c:forEach var="vo" items="${listFile}">
							<div class="col-md-auto sm-img">
								<img class="border rounded" src="${pageContext.request.contextPath}/uploads/product/${vo.filename}">
							</div>
						</c:forEach>
					</div>
				</div>
				
				<div class="col-md-6">
					<form name="buyForm">
					<!--  특가
						<c:if test="${dto.special != 0}">
							<div class="border rounded bg-light mt-2 p-2">
								<label class="fs-6 fw-semibold text-primary pe-2">${dto.special == 1 ? "오늘의 특가" : "기획전"}</label>
								<label class="fs-6 fw-semibold pe-2 time-remaining">1일 10시간 남음</label>
								<label class="text-black-50"><fmt:formatNumber value="${dto.saleCount}"/>개 구매</label>
							</div>
						</c:if>
						
						 -->
						<div class="row pt-2">
							<div class="col fs-4 fw-semibold">
								애착인형
							</div>
						</div>
						
						<div class="row pt-1 pb-1 border-bottom">
							<div class="col">
								<label class="align-middle">리뷰수 <span class="fs-5 fw-semibold product-reviewCount">3</span></label>
								<label class="align-middle pt-0 ps-2 score-star product-star">
									<c:forEach var="n" begin="1" end="5">
										<c:set var="score" value="3"/>
										<span class="fs-6 item 3"><i class="bi bi-star-fill"></i></span>
									</c:forEach>
								</label>
								<label class="align-middle "><span class="product-score ps-1">(3 / 5)</span></label>
							</div>
						</div>
						
						<div class="row mt-2">
						<!--  
							<c:if test="${dto.discountRate != 0}">
								<div class="col-auto fs-5 pe-2 text-danger">${dto.discountRate}%</div>
							</c:if>-->
							<div class="col-auto fs-5 pe-2 text-danger">5%</div>
							<div class="col text-end">
								<label class="fs-5 pe-2 fw-semibold"><!-- 
									<fmt:formatNumber value="${dto.salePrice}"/> -->450원
								</label>
								<c:if test="10">
									<label class="fs-6 fw-light text-decoration-line-through"><!-- 
										<fmt:formatNumber value="${dto.price}"/> --> 500원
									</label>
								</c:if>
							</div>
						</div>
						
						<div class="row p-2 m-1 mt-2">
							<div class="col">
								<div class="border-bottom p-2 fs-6 fw-semibold">회원을 위한 혜택</div>
								<div class="row p-2">
									<div class="col-auto text-black-50">적립 포인트</div>
									<div class="col fs-6 text-end">5</div>
								</div>
								<div class="row ps-2 pe-2">
									<div class="col-auto text-black-50">쿠폰 사용 | 포인트 결제</div>
								</div>
							</div>
						</div>

						<div class="border-bottom mt-2 text-black-50 pb-2">
							무이자 할부 | 카드 자세히 보기 <i class="bi bi-question-circle"></i>
						</div>

						<div class="border-bottom mt-2 pb-2">
							<div>
								<label>택배 배송 | </label> 
								<label>
									<c:choose>
										<c:when test="${dto.delivery==0}">무료 배송</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${dto.delivery}"/>
										</c:otherwise>
									</c:choose>
								</label>
								<label>(주문시 결제)</label>
							</div>
							<div>
								<label>제주 추가 배송비 3,000 / 제주 제외 도서 산간 추가 배송비 5,000</label>
							</div>
							<div>
								<label>200,000 이상 구매시 무료</label>
							</div>
						</div>
						
						<div class="mt-2">
							* 필수 옵션
						</div>
						<div class="mt-2">
							<select class="form-select requiredOption" data-optionNum="${listOption[0].optionNum}">
								<option value="">${listOption[0].optionName}</option>
								<c:forEach var="vo" items="${listOptionDetail}">
									<option value="${vo.detailNum}">${vo.optionValue}</option>
								</c:forEach>
							</select>
						</div>
	
						<div class="mt-2 border-bottom pb-2">
							<select class="form-select requiredOption2" data-optionNum2="${listOption[1].optionNum}">
								<option value="">${listOption[1].optionName}</option>
							</select>
						</div>
						
						<div class="order-area"></div>
						
						<div class="row mt-2 pb-2">
							<div class="col-auto fw-semibold pt-1">총상품금액</div>
							<div class="col text-end">
								<label>총수량 <span class="product-totalQty">0</span>개 | </label>
								<label><span class="product-totalAmount fs-5 fw-semibold text-primary">0</span>원</label>
							</div>
						</div>
	
						<div class="mt-2">
							<input type="hidden" name="mode" value="buy">
							<button type="button" class="btn btn-primary w-100 btn-buySend" onclick="sendOk('buy');">구매하기</button>
						</div>
						<div class="row mt-2 mb-2">
							<div class="col pe-1">
								<button type="button" class="btn border w-100 btn-productBlind" disabled>찜하기 <i class="bi bi-heart"></i></button>
							</div>
							<div class="col ps-1">
								<button type="button" class="btn border w-100 btn-productCart" onclick="sendOk('cart');" disabled>장바구니 <i class="bi bi-bag"></i></button>
							</div>
						</div>
					</form>
				</div>
			</div>
			</div>
			</div>
			</div>

</body>
</html>	 