<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">



		<h4 class="py-3 mb-4">
			<span>&nbsp;&nbsp;</span>리뷰 관리
		</h4>

		<div class="row mb-4 g-4">
			<div class="col-md-6">
				<div class="card h-100">
					<div class="card-body row widget-separator">
						<div class="col-sm-5 border-shift border-end">
							<h2>
								평균점수<i class='bx bxs-star mb-2 ms-1'></i>
							</h2>
							<h2>${avgscore/100}</h2>
							<br> <br> <br>
							<p class="fw-medium mb-1">총 ${dataCount}개의 리뷰</p>
							<hr class="d-sm-none">
						</div>
						<div
							class="col-sm-7 gy-1 text-nowrap d-flex flex-column justify-content-between ps-4 gap-2 pe-3">
							<c:forEach var="dto" items="${scorelist}" varStatus="status">
								<div class="d-flex align-items-center gap-3">
									<small>${dto.score}</small>
									<div class="progress w-100" style="height: 10px;">
										<div class="progress-bar bg-primary" role="progressbar"
											style="width: ${dto.count_per_score/dataCount*100}%"
											aria-valuenow="61.50" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
									<small class="w-px-20 text-end">${dto.count_per_score}</small>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card h-100">
					<div class="card-body row">
						<div class="col-sm-5">
							<div class="mb-5">
								<h4 class="mb-2 text-nowrap">리뷰 통계</h4>
								<p class="mb-0">
									<span class="me-2">${empty reviewweek ? 0 : reviewweek}개의
										새로운 리뷰</span>
								</p>
								<small class="text-muted">1주 기준</small>
							</div>

							<div>
								<c:forEach var="vo" items="${reviewupdown}" varStatus="status">
									<h5 class="mb-2 fw-normal">
										<span
											class="text-${vo.score_group == '긍정적' ? 'success' : vo.score_group == '부정적' ? 'danger' : 'warning'} me-1">${vo.score_group_percentage_sum/100 }%</span>${vo.score_group}인
										리뷰
									</h5>
								</c:forEach>
								<small class="text-muted">1달 기준</small>
							</div>
						</div>
						<div
							class="col-sm-7 d-flex justify-content-sm-end align-items-end">
							<div id="reviewsChart"></div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<!-- review List Table -->
		<div class="card">
			<div class="card-datatable ">
				<div id="DataTables_Table_0_wrapper"
					class="dataTables_wrapper dt-bootstrap5 no-footer">
					<div
						class="card-header d-flex align-items-md-center pb-md-2 flex-wrap justify-content-end"
						style="width: 100%;">
						<div class="me-2 ms-n2">
							<div id="DataTables_Table_0_filter" class="dataTables_filter">
							</div>
						</div>
						<div class="review_filter mb-2 mt-2">
						</div>
						<div
							class="dt-action-buttons text-xl-end text-lg-start text-md-end text-start d-flex align-items-end align-items-md-center justify-content-md-end pt-0 gap-3 flex-wrap">
							<div class="slay dataTables_length  md-3 mb-2"
								id="DataTables_Table_0_length" style="padding-left: 750px;">
								<label>
									<i class='that bx bx-refresh' data-sorter="5" style="cursor: pointer;"></i>
								</label>
							</div>
						</div>
					</div>
					<table
						class="sort datatables-review table dataTable no-footer dtr-column collapsed"
						id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info"
						style="width: 100%;">
						<thead>
							<tr>
							
								<th class="control sorting_disabled pe-0" rowspan="1"
									colspan="1" width="10px;" aria-label=""></th>
								<th
									class="sorting_disabled dt-checkboxes-cell dt-checkboxes-select-all"
									rowspan="1" colspan="1" style="width: 20px;" data-col="1"
									aria-label="">공개 여부</th>
								<th class="sorting sorting_asc" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									width="50px;"
									aria-label="Product: activate to sort column descending"
									aria-sort="ascending">상품</th>
								<th class="text-nowrap sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									width="40px;"
									aria-label="Reviewer: activate to sort column ascending">작성자</th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									width="200px"
									aria-label="Review: activate to sort column ascending">별점
									<i class='that bx bx-chevron-up' data-sorter="1" style="cursor: pointer;"></i>
									<i class='that bx bx-chevron-down' data-sorter="2" style="cursor: pointer;"></i></th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 10px;"
									aria-label="Date: activate to sort column ascending">날짜
									<i class='that bx bx-chevron-up' data-sorter="3" style="cursor: pointer;"></i>
									<i class='that bx bx-chevron-down' data-sorter="4" style="cursor: pointer;"></i>
									</th>
								<th class="sorting_disabled dtr-hidden" rowspan="1" colspan="1"
									style="width: 10px;" aria-label="Actions"></th>
							</tr>
						</thead>
						<tbody class="review-list">

						</tbody>
					</table>
					<div class="row mx-2 " style="width: 100%;">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_info mt-3" id="DataTables_Table_0_info"
								role="status" aria-live="polite">1-10개/100개 중</div>
						</div>
						<div class="col-sm-12 col-md-6 mt-3 ">
							<div class="dataTables_paginate paging_simple_numbers"
								id="DataTables_Table_0_paginate">
								<ul class="pagination justify-content-end">
									<li class="paginate_button page-item previous disabled"
										id="DataTables_Table_0_previous"><a
										aria-controls="DataTables_Table_0" aria-disabled="true"
										role="link" data-dt-idx="previous" tabindex="0"
										class="page-link">Previous</a></li>
									<li class="paginate_button page-item active"><a href="#"
										aria-controls="DataTables_Table_0" role="link"
										aria-current="page" data-dt-idx="0" tabindex="0"
										class="page-link">1</a></li>
									<li class="paginate_button page-item "><a href="#"
										aria-controls="DataTables_Table_0" role="link" data-dt-idx="1"
										tabindex="0" class="page-link">2</a></li>
									<li class="paginate_button page-item "><a href="#"
										aria-controls="DataTables_Table_0" role="link" data-dt-idx="2"
										tabindex="0" class="page-link">3</a></li>
									<li class="paginate_button page-item "><a href="#"
										aria-controls="DataTables_Table_0" role="link" data-dt-idx="3"
										tabindex="0" class="page-link">4</a></li>
									<li class="paginate_button page-item "><a href="#"
										aria-controls="DataTables_Table_0" role="link" data-dt-idx="4"
										tabindex="0" class="page-link">5</a></li>
									<li class="paginate_button page-item disabled"
										id="DataTables_Table_0_ellipsis"><a
										aria-controls="DataTables_Table_0" aria-disabled="true"
										role="link" data-dt-idx="ellipsis" tabindex="0"
										class="page-link">…</a></li>
									<li class="paginate_button page-item "><a href="#"
										aria-controls="DataTables_Table_0" role="link" data-dt-idx="9"
										tabindex="0" class="page-link">10</a></li>
									<li class="paginate_button page-item next"
										id="DataTables_Table_0_next"><a href="#"
										aria-controls="DataTables_Table_0" role="link"
										data-dt-idx="next" tabindex="0" class="page-link">Next</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- / Content -->
