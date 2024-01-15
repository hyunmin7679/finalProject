`<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 850px;
}

.nav-tabs .nav-link {
	min-width: 170px;
	background: #f3f5f7;
	border-radius: 0;
	border-right: 1px solid #dbdddf;
	color: #333;
	font-weight: 600;
}

.nav-tabs .nav-link.active {
	background: #003166;
	color: #fff;
	border-radius: 0 60px 60px 0;
}

.tab-pane { min-height: 300px; }

.md-img { width: 100px; height: 100px; object-fit: cover; }

.payment-dropdown, .payment-delete { cursor: pointer; }
.payment-dropdown:hover, .payment-delete:hover { color: #0d6efd; }

.payment-menu {
	display: none; position: absolute; width: 100px; min-height: 65px; background:#fff; border: 1px solid #d5d5d5; border-radius: 3px; z-index: 9999;
}
.payment-menu-item { text-align: center; cursor: pointer; padding: 7px; }
.payment-menu-item:nth-child(1) { border-bottom: 1px solid #d5d5d5; }
.payment-menu-item:hover { color: #0d6efd; font-weight: 500; }

.review-form textarea { width: 100%; height: 75px; resize: none; }
.review-form .star { font-size: 0; letter-spacing: -4px; }
.review-form .star a {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	 color: #ccc; text-decoration: none;
}
.review-form .star a:first-child { margin-left: 0; }
.star a.on { color: #FFBB00;}

.review-form .img-grid {
	display: grid;
	grid-template-columns:repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.review-form .img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}

.img-grid .item {
    object-fit: cover;
    width: 50px;
    height: 50px;
    cursor: pointer;
    border: 1px solid #c2c2c2;
    border-radius: 10px;
}

.img-box img {
    width: 50px;
    height: 50px;
    margin-right: 5px;
    flex: 0 0 auto;
    cursor: pointer;
    border: 1px solid #c2c2c2;
    border-radius: 10px;
}

.delivery-dox {font-size: 18px; padding: 20px; text-align: center;}


/* ------------------------------------------------------------------------------ */

@import url('http://fonts.googleapis.com/earlyaccess/notosanskr.css');

ul, li, p { list-style:none; padding:0; margin:0; }
.body-container {max-width: 800px; }
.fa-regular {text-align: center;}

i { width: 25px;}
a { color:#003166; font-size: 15px;}
a:hover {color: black; text-decoration: none;}
.category-bar { margin-top: 40px; margin-bottom:20px; display: flex;
				align-items: center; border:1px solid #D8D8D8; border-radius: 30px; 
				background: #ffc303; position: relative;}
				
.bar-item{ width:150px; height:auto; text-align:center;}
.title {display: flex; justify-content: center; }
h3{font-weight: 900;}

.icombox {padding: 30px;}
.icon { width: 100px; height:auto;}

.itembox {display: flex; justify-content: center; width: 65%;} 
.point-item{height:auto; text-align:center; margin: 10px; display: flex; align-items: center;}

.category-bar .mem_info { float: left; width: 50%; height: 100%;
  							  background:#ffffff; border-radius: 0 141px 141px 0;}

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

// 주문상세, 주문취소, 반품, 교환 메뉴
$(function(){
	$("body").on("click", ".payment-dropdown", function(){
		const $menu = $(this).next(".payment-menu");
		if($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$(".payment-menu").hide();
			$menu.fadeIn(100);

			let pos = $(this).offset();
			$menu.offset( {left:pos.left-70, top:pos.top+30} );
		}
	});
	$("body").on("click", function(evt) {
		if($(evt.target.parentNode).hasClass("payment-dropdown")) {
			return false;
		}
		$(".payment-menu").hide();
	});
});

$(function(){
	$(".payment-delete").click(function(){
		// 주문 내역 삭제 - 주문자화면에 보이지 않게 설정(userDelete 컬럼을 1로 설정)
		if(! confirm("주문내역을 삭제하시겠습니까 ?")) {
			return false;
		}		
		
		let orderDetailNum = $(this).attr("data-orderDetailNum");

		let qs = "orderDetailNum=" + orderDetailNum + "&page=${page}";
		location.href = "${pageContext.request.contextPath}/myPage/updateOrderHistory?" + qs;
	});
});

$(function(){
	$(".payment-confirmation").click(function(){
		// 구매 확정
		if(! confirm("구매확정을 진행하시겠습니까 ?")) {
			return false;
		}
		
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		let url = "${pageContext.request.contextPath}/myPage/confirmation?orderDetailNum="+orderDetailNum+"&page=${page}";
		location.href = url;
	});
});


$(function(){
	$(".order-details-view").click(function(){
		// 주문 상세 정보
		let orderDetailNum = $(this).attr("data-orderDetailNum");

		let url = '${pageContext.request.contextPath}/myPage/orderDetail?orderDetailNum='+orderDetailNum;
		$("#orderDetailModal").modal("show");
		
		$("#orderDetailModal .modal-body2").load(url);
	});
	
});

// *******************************************************************************************************

// 상품문의 모달 띄우기
$(function(){ 
	$('.product-qna').click(function(){
		let productNum = $(this).attr("data-productNum");
		
		let url = "${pageContext.request.contextPath}/myPage/qna2?productNum="+productNum;
		
		$("#questionDialogModal").modal("show");
		$("#questionDialogModal .qna-submit").load(url);
		
	});
});

$(function(){
	var sel_files = [];
	
	$(".qna-submit").on("click", ".qna-form .img-add", function(){
		$(this).closest(".qna-form").find("input[name=selectFile]").trigger("click");
	});
	
	$("form[name=questionForm] input[name=selectFile]").change(function(e){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			
			this.files = dt.files;
			
			return false;
		}
		
		let $form = $(this).closest("form");
		
		// 유사 배열을  배열로 변환
		const fileArr = Array.from(this.files);
		
		fileArr.forEach((file, index) => {
			sel_files.push(file);
			
			const reader = new FileReader();
			const $img = $("<img>", {"class":"item img-item"});
			$img.attr("data-filename", file.name);
			reader.onload = e => {
				$img.attr("src", e.target.result);		
			};
			reader.readAsDataURL(file);
			$form.find(".img-grid").append($img);
		});
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		this.files = dt.files;
	});
	
	$(".qna-submit").on("click", ".qna-form .img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		const f = this.closest("form");
		f.selectFile.files = dt.files;
		
		$(this).remove();
	});

	$('.btnQuestionSendOk').click(function(){
		const f = document.questionForm;
		
		let s;
		
		s = f.question.value.trim();
		if( ! s ) {
			alert("문의 사항을 입력하세요.")	;
			f.question.focus();
			return false;
		}
		
		if(f.selectFile.files.length > 5) {
			alert("이미지는 최대 5개까지 가능합니다..")	;
			return false;
		}
		
		
		let url = "${pageContext.request.contextPath}/proqna/write";
		// FormData : form 필드와 그 값을 나타내는 일련의 key/value 쌍을 쉽게 생성하는 방법을 제공 
		// FormData는 Content-Type을 명시하지 않으면 multipart/form-data로 전송
		let query = new FormData(f); 
		
		const fn = function(data) {
			$("#questionDialogModal").hide();
				location.reload();
		};
		
		ajaxFun(url, "post", query, "json", fn, true);		
	});
	
});

// *******************************************************************************************************

$(function(){
	$(".order-cancel").click(function(){
		// 구매(주문) 취소
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		let payment = $(this).attr("data-payment");
		let orderNum = $(this).attr("data-orderNum");

		const f = document.userOrderDetailForm;
		f.orderDetailNum.value = orderDetailNum;
		f.payment.value = payment;
		f.orderNum.value = orderNum;

		$("#orderDetailUpdateDialogModalLabel").html("주문취소");
		$("#orderDetailUpdateDialogModal").modal("show");
		
	});
});


$(function(){
	$('.btnUserOrderDetailUpdateOk').click(function(){
		// 주문취소/교환요청/반품요청
		const f = document.userOrderDetailForm;

	/*	if(f.changeSort.value.trim() == 0) {
			alert('취소구분을 선택해주세요.');
			f.changeSort.focus();
			return false;
		}  */
		
		f.action = '${pageContext.request.contextPath}/myPage/orderDetailUpdate';
		f.submit();
	});
});
</script>


<div class="container">

	<div class="category-bar">
		<div class="mem_info">
			<div style="display: flex; justify-content :center;">
			<a href="${pageContext.request.contextPath}/"><img class="icon" src="${pageContext.request.contextPath}/resources/images/아이콘1.gif"></a>
			<div style="align-items: center; display: flex;">
				<p>${sessionScope.member.userName} 님&nbsp;|</p>
				<p>&nbsp;${userPoint} P</p>
			</div>
			</div> 
		</div>
		
		<div class="itembox">
		<div class="bar-item p-3">
			<a href="#"><i class="fa-solid fa-heart"></i><br>위시리스트</a>
		</div>
		<div class="point-item">
			<i class="fa-solid fa-angle-right"></i>
		</div>
		<div class="bar-item p-3">
			<a href="${pageContext.request.contextPath}/friend/list" ><i class="fa-solid fa-user-group"></i><br>친구목록</a>
		</div>
		<div class="point-item">
			<i class="fa-solid fa-angle-right"></i>
		</div>
		<div class="bar-item p-3">
			<a href="${pageContext.request.contextPath}/iconStore/list"><i class="fa-brands fa-shopify"></i><br>아이콘 상점</a>
		</div>
		</div>
    </div>

	
	
	<!-- 탭버튼 -->
		<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="true">주문 내역</button>
			</li>

			<li class="nav-item" role="presentation">
				<button class="nav-link" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="3" aria-selected="false">취소/반품 내역</button>
			</li>
		</ul>
		
	       <!-- 주문내역 -->
		<div class="tab-content pt-2" id="myTabContent">
			<div class="tab-pane fade show active" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
				<div class="mt-3 pt-3 border-bottom">
					<p class="fs-4 fw-semibold">주문 내역</p> 
				</div>
				<div class="mt-3">
					 <c:forEach var="dto" items="${list }">
						<div class="mt-3 p-2 border-bottom payment-list">
							<div class="row pb-2">
								<div class="col-6">
									<div class="fs-6 fw-semibold text-black-50"><label>${detailState[dto.detailState]}</label><label></label></div>
								</div>
								
								<div class="col-6 text-end payment">
									<label class='payment-delete' title="주문내역삭제" data-orderDetailNum="${dto.orderDetailNum}"><i class="fa-solid fa-rectangle-xmark"></i></label>
								</div>
							</div>
								<div class="row">
									<div class="pt-1 pb-2">
										<label class="text-black-50">${dto.orderDate} 결제</label>
									</div>
								<div class="col-auto">
									<!-- 상품이미지 -->
									<img class="border rounded md-img" src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
								</div>
								<div class="col">
									<div class="fw-semibold pt-2">${dto.productName}</div>
									<div class="pt-1">
										<label>주문수량 : ${dto.qty}개 &nbsp; |</label>
										<label class="fw-semibold ps-3"><fmt:formatNumber value="${dto.productMoney}"/>원</label>
									</div>
									<div class="pt-1">
										옵션 : ${dto.optionValue} / ${dto.optionValue2}
									</div>
								</div>
							</div>
							
							<!-- 주문내역 버튼들 -->
							<div class="mt-3 p-3 text-end">
								<c:if test="${dto.reviewWrite==0 && (dto.detailState==1 || dto.detailState==2)}">
									<button type="button" class="btn border btnReviewWriteForm" style="width: 130px;"> 리뷰쓰기 </button>
								</c:if>						
								<button type="button" class="btn btn-warning deliveryTracking" style="width: 130px;" data-orderDetailNum="${dto.orderDetailNum}"> 배송조회 </button>
														
								<c:if test="${dto.detailState==0}">
									<button type="button" class="btn border payment-confirmation" style="width: 130px;" data-orderDetailNum="${dto.orderDetailNum}"> 구매확정 </button>
								</c:if>
								<button type="button" class="btn btn-warning" style="width: 130px;" onclick="location.href='${pageContext.request.contextPath}/product/buy/${dto.productNum}';"> 재구매  </button>
								
								<button type="button" class="btn btn-warning payment-dropdown" title="주문상세"><i class="bi bi-three-dots"></i></button>
								<div class="payment-menu">
									<div class="payment-menu-item order-details-view" data-orderDetailNum="${dto.orderDetailNum}"> 주문상세
									</div>
									<c:if test="${dto.detailState==0 && dto.orderState==1}">
										<div class="payment-menu-item order-cancel" data-orderDetailNum="${dto.orderDetailNum}" data-payment="${dto.productMoney}" data-orderNum="${dto.orderNum}"> 주문취소 </div>
									</c:if>
									<div class="payment-menu-item product-qna" data-productNum="${dto.productNum}"> 1:1 문의 </div>
								</div>								
							</div>
							
							<!-- 리뷰쓰기 -->
							<c:if test="${dto.reviewWrite == 0}">
								<div class="review-form border border-secondary p-3 mt-2" style="display: none;">
									<form name="reviewForm">
										<div class="p-1">
											<p class="star">
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<a href="#" class="on"><i class="bi bi-star-fill"></i></a>
												<input type="hidden" name="score" value="5">
												<input type="hidden" name="productNum" value="${dto.productNum}">
											</p>
										</div>
										<div class="p-1">
											<textarea name="review" class="form-control"></textarea>
										</div>
										<div class="p-1">
											<div class="img-grid">
												<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
											</div>
											<input type="file" name="selectFile" accept="image/*" multiple class="form-control" style="display: none;">
										</div>
										<div class="p-1 text-end">
											<input type="hidden" name="num" value="${dto.orderDetailNum}">
											<button type="button" class="btn btn-dark btnReviewSend ps-5 pe-5">등록하기</button>
										</div>
									</form>
								</div>
							</c:if>
							
						</div>
					 </c:forEach> 
					
					<div class="page-navigation">
						${dataCount == 0 ? "주문 내역이 없습니다." : paging }
					</div>

				</div>				
			</div>
			
		  <!--주문취소/반품내역 -->
			<div class="tab-pane fade" id="tab-pane-2" role="tabpanel" aria-labelledby="tab-2" tabindex="0">
				<div class="mt-3 pt-3 border-bottom">
					<p class="fs-4 fw-semibold">취소/반품 내역</p> 
				</div>
				<c:forEach var="dto" items="${cancelList }">
				<div class="mt-3 p-2 border-bottom payment-list">
					<div class="col-6">
						<div class="fs-6 fw-semibold text-black-50"><label>${empty dto.com_date ? "처리중" : "처리완료"}</label><label></label></div>
					</div>
							<div class="row pb-2">
								<div class="col-6">
									<div class="fs-6 fw-semibold text-black-50"><label>${dto.stateProduct}</label><label></label></div>
								</div>
								<div class="col-6 text-end">
									<label class='payment-delete' title="주문내역삭제" data-orderDetailNum="${dto.orderDetailNum}"><i class="fa-solid fa-rectangle-xmark"></i></label>
									<input type="hidden" data-orderNum="${dto.orderNum}" value="${dto.orderNum}">
								</div>
							</div>
								<div class="row">
									<div class="pt-1 pb-2">
										<label class="text-black-50">${dto.reg_date} 반품/취소</label>
									</div>
								<div class="col-auto">
									<!-- 상품이미지 -->
									<img class="border rounded md-img" src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
								</div>
								<div class="col">
									<div class="fw-semibold pt-2">${dto.productName}</div>
									<div class="pt-1">
										<label>주문수량 : ${dto.qty}개 &nbsp; |</label>
										<label class="fw-semibold ps-3"><fmt:formatNumber value="${dto.productMoney}"/>원</label>
									</div>
									<div class="pt-1">
										옵션 : ${dto.optionValue} / ${dto.optionValue2}
									</div>
									<div class="pt-1">
										<label>총 취소금액 : <fmt:formatNumber value="${dto.cancelCost}"/>원</label>
									</div>
									<div class="mt-3 mb-0 text-end">
										<label class="text-black-50 mt-0">${empty dto.com_date ? "처리중" : dto.com_date}&nbsp; | ${changeSate[dto.changeSort]} </label>
									</div>
									<div class="text-end">
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					
					<div class="page-navigation">
						${cancelCount == 0 ? "주문취소 내역이 없습니다." : paging2 }
					</div>
			</div>
		</div>
	</div>
	
<!-- 주문상세 모달 -->	
<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel"
				aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		
			<div class="modal-header">
				<h5 class="modal-title" id="orderDetailModalLabel">주문상세</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
			<div class="modal-body2"></div>
		</div>
	</div>
</div>

<!-- 배송조회  -->
<c:forEach var="dto" items="${list }">
<div class="modal fade" id="deliveryTrackingModal" tabindex="-1" aria-labelledby="deliveryTrackingModalLabel"
				aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="deliveryTrackingModalLabel">배송조회</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<c:if test="${empty dto.deliveryName }"> <p class="delivery-dox">배송정보가 없습니다.</p> </c:if>
			<c:if test="${not empty dto.deliveryName} ">
			<div class="modal-body">
                <div class="row search-form">
					<div class="col-4 pe-1">
						<h3>${dto.deliveryName} | </h3>
					</div>
					<div class="col-auto ps-0 pe-2">
						<p>${orderState[dto.orderState]}</p>
					</div>
					<div class="col ps-0 pe-1">
						<span>${dto.invoiceNumber}</span>
					</div>
                </div>
			</div>
			</c:if>
		</div>
	</div>
</div>
</c:forEach>


<!-- 구매취소/교환요청/반품요청 처리 -->
<div class="modal fade" id="orderDetailUpdateDialogModal" tabindex="-1" aria-labelledby="orderDetailUpdateDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDetailUpdateDialogModalLabel">주문취소</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="p-1">
					<form name="userOrderDetailForm" method="post" class="row justify-content-center">
						<div>
						<div class="col-8 p-1">
							<select name="changeSort" class="form-select">
								<option > ::취소구분을 선택해주세요:: </option>
								<option value="0" >물건하자로 인한 교환</option>
								<option value="1" >옵션변경을 위한 교환 </option>
								<option value="2" >단순변심에 의한 반품</option>
								<option value="3" >귀책사유에 의한 반품 </option>
								<option value="4" >단순변심으로 인한 환불 </option>
								<option value="5" >귀책사유에 의한 환불</option>
								<option value="6" >단순 변심에 의한 주문취소</option>
								<option value="7" >옵션 선택 실수로 주문 취소</option>
							</select>
						</div>
							<div class="col p-1">
								<input type="text" name="stateMemo" class="form-control" placeholder="사유를 입력 하세요">
							</div>
						</div>	
						
						<div class="col-auto p-1">
							<input type="hidden" name="page" value="${page}">
							<input type="hidden" name="orderDetailNum">
							<input type="hidden" name="orderNum">
							<input type="hidden" name="payment">
							<input type="hidden" name="changeSort">
							<input type="hidden" name="stateMemo">
							<button type="button" class="btn btn-light btnUserOrderDetailUpdateOk"> 요청하기 </button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 1:1문의 요청 모달 -->
<div class="modal fade" id="questionDialogModal" tabindex="-1" 
		data-bs-backdrop="static" data-bs-keyboard="false"
		aria-labelledby="questionDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="questionDialogModalLabel">상품 문의 하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body qna-submit">
			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btnQuestionSendOk">문의등록 <i class="bi bi-check2"></i> </button>
				<button type="button" class="btn btn-secondary btnQuestionSendCancel" data-bs-dismiss="modal">취소</button>
			</div>			
		</div>
	</div>
</div>

<script type="text/javascript">

// 배송조회 모달 
$(".deliveryTracking").click(function(){

	$("#deliveryTrackingModal").modal("show");
});


// 리뷰 쓰기 버튼
$(function(){
	$(".btnReviewWriteForm").click(function(){
		const $review = $(this).closest(".payment-list").find(".review-form");
		if($review.is(':visible')) {
			$review.fadeOut(100);
		} else {
			$review.fadeIn(100);
		}
	});
});

// 별
$(function(){
	$(".review-form .star a").click(function(e){
		let b = $(this).hasClass("on");
		$(this).parent().children("a").removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
		
		if( b ) {
			$(this).removeClass("on");
		}
		
		let s = $(this).closest(".review-form").find(".star .on").length;
		$(this).closest(".review-form").find("input[name=score").val(s);
		
		// e.preventDefault(); // 화면 위로 이동 안되게
		return false;
	});
});

// 이미지
$(function(){
	var sel_files = [];
	
	$("body").on("click", ".review-form .img-add", function(){
		$(this).closest(".review-form").find("input[name=selectFile]").trigger("click");
	});
	
	$("form[name=reviewForm] input[name=selectFile]").change(function(e){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			
			this.files = dt.files;
			
			return false;
		}
		
		let $form = $(this).closest("form");
		
		// 유사 배열을  배열로 변환
		const fileArr = Array.from(this.files);
		
		fileArr.forEach((file, index) => {
			sel_files.push(file);
			
			const reader = new FileReader();
			const $img = $("<img>", {"class":"item img-item"});
			$img.attr("data-filename", file.name);
			reader.onload = e => {
				$img.attr("src", e.target.result);		
			};
			reader.readAsDataURL(file);
			$form.find(".img-grid").append($img);
		});
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		this.files = dt.files;
	});
	
	$("body").on("click", ".review-form .img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		
		const f = this.closest("form");
		f.selectFile.files = dt.files;
		
		$(this).remove();
	});
});

$(function(){
	// 리뷰 등록 완료
	$(".btnReviewSend").click(function(){
		let $plist = $(this).closest(".payment-list");
		
		const f = this.closest("form");
		let s;
		
		if(f.score.value === "0") {
			alert("평점은 1점부터 가능합니다.")	;
			return false;
		}
		
		s = f.review.value.trim();
		if( ! s ) {
			alert("리뷰를 입력하세요.")	;
			f.review.focus();
			return false;
		}
		
		if(f.selectFile.files.length > 5) {
			alert("이미지는 최대 5개까지 가능합니다..")	;
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/review/write";
		// FormData : form 필드와 그 값을 나타내는 일련의 key/value 쌍을 쉽게 생성하는 방법을 제공 
		// FormData는 Content-Type을 명시하지 않으면 multipart/form-data로 전송
		let query = new FormData(f); 
		
		const fn = function(data) {
			if(data.state === "true") {
				$plist.find(".btnReviewWriteForm").remove();
				$plist.find(".review-form").remove();
			}
		};
		
		ajaxFun(url, "post", query, "json", fn, true);
	});
});


</script>
