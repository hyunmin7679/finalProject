<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
#custom-modal {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 20px;
	background-color: white;
	border: 1px solid #ccc;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#custom-modal-buttons {
	text-align: right;
	margin-top: 10px;
}

#custom-modal-buttons button {
	margin-left: 10px;
}

.asd {
	position: relative;
	margin: 0;
	padding: 0.5em 1em;
	outline: none;
	text-decoration: none;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
	border: none;
	text-transform: uppercase;
	background-color: blue;
	border-radius: 10px;
	color: #fff;
	font-weight: 300;
	font-size: 18px;
	font-family: inherit;
	z-index: 0;
	overflow: hidden;
	transition: all 0.3s cubic-bezier(0.02, 0.01, 0.47, 1);
}

.asd:hover {
	animation: sh0 0.5s ease-in-out both;
}

@
keyframes sh0 { 0% {
	transform: rotate(0deg) translate3d(0, 0, 0);
}

25


%
{
transform


:


rotate
(


7deg


)


translate3d
(


0
,
0
,
0


)
;


}
50


%
{
transform


:


rotate
(


-7deg


)


translate3d
(


0
,
0
,
0


)
;


}
75


%
{
transform


:


rotate
(


1deg


)


translate3d
(


0
,
0
,
0


)
;


}
100


%
{
transform


:


rotate
(


0deg


)


translate3d
(


0
,
0
,
0


)
;


}
}
.asd:hover span {
	animation: storm 0.7s ease-in-out both;
	animation-delay: 0.06s;
}

.asd::before, .asd::after {
	content: '';
	position: absolute;
	right: 0;
	bottom: 0;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background: #fff;
	opacity: 0;
	transition: transform 0.15s cubic-bezier(0.02, 0.01, 0.47, 1), opacity
		0.15s cubic-bezier(0.02, 0.01, 0.47, 1);
	z-index: -1;
	transform: translate(100%, -25%) translate3d(0, 0, 0);
}

.asd:hover::before, .asd:hover::after {
	opacity: 0.15;
	transition: transform 0.2s cubic-bezier(0.02, 0.01, 0.47, 1), opacity
		0.2s cubic-bezier(0.02, 0.01, 0.47, 1);
}

.asd:hover::before {
	transform: translate3d(50%, 0, 0) scale(0.9);
}

.asd:hover::after {
	transform: translate(50%, 0) scale(1.1);
}


.body-container {
	max-width: 1000px;
}

.lg-img img { min-height: 420px; max-height: 420px;}
.md-img img { width: 150px; height: 150px; cursor: pointer; object-fit: cover; }
.sm-img img { width: 40px; height: 40px; cursor: pointer; object-fit: cover; }

