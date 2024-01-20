<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
@import url('http://fonts.googleapis.com/earlyaccess/notosanskr.css');

.body-container {
	max-width: 800px;
}

table td { vertical-align: middle;  word-break: keep-all;
        word-wrap: break-word;}
.product img{margin-right:3px; vertical-align: middle; float: left;}
.product span {vertical-align: middle;}
table tr td:nth-child(2) {font-size: 12px;} 


i { color:#848484; width: 15px;}
a { color:#848484; font-size: 15px;}
a:hover {color: black; text-decoration: none;}
.category-bar { margin-top: 40px; margin-bottom:20px; display: flex; justify-content: center;}
.bar-item{ width:100px; height:70px; text-align:center;  margin: 10px;}
.title {display: flex; justify-content: center; }
h3{font-weight: 900;}

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
		<div class="title">
			<h3>문의사항 </h3>
		</div>
		<div class="category-bar">
			<div class="bar-item p-3">
				<a href="${pageContext.request.contextPath}/faq/main"><i class="fa-regular fa-circle-question fa-lg"></i><br>FAQ</a>
			</div>
			<div class="point-item">
				<i class="fa-solid fa-angle-right"></i>
			</div>
			<div class="bar-item p-3">
				<a href="${pageContext.request.contextPath}/notice/list" ><i class="fa-regular fa-file-lines fa-lg"></i><br>공지사항</a>
			</div>
			<div class="point-item">
				<i class="fa-solid fa-angle-right"></i>
			</div>
			<div class="bar-item p-3 active">
				<a href="${pageContext.request.contextPath}/qna/list"><i class="fa-solid fa-file-pen fa-lg"></i><br>문의사항</a>
			</div>
		</div>
		<div class="body-main">

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
						<th>상품명</th>
						<th width="240">제목</th>
						<th width="100">작성자</th>
						<th width="90">문의일자</th>
						<th width="90">처리결과</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${dataCount - (page-1) * size - status.index}</td>
							<td class="product left">
								<c:if test="${!empty dto.productNum}">
									<img src="${pageContext.request.contextPath}/resources/images/${dto.thumbnail}" alt="" width="55px;" height="55px;"  onerror="this.style.display='none'"><span>${dto.productName}</span>									
								</c:if>
							</td>
							<td class="left">
								<c:choose>
									<c:when test="${dto.secret==1}">
										<c:if test="${sessionScope.member.memberIdx eq dto.memberIdx || sessionScope.member.membership>30}">
											<a href="${articleUrl}&num=${dto.num}">${dto.q_subject}</a>
										</c:if>
										<c:if test="${!(sessionScope.member.memberIdx eq dto.memberIdx) && sessionScope.member.membership<31}">
											비밀글 입니다.
										</c:if>
										<i class="bi bi-file-lock2"></i>
									</c:when>
									<c:otherwise>
										<a href="${articleUrl}&num=${dto.num}">${dto.q_subject}</a>
									</c:otherwise>
								</c:choose>
							</td>
							<td>${dto.userName}</td>
							<td>${dto.question_date}</td>
							<td>${(empty dto.answer_date)?"답변대기":"답변완료"}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page-navigation">
				${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
			</div>

			<div class="row board-list-footer">
				<div class="col">
					<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/qna/list';" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
				</div>
				<div class="col-6 text-center">
					<form class="row" name="searchForm" action="${pageContext.request.contextPath}/qna/list" method="post">
						<div class="col-auto p-1">
							<select name="schType" class="form-select">
								<option value="all" ${schType=="all"?"selected":""}>제목+상품명</option>
								<option value="question_date" ${schType=="question_date"?"selected":""}>등록일</option>
								<option value="productName" ${schType=="productName"?"selected":""}>상품명</option>
								<option value="userName" ${schType=="userName"?"selected":""}>작성자</option>
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
						<c:if test="${!empty sessionScope.member.memberIdx}">
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/qna/write';">질문등록</button>
						</c:if>
					</div>
			</div>
		</div>
	</div>
</div>