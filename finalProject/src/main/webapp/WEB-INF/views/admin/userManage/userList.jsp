<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!-- Content wrapper -->
<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="py-3 mb-4">
			<span>&nbsp;&nbsp;</span>회원 리스트
		</h4>
		<div class="row g-4 mb-4">
			<div class="col-sm-6 col-xl-3">
				<div class="card">
					<div class="card-body">
						<div class="d-flex align-items-start justify-content-between">
							<div class="content-left">
								<span>회원현황</span>
								<div class="d-flex align-items-end mt-2">
									<h4 class="mb-0 me-2">${result}</h4>
									<small class="text-success">${dailyresult}[하루 기준 증감]</small>
								</div>
								<p class="mb-0">총 회원 수</p>
							</div>
							<div class="avatar">
								<span class="avatar-initial rounded bg-label-primary"> <i
									class="bx bx-user bx-sm"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-xl-3">
				<div class="card">
					<div class="card-body">
						<div class="d-flex align-items-start justify-content-between">
							<div class="content-left">
								<span>활동 회원 현황</span>
								<div class="d-flex align-items-end mt-2">
									<h4 class="mb-0 me-2">${activeuser}</h4>
									<small class="text-success">${activeuserdiff}</small>
								</div>
								<p class="mb-0">지난주 기준</p>
							</div>
							<div class="avatar">
								<span class="avatar-initial rounded bg-label-danger"> <i
									class="bx bx-user-check bx-sm"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-xl-3">
				<div class="card">
					<div class="card-body">
						<div class="d-flex align-items-start justify-content-between">
							<div class="content-left">
								<span>구매 회원</span>
								<div class="d-flex align-items-end mt-2">
									<h4 class="mb-0 me-2">${purchaseUserCount}</h4>
									<small class="text-danger">${purchasediff }</small>
								</div>
								<p class="mb-0">주단위 누적</p>
							</div>
							<div class="avatar">
								<span class="avatar-initial rounded bg-label-success"> <i
									class="bx bx-group bx-sm"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-xl-3">
				<div class="card">
					<div class="card-body">
						<div class="d-flex align-items-start justify-content-between">
							<div class="content-left">
								<span>휴면 계정 현황</span>
								<div class="d-flex align-items-end mt-2">
									<h4 class="mb-0 me-2 pb-4">${deactiveuser}</h4>
								</div>
							</div>
							<div class="avatar">
								<span class="avatar-initial rounded bg-label-warning"> <i
									class="bx bx-user-voice bx-sm"></i>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Users List Table -->
		<div class="card">
			<div class="card-header border-bottom">
				<h5 class="card-title">계정 분류</h5>
				<div
					class="dt-action-buttons text-xl-end text-lg-start text-md-end text-start d-flex align-items-center justify-content-end flex-md-row flex-column mb-3 mb-md-0">
					<div id="DataTables_Table_0_filter" class="dataTables_filter">
						<label> <input type="text" class="form-control" name="kwd"
							id="kwd" value="${kwd}" placeholder="검색할 이름을 입력하세요"
							aria-controls="DataTables_Table_0">
						</label>
					</div>
					<div class="col-auto p-1">
						<button type="button" class="btn btn-light" onclick="searchList()">
							<i class='bx bx-search-alt'></i>
						</button>
					</div>
				</div>
			</div>
			<div class="card-datatable">
				<div id="DataTables_Table_0_wrapper"
					class="dataTables_wrapper dt-bootstrap5 no-footer">
					<div class="row mx-2">
						<div class="col-md-2">
							<div class="me-3"></div>
						</div>
						<div class="row mx-2" style="border-top: 2px sold;">
							<ul
								style="float: left; list-style: none; margin-top: 16px; font-weight: bold;"
								class="sort">
								<li class="control sorting_disabled dtr-hidden"
									style="width: 0px; float: left;" aria-label=""></li>
								<li class="sorting sorting_desc" tabindex="0"
									aria-controls="DataTables_Table_0"
									style="width: 200px; float: left; margin-left: 7%;"
									aria-label="User: activate to sort column ascending"
									aria-sort="descending">회원</li>
								<li class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0"
									style="width: 129px; float: left; margin-left: 15%;"
									aria-label="Role: activate to sort column ascending">가입일수
									<i class='which bx bxs-chevron-up' data-sorter="1"
									style="cursor: pointer;"></i> <i
									class='which bx bxs-chevron-down' data-sorter="2"
									style="cursor: pointer;"></i>
								</li>
								<li class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0"
									style="width: 83px; float: left; margin-left: 4%;"
									aria-label="Plan: activate to sort column ascending">주문횟수</li>

								<li class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0"
									style="width: 120px; float: left; margin-left: 4%;"
									aria-label="Billing: activate to sort column ascending">구매금액
									<i class='which bx bxs-chevron-up' data-sorter="3"
									style="cursor: pointer;"></i> <i
									class='which bx bxs-chevron-down' data-sorter="4"
									style="cursor: pointer;"></i>
								</li>
								<li class="sorting me-4" tabindex="0"
									aria-controls="DataTables_Table_0"
									style="width: 120px; float: left; margin-left: 7%;"
									aria-label="Status: activate to sort column ascending">계정상태
									<i class='bx bxs-user-check which' data-sorter="5"
									style="cursor: pointer;"></i> <i class='bx bxs-user-x which'
									data-sorter="6" style="cursor: pointer;"></i>
								</li>
								<li class="sorting_disabled" style="width: 30px; float: left;"
									aria-label="Actions"></li>
							</ul>
						</div>
						<!-- list 넣기 -->
						<div class="user-list"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<form name="searchForm" method="post">
	<input type="hidden" name="kwd" value="">
