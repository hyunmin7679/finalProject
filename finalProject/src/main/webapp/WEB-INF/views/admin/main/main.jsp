<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/heatmap.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<!-- Content wrapper -->
<div class="content-wrapper">
	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">



		<div class="row">

			<!-- 카테고리 별 주문현황 -->
			<div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4 cata-list">
				
			</div>

			<!--  기타 통계 -->
			<div class="col-md-6 col-lg-4 order-2 mb-4" id="etcList"></div>


			<!-- 인기 아이콘순위 -->
			<div class="col-md-6 col-lg-4 order-2 mb-4" id="iconList"></div>


			<!--/ Total Revenue -->
			<div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
				<div class="row">

					<!-- </div>
    <div class="row"> -->

				</div>
			</div>
		</div>


		<div class="row">
			<!-- Order Statistics -->
			<div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
				<div class="card">
					<div class="row row-bordered g-0">

						<div class="col-md-8">
							<div
								style="text-align: center; padding-left: 38%; padding-top: 5px;">
								<select id="selectYear"
									style="width: 150px; border: 1px solid blue;" name="year"
									class="form-select text-center">
									<option value="2024">2024</option>
									<option value="2023">2023</option>
									<option value="2022">2022</option>
									<option value="2021">2021</option>
								</select>
							</div>


							<div id="saleslist"></div>


							<div class="resize-triggers">
								<div class="expand-trigger">
									<div style="width: 659px; height: 377px;"></div>
								</div>
								<div class="contract-trigger"></div>
							</div>
							<div class="resize-triggers">
								<div class="expand-trigger">
									<div style="width: 478px; height: 377px;"></div>
								</div>
								<div class="contract-trigger"></div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card-body">
								<div class="text-center">
									<div class="dropdown">
										
									</div>
								</div>
							</div>
							<div id="revenue" style="min-height: 154.875px;"></div>
							<!-- <div class="text-center fw-semibold pt-3 mb-2">62% 매출 성장</div> -->





							<div class="resize-triggers">
								<div class="expand-trigger">
									<div style="width: 240px; height: 377px;"></div>
								</div>
								<div class="contract-trigger"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-4 col-md-4 order-1 yearly-sta">
				
			</div>
			<!--/ Transactions -->
		</div>


		<div class="row">
			<input style="width: 200px;" type="month" class="form-control" name="glance">

			<div class="card" id="daySale"></div>
		</div>
	</div>
	<!-- / Content -->




	<div id="chart"></div>
	<!-- / Footer -->
	<div class="content-backdrop fade"></div>
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
	salesPage();
	etcPage();
	iconPage();
	revenue();
	daySale();
	yearlysta();
	catesta();
});



function etcPage() {
	
	let url = "${pageContext.request.contextPath}/admin/statistics/etclist";
	let query = '';
	
	let selector = "#etcList";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}

function iconPage() {
	
	let url = "${pageContext.request.contextPath}/admin/statistics/iconlist";
	let query = '';
	
	let selector = "#iconList";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}

function salesPage(selectedYear) {
	
	let url = "${pageContext.request.contextPath}/admin/statistics/saleslist";
	let query = 'selectedYear='+selectedYear;
	
	let selector = "#saleslist";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}

function revenue() {
	
	let url = "${pageContext.request.contextPath}/admin/statistics/revenuelist";
	let query = '';
	let selector = "#revenue";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}


function daySale(selectedDate) {
	
	var gogo;
	if (!selectedDate) {
		let today = new Date();   

		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		gogo = year+'-0'+month
		console.log(gogo);
		
		 // input 요소 찾기
	    let inputElement = document.querySelector('input[name="glance"]');
	    
	    // input 요소의 값을 변경
	    if (inputElement) {
	        inputElement.value = gogo;
	    }
		
	}else{
		gogo = selectedDate;
	}
	
	console.log(gogo+'gogogogogogo');
	
	let url = "${pageContext.request.contextPath}/admin/statistics/daysalelist";
	let query = 'gogo='+gogo;
	let selector = "#daySale";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}


const monthInput = $('input[type="month"].form-control');

// change 이벤트에 대한 리스너 추가
monthInput.change(function () {
    // 선택된 날짜를 콘솔에 출력
    const selectedDate = $(this).val();
    daySale(selectedDate);
});


$("#selectYear").change(function () {
    var selectedYear = $(this).val();
    salesPage(selectedYear);
});

function catesta(){
	
	let url = "${pageContext.request.contextPath}/admin/statistics/catesta"; 
	let query = ""
	let search = $('form[name=searchForm]').serialize();
	query = query+"&"+search;
	let selector = ".cata-list";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);

}


function yearlysta(){
	
	let url = "${pageContext.request.contextPath}/admin/statistics/yearlysta"; 
	let query = ""
	let search = $('form[name=searchForm]').serialize();
	query = query+"&"+search;
	let selector = ".yearly-sta";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);

}




</script>






