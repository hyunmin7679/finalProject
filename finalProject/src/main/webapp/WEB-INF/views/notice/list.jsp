<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
@import url('http://fonts.googleapis.com/earlyaccess/notosanskr.css');

.body-container {
	max-width: 800px;
}

i { color:#848484; width: 15px;}
a { color:#848484; font-size: 15px;}
a:hover {color: black; text-decoration: none;}
.category-bar { margin-bottom:20px; display: flex; justify-content: center;}
.bar-item{ width:100px; height:70px; text-align:center;  margin: 10px;}
h3{font-weight: 900;}
.body-title2 {
    color: #424951;
    padding-top: 10px;
    padding-bottom: 5px;
    
  }

.point-item{height:auto; text-align:center; margin: 10px; display: flex; align-items: center;}

.category-bar .active{ border-bottom : 2px solid #ee964b;}

</style>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
function searchList() {
	const f = document.searchForm;
	f.submit();
}
</script>


<div class="container">
	<div class="body-container">
		<div class="body-title2">
		   <p style="font-size: 22px;"><span style="border-bottom: 12px solid #dcf1fb; padding: 0 0 0 0.2em; width: 100%"> <i class="fa-regular fa-file-lines fa" style="margin-right: 5px;"></i> 공지사항</span></p>
		</div>
		<div class="category-bar">
			<div class="bar-item p-3">
				<a href="${pageContext.request.contextPath}/faq/main"><i class="fa-regular fa-circle-question fa-lg"></i><br>FAQ</a>
			</div>
			<div class="point-item">
				<i class="fa-solid fa-angle-right"></i>
			</div>
			<div class="bar-item p-3 active">
				<a href="${pageContext.request.contextPath}/notice/list" ><i class="fa-regular fa-file-lines fa-lg"></i><br>공지사항</a>
			</div>
			<div class="point-item">
				<i class="fa-solid fa-angle-right"></i>
			</div>
			<div class="bar-item p-3">
				<a href="${pageContext.request.contextPath}/qna/list"><i class="fa-solid fa-file-pen fa-lg"></i><br>문의사항</a>
			</div>
	    </div>
	    
		<div class="main">

	        <div class="row board-list-header">
	            <div class="col-auto me-auto">
	            	${dataCount}개(${page}/${total_page} 페이지)
	            </div>
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
						<th width="50">파일</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${noticeList}">
						<tr>
							<td><span class="badge bg-primary">공지</span></td>
							<td class="left">
								<a href="${articleUrl}&num=${dto.num}" class="text-reset">${dto.subject}</a>
							</td>
							<td>${dto.userName}</td>
							<td>${dto.reg_date}</td>
							<td>${dto.hitCount}</td>
							<td>
								<c:if test="${dto.fileCount != 0}">
									<a href="${pageContext.request.contextPath}/notice/zipdownload?num=${dto.num}" class="text-reset"><i class="bi bi-file-arrow-down"></i></a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
									
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td class="left">
								<a href="${articleUrl}&num=${dto.num}" class="text-reset">${dto.subject}</a>
								<c:if test="${dto.gap < 10}">
									<span class="badge text-bg-info">New</span>
								</c:if>
							</td>
							<td>${dto.userName}</td>
							<td>${dto.reg_date}</td>
							<td>${dto.hitCount}</td>
							<td>
								<c:if test="${dto.fileCount != 0}">
									<a href="${pageContext.request.contextPath}/notice/zipdownload?num=${dto.num}" class="text-reset"><i class="bi bi-file-arrow-down"></i></a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>

			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/notice/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/notice/list" method="post">
						<div class="col-4 p-1">
							<select name="schType" class="form-select">
								<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
								<option value="reg_date" ${schType=="reg_date"?"selected":""}>등록일</option>
								<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
								<option value="content" ${schType=="content"?"selected":""}>내용</option>
							</select>
						</div>
						<div class="col-6 p-1">
							<input type="text" name="kwd" value="${kwd}" class="form-control">
						</div>
						<div class="col p-1">
							<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
						</div>
					</form>
				</div>
				<div class="col text-end">
					&nbsp;
				</div>
			</div>

		</div>
	</div>
</div>