<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1000px;
}

.md-img {
	width: 80px; height: 80px;
}
</style>

<script type="text/javascript">

function pointOk() {
	const f = document.paymentForm;
	
	let point = parseInt(${point.point}); 
	let usePoint = parseInt(f.usePoint.value);
	
	if(f.usePoint.value > point){
		alert("보유포인트보다 많은 포인트를 사용할 수 없습니다.")
		return;
	}
	
	let totalvalue = parseInt(f.payment.value);
	
	if(f.usePoint.value > totalvalue){
		alert(f.usePoint.value)
		alert(totalvalue)
		return;
	}
	
	let totalPayMent = totalvalue - f.usePoint.value;
	
	$(".usePoint").text(f.usePoint.value.toLocaleString() + "원");
	$(".product-totalAmount").text(totalPayMent.toLocaleString() + "원");	
}

function sendOk() {
	const f = document.paymentForm;
	
	if(! f.recipientName.value) {
		alert("먼저 배송지를 등록하세요..");
		return;
	}

	// 결제 API에서 응답 받을 파라미터
	let payMethod = "카드결제"; // 결제유형
	let cardName = "BC 카드";  // 카드 이름
	let authNumber = "1234567890"; // 승인번호
	let authDate = ""; // 승인 날짜
	// toISOString() : "YYYY-MM-DDTHH:mm:ss.sssZ" 형식
	authDate = new Date().toISOString().replace('T', ' ').slice(0, -5); // YYYY-MM-DD HH:mm:ss

	// 결제 API에 요청할 파라미터
	let payment = f.payment.value; // 결제할 금액
	let merchant_uid = "${productOrderNumber}";  // 고유 주문번호
	let productName = "${productOrderName}";  // 주문상품명
	let buyer_email = "${orderUser.email}";  // 구매자 이메일
	let buyer_name = "${orderUser.userName}";  // 구매자 이름
	let buyer_tel = "${orderUser.tel}";   // 구매자 전화번호(필수)
	let buyer_addr = "${orderUser.addr1}" + " " + "${orderUser.addr2}";  // 구매자 주소
	buyer_addr = buyer_addr.trim();
	let buyer_postcode = "${orderUser.zip}"; // 구매자 우편번호
	
	// 결제 API로 결제 진행
	
	
	
	// 결제가 성공한 경우 ------------------------
	
	// 결제 방식, 카드번호, 승인번호, 결제 날짜
	f.payMethod.value = payMethod;
	f.cardName.value = cardName;
	f.authNumber.value = authNumber;
	f.authDate.value = authDate;
	
	f.action = "${pageContext.request.contextPath}/order/paymentOk"
	f.submit();
}

$(function(){
	$(".requiredOption").change(function(){
		let $opt = $(this);
		let num = $opt.children("option:selected").attr('data-couponNum');
		let idx = $(".requiredOption").index($opt);

		b = false;
		if(num != '0') {
			$('.requiredOption').each(function(){
				let num2 = $(this).children("option:selected").attr('data-couponNum');
				let $opt2 = $(this);
				let idx2 = $(".requiredOption").index( $opt2);
				if(idx != idx2 && num == num2) {
					b = true;
					return false;
				}
			});
		}
		
		if( b ) {
			alert('쿠폰은 한번만 적용 가능합니다.');
			$opt.val("0");
			return false;
		}
		
		
		const f = document.paymentForm;
		let disCount = parseInt($(this).val());
		let buyQtys = parseInt($(this).closest(".text-center").find("input[name=buyQtys]").val());
		let totalMoneys = parseInt(f.totalMoney.value);
		let totalvalue = parseInt(f.payment.value);
		let prices = parseInt($(this).closest(".text-center").find("input[name=prices]").val());
		let salePrices = parseInt($(this).closest(".text-center").find("input[name=salePrices12]").val());
		let discountPrices = parseInt($(this).closest(".text-center").find("input[name=discountPrices]").val());
		var disMoney = parseInt($(this).closest(".text-center").find("input[name=disMoney]").val());
		let couponNUm = $(this).children("option:selected").attr('data-couponNum');
		let deliveryCharge =  parseInt(f.deliveryCharge.value);
		if(discountPrices !=0){
			discountPrices = discountPrices + salePrices / disCount;
		} else{
			discountPrices = salePrices / disCount;
		} 
		if(disCount==0){
			discountPrices = parseInt($(this).closest(".text-center").find("input[name=discountPrices]").val());
			$(this).closest(".text-center").find(".sapri").remove();
			$(this).closest(".text-center").find("input[name=couponNums]").val(0);
		} else{
			$(this).closest(".text-center").find("input[name=couponNums]").val(couponNUm);
		}
		totalMoneys += disMoney;
		salePrices = salePrices - discountPrices;
		let saleproductMoneys = salePrices * buyQtys;
		loprices = prices.toLocaleString();
		
		$(this).closest(".text-center").find(".discountPrice").text(discountPrices.toLocaleString() + "원");
		$(this).closest(".text-center").find(".salePrice").html('<label class="fw-semibold">'+salePrices.toLocaleString() + '원</label>');
		$(this).closest(".text-center").find(".productMoney").text(saleproductMoneys.toLocaleString() + "원");
		if(discountPrices!=0) {
			let out = "";
			out += "<div class = 'sapri'>";
			out += 		"<label class='fw-light text-decoration-line-through'>"+loprices+"원</label>";
			out += "</div>";
			
			$(this).closest(".text-center").find(".price").append(out);
		}
		totalMoneys = totalMoneys - discountPrices * buyQtys;
		totalvalue = totalMoneys + deliveryCharge;
		$(".totalMoney").text(totalMoneys.toLocaleString() + "원");
		$(".payment").text(totalvalue.toLocaleString() + "원");
		disMoney = parseInt($(this).closest(".text-center").find("input[name=disMoney]").val(discountPrices * buyQtys));
		$(this).closest(".text-center").find("input[name=salePrices]").val(salePrices);
		$(this).closest(".text-center").find("input[name=productMoneys]").val(saleproductMoneys);
		f.totalMoney.value = totalMoneys;
		f.payment.value = totalvalue;
	});
});