<div class="content-backdrop fade"></div>

<div class="modal fade modalwrap" id="editUser" tabindex="-1"
	role="dialog" aria-labelledby="editUserLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 style="margin: auto;" class="modal-title" id="editUserLabel"></h5>
			</div>
			<div class="modal-body" style="font: bold; margin: auto;">
				<input type="text" name="num" id="num" value=""
					style="display: none;" />
				<div>해당 리뷰를 숨기시겠습니까?</div>
			</div>
			<div class="modal-footer" style="margin: auto;">
				<button type="button" class="btn btn-danger hideconfirm"
					id="hideconfirm" data-reviewn="">확인</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade modalwrap" id="uneditUser" tabindex="-1"
	role="dialog" aria-labelledby="editUserLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 style="margin: auto;" class="modal-title" id="editUserLabel"></h5>
			</div>
			<div class="modal-body" style="font: bold; margin: auto;">
				<input type="text" name="num" id="num" value=""
					style="display: none;" />
				<div>해당 리뷰를 공개시겠습니까?</div>
			</div>
			<div class="modal-footer" style="margin: auto;">
				<button type="button" class="btn btn-danger showconfirm"
					id="showconfirm" data-reviewn="">확인</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade modalwrap" id="answerReview" tabindex="-1"
	role="dialog" aria-labelledby="editUserLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 style="margin: auto;" class="modal-title" id="editUserLabel"></h5>
			</div>
			<div class="modal-body" style="font: bold; margin: auto;">
				<input type="text" name="num" id="num" value=""
					style="display: none;" />
				<div style="text-align: center;">리뷰 답변 내용을 입력하세요</div>

				<div class="col-12  mt-3" style="margin: auto;">
					<input style="text-align: center;" type="text" id="rememo"
						name="rememo" class="form-control" placeholder="답변">
				</div>
			</div>
			<div class="modal-footer" style="margin: auto;">
				<button type="button" class="btn btn-danger answerconfirm"
					id="answerconfirm" data-reviewn="">확인</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
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
		    	} else if(jqXHR.status === 402) {
		    		alert('권한이 없습니다.');
		    		return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	} else if(jqXHR.status === 410) {
		    		alert('삭제된 게시물입니다.');
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
window.onload=function(){
	var sort = 5;
	reviewlist(1, sort);
}

function reviewlist(page, sort){
	
	let url = "${pageContext.request.contextPath}/admin/reviewManage/"+sort+"/list"; 
	let query = "pageNo="+page;
	let search = $('form[name=searchForm]').serialize();
	query = query+"&"+search;
	let selector = ".review-list";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);

}

