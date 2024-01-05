<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">


		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">쿠폰관리 /</span> 쿠폰리스트
		</h4>

		<div class="card" style="width: 100%">
				<div class="card-header d-flex flex-wrap py-0">

					<div class="ms-n2  pt-3 mb-3 pe-1">

						<div class="d-flex justify-content-between align-items-center row gap-md-0">

							<div class="col-4 product_status" style="width: 200px;">
								<select name="schType" id="ProductStatus" class="form-select text-capitalize">
									<option value="couponCode">쿠폰코드</option>
									<option value="couponName">쿠폰이름</option>
									<option value="categoryNum">카테고리이름</option>
								</select>
							</div>
							
							<div class="col product_category">
								<input class="form-control" type="text" name="kwd" value="">
							
								
							</div>
							
						</div>
					</div>


					<div class="col dataTables_length mt-0 mt-md-3" id="DataTables_Table_0_length">	
						<button class="btn btn-secondary" onclick="searchCoupon();">검색</button>

					</div>
					<div class="dt-buttons pt-3">
						<button class="dt-button add-new btn btn-primary ms-2"
							tabindex="0" aria-controls="DataTables_Table_0" type="button"
							data-bs-toggle="offcanvas"
							data-bs-target="#offcanvasEcommerceCategoryList">
							<span><i class="bx bx-plus me-0 me-sm-1"> </i>쿠폰추가</span>
						</button>
					</div>



				</div>
			</div>

		<br/>
		<div class="app-ecommerce-category" data-select2-id="8">
			
			<div class="col ">
				
				
				<div class="nav-align-top mb-4">
				
				
					<ul class="nav nav-tabs tabs" role="tablist">
					
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link active" role="tab"
								data-bs-toggle="tab" data-bs-target="#navs-top-home"
								aria-controls="navs-top-home" aria-selected="true"
								data-category="all"
								>전체쿠폰</button>
						</li>
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link" role="tab"
								data-bs-toggle="tab" data-bs-target="#navs-top-home"
								aria-controls="navs-top-profile" aria-selected="false"
								data-category="open">발급중 쿠폰</button>
						</li>
						
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link" role="tab"
								data-bs-toggle="tab" data-bs-target="#navs-top-home"
								aria-controls="navs-top-profile" aria-selected="false"
								data-category="stop">발급중단 쿠폰</button>
						</li>
						
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link" role="tab"
								data-bs-toggle="tab" data-bs-target="#navs-top-home"
								aria-controls="navs-top-messages" aria-selected="false"
								data-category="end">발급종료 쿠폰</button>
						</li>
					</ul>
					
					<div class="tab-content container">
					
						<div class="tab-pane fade active show" id="navs-top-home"
							role="tabpanel">
							
							<!-- 내용 -->
						
						</div>
						
					</div>
					
				</div>
			</div>



			<!-- Category List Table -->

			

			<!-- Offcanvas to add new customer -->
			<div class="offcanvas offcanvas-end " tabindex="-1"
				id="offcanvasEcommerceCategoryList"
				aria-labelledby="offcanvasEcommerceCategoryListLabel"
				style="max-width: 500px;">
				<!-- Offcanvas Header -->
				<div class="offcanvas-header py-4">
					<h5 id="offcanvasEcommerceCategoryListLabel"
						class="offcanvas-title">쿠폰 추가</h5>
					<button type="button"
						class="btn-close bg-label-secondary text-reset"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<!-- Offcanvas Body -->
				
				
				
				<div class="offcanvas-body border-top offcanvas-container">
					<form class="pt-0 fv-plugins-bootstrap5 fv-plugins-framework"
						id="couponForm" name="couponForm"
						novalidate="novalidate"
						data-select2-id="eCommerceCategoryListForm">
						<!-- Title -->
						<div class="mb-3 fv-plugins-icon-container">
							<label class="form-label" for="ecommerce-category-title">쿠폰코드</label>
							<input type="text" class="form-control"
								id="ecommerce-category-title" placeholder="쿠폰코드입력해주세요"
								name="couponCode" aria-label="category title">
						</div>

						<div class="mb-3 fv-plugins-icon-container">
							<label class="form-label" for="ecommerce-category-title">쿠폰이름</label>
							<input type="text" class="form-control"
								id="ecommerce-category-title" placeholder="쿠폰코드입력해주세요"
								name="couponName" aria-label="category title">
						</div>

						<!-- Parent category -->
						<div class="row mb-3 ecommerce-select2-dropdown">
							<label class="form-label"
								for="ecommerce-category-parent-category">사용가능한카테고리</label>
								
							<div class="col-4 position-relative pe-0">
								<select id="ecommerce-category-parent-category1"
									class="select2 form-select select2-hidden-accessible requiredOption"
									data-placeholder="Select parent category"
									data-select2-id="ecommerce-category-parent-category"
									tabindex="-1" aria-hidden="true"
									> 
									<option class="allcate" >==</option>
									<option  value="4">모두</option>
									<option value="0">사료</option>
									<option value="1">간식</option>
									<option value="2">용품</option>
									
								</select>
							</div>
							
							<div class="col-5">
							
								<select id="ecommerce-category-parent-category"
									class="select2 form-select select2-hidden-accessible requiredOption2"
									data-placeholder="Select parent category"
									data-select2-id="ecommerce-category-parent-category"
									tabindex="-1" aria-hidden="true" name="categoryNum"> 
									
									<option class="allcate" >==</option>
									
								</select>
								
							</div>
						</div>
						<!-- Description -->

						<!-- Status -->
						<div class="row mb-4 ecommerce-select2-dropdown"
							data-select2-id="7">
							<div class="col pe-0 me-0">
								<label class="form-label" for="ecommerce-category-title">할인율</label>
								<input style="width: 150px; font-size: 10px;" type="text"
									class="form-control pe-0" id="ecommerce-category-title"
									placeholder="할인율을 입력해주세요" name="couponDiscount">
							</div>
							<div class="col" style="padding-top: 33px; padding-left: 0">%</div>
						</div>


						<div>
							<div class="row mb-4 ecommerce-select2-dropdown"
								data-select2-id="7">
								<label class="form-label" for="ecommerce-category-title">기간</label>
								<div class="row ps-4">
									<div class="col-2 col-2 p-0"
										style="width: 150px; font-size: 50px;">
										<input class="form-control" type="date" name="startCouponDate">
									</div>
									<i style="width: 30px;" class='bx bx-minus col-1 pt-2 pe-4'></i>
									<div class="col-2 col-2 p-0"
										style="width: 150px; font-size: 50px;">
										<input class="form-control" type="date" name="endCouponDate">
									</div>
								</div>
							</div>
						</div>
						<!-- Submit and reset -->
						<div class="mb-3">
							<button type="button"
								class="btn btn-primary me-sm-3 me-1 btnSendOk">추가하기</button>
						</div>
					</form>
				</div>
			</div>




		</div>

	</div>
	<!-- / Content -->


	<div class="content-backdrop fade"></div>
