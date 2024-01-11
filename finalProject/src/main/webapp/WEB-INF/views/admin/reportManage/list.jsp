<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<style>
        /* 초기 스타일 설정 */
        .highlight {
            color: blue;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
<!-- / Navbar -->



<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">


		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">신고관리 /</span> 신고 게시물 조회
		</h4>
		<div class="row">


			<div class="col-xl-6">

				<div class="nav-align-top mb-4" style="width: 1360px;">

					<ul class="nav nav-pills mb-3 nav-fill" role="tablist"
						style="width: 500px;">
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link active" role="tab"
								data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home"
								aria-controls="navs-pills-justified-home" aria-selected="false"
								tabindex="-1">
								<i class="tf-icons bx bx-home me-1"></i> 신고 당한 게시물 
							</button>
						</li>
						<!-- 
        <li class="nav-item" role="presentation">
          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-messages" aria-controls="navs-pills-justified-messages" aria-selected="false" tabindex="-1"><i class="tf-icons bx bx-message-square me-1"></i></button>
        </li>
         -->
					</ul>
					<div class="tab-content" style="width: 1380px;">

						<div class="tab-pane fade active show"
							id="navs-pills-justified-home" role="tabpanel">



							<div class=" text-nowrap">
								<table class="table table-bordered" style="width: 1330px;">
									<thead>
										<tr class="text-center" style="background-color: gray;">
											<th colspan="5">조회하기</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="width: 6%; text-align: center;"><span
												class="fw-medium">카테고리</span></td>
											<td colspan="4">

												<div
													class="d-flex justify-content-between align-items-center row gap-md-0">

													<div class="col-4 product_status" style="width: 300px;">
														<select id="ProductStatus"
															class="form-select text-capitalize">
															<option value="">카테고리전체</option>
														</select>
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
															<option value="">등록일자</option>
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
											<td style="text-align: center;"><span class="fw-medium">게시글찾기</span></td>
											<td colspan="4">

												<div
													class="d-flex justify-content-between align-items-center row gap-md-0">

													<div class="col-4 product_status" style="width: 300px;">
														<select id="ProductStatus"
															class="form-select text-capitalize">
															<option value="">제목</option>
															<option value="">유저아이디</option>
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
							<!--/ Bordered Table -->


							<br />
							<!--  @@@@@@@@@@@@@@@@@@@ -->
							<div class="reportlist" id="reportlist"></div>


						</div>



					</div>

				</div>
			</div>
			<!--/ User Content -->
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="backDropModal" 
	tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDialogModalLabel">신고상세보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="modal-order-detail">



					<div>


						<div class="mt-2 border-top pt-2">
							<div class="mt-3 p-3">

								<table class="table board-list order-detail-list">
									<thead class="table-light">
										<tr>
											<th width="200">신고일</th>
											<th width="100">신고자</th>
											<th width="290">신고사유</th>
											<th width="290">신고내용</th>
										</tr>
									</thead>

									<tbody style="width: auto;" id="reportList">
										
									</tbody>
								</table>
								<table class="table table-borderless mb-1">
									<tbody>
										<tr>

											<td class="text-end">
												<div class="row justify-content-end delivery-update-area">
													<div class="col-auto">
														<button type="button"
															class="btn btn-primary hiddenComu">게시글숨김
															/ 숨겨져있으면 표시로</button>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- /Modal -->




<!-- Footer -->
<footer class="content-footer footer bg-footer-theme"> </footer>



<script type="text/javascript">
//ajax
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
		    	} else if(jqXHR.status === 401) {
		    		return false;
		    	} else if(jqXHR.status === 402) {
		    		alert('권한이 없습니다.');
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

//글리스트 및 페이징 처리
function listPage(page) {
	
	let url = "${pageContext.request.contextPath}/admin/reportManage/reportList";
	
	// let schType = $('#ProductStatus').val();
    // let kwd = $('input[name="kwd"]').val();
    // console.log(schType);
    // console.log(kwd);
	
	let query = "page="+page
	
	
	let selector = "#reportlist";
	
	const fn = function(data){
		 $(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "text", fn);
}

// modalOn
$('body').on('click', '.modalOn', function () {

    let communityNum = $(this).attr("data-communityNum");
    let showNo = $(this).attr("data-showNo");
	console.log(showNo);
    let query = "communityNum=" + communityNum;
    let url = "${pageContext.request.contextPath}/admin/reportManage/findReporyList";

    const fn = function (data) {
        console.log(data);
        let selector = "#reportList"
        let rowHtml = '';
        console.log(data.list.length);

        for (let i = 0; i < data.list.length; i++) {
            rowHtml += '<tr valign="middle" >';
            rowHtml += '<td>' + data.list[i].reg_date + '</td>';
            rowHtml += '<td>' + data.list[i].reportUser + '</td>';
            rowHtml += '<td>' + data.list[i].reason + '</td>';
            rowHtml += '<td>' + data.list[i].content + '</td>';
            rowHtml += '</tr>';
        }
        $(selector).html(rowHtml);

        // 동적으로 버튼 변경
        let btnHtml = '<button type="button" class="btn btn-primary hiddenComu" ' +
            'data-showNo='+showNo+' data-communityNum='+communityNum+'>';

        if (showNo === "1") {
            btnHtml += '숨김';
        } else {
            btnHtml += '표시';
        }

        btnHtml += '</button>';

        $('.delivery-update-area .col-auto').html(btnHtml);
    };

    ajaxFun(url, "post", query, "json", fn);

    $('#backDropModal').modal('show');

});

$('body').on('click', '.hiddenComu', function () {
    let communityNum = $(this).attr("data-communityNum");
    let showNo = $(this).attr("data-showNo");
    
    if(showNo == 1){
    	showNo = 0 
    }else{
    	showNo = 1
    }
    
    let query = "communityNum="+communityNum+"&showNo="+showNo;
    let url = "${pageContext.request.contextPath}/admin/reportManage/changeShow";
    
    const fn = function (data) {
    		
    	listPage(1);
    	$('#backDropModal').modal('hide');
    };
    
    ajaxFun(url, "post", query, "json", fn);
});





//jQuery를 사용하여 이벤트 리스너 등록
$(document).on("mouseover", ".article", handleMouseOver);
$(document).on("mouseout", ".article", handleMouseOut);

// 마우스를 올렸을 때 실행되는 함수
function handleMouseOver(event) {
    // 클래스를 추가하여 CSS 변경
    $(this).addClass("highlight");
}

// 마우스를 내렸을 때 실행되는 함수
function handleMouseOut() {
    // 클래스를 제거하여 초기 상태로 돌아감
    $(this).removeClass("highlight");
}
</script>










