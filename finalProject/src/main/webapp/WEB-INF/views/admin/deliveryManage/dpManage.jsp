<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">


		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">주문관리 /</span> 배송조회
		</h4>


		<!-- On route vehicles Table -->
		<div class="col-12 order-5">
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<div class="card-title mb-0 pb-3">
				<h5 class="m-0 me-2">상품주문관리</h5>
			</div>

			<!-- Bordered Table -->
			<div class="card">
				<div class="card-body">
					<div class="table-responsive text-nowrap">
						<table class="table table-bordered" style="width: 1330px;">
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
													<i style="width: 30px;" class='bx bx-minus col-1 pt-2 pe-4'></i>
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

					<c:if test="${sub eq 'dpManage' }">
						<ul class="nav nav-tabs tabs" role="tablist">

							<li class="nav-item" role="presentation">
								<button type="button" class="nav-link active" role="tab"
									data-bs-toggle="tab" data-bs-target="#navs-top-home"
									aria-controls="navs-top-home" aria-selected="true"
									data-state="ready">배송준비중</button>
							</li>
							<li class="nav-item" role="presentation">
								<button type="button" class="nav-link" role="tab"
									data-bs-toggle="tab" data-bs-target="#navs-top-home"
									aria-controls="navs-top-profile" aria-selected="false"
									data-state="start">배송 시작/중</button>
							</li>

						</ul>
					</c:if>

					<c:if test="${sub eq 'dpEndManage' }">
						<ul class="nav nav-tabs tabs" role="tablist">

							<li class="nav-item" role="presentation">
								<button type="button" class="nav-link active" role="tab"
									data-bs-toggle="tab" data-bs-target="#navs-top-home"
									aria-controls="navs-top-home" aria-selected="true"
									data-state="complete">배송완료</button>
							</li>

						</ul>
					</c:if>
					<div class="tab-content container">

						<div class="tab-pane fade active show" id="navs-top-home"
							role="tabpanel">

							<!-- 내용!!!!!!!! -->

						</div>

					</div>

				</div>
			</div>

		</div>
		<!--/ On route vehicles Table -->
	</div>
	<!-- / Content -->

</div>


<div id="modalList" class="modalList"></div>