</div>


<!-- modal -->
<div class="modal fade" id="modalToggle"
	aria-labelledby="modalToggleLabel" tabindex="-1" style="display: none;"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalToggleLabel">발급상태변경</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body resultHtml">
				<div class="mt-2">
					<select class="form-select" name="couponState">
						<option value="" style="text-align: center;">::쿠폰 상태 변경::</option>
						<option value="0" style="text-align: center;">발급 진행</option>
						<option value="1" style="text-align: center;">발급 중단</option>
						<option value="2" style="text-align: center;">발급 종료</option>
					</select>
				</div>
				<div class="col-12  mt-3" style="margin: auto;">
					<input style="text-align: center;" type="text" name="couponMemo" class="form-control" placeholder="메모">
				</div>
			</div>

			<div class="modal-footer changeCoupon">
			
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
	$('.offcanvas-container').on('click', '.btnSendOk', function() {
		//  쿠폰 등록 완료
		const f = document.couponForm;
		    
		let url = "${pageContext.request.contextPath}/admin/couponManage/couponRegi";
		
	    let formData = new FormData(f);
	    
	    for (let pair of formData.entries()) {
	        console.log(pair[0] + ': ' + pair[1]);
	    } 
	    

		const fn = function(data){
			let state = data.state;
			
	        if(state === "false") {
	            alert("쿠폰을 추가하지 못했습니다. !!!");
	            return false;
	        }

	       /*  $('#searchInput').val('');
	        $('#searchWord').val('');
	        
			$('.list-content').empty(); */
	    	// loadContent(1);
			alert('쿠폰을 등록하셨습니다 !');
			
			listPage(1);
			
	    	$('#offcanvasEcommerceCategoryList').offcanvas('hide');
	    	
		};
		
		ajaxFun(url, 'post', formData, 'json', fn, true);
	});
});