.qty-plus, .qty-minus, .qty-remove { cursor: pointer; }
.qty-plus:hover, .qty-minus:hover, .qty-remove:hover { color: #0b83e6; }

.nav-tabs .nav-link {
	min-width: 170px;
	background: #f3f5f7;
	border-radius: 0;
	border-right: 1px solid #dbdddf;
	color: #333;
	font-weight: 600;
}
.nav-tabs .nav-link.active {
	background: #3d3d4f;
	color: #fff;
}
.tab-pane { min-height: 300px; }

.score-star { font-size: 0; letter-spacing: -4px; }
.score-star .item {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #ccc; text-decoration: none; vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }
.score-star .on { color: #f54a4c; }

.graph { font-size: 0;  letter-spacing: 0; word-spacing: 0; }
.graph-title { padding-right: 3px; }
.graph .one-space { font-size:13px; background:#eee;}
.graph .one-space:after { content: ''; display: inline-block; width:17px; }
.graph .one-space.on{ background:  #f54a4c; }
.graph .one-space:first-child{ border-top-left-radius:5px;  border-bottom-left-radius:5px; }
.graph .one-space:last-child{ border-top-right-radius:5px; border-bottom-right-radius:5px; }
.graph-rate { padding-left: 5px; display: inline-block; width: 60px; text-align: left; }

.deleteReview, .notifyReview { cursor: pointer; padding-left: 5px; }
.deleteReview:hover, .notifyReview:hover { font-weight: 500; color: #2478FF; }

.qna-form textarea { width: 100%; height: 75px; resize: none; }
.qna-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.qna-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}

.deleteQuestion, .notifyQuestion { cursor: pointer; padding-left: 5px; }
.deleteQuestion:hover, .notifyQuestion:hover { font-weight: 500; color: #2478FF; }
</style>

<script type="text/javascript">
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}
</script>

<script type="text/javascript">
$(function(){
	// 필수 옵션-1
	$(".requiredOption").change(function(){
		$(".requiredOption2 option").each(function(){
			if($(this).is(":first-child")) {
				return true; // continue
			}
			
        	$(this).remove();
        });
		
		let detailNum = $(this).val();
		if(! detailNum) {
			return false;
		}
		
		let optionNum = $(".requiredOption").attr("data-optionNum");
		let optionNum2 = $(".requiredOption2").attr("data-optionNum2");
		
		let url = "${pageContext.request.contextPath}/product/listOptionDetail2";
		$.get(url, {optionNum:optionNum, optionNum2:optionNum2, detailNum:detailNum}, function(data){
			$(data).each(function(index, item){
				let detailNum = item.detailNum;
				let optionValue2 = item.optionValue2;
				let totalStock = item.totalStock;
				
				if(totalStock > 0){
					$(".requiredOption2").append("<option value='"+detailNum+"'>"+optionValue2+"</option>");
				}
				else {
					$(".requiredOption2").append("<option value='"+detailNum+"' disabled='disabled'>"+optionValue2+" -품절-</option>");
				}
			});
		});
	});
	
	// 필수 옵션-2
	$(".requiredOption2").change(function(){
		if(! $(this).val()) {
			return false;
		}
		let productNum = "${dto.productNum}";
		if(! productNum) {
			return false;
		}
		
		let detailNum = $(".requiredOption").val();
		let detailNum2 = $(this).val();
		
		let b = true;
		$(".order-area input[name=detailNums2]").each(function(){
			let dnum = $(this).closest(".input-group").find("input[name=detailNums]").val();
			let dnum2 = $(this).val();
			if(detailNum === dnum && detailNum2 === dnum2) {
				alert("선택된 옵션입니다.");
				$(".requiredOption").val("");
				$(".requiredOption").trigger("change");
				b = false;
				return false;
			}
		});
		if(! b) {
			return false;
		}
		
		let optionValue = $(".requiredOption :selected").text();
		let optionValue2 = $(".requiredOption2 :selected").text();
		
		let salePrice = ${dto.salePrice};
		let totalPrice = salePrice.toLocaleString();
		
		let qty = ${dto2.qty};
		
		let s = optionValue + " / " + optionValue2;
		let out = "";
		out += "<div class='order-qty'>";
		out += "  <div class='mt-2 pb-1'>";
		out += "    <label>"+s+"</label>";
		out += "  </div>";
		out += "  <div class='row border-bottom mt-1 pb-2'>";
		out += "    <div class='col'>";
		out += "      <div class='input-group'>";
		out += "        <input type='text' name='buyQtys' class='form-control' value='1' style='flex:none; width: 60px; text-align: center;' readonly>";
		out += "        <input type='hidden' name='productNums' value='"+productNum+"'>";
		out += "        <input type='hidden' name='detailNums' value='"+detailNum+"'>";
		out += "        <input type='hidden' name='detailNums2' value='"+detailNum2+"'>";
		out += "      </div>";
		out += "    </div>";
		out += "    <div class='col text-end product-salePrice' data-salePrice='"+salePrice+"';>";
		out += "      <label class='pt-2 fs-6 fw-semibold item-totalPrice'>"+totalPrice+"원</label>";
		out += "      <label class='pt-2 ps-1'><i class='bi bi-x qty-remove'></i></label>";
		out += "    </div>";
		out += "  </div>";
		out += "</div>";
		
		$(".order-area").append(out);
		
		totalProductPrice();
	});

	// 수량 더하기
	$(".order-area").on("click", ".qty-plus", function() {
		let $order = $(this).closest(".order-qty");
		let qty = parseInt($order.find("input[name=buyQtys]").val()) + 1;
		$order.find("input[name=buyQtys]").val(qty);
		let salePrice = $order.find(".product-salePrice").attr("data-salePrice");
		let item = qty * salePrice;
		let totalPrice = item.toLocaleString();
		$order.find(".item-totalPrice").text(totalPrice+"원");
		
		totalProductPrice();
	});

	// 수량 빼기
	$(".order-area").on("click", ".qty-minus", function() {
		let $order = $(this).closest(".order-qty");
		let qty = parseInt($order.find("input[name=buyQtys]").val()) - 1;
		if(qty <= 0) {
			alert("구매 수량은 한개 이상입니다.");
			$(".requiredOption").val("");
			$(".requiredOption").trigger("change");
			$order.remove();
			
			totalProductPrice()
			
			return false;
		}
		
		$order.find("input[name=buyQtys]").val(qty);
		let salePrice = $order.find(".product-salePrice").attr("data-salePrice");
		let item = qty * salePrice;
		let totalPrice = item.toLocaleString();
		$order.find(".item-totalPrice").text(totalPrice+"원");
		
		totalProductPrice();
	});
	
	// 수량 제거
	$(".order-area").on("click", ".qty-remove", function() {
		let $order = $(this).closest(".order-qty");
		
		$(".requiredOption").val("");
		$(".requiredOption").trigger("change");
		$order.remove();
		
		totalProductPrice();
	});
	
	function totalProductPrice() {
		let totalQty = 0;
		let totalPrice = 0;
		$(".order-qty").each(function(){
			let qty = parseInt($(this).find("input[name=buyQtys]").val());
			let salePrice = parseInt($(this).find(".product-salePrice").attr("data-salePrice"));
			
			totalQty += qty;
			totalPrice += (salePrice * qty);
		});
		
		let s = totalPrice.toLocaleString();
		
		$(".product-totalQty").text(totalQty);
		$(".product-totalAmount").text(s);
	}
});

$(function(){
	$(".sm-img img").click(function(){
		let url = $(this).attr("src");
		$(".lg-img img").attr("src", url);
	});
});

function sendOk(mode) {
	let totalQty = 0;
	$(".order-qty").each(function(){
		let qty = parseInt($(this).find("input[name=buyQtys]").val());
		
		totalQty += qty;
	});
	
	if(totalQty <= 0) {
		alert("구매 상품의 수량을 선택하세요 !!! ");
		return;
	}

	const f = document.buyForm;
	if(mode === "buy") {
		f.method = "get";
		f.action = "${pageContext.request.contextPath}/friend/acceptpresentOk";
	}
	
	f.submit();
}

document.getElementById('wishButton').addEventListener('click', function() {
    // data-productNum 속성에서 pnum 값을 가져오기
    let pnum = this.getAttribute('data-productNum');
	console.log(pnum);
    $('.wishbodydelete #productNum').val(pnum);
    $('#deletewish-modal').modal('show');
	
});

</script>

<div class="container">
	<div class="body-container">	
		<div class="body-main">
			<div class="row mt-4">
				<c:if test="${not empty friendname}">
					<div>
						<span>${friendname}에게 선물하기</span>
						
					</div>
				</c:if>
				<div class="col-md-6 border border-end-0 pt-2">
					
					<div class="row gx-1 border rounded">
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
				
				<div class="col-md-6 border">
					<form name="buyForm">
						<div class="row pt-2">
							<div class="col fs-4 fw-semibold">
								${dto.productName}
							</div>
						</div>
						
						<div class="row pt-1 pb-1 border-bottom">
							<div class="col">
								<label class="align-middle">리뷰수 <span class="fs-5 fw-semibold product-reviewCount">${dto.reviewCount}</span></label>
								<label class="align-middle pt-0 ps-2 score-star product-star">
									<c:forEach var="n" begin="1" end="5">
										<c:set var="score" value="${dto.score + ((dto.score%1>=0.5) ? (1-dto.score%1)%1 : -(dto.score%1))}"/>
										<span class="fs-6 item ${score>=n?'on':''}"><i class="bi bi-star-fill"></i></span>
									</c:forEach>
								</label>
								<label class="align-middle "><span class="product-score ps-1">(${dto.score} / 5)</span></label>
							</div>
						</div>
						
						<div class="row mt-2">
							<c:if test="${dto.discountRate != 0}">
								<div class="col-auto fs-5 pe-2 text-danger">${dto.discountRate}%</div>
							</c:if>
							<div class="col text-end">
								<label class="fs-5 pe-2 fw-semibold">
									<fmt:formatNumber value="${dto.salePrice}"/>원
								</label>
								<c:if test="${dto.discountRate != 0}">
									<label class="fs-6 fw-light text-decoration-line-through">
										<fmt:formatNumber value="${dto.price}"/>원
									</label>
								</c:if>
							</div>
						</div>
						
						<div class="mt-2">
							* 필수 옵션
						</div>
						<div class="mt-2">
							<select class="form-select requiredOption" name="detailNum"
								data-optionNum="${listOption[0].optionNum}">
								<option value="">${listOption[0].optionName}</option>
								<c:forEach var="vo" items="${listOptionDetail}">
									<option value="${vo.detailNum}">${vo.optionValue}</option>
								</c:forEach>
							</select>
						</div>
	
						<div class="mt-2 border-bottom pb-2">
							<select class="form-select requiredOption2" name="detailNum2" data-optionNum2="${listOption[1].optionNum}">
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
							<input type="hidden" name="orderNum" value="${dto2.orderNum}">
							<button type="button" class="btn btn-primary w-100 btn-buySend" onclick="sendOk('buy');">받기</button>
						</div>
			
			<div class="tab-content pt-2" id="myTabContent">
			<div class="p-3 bg-light">
					<div class="fs-5 fw-semibold border-bottom pb-1">배송지 정보</div>
					<div class="pt-2">
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
								value="${0}" maxlength="3">
						</div>
						<div class="col-sm-1 px-1" style="width: 2%;">
							<p class="form-control-plaintext text-center">-</p>
						</div>
						<div class="col-sm-3 px-1">
							<input type="text" name="tel2" id="tel2" class="form-control"
								value="${0}" maxlength="4">
						</div>
						<div class="col-sm-1 px-1" style="width: 2%;">
							<p class="form-control-plaintext text-center">-</p>
						</div>
						<div class="col-sm-3 ps-1">
							<input type="text" name="tel3" id="tel3" class="form-control"
								value="${0}" maxlength="4">
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

				
			</div>
					</form>
				</div>
			</div>
			

		</div>
	</div>
</div>



<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

// 리뷰 -----


function printSummary(summary) {
	let count = summary.count;
	let ave = summary.ave;
	
	let score1 = summary.score1;
	let score2 = summary.score2;
	let score3 = summary.score3;
	let score4 = summary.score4;
	let score5 = summary.score5;
	let scoreRate1 = summary.scoreRate1;
	let scoreRate2 = summary.scoreRate2;
	let scoreRate3 = summary.scoreRate3;
	let scoreRate4 = summary.scoreRate4;
	let scoreRate5 = summary.scoreRate5;
	
	$(".product-reviewCount").text(count);
	$(".product-score").text("("+ave+" / 5)");
	$(".product-star .item").removeClass("on");
	let roundAve = Math.round(ave);
	for(let i=1; i<=roundAve; i++) {
		$(".product-star .item").eq(i-1).addClass("on");
	}
	
	$(".title-reviewCount").text("("+count+")");
	
	$(".review-score-star .item").removeClass("on");
	for(let i=1; i<=roundAve; i++) {
		$(".review-score-star .item").eq(i-1).addClass("on");
	}
	$(".review-score").text(ave+" / 5");
	$(".review-reviewCount").text(count);
	
	$(".review-rate .one-space").removeClass("on");

	for(let i=1; i<=Math.floor(scoreRate5/10); i++) {
		$(".review-rate .score-5 .one-space").eq(i-1).addClass("on");
	}
	$(".review-rate .score-5 .graph-rate").text(scoreRate5+"%");
	
	for(let i=1; i<=Math.floor(scoreRate4/10); i++) {
		$(".review-rate .score-4 .one-space").eq(i-1).addClass("on");
	}
	$(".review-rate .score-4 .graph-rate").text(scoreRate4+"%");

	for(let i=1; i<=Math.floor(scoreRate3/10); i++) {
		$(".review-rate .score-3 .one-space").eq(i-1).addClass("on");
	}
	$(".review-rate .score-3 .graph-rate").text(scoreRate3+"%");

	for(let i=1; i<=Math.floor(scoreRate2/10); i++) {
		$(".review-rate .score-2 .one-space").eq(i-1).addClass("on");
	}
	$(".review-rate .score-2 .graph-rate").text(scoreRate2+"%");

	for(let i=1; i<=Math.floor(scoreRate1/10); i++) {
		$(".review-rate .score-1 .one-space").eq(i-1).addClass("on");
	}
	$(".review-rate .score-1 .graph-rate").text(scoreRate1+"%");
}

$(function(){
	$('body').on('click', '.notifyReview', function(){
		let num = $(this).attr('data-num');
		alert(num);
	});
});

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
