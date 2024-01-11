<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
// 탭
$(function(){
	$("button[role='tab']").on('click', function(){
		const tab = $(this).attr("aria-controls");
		
		if(tab === "1") { // 판매취소
			location.href = "${pageContext.request.contextPath}/admin/cancleManage/sale";
		} else if( tab === "2") { // 주문취소
			location.href = "${pageContext.request.contextPath}/admin/cancleManage/order";
		}
	});
});
</script>
<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">


		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">주문관리 /</span> 취소상품조회
		</h4>

		<div class="nav-align-top mb-4" style="width: 1360px;">

			<ul class="nav nav-pills mb-3 nav-fill" role="tablist"
				style="width: 500px;">
				<li class="nav-item" role="presentation">
					<button type="button" class="nav-link ${cancleStatus =='order'?'active':''}" role="tab"
						data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home"
						aria-controls="2" aria-selected="true">
						<i class="tf-icons bx bx-user me-1"></i> 주문취소
					</button>
				</li>
				<li class="nav-item" role="presentation">
					<button type="button" class="nav-link ${cancleStatus =='sale'?'active':''}" role="tab"
						data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home"
						aria-controls="1" aria-selected="false"
						tabindex="-1">
						<i class="tf-icons bx bx-home me-1"></i> 판매취소<!--  <span
							class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger ms-1">3</span> -->
					</button>
				</li>
				
			</ul>



			<div class="tab-pane fade active show" id="navs-pills-justified-home"
				role="tabpanel">

				<!-- Bordered Table -->
				<div class="card">
					<div class="card-body">
						<div class=" text-nowrap">
							<table class="table table-bordered" style="width: 100%;">
								<thead>
									<tr class="text-center" style="background-color: gray;">
										<th colspan="5">상품준비조회</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="width: 6%; text-align: center;"><span
											class="fw-medium">검색어</span></td>
										<td colspan="4">

											<div
												class="d-flex justify-content-between align-items-center row gap-md-0">

												<div class="col-4 product_status" style="width: 300px;">
													<select id="ProductStatus"
														class="form-select text-capitalize">
														<option value="">주문번호</option>
													</select>
												</div>
												<div class="col product_category">
													<input class="form-control" type="text" name="#" value="">
												</div>
											</div>
										</td>

									</tr>
									<tr>
										<td style="text-align: center;"><span class="fw-medium">기간</span></td>
										<td colspan="4">

											<div
												class="d-flex justify-content-between align-items-center row gap-md-0">

												<div class="col-4 product_status" style="width: 300px;">
													<select id="ProductStatus"
														class="form-select text-capitalize">
														<option value="">주문일자</option>
													</select>
												</div>
												<div class="col product_category">
													<div class="row">
														<div class="col-2 col-2">
															<input class="form-control" type="date">
														</div>
														<i style="width: 30px;"
															class='bx bx-minus col-1 pt-2 pe-4'></i>
														<div class="col-2 col-2">
															<input class="form-control" type="date">
														</div>
													</div>
												</div>
											</div>
										</td>

									</tr>
									<tr>
										<td style="text-align: center;"><span class="fw-medium">상품</span></td>
										<td colspan="4">

											<div
												class="d-flex justify-content-between align-items-center row gap-md-0">

												<div class="col-4 product_status" style="width: 300px;">
													<select id="ProductStatus"
														class="form-select text-capitalize">
														<option value="">상품명</option>
													</select>
												</div>
												<div class="col product_category">
													<input class="form-control" type="text" name="#" value="">
												</div>
											</div>
										</td>

									</tr>
								</tbody>
							</table>
							<div class="text-center pb-0 pt-3">
								<button class="btn btn-secondary" style="width: 100px;">검색</button>
							</div>
						</div>
					</div>
				</div>
				<!--/ Bordered Table -->

				<br />
				<div class="card-title m-0 pb-3">
					<h5 class="m-0 me-2">검색결과(1)</h5>
				</div>
				<div class="col ">


					<div class="nav-align-top mb-4">


						<ul class="nav nav-tabs tabs" role="tablist">
							<c:if test="${cancleStatus eq 'order' }">
								<li class="nav-item" role="presentation">
									<button type="button" class="nav-link active" role="tab"
										data-bs-toggle="tab" data-bs-target="#navs-top-home"
										aria-controls="navs-top-home" aria-selected="true"
										data-state="ordercancle">주문취소신청</button>
								</li>
								<li class="nav-item" role="presentation">
									<button type="button" class="nav-link" role="tab"
										data-bs-toggle="tab" data-bs-target="#navs-top-home"
										aria-controls="navs-top-profile" aria-selected="false"
										data-state="ordercanclecom">주문취소완료</button>
								</li>
							</c:if>
							
							<c:if test="${cancleStatus eq 'sale' }">
								<li class="nav-item" role="presentation">
									<button type="button" class="nav-link active" role="tab"
										data-bs-toggle="tab" data-bs-target="#navs-top-home"
										aria-controls="navs-top-home" aria-selected="true"
										data-state="salecancle">판매취소완료</button>
								</li>
							</c:if>
						</ul>

						<div class="tab-content container">

							<div class="tab-pane fade active show" id="navs-top-home"
								role="tabpanel">

								<!-- 내용!!!!!!!! -->

							</div>

						</div>

					</div>
				</div>
			</div>




		</div>


	</div>
	<!--/ User Content -->
</div>


<footer class="content-footer footer bg-footer-theme"> </footer>

