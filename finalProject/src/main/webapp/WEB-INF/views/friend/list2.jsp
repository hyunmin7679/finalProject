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
		<div class="body-title2">
		   <p style="font-size: 22px;"><span style="border-bottom: 12px solid #dcf1fb; padding: 0 0 0 0.2em; width: 100%"> <i class="fa-regular fa-comment-dots"></i> 친구추가</span></p>
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
	        <div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/friend/addfriendlist" method="post">
						<div class="col-auto p-1">
						</div>
						<div class="col-auto p-1">
							<input type="text" name="kwd" value="${kwd}" class="form-control">
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
						</div>
					</form>
				</div>		
			<form name="insertForm" action="${pageContext.request.contextPath}/friend/addfriend" method="post">
			<table class="table table-hover board-list">
				<thead class="table-light">
					<tr>
						<th width="100">작성자</th>
						<th width="100"></th>
						
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${dto.userName}</td>
							<td><button type="button" class="btn btn-light" onclick="searchinsert()"><i class="fa-solid fa-plus"></i></button></td>
							<td><input type="hidden" name="userName" value="${dto.userName}"></td>
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




</script>