<!-- 주문상세정보-상태변경/상태확인 대화상자  -->
<div class="modal fade" id="orderDetailStateDialogModal" tabindex="-1"
	aria-labelledby="orderDetailStateDialogModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDetailStateDialogModalLabel">주문상세정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="mt-1 p-1">
					<div class="p-1">
						<p class="form-control-plaintext optionDetail-value"></p>
					</div>

					<table class="table board-list" style="width: 100%">
						<thead class="table-secondary">
							<tr>
								<td width="80">코드</td>
								<td width="140">구분</td>
								<td width="90">작성자</td>
								<td width="150">날짜</td>
								<td>설명</td>
							</tr>
						</thead>
						<tbody class="detailState-list"></tbody>
					</table>
				</div>

				<div class="p-1 detailStateUpdate-form">
					<form name="detailStateForm" class="row justify-content-center">
						<div class="col-auto p-1">
							<select name="detailState" class="form-select"></select>
						</div>
						<div class="col-6 p-1">
							<input type="text" name="stateMemo" class="form-control"
								placeholder="상태 메시지 입력">
						</div>
						<div class="col-auto p-1">
							<input type="hidden" name="orderNum"> <input
								type="hidden" name="orderDetailNum"> <input
								type="hidden" name="productMoney"> <input type="hidden"
								name="cancelAmount">
							<button class="btn btn-secondary p-6 m-0 btnDetailStateUpdateOk"
								type="button">변경</button>

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
		
		const $tab = $(".tabs .active");
		let state = $tab.attr("data-state");
		
		// let schType = $('#ProductStatus').val();
	    // let kwd = $('input[name="kwd"]').val();
		console.log(state);
		
		let url = "${pageContext.request.contextPath}/admin/deliveryManage/deliverylist";
		let query = "page="+page+"&state="+encodeURIComponent(state);
		
		let selector = "#navs-top-home";
		
		const fn = function(data){
			$(selector).html(data);
		};
		
		ajaxFun(url, "get", query, "html", fn);
	}
	
	$(function ()  {
		$('.container').on('click', '.detailList', function() {
			
			
			// 쿠폰 상태 모달
			let orderNum = $(this).attr('data-orderNum');
			
			let selector = "#modalList";
			
			let url = '${pageContext.request.contextPath}/admin/deliveryManage/detailList';
			let query = 'orderNum=' + orderNum ;
			const fn = function(data){
				$(selector).html(data)
				
				$("#backDropModal").modal('show');
			}; 
			
			ajaxFun(url, "get", query, "html", fn);
		});
	});
	
	$('body').on('click', '.orderDetailStatus-update', function(){
		const f = document.detailStateForm;
		f.reset();
		
		let orderNum = $(this).attr("data-orderNum");
		let orderState = $(this).attr("data-orderState");
		let orderDetailNum = $(this).attr("data-orderDetailNum");
		let detailState = $(this).attr("data-detailState");
		let productMoney = $(this).attr("data-productMoney");
		let cancelAmount = $(".order-cancelAmount").attr("data-cancelAmount");
		
		f.orderNum.value = orderNum;
		f.orderDetailNum.value = orderDetailNum;
		f.productMoney.value = productMoney;
		f.cancelAmount.value = cancelAmount;
		
		let opt = $(this).closest("tr").find("td").eq(5).text();

		let $SELECT = $('form[name=detailStateForm] select[name=detailState]');
		$('form[name=detailStateForm] select[name=detailState] option').remove();
		
	
		
		if(orderState==="6") {
			// 주문상태-판매취소
			$(".detailStateUpdate-form").hide();
		} else if(detailState==='1' || detailState==='2' || detailState==='3' || detailState==='5' || detailState==='12' || orderState==='3' || orderState==='4' ) {
			// 주문상세상태- 구매확정,자동구매확정,취소완료,반품완료,판매취소
			$SELECT.append('<option value="14">기타</option>');
		} else if(detailState==='4') { // 주문상세상태-주문취소요청
			$SELECT.append('<option value="5">주문취소완료</option>');
		} else if(detailState==='6'){ // 주문상세상태-교환요청
			$SELECT.append('<option value="7">교환접수</option>');
			$SELECT.append('<option value="8">교환발송완료</option>');
			$SELECT.append('<option value="9">교환불가</option>');
		} else if(detailState==='10'){ // 주문상세상태-반품요청
			$SELECT.append('<option value="11">반품접수</option>');
			$SELECT.append('<option value="12">반품완료</option>');
			$SELECT.append('<option value="13">반품불가</option>');
		} else if(orderState==="5"){
			$SELECT.append('<option value="2">자동구매확정</option>');
			$SELECT.append('<option value="14">기타</option>');
		} else {
			$SELECT.append('<option value="3">판매취소</option>');
			$SELECT.append('<option value="14">기타</option>');
		}
		
		$('.optionDetail-value').html('옵션 : ' + opt + ' ');
		$('#orderDetailStateDialogModal').modal('show');
	});
	
	

	
	// 배송 변경(배송중/배송완료)
	$(function(){
		$("body").on("click", ".btn-delivery-order", function(){
			const $EL = $(this);
			let orderNum = $EL.attr("data-orderNum");
			let preState = $EL.attr("data-orderState");
			
			let orderState = $EL.closest(".delivery-update-area").find("select").val();
			let orderStateInfo = $EL.closest(".delivery-update-area").find("select option:selected").text();
			
			if(preState >= orderState) {
				alert('배송 변경은 현 배송 단계보다 적거나 같을수 없습니다.');
				return false;
			}
			
			
				
				let qs = 'orderNum=' + orderNum + '&orderState=' + orderState;
				let url = '${pageContext.request.contextPath}/admin/deliveryManage/delivery';

				const fn = function(data) {
					if(data.state === "true") {
						
						$("#backDropModal").modal("hide");
						
						listPage(1);
					}
				};
			
			
			
			ajaxFun(url, "post", qs, "json", fn);
		});
	});

	
	function listDetailState() {
		$('.detailState-list').empty();
		
		const f = document.detailStateForm;
		let orderDetailNum = f.orderDetailNum.value;
		
		let qs = 'orderDetailNum=' + orderDetailNum;
		let url = '${pageContext.request.contextPath}/admin/orderManage/listDetailState';

		const fn = function(data) {
			let out;
			for(let item of data.list) {
				out  = '<tr>';
				out += '<td>'+item.DETAILSTATE+'</td>';
				out += '<td>'+item.DETALSTATEINFO+'</td>';
				out += '<td>'+item.USERNAME+'</td>';
				out += '<td>'+item.DETAILSTATEDATE+'</td>';
				out += '<td align="left">'+item.STATEMEMO+'</td>';
				out += '</tr>';
				
				$('.detailState-list').append(out);
			}
		};
		
		ajaxFun(url, "get", qs, "json", fn);
	}
	
	const modalEl = document.getElementById('orderDetailStateDialogModal');
	modalEl.addEventListener('show.bs.modal', function(){
		// 모달 대화상자가 보일때
		listDetailState();
	});
	
	$(".btnDetailStateUpdateOk").click(function(){
		// 주문상세 상태정보변경 등록
		const f = document.detailStateForm;
		let orderNum = f.orderNum.value;
		let orderDetailNum = f.orderDetailNum.value;
		let productMoney = f.productMoney.value;
		let cancelAmount = f.cancelAmount.value;
		
		// 이전상태
		// let preDetailState = $("#orderDetail-list" + orderDetailNum).find("td").eq(9).attr("data-detailstate");
		let preDetailState = $("#orderDetail-list" + orderDetailNum + " td:eq(9) span").data("detailstate");
		if(preDetailState === 3 || preDetailState === 5 || preDetailState === 12) {
			alert("판매취소 또는 반품완료 상품은 변경이 불가능합니다.");
			return false;
		}
		
		let changeStateInfo = $("form[name=detailStateForm] select option:selected").text();
		
		if(! f.stateMemo.value.trim()) {
			alert("상태 메시지를 등록하세요");
			f.stateMemo.focus();
			return false;
		}
		
		let qs = $('form[name=detailStateForm]').serialize();
		
		let url = '${pageContext.request.contextPath}/admin/orderManage/updateDetailState';

		const fn = function(data) {
			if(data.state === "true") {
				listDetailState();
				
				let detailState = data.detailState;

				$("#orderDetail-list" + orderDetailNum).find("td").eq(10).html(changeStateInfo);
				$("#orderDetail-list" + orderDetailNum).find("td").eq(11).attr("data-detailState", detailState);
				
				// 주문취소완료인 경우
				if(detailState == 3 || detailState == 5 || detailState == 12) {
					cancelAmount = parseInt(cancelAmount) + parseInt(productMoney);
					$(".order-cancelAmount").attr("data-cancelAmount", cancelAmount);
					$(".order-cancelAmount").text(cancelAmount.toLocaleString());
				}
				
				alert("정보가 변경되었습니다.");
				f.reset();
				
				// $('#orderDetailStateDialogModal').modal('hide');
				// $("#backDropModal").modal('hide');
				
				listPage(1);
				
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
		
	});
	
	// 전체 판매취소 
	$(function(){
	    $("body").on("click", ".btn-cancel-order", function () {
	    	let orderNum = $(this).attr('data-orderNum');
	    	let payment = $(this).attr('data-payment');
	    	let cancelAmount = $(this).attr('data-cancelAmount');
	    	let usedSaved = $(this).attr('data-usedSaved');
	        
	        console.log("주문번호: " + orderNum);
            console.log("결제금액: " + payment);
            console.log("취소금액: " + cancelAmount);
            console.log("적립금: " + usedSaved);
	    	
			if(!confirm('전체 주문 취소를 하시겠습니까 ? ')){
				return;
			};
			
			let query = 'orderNum='+orderNum+'&payment='+payment+'&cancelAmount='+cancelAmount+'&usedSaved='+usedSaved;
			let url = '${pageContext.request.contextPath}/admin/orderManage/cancleAllproduct';
			
			const fn = function(data) {
				$("#backDropModal").modal("hide");
				listPage(1);
			};
			
			ajaxFun(url, "post", query, "json", fn);
	    });
	});
</script>
