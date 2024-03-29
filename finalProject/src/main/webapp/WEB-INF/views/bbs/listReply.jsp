<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${replyCount > 0 }">
<div class='reply-info'>
	<span class='reply-count'>댓글 ${replyCount}개</span>
	<span>[목록, ${pageNo}/${total_page} 페이지]</span>
</div>
</c:if>

<table class='table table-borderless'>
	<c:forEach var="vo" items="${listReply}">
		<tr class='border table-light'>
			<td width='50%'>
				<div class='row reply-writer'>
					<div class='col-1'><img class="align-self-center" style="padding: 4px; width: 37px;" src="${pageContext.request.contextPath}/uploads/photo/${vo.iconImage}"></div>
					<div class='col-auto align-self-center'>
						<div class='name'>${vo.userName}</div>
						<div class='date'>${vo.reg_date}</div>
					</div>
				</div>
			</td>
			<td width='50%' align='right' class='align-middle'>
				<c:if test="${sessionScope.member.userId==vo.userId || sessionScope.member.membership > 50}">
				<span class='reply-dropdown'><i class='bi bi-three-dots-vertical'></i></span>
				</c:if>
				
				<div class="reply-menu">
					<c:choose>
						<c:when test="${sessionScope.member.userId==vo.userId}">
							<div class='deleteReply reply-menu-item' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</div>
							<div class='hideReply reply-menu-item' data-replyNum='${vo.replyNum}' data-showReply='${vo.showReply}'>${vo.showReply == 1 ? "숨김":"표시"}</div>
						</c:when>
						<c:when test="${sessionScope.member.membership > 50}">
							<div class='deleteReply reply-menu-item' data-replyNum='${vo.replyNum}' data-pageNo='${pageNo}'>삭제</div>

						</c:when>
						<c:otherwise>
							<div class='notifyReply reply-menu-item btnUserReportSubmit'>신고</div>
							<div class='blockReply reply-menu-item'>차단</div>
						</c:otherwise>
					</c:choose>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan='2' valign='top' class="${vo.showReply == 0 ? 'text-primary text-opacity-50':''}">${vo.content}</td>
		</tr>

		<tr>
			<td>
				<button type='button' class='btn btn-light btnReplyAnswerLayout' data-replyNum='${vo.replyNum}'>답글 <span id="answerCount${vo.replyNum}">${vo.answerCount}</span></button>
			</td>
		</tr>
	
	    <tr class='reply-answer'>
	        <td colspan='2'>
	        	<div class='border rounded'>
		            <div id='listReplyAnswer${vo.replyNum}' class='answer-list'></div>
		            <div>
		                <textarea class="form-control m-2"></textarea>
		            </div>
					<div class='text-end pe-2 pb-1'>
						<button type='button' class='btn btn-light btnSendReplyAnswer' data-replyNum='${vo.replyNum}'>답글 등록</button>
		            </div>
	            </div>
			</td>
	    </tr>
	</c:forEach>
</table>

<div class="page-navigation d-flex justify-content-center">
	${paging}
</div>			