$(function(){
	$('.nav-tabs button').on('click', function () {
	      // 클릭된 버튼의 data-category 값을 콘솔에 출력
	      let category = $(this).data('category');
	      
	      listPage(1);
	});
});



//글리스트 및 페이징 처리
function listPage(page) {
	
	const $tab = $(".tabs .active");
	let category = $tab.attr("data-category");
	
	let schType = $('#ProductStatus').val();
    let kwd = $('input[name="kwd"]').val();
	
	let url = "${pageContext.request.contextPath}/admin/couponManage/couponlist";
	let query = "page="+page+"&category="+encodeURIComponent(category)+"&schType="+schType+"&kwd="+kwd;
	
	let selector = "#navs-top-home";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}

function searchCoupon() {
	listPage(1);
}

$(function(){
	$('.container').on('click', '.deleteCoupon', function() {
		// 쿠폰 삭제
		let couponNum = $(this).attr('data-couponNum');
		
		let url = '${pageContext.request.contextPath}/admin/couponManage/deleteCoupon';
		let query = 'couponNum=' + couponNum ;
		
		console.log(couponNum);
		if(! confirm("쿠폰을 삭제하시겠습니까 ? ")) {
			  return;
		}
		
		const fn = function(data){
			listPage(1);
	    	// $('#editUser').modal('hide');
	    	// $('#modalCenter').modal('hide');
		};
		
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});



$(function () {
	$(".requiredOption").change(function(){
		
		let sort = $(this).val();
		
		$(".requiredOption2 option").each(function(){
			
			if($(this).is(":first-child")) {
				return true; // continue
			}
			
			$(this).remove();
        });
		
		
		
		/* 	if(! detailNum) {
			return false;
		} */
		
		// let optionNum = $(".requiredOption").attr("data-optionNum");
		// let optionNum2 = $(".requiredOption2").attr("data-optionNum2");
		
		
		let url = "${pageContext.request.contextPath}/admin/couponManage/couponDetail";
		$.get(url, {sort:sort}, function(data){
			$(data).each(function(index, item){
				
				let categoryNum = item.categoryNum;
				let sort = item.sort;
				let categoryName = item.categoryName;
				
				$(".requiredOption2").append("<option value='"+categoryNum+"'>"+categoryName+"</option>");
			});
		});
		
	});
});

$(function(){
	$('.container').on('click', '.updateCoupon', function() {
		// 쿠폰 상태 모달
		$("select[name=couponState]").val('');
		$('input[name=couponMemo]').val('');
		
		let couponNum = $(this).attr('data-couponNum');
		
		let result = "";
		result += '<button class="btn btn-primary stateCoupon" data-couponNum="'+ couponNum +'" >변경</button>'
		$('#modalToggle .changeCoupon').html(result);
		
		let url = '${pageContext.request.contextPath}/admin/couponManage/findByCoupon';
		let query = 'couponNum=' + couponNum ;
		const fn = function(data){
			
			let couponState = data.dto.couponState;
			let couponMemo = data.dto.couponMemo;
			console.log(couponState);
			console.log(couponMemo);
			$("select[name=couponState]").val(couponState);
			
			if (couponMemo !== null) {
				$('input[name=couponMemo]').attr('placeholder', couponMemo);
			}
		}; 
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

$(function(){
	$('#modalToggle').on('click', '.stateCoupon', function() {
		
		//  쿠폰 상태변경
		let couponNum = $(this).attr('data-couponNum');
		let couponState = $("select[name=couponState]").val();
		let couponMemo = $('input[name=couponMemo]').val();
		
		console.log(couponNum);
		console.log(couponState);
		console.log(couponMemo);
		
		let url = '${pageContext.request.contextPath}/admin/couponManage/stateCoupon';
		let query = 'couponNum=' + couponNum + '&couponState=' + couponState+'&couponMemo='+couponMemo;
		
		
		const fn = function(data){
			listPage(1);
			console.log(data);
			
	    	$('#modalToggle').modal('hide');
		}; 
		
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});



</script>