<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.selectbox {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 4px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.selectbox[readonly] { background-color:#f8f9fa; }

.selectbox check-input { width: 1em; height: 1em; vertical-align: middle; background-color: #fff; border: 1px solid rgba(0,0,0,.25); margin-top: 7px; margin-bottom: 7px; }
.selectbox check-input:checked { background-color: #0d6efd; border-color: #0d6efd; }
.selectbox check-input[type=checkbox] { border-radius: 0.25em; }
.selectbox check-label { cursor: pointer; vertical-align: middle; margin-top: 7px; margin-bottom: 7px; }

</style>

<div class="row board-list-header">
     <div class="col-auto me-auto dataCount"><i class="fa-regular fa-file-lines" style="color: #697486;"></i> ${dataCount}개 (${pageNo}/${total_page})</div>
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
				<td>${dataCount - (pageNo-1) * size - status.index}</td>
				<td class="left">
					<a href="javascript:articleView('${dto.communityNum}', '${pageNo}');" class="text-reset">${dto.subject}</a>
				</td>
				<td>${dto.userName}</td>
				<td>${dto.reg_date}</td>
				<td>${dto.hitCount}</td>
				<td>${dto.replyCount}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div class="page-navigation d-flex justify-content-center">
   ${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>

<div class="row board-list-footer">
	<div class="col">
		<button type="button" class="btn btn-light"  onclick="reloadBoard();"  title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
	</div>
	<div class="col-6 text-center">
    <div class="row d-flex justify-content-center" > 
		<div class="col-auto p-1">
			<select name="schType" id="schType" class="form-select">
				<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
				<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
				<option value="reg_date" ${schType=="reg_date"?"selected":""}>등록일</option>
				<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
				<option value="content" ${schType=="content"?"selected":""}>내용</option>
			</select>
		</div>
		<div class="col-auto p-1">
			<input type="text" name="kwd" id="kwd" value="${kwd}" class="form-control">
		</div>
		<div class="col-auto p-1">
			<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
		</div>
		  </div>
	  </div>
	<div class="col text-end">
		<button type="button" class="btn btn-light"  onclick="writeForm();">글올리기</button>
	</div>
</div>