</form>
<!-- / Content -->
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
	var orders = 10;
	userlist(1, orders);
}

$(".sort").on("click", "i.which", function() {
	
    var orders = $(this).attr("data-sorter");
    
    userlist(1, orders);
});

function userlist(page, orders){
	
	let url = "${pageContext.request.contextPath}/admin/userManage/"+orders+"/list"; 
	let query = "pageNo="+page;
	let search = $('form[name=searchForm]').serialize();
	query = query+"&"+search;
	let selector = ".user-list";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);

}

function searchList(){
	const f = document.searchForm; 
	f.kwd.value = $.trim($("#kwd").val());
	
	userlist(1, 10);
	
}

$(function() {
	
    $('.user-list').on('click', '.sanctrigger', function() {
    	
        var memberIdxx = $(this).data('enablenum');
        $('.modal-body #memberIdx').val(memberIdxx);
        console.log(memberIdxx);
        
        
   
    });
    
	
    
	$('.user-list').on('click', '.sanctrigger', function() {
    	
        var userName = $(this).attr('data-userName');
        $('.modal-body #userName').val(userName);
        var userNametext = userName + '님을 제재하시겠습니까?'
        $('#editUserLabel').html(userNametext);
   
    });
    
	
	
	
    $('.user-list').on('click', '.sancconfirm', function() {
        var memberIdx = $('#editUser #memberIdx').val();
        $(this).data('final', memberIdx);
        
        var enableNum = $('#editUser #enabled').val();
        $(this).data('finalNum', enableNum);
        
        var sancNum= $('#rereason').val();
        var sancMemo = $('#rememo').val();
        console.log(memberIdx);
        console.log(sancNum);
        console.log(sancMemo);
        
        usersanction(memberIdx,sancNum,sancMemo);
        $('#editUser').modal('hide');
    });
    
});


function usersanction(memberIdx,sancNum,sancMemo){
	

	let url = "${pageContext.request.contextPath}/admin/userManage/"+memberIdx+"/sanction"; 
	let query ="sancNum="+sancNum+"&sancMemo="+encodeURIComponent(sancMemo);
	const fn = function(data){
		userlist(1, 10);
	};
	
	ajaxFun(url, "post", query, "json", fn);

}


</script>