</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
		<c:if test="${not empty friendname}">
			<h3>${friendname}에게 선물하기</h3>
		</c:if>
			<h3><i class="bi bi-credit-card"></i> 주문 / 결제 </h3>
		</div>
		
		<div class="body-main pt-3">
			<form name="paymentForm" method="post">
				<table class="table">
					<tr class="bg-light text-center">
						<th width="120">&nbsp;</th>
						<th>상품정보</th>
						<th width="80">구매적립</th>
						<th width="60">수량</th>
						<th width="120">할인금액</th>
						<th width="120">쿠폰</th>
						<th width="120">상품금액</th>
						<th width="120">총금액</th>
					</tr>
					
					<c:forEach var="dto" items="${listProduct}" varStatus="status">
						<tr class="text-center" valign="middle">
							<td>
								<img class="border rounded md-img" src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
							</td>
							<td>
								<div class="fw-semibold">${dto.productName}</div>
								<div>
									${dto.optionName} : ${dto.optionValue} / 
									${dto.optionName2} : ${dto.optionValue2}
								</div>
								
								<input type="hidden" name="productNums" value="${dto.productNum}">
								<input type="hidden" name="detailNums" value="${dto.detailNum}">
								<input type="hidden" name="detailNums2" value="${dto.detailNum2}">
								<input type="hidden" name="buyQtys" value="${dto.qty}">
								<input type="hidden" name="productMoneys" value="${dto.productMoney}">
								<input type="hidden" name="prices" value="${dto.price}">
								<input type="hidden" name="discountPrices" value="${dto.discountPrice}">
								<input type="hidden" name="salePrices" value="${dto.salePrice}">
								<input type="hidden" name="salePrices12" value="${dto.salePrice}">
								<input type="hidden" name="savedMoneys" value="${dto.savedMoney}">
								<input type="hidden" name="disMoney" value="${0}">
								<input type="hidden" name="categoryNums" value="${0}">
								<input type="hidden" name="couponNums" value="${0}">
							</td>
							<td>
								<fmt:formatNumber value="${dto.savedMoney}"/>
							</td>
							<td class = "qty">
								${dto.qty}
							</td>
							<td class = "discountPrice">
								<fmt:formatNumber value="${dto.discountPrice}"/>원
							</td>
							<td>
								<div>
									<select class="form-select requiredOption" >
										<option value="0" data-couponNum="0">미적용</option>
										<c:forEach var="vo" items="${dto.categoryNums}" varStatus="status">
											<option value="${dto.couponDiscounts[status.index]}" data-couponNum="${dto.couponNums[status.index]}">${dto.couponNames[status.index]}  ${dto.couponDiscounts[status.index]}% 할인</option>
										</c:forEach>
									</select>
								</div>
							</td>
							<td class = "price">
								<c:if test="${dto.discountPrice} != 0">
									<div>
										<label class="fw-light text-decoration-line-through">
											<fmt:formatNumber value="${dto.price}"/>원
										</label>
									</div>
								</c:if>
								<div class = "salePrice">
									<label class="fw-semibold">
										<fmt:formatNumber value="${dto.salePrice}"/>원
									</label>								
								</div>
							</td>
							<td>
								<label class="fw-semibold productMoney">
									<fmt:formatNumber value="${dto.productMoney}"/>원
								</label>
							</td>
						</tr>
							

					</c:forEach>
				</table>
				
				<input type="hidden" name="orderNum" value="${productOrderNumber}">
				<input type="hidden" name="totalMoney" value="${totalMoney}">
				<input type="hidden" name="totmon" value="${totalMoney}">
				<input type="hidden" name="deliveryCharge" value="${deliveryCharge}">
				<input type="hidden" name="payment" value="${payment}">
				<input type="hidden" name="friendname" value="${friendname}"> <!-- 도메인에 넣고 하가 -->
				
				<input type="hidden" name="mode" value="${mode}">

				<input type="hidden" name="payMethod" value="">
				<input type="hidden" name="cardName" value="">
				<input type="hidden" name="authNumber" value="">
				<input type="hidden" name="authDate" value="">
				<div class = "p-3">
					<div class="fs-5 fw-semibold border-bottom pb-1">포인트 사용</div>
					<table>
						<tr>
							<td>보유 포인트</td>
							<td>${point.point}</td>
						</tr>
						
						<tr>
							<td><input type="text" name="usePoint" value="0"></td>
							<td><button type="button" onclick="pointOk()">사용</button></td>
						</tr>
					</table>
				</div>
				<c:if test="${not empty friendname}"></c:if>
				<div class="p-3 bg-light">
					<div class="fs-5 fw-semibold border-bottom pb-1">배송지 정보</div>
					<div class="pt-2">
						<div class="pt-2">서울특별시 마포구 월드컵북로 21 풍성빌딩 2층</div>
						<div class="pt-2">010-1111-1111</div>
						<div class="pt-2 w-50">
							<input type="text" name="recipientName" value="${orderUser.userName}">
							<input type="text" name="destMemo" class="form-control" placeholder="요청사항을 입력합니다.">
						</div>
					</div>
					
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="tel1">전화번호</label>
					<div class="col-sm-10 row">
						<div class="col-sm-3 pe-1">
							<input type="text" name="tel1" id="tel1" class="form-control"
								value="${dto.tel1}" maxlength="3">
						</div>
						<div class="col-sm-1 px-1" style="width: 2%;">
							<p class="form-control-plaintext text-center">-</p>
						</div>
						<div class="col-sm-3 px-1">
							<input type="text" name="tel2" id="tel2" class="form-control"
								value="${dto.tel2}" maxlength="4">
						</div>
						<div class="col-sm-1 px-1" style="width: 2%;">
							<p class="form-control-plaintext text-center">-</p>
						</div>
						<div class="col-sm-3 ps-1">
							<input type="text" name="tel3" id="tel3" class="form-control"
								value="${dto.tel3}" maxlength="4">
						</div>
					</div>
				</div>
				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="zip">우편번호</label>
					<div class="col-sm-5">
						<div class="input-group">
							<input type="text" name="zip" id="zip" class="form-control"
								placeholder="우편번호" value="${orderUser.zip}" readonly>
							<button class="btn btn-light" type="button"
								style="margin-left: 3px;" onclick="daumPostcode();">우편번호
								검색</button>
						</div>
					</div>
				</div>

				<div class="row mb-3">
					<label class="col-sm-2 col-form-label" for="addr1">주소</label>
					<div class="col-sm-10">
						<div>
							<input type="text" name="addr1" id="addr1" class="form-control"
								placeholder="기본 주소" value="${orderUser.addr1}" readonly>
						</div>
						<div style="margin-top: 5px;">
							<input type="text" name="addr2" id="addr2" class="form-control"
								placeholder="상세 주소" value="${orderUser.addr2}">
						</div>
					</div>
				</div>
				
				<div class="pt-3">
					<div class="text-end">
						<label class="fs-6 fw-semibold">총 결제금액 : </label>
						<label class="product-totalAmount fs-4 fw-bold text-primary payment">
							<fmt:formatNumber value="${payment}"/>원
						</label>
					</div>
					<div class="ps-2 pt-2 text-end totalMoneys">
						<label>상품금액 : </label>
						<label class="totalMoney">
							<fmt:formatNumber value="${totalMoney}"/>원
						</label>
					</div>
					<div class="ps-2 pt-1 text-end">
						<label>배송비 : </label>
						<label>
							<fmt:formatNumber value="${deliveryCharge}"/>원
						</label>
					</div>
					<div class="ps-2 pt-1 text-end">
						<label>쿠폰사용액 : </label>
						<label class="usePoint">
							<span></span>
						</label>
					</div>
				</div>
				
				<div class="pt-3">
					<div class="text-end">
						<label class="fs-6">포인트 적립 : </label>
						<label class="fs-5">
							<fmt:formatNumber value="${totalSavedMoney}"/>원
						</label>
					</div>
				</div>
				
				<div class="pt-3 pb-3 text-center">
					<button type="button" class="btn btn-primary btn-lg" style="width: 250px;" onclick="sendOk()">결제하기</button>
					<button type="button" class="btn btn-light btn-lg" style="width: 250px;" onclick="location.href='${pageContext.request.contextPath}/';">결제취소</button>
					<input type="hidden" name="totalSavedMoney"value="${totalSavedMoney}">
				</div>
			</form>
		</div>
	</div>
</div>	
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr1').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2').focus();
        }
    }).open();
}
</script>