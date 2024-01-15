<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 1000px;
}

.box {padding-bottom: 10px; border-bottom: 1px solid gray; font-size: 14px; font-weight: bold; text-align: right;}
.non-data {text-align: center; margin:30px; padding-top: 20px; font-weight: bold; font-size: 16px; color: gray;}

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
.score-star .on { color: #00D8FF; }

.md-img img { width: 150px; height: 150px; cursor: pointer; object-fit: cover; }
.deleteReview, .deleteQuestion { cursor: pointer; padding-left: 5px; }
.deleteReview:hover, .deleteQuestion:hover { font-weight: 500; color: #2478FF; }
</style>

<script type="text/javascript">
$(function(){
	$("button[role='tab']").on('click', function(){
		const tab = $(this).attr("aria-controls");
		
		if(tab === "1") {
			listCoupon(1);
		} else if(tab === "2"){
			listPoint(1);
		}
	});
	
	let mode = "${mode}";
	if(mode === "point") {
		listPoint(1);
	} else {
		listCoupon(1);
	}
	
});

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

<div class="container">
	<div class="body-container">	
		<div class="body-main">

			<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link ${mode=='coupon'?'active':'' }" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="false"> 내 쿠폰 </button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link ${mode=='point'?'active':'' }" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false"> 포인트 내역 </button>
				</li>
			</ul>
			
			<div class="tab-content pt-2" id="myTabContent">
				<div class="tab-pane fade ${mode=='coupon'?'active show':'' }" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
					<div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">보유중인 내 쿠폰</p> 
					</div>
					
					<div class="mt-2 list-coupon" ></div>
				</div>
				
				<div class="tab-pane fade ${mode=='point'?'active show':'' }" id="tab-pane-2" role="tabpanel" aria-labelledby="tab-2" tabindex="0">
					<div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">포인트 사용내역</p> 
					</div>
			
					<div class="mt-1 p-2 list-point"></div>
				</div>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
// coupon -------------
function listCoupon(page) {
	let url = '${pageContext.request.contextPath}/coupon/myCoupon';
	let query = 'pageNo='+page;
	
	const fn = function(data) {
		printCoupon(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);	
}

function printCoupon(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	console.log(dataCount);
	
	let out = '';
	
	if(dataCount > 0) {
	out += ' <div><table class="table">';
	out += '	<thead> <tr class="bg-light text-center">'
	out += ' 	<th colspan="2">쿠폰코드</th>';
	out += ' 	<th colspan="2">쿠폰이름</th>';
	out += ' 	<th colspan="2">사용카테고리</th>';
	out += ' 	<th width="120">할인율</th>';
	out += ' 	<th width="120">시작일</th>';
	out += ' 	<th width="120">종료일</th>';
	out += ' 	</tr> </thead> <tbody>';
	
	for(let item of data.list) {
		let couponNum = item.couponNum;
		let memberIdx = item.memberIdx;
		let couponCode = item.couponCode;
		let couponName = item.couponName;
		let couponstate = item.couponstate;
		let couponDiscount = item.couponDiscount;
		let startCouponDate = item.startCouponDate;
		let endCouponDate = item.endCouponDate;
		let categoryName = item.categoryName;
		
		out += '   <tr class="text-center" valign="middle">';
		out += '  <td colspan="2">'+couponCode+'</td>';
		out += '  <td colspan="2">'+couponName+'</td>';
		out += '  <td colspan="2">'+categoryName+'</td>';
		out += '  <td width="120">'+couponDiscount+'%</td>';
		out += '  <td width="120">'+startCouponDate+'</td>';
		out += '  <td width="120">'+endCouponDate+'</td>';
	}
	
	out += '  </tbody></table></div>';
	}
	if(dataCount > 0) {
		out += '<div class="page-navigation">' + paging + '</div>';
	} else {
		out += '<div class="non-data">보유하고 계신 쿠폰이 없습니다.</div>';
	}
	
	$('.list-coupon').html(out);	
}


// point -------------
function listPoint(page) {
	let url = '${pageContext.request.contextPath}/coupon/point';
	let query = 'pageNo='+page;
	
	const fn = function(data) {
		printPoint(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);	
}

function printPoint(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	let userPoint = data.userPoint;
	
	let out = '';
	
	out += '  <p class ="box">총 보유포인트: '+userPoint+' P</p>'
	
	if(dataCount > 0) {
		
	out += ' <div><table class="table">';
	out += '	<thead> <tr class="bg-light text-center">'
	out += ' 	<th colspan="2">번호</th>';
	out += ' 	<th colspan="2">일자</th>';
	out += ' 	<th width="120">구분</th>';
	out += ' 	<th width="120">포인트</th>';
	out += ' 	</tr> </thead> <tbody>';
	
	for(let item of data.list) {
		let pointNum = item.pointNum;
		let reg_date = item.reg_date;
		let memo = item.memo;
		let p_qyt = item.p_qyt;
		
		out += '   <tr class="text-center" valign="middle">';
		out += '  <td colspan="2">'+pointNum+'</td>';
		out += '  <td colspan="2">'+reg_date+'</td>';
		out += '  <td width="120">'+memo+'</td>';
		out += '  <td width="120">'+p_qyt+'</td>';
		
		}
	
		out += '  </tbody></table></div>';
	}
	
	if(dataCount > 0) {
		out += '<div class="page-navigation">' + paging + '</div>';
	} else {
		out += '<div class="non-data">포인트 사용내역이 없습니다.</div>';
	}

	$('.list-point').html(out);
}

</script>
