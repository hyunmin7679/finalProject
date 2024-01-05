<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.bordered-image {
    border: 1px solid #000;
    border-radius: 5px;
}
</style>
<script type="text/javascript">
$(function(){
	$('body').on('click', '.sm-img img', function(){
	
		let url = $(this).attr("src");
		console.log(url);
		$(".lg-img img").attr("src", url);
	});
});
</script>

<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">


		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">주문관리 /</span> 반품관리
		</h4>

		<div class="nav-align-top mb-4" style="width: 1360px;">

			<ul class="nav nav-pills mb-3 nav-fill" role="tablist"
				style="width: 500px;">
				<li class="nav-item" role="presentation">
					<button type="button" class="nav-link active" role="tab"
						data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home"
						aria-controls="2" aria-selected="true">
						<i class="tf-icons bx bx-user me-1"></i> 반품상품
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
							
								<li class="nav-item" role="presentation">
									<button type="button" class="nav-link active" role="tab"
										data-bs-toggle="tab" data-bs-target="#navs-top-home"
										aria-controls="navs-top-home" aria-selected="true"
										data-state="returnApply">반품신청</button>
								</li>
								<li class="nav-item" role="presentation">
									<button type="button" class="nav-link" role="tab"
										data-bs-toggle="tab" data-bs-target="#navs-top-home"
										aria-controls="navs-top-profile" aria-selected="false"
										data-state="returnReceipt">반품접수</button>
								</li>
							
								<li class="nav-item" role="presentation">
									<button type="button" class="nav-link" role="tab"
										data-bs-toggle="tab" data-bs-target="#navs-top-home"
										aria-controls="navs-top-home" aria-selected="true"
										data-state="returnComplete">반품완료</button>
								</li>
								
								<li class="nav-item" role="presentation">
									<button type="button" class="nav-link" role="tab"
										data-bs-toggle="tab" data-bs-target="#navs-top-home"
										aria-controls="navs-top-home" aria-selected="true"
										data-state="returnNo">반품취소/불가</button>
								</li>
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
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
		
			<div class="modal-header" style="padding-left: 340px;" > 
				<h5 class="modal-title" id="orderDetailStateDialogModalLabel">※반품처리※</h5>
				
			
				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
			<div class="modal-title text-center" style="padding-right: 20px;" id="orderDetailStateDialogModalLabel">반품상품이미지</div>
			
			<div class="modal-body pt-1">
				
				<div class="p-1 detailStateUpdate-form row">
				
				<div id="cancelFile"></div>
				
				
					<form name="detailStateForm" class="row justify-content-center pt-3">
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
							<input type="hidden" name="PchangeState">
							<input type="hidden" name="deliveryCharge">
								
							
							<input type="hidden" name="usedSaved">
							<input type="hidden" name="savedMoney">
							<input type="hidden" name="memberIdx">
							<input type="hidden" name="detailNum">
							<input type="hidden" name="detailNum2">
							<input type="hidden" name="productNum">
							<input type="hidden" name="qty">
						
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
		
		let url = "${pageContext.request.contextPath}/admin/returnManage/orderlist";
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
		let PchangeState = $(this).attr("data-PchangeState");
		let deliveryCharge = $(this).attr("data-deliveryCharge");

		let usedSaved = $(this).attr("data-usedSaved");
		let savedMoney = $(this).attr("data-savedMoney");
		let memberIdx = $(this).attr("data-memberIdx");
		let detailNum = $(this).attr("data-detailNum");
		let detailNum2 = $(this).attr("data-detailNum2");
		let productNum = $(this).attr("data-productNum");
		let qty = $(this).attr("data-qty");
		
		
		
		
		
		
		console.log(cancelCost);
		console.log(changeNum);
		console.log(orderNum);
		console.log(orderDetailNum);
		console.log(PchangeState);
		console.log(deliveryCharge);

		console.log(usedSaved);
		console.log(savedMoney);
		console.log(memberIdx);
		console.log(detailNum);
		console.log(detailNum2);
		console.log(productNum);
		console.log(qty);
		
		f.qty.value = qty;
		f.PchangeState.value = PchangeState;
		f.orderNum.value = orderNum;
		f.changeNum.value = changeNum;
		f.orderDetailNum.value = orderDetailNum;
		f.cancelCost.value = cancelCost;
		f.deliveryCharge.value = deliveryCharge;

		f.usedSaved.value = usedSaved;
		f.savedMoney.value = savedMoney;
		f.memberIdx.value = memberIdx;
		f.detailNum.value = detailNum;
		f.detailNum2.value = detailNum2;
		f.productNum.value = productNum;
		
		let query = "changeNum="+changeNum;
		let url = '${pageContext.request.contextPath}/admin/returnManage/returnFile'
		const $CANCELIMG =$('#cancelFile');
		
		const fn = function(data) {
			
			if(data.list.length > 0){
			
				let result = '';
				result += '<div class="col-lg-12 text-center lg-img">'; 
                result += '<img src="${pageContext.request.contextPath}/uploads/img/'+data.firstFileName+'" class="img-fluid large-image bordered-image" alt="Large Image">'; 
                result += '</div>'; 
                result += '<div class="col-lg-12 mt-2">'; 
               	 	result += '<div class="row" style="padding-left: 12px;">'; 
               	 	
               	 for(let item of data.list) {
               	 		result += '<div class="col-4 sm-img" style="width: 15%; height: 10%; padding-right: 1px; padding-left: 0px;">'; 
               		 		result += '<img src="${pageContext.request.contextPath}/uploads/img/'+item.FILENAME+'" class="img-thumbnail small-image bordered-image" alt="Small Image 1">'; 
               	  	    result += '</div>';
               	 }   
               	 
               result += '</div>'; 
               result += '</div>'; 
               $CANCELIMG.html(result); 
			}else{
				let result = '<div class="text-center"> 등록된 사진이 없습니다 </div>';
				$CANCELIMG.html(result); 
			}
			
			
              
		};
		
		ajaxFun(url, "post", query, "json", fn);
		
		
		let $SELECT = $('form[name=detailStateForm] select[name=changeState]');
		$('form[name=detailStateForm] select[name=changeState] option').remove();
		
		if(PchangeState == 10 ){
			$SELECT.append('<option value="11">반품접수</option>');	
			$SELECT.show();
			$('.btnDetailStateUpdateOk').show();
		}else if(PchangeState == 11){
			$SELECT.show();
			$('.btnDetailStateUpdateOk').show();
			$('form[name=detailStateForm] input[name=adminMemo]').show();
			$SELECT.append('<option value="12">반품완료</option>');
			$SELECT.append('<option value="13">반품취소/불가</option>');
		}
		
		if (PchangeState == 10) {
	           $('form[name=detailStateForm] input[name=adminMemo]').hide();
	    }
		
		
		if(PchangeState == 12 || PchangeState == 13){
			   $SELECT.hide();
			   $('form[name=detailStateForm] input[name=adminMemo]').hide();	
			   $('.btnDetailStateUpdateOk').hide();
		}
		
		
		$('#orderDetailStateDialogModal').modal('show');
		
		listPage(1);
	});
	
	
	$(".btnDetailStateUpdateOk").click(function(){
		// 주문상세 상태정보변경 등록
		
		
		const f = document.detailStateForm;
		let orderNum = f.orderNum.value;
		let changeNum = f.changeNum.value;
		let orderDetailNum = f.orderDetailNum.value
		let cancelCost = f.cancelCost.value
		let changeState = f.changeState.value
		let PchangeState = f.PchangeState.value
		let deliveryCharge = f.deliveryCharge.value
		
		console.log(changeNum);
		console.log(orderNum);
		console.log(orderDetailNum);
		console.log(changeState);
		console.log(PchangeState);
		
		
		
		let qs = $('form[name=detailStateForm]').serialize();
		
		let url = '${pageContext.request.contextPath}/admin/returnManage/returnState';

		const fn = function(data) {
			if(data.state === "true") {
				
				alert("상태변경 완료 !");
				f.reset();
				
				$('#orderDetailStateDialogModal').modal('hide');
				
				listPage(1);
				
			}
		};
		
		ajaxFun(url, "post", qs, "json", fn);
		
	});
	
	
</script>