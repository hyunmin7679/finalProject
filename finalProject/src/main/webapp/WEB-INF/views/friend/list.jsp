<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<style type="text/css">
.body-container {
	max-width: 800px;
}

</style>

<c:url var="listUrl" value="/friend/list">
	<c:if test="${not empty kwd}">
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

function searchList() {
	const f = document.searchForm;
	f.submit();
}
function searchinsert() {
	const f = document.insertForm;
	f.submit();
}
</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-app"></i> 친구목록 </h3>
		</div>
		
	<form name="SearchForm" method="post">
	    <input type="hidden" name="kwd" value="">
	</form>
	<!-- 
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
		</div> -->
		
		<div class="body-main">
			
	        <div class="row board-list-header">
	            <div class="col-auto me-auto dataCount"></div>
	            <div class="col-auto">&nbsp;</div>
	        </div>				
			<form name="insertForm" action="${pageContext.request.contextPath}/friend/accept" method="post">
			<table class="table table-hover board-list">
				<thead class="table-light">
					<tr>
						<th width="100">작성자z</th>
						<th width="100">작성일</th>
						
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${receivedlist}" varStatus="status">
						<tr>
							<td>${dto.to_Friend}</td>
							<td><button type="button" class="btn btn-light" onclick="searchinsert()"><i class="fa-solid fa-check"></i></button></td>
							<td><input type="hidden" name="userName" value="${dto.to_Friend}"></td>
						</tr>
					</c:forEach>
					
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${dto.to_Friend}</td>
							<td>${dto.reg_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
			<div class="page-navigation"></div>

			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/friend/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/friend/list" method="post">
						<div class="col-auto p-1">
							<select name="schType" class="form-select">
								<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
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
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/friend/addfriendlist';">친구추가하기!</button>
				</div>
			</div>

		</div>
	</div>
</div>

<script>
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

$(function(){
	listPage(1);
	
    $("button[role='tab']").on("click", function(e){
		// const tab = $(this).attr("aria-controls");
    	listPage(1);
    	
    });
});

// 글리스트 및 페이징 처리
function listPage(page) {
	
	let url = "${pageContext.request.contextPath}/friend/list";
	let query = "page="+page";
	let search = $('form[name=SearchForm]').serialize();
	
	query = query+"&"+search;
	
	console.log(query);
	
	let selector = "#nav-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "text", fn);
}


</script>