$(function(){
	$('.review-list').on('click', '#hidetrigger', function() {
    	
        var reviewnum = $(this).data('num');
        $('.modal-body #num').val(reviewnum);
        console.log(reviewnum);
          
    });
	
	$('.review-list').on('click', '#showtrigger', function() {
    	
        var reviewnum = $(this).data('num');
        $('.modal-body #num').val(reviewnum);
        console.log(reviewnum);
          
    });
	
	$('.review-list').on('click', '#answertrigger', function() {
    	
        var reviewnum = $(this).data('num');
        $('.modal-body #num').val(reviewnum);
        console.log(reviewnum);
          
    });
	
	$('#hideconfirm').on('click', function() {
	    var reviewnumber = $('#editUser #num').val();        
	    $(this).data('reviewn', reviewnumber);
	    
	    console.log(reviewnumber);
	    
	    hidereview(reviewnumber);
	    $('#editUser').modal('hide');
	});
	
	$('#showconfirm').on('click', function() {
	    var reviewnumber = $('#uneditUser #num').val();        
	    $(this).data('reviewn', reviewnumber);
	    
	    console.log(reviewnumber);
	    
	    showreview(reviewnumber);
	    $('#uneditUser').modal('hide');
	});
	
	
	$('#answerconfirm').on('click', function() {
	    var reviewnumber = $('#answerReview #num').val();        
	    $(this).data('reviewn', reviewnumber);
	    var sancMemo = $('#rememo').val();
	    console.log(reviewnumber);
	    
	    answerreview(reviewnumber,sancMemo);
	    
	    $('#answerReview').modal('hide');
	});
	
	
});

function hidereview(reviewnumber){
	
	let url = "${pageContext.request.contextPath}/admin/reviewManage/"+reviewnumber+"/hide";
	let query ="";
	const fn = function(data){
		reviewlist(1,5);
	};
	ajaxFun(url, "post", query, "json", fn);
}

function showreview(reviewnumber){
	
	let url = "${pageContext.request.contextPath}/admin/reviewManage/"+reviewnumber+"/show";
	let query ="";
	const fn = function(data){
		reviewlist(1,5);
	};
	ajaxFun(url, "post", query, "json", fn);
}

function answerreview(reviewnumber,sancMemo){
	
	let url = "${pageContext.request.contextPath}/admin/reviewManage/"+reviewnumber+"/reviewanswer";
	let query = "sancMemo="+encodeURIComponent(sancMemo);
	const fn = function(data){
		reviewlist(1,5);
	};
	ajaxFun(url, "post", query, "json", fn);
}

$(".sort").on("click", "i.that", function() {
	
    var sort = $(this).attr("data-sorter");
    
    reviewlist(1, sort);
});

$(".slay").on("click", "i.that", function() {
	
    var sort = $(this).attr("data-sorter");
    
    reviewlist(1, sort);
});



</script>