<!-- 주문상세정보-상태변경/상태확인 대화상자  -->
<div  class="modal fade" id="orderDetailStateDialogModal" tabindex="-1" aria-labelledby="orderDetailStateDialogModalLabel" aria-hidden="true">
	<div style="max-width: 600px;" class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
		
			<div class="modal-header" style="padding-left: 250px;" > 
				<h5 class="modal-title" id="orderDetailStateDialogModalLabel">※취소처리※</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				
				<div class="p-1 detailStateUpdate-form">
					<form name="detailStateForm" class="row justify-content-center">
						<div class="col-auto p-1">
							<select name="changeState" class="form-select"></select>
						</div>
						<div class="col-6 p-1">
							<input type="text" name="adminMemo" class="form-control" placeholder="메모남기기">
						</div>
						<div class="col-auto p-1">
							<input type="hidden" name="changeNum">
							<input type="hidden" name="orderNum">
							<input type="hidden" name="orderDetailNum">
							<input type="hidden" name="cancelCost">
							<input type="hidden" name="savedMoney">
							<input type="hidden" name="usedSaved">
							<input type="hidden" name="memberIdx">

							<input type="hidden" name="productNum">
							<input type="hidden" name="detailNum">
							<input type="hidden" name="detailNum2">
							<input type="hidden" name="qty">
							<input type="hidden" name="couponNum">
							
							<button class="btn btn-secondary p-6 m-0 btnDetailStateUpdateOk" type="button">변경</button>
							
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	
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
	
	$(function(){
		listPage(1);
	});
	
	$(function(){
		$('.nav-tabs button').on('click', function () {
		      // 클릭된 버튼의 data-category 값을 콘솔에 출력
		      let state = $(this).data('state');
		      console.log(state);
		       listPage(1);
		});
	});
	
	//글리스트 및 페이징 처리
	function listPage(page) {
		//let cancleStatus = ${cancleStatus};
		
		const $tab = $(".tabs .active");
		let state = $tab.attr("data-state");
		
		// let schType = $('#ProductStatus').val();
	    // let kwd = $('input[name="kwd"]').val();
		console.log(state);
		
		let url = "${pageContext.request.contextPath}/admin/cancleManage/${cancleStatus}/orderlist";
		let query = "page="+page+"&state="+encodeURIComponent(state);
		
		let selector = "#navs-top-home";
		
		const fn = function(data){
			$(selector).html(data);
		};
		
		ajaxFun(url, "get", query, "html", fn);
	}
	
	
	
	
	$('body').on('click', '.orderDetailStatus-update', function(){
		const f = document.detailStateForm;
		f.reset();
		
		let changeNum = $(this).attr("data-changeNum");
		let orderNum = $(this).attr("data-orderNum");
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		let cancelCost = $(this).attr("data-cancelCost");
		
		// 사용한 적립금
		let usedSaved = $(this).attr("data-usedSaved");
		// 상품별로 받은 적림급금
		let savedMoney = $(this).attr("data-savedMoney");
		let memberIdx = $(this).attr("data-memberIdx");

		let detailNum = $(this).attr("data-detailNum");
		let detailNum2 = $(this).attr("data-detailNum2");
		let productNum = $(this).attr("data-productNum");
		let qty = $(this).attr("data-qty");
		let couponNum= $(this).attr("data-couponNum");
		 
	
		
		
		console.log(changeNum);
		console.log(orderNum);
		console.log(orderDetailNum);
		console.log(usedSaved);
		console.log(savedMoney);
		console.log(memberIdx);
		console.log(detailNum);
		console.log(detailNum2);
		console.log(qty);
		
		
		f.orderNum.value = orderNum;
		f.changeNum.value = changeNum;
		f.orderDetailNum.value = orderDetailNum;
		f.cancelCost.value = cancelCost;
		
		f.usedSaved.value = usedSaved;
		f.savedMoney.value = savedMoney;
		f.memberIdx.value = memberIdx;

		
		f.detailNum.value = detailNum;
		f.detailNum2.value = detailNum2;
		f.productNum.value = productNum;
		f.qty.value = qty;
		f.couponNum.value = couponNum;
		
		
		
		let $SELECT = $('form[name=detailStateForm] select[name=changeState]');
		$SELECT.append('<option value="5">주문취소완료</option>');
		
		$('#orderDetailStateDialogModal').modal('show');
		
	});
	
	
	$(".btnDetailStateUpdateOk").click(function(){
		// 주문상세 상태정보변경 등록
		const f = document.detailStateForm;
		let orderNum = f.orderNum.value;
		let changeNum = f.changeNum.value;
		let orderDetailNum = f.orderDetailNum.value
		let cancelCost = f.cancelCost.value
		
		let usedSaved = f.usedSaved.value
		let savedMoney = f.savedMoney.value
		let memberIdx = f.memberIdx.value
		
		let detailNum = f.detailNum.value
		let detailNum2 = f.detailNum2.value 
		let productNum = f.productNum.value 
		let qty = f.qty.value 
		
		
		console.log(changeNum);
		console.log(orderNum);
		console.log(orderDetailNum);
		console.log(usedSaved);
		console.log(savedMoney);
		console.log(memberIdx);
		console.log(detailNum);
		console.log(detailNum2);
		console.log(productNum);
		
		if(! f.adminMemo.value.trim()) {
			alert("메모를 등록하세요");
			f.adminMemo.focus();
			return false;
		}
		
		let qs = $('form[name=detailStateForm]').serialize();
		
		let url = '${pageContext.request.contextPath}/admin/cancleManage/{cancleStatus}/cancleComplete';

		const fn = function(data) {
			if(data.state === "true") {
				
				alert("취소완료 되었습니다.");
				f.reset();
				
				$('#orderDetailStateDialogModal').modal('hide');
				
				listPage(1);
				
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
		
	});
	
	
</script>