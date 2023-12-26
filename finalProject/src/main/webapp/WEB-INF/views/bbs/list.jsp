<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>

<c:url var="listUrl" value="/bbs/list">
	<c:if test="${not empty kwd}">
		<c:param name="schType" value="${schType}"/>
		<c:param name="kwd" value="${kwd}"/>
	</c:if>
</c:url>

<script type="text/javascript">
window.addEventListener('load', function(){
	let page = ${page};
	let pageSize = ${size};
	let dataCount = ${dataCount};
	let url = '${listUrl}'; 
	
	let total_page = pageCount(dataCount, pageSize);
	let paging = pagingUrl(page, total_page, url);
	
	document.querySelector('.dataCount').innerHTML = dataCount + '개 ('
			+ page + '/' + total_page + '페이지)';

	document.querySelector('.page-navigation').innerHTML = 
		dataCount === 0 ? '등록된 게시물이 없습니다.' : paging;
});

//탭
/*$(function(){
	$("button[role='tab']").on('click', function(){
		const tab = $(this).attr("aria-controls");
		
		if(tab === "1") { // 나눔
			//location.href = "${pageContext.request.contextPath}/admin/order/status";
		} else if( tab === "2") { // 상담 
			//location.href = "${pageContext.request.contextPath}/admin/order/delivery";
		} else if( tab === "3") { // 자유
			
		} else if( tab === "4") { // 산책메이트
			
		} 
	});
});*/
</script>

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

function searchList() {
	const f = document.searchForm;
	f.submit();
}

$(function(){
	listPage(1);
	
    $("button[role='tab']").on("click", function(e){
    	listPage(1);
    	
    });
});

// 글리스트 및 페이징 처리
function listPage(page) {
	const $tab = $("button[role='tab'].active");
	let categoryNum = $tab.attr("data-categoryNum");
	
	let url = "${pageContext.request.contextPath}/bbs/list";
	let query = "pageNo="+page+"&categoryNum="+categoryNum;
	let search = $('form[name=bbsSearchForm]').serialize();
	query = query+"&"+search;
	
	console.log(query);
	
	let selector = "#nav-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "text", fn);
}
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-app"></i> 게시판 </h3>
		</div>
		
	<form name="bbsSearchForm" method="post">
		<input type="hidden" name="schType" value="all">
	    <input type="hidden" name="kwd" value="">
	</form>
	
		<div class="nav-align-top mb-4">
		  <ul class="nav nav-pills mb-3" role="tablist">   
	        <li class="nav-item" role="presentation">
				<button class="nav-link active" id="tab-0" data-bs-toggle="tab" data-bs-target="#nav-content" 
					type="button" role="tab" aria-controls="0" aria-selected="true" data-categoryNum="0">전체</button>
			</li>		
			<c:forEach var="dto" items="${listCategory}" varStatus="status">
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="tab-${status.count}" data-bs-toggle="tab" 
						data-bs-target="#nav-content" type="button" role="tab" aria-controls="${status.count}" 
						aria-selected="true" data-categoryNum="${dto.categoryNum}">${dto.categoryName}</button>
				</li>
			</c:forEach>
	   </ul>
		</div>
		
		<div class="body-main">

	        <div class="row board-list-header">
	            <div class="col-auto me-auto dataCount"></div>
	            <div class="col-auto">&nbsp;</div>
	        </div>				
			
			<table class="table table-hover board-list">
				<thead class="table-light">
					<tr>
						<th width="60">번호</th>
						<th>제목</th>
						<th width="100">작성자</th>
						<th width="100">작성일</th>
						<th width="70">조회수</th>
						<th width="70">댓글수</th>

					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td class="left">
								<c:url var="url" value="/bbs/article">
									<c:param name="communityNum" value="${dto.communityNum}"/>
									<c:param name="page" value="${page}"/>
									<c:if test="${not empty kwd}">
										<c:param name="schType" value="${schType}"/>
										<c:param name="kwd" value="${kwd}"/>
									</c:if>									
								</c:url>
								<a href="${url}" class="text-reset">${dto.subject}</a>
								<c:if test="${dto.replyCount!=0}">(${dto.replyCount})</c:if>
							</td>
							<td>${dto.userName}</td>
							<td>${dto.reg_date}</td>
							<td>${dto.hitCount}</td>
							<td>${dto.replyCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page-navigation"></div>

			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/bbs/list" method="post">
						<div class="col-auto p-1">
							<select name="schType" class="form-select">
								<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
								<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
								<option value="reg_date" ${schType=="reg_date"?"selected":""}>등록일</option>
								<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
								<option value="content" ${schType=="content"?"selected":""}>내용</option>
							</select>
						</div>
						<div class="col-auto p-1">
							<input type="text" name="kwd" value="${kwd}" class="form-control">
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
						</div>
					</form>
				</div>
				<div class="col text-end">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/write';">글올리기</button>
				</div>
			</div>

		</div>
	</div>
</div>