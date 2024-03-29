<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="vo" items="${listReplyAnswer}">
	<div class='border-bottom m-1'>
		<div class='row p-1'>
			<div class='col-auto'>
				<div class='row reply-writer'>
					<div class='col-1'><img class="align-self-center" style="padding: 4px; width: 37px;" src="${pageContext.request.contextPath}/uploads/photo/${vo.iconImage}"></div>
					<div class='col ms-2 align-self-center'>
						<div class='name'>${vo.userName}</div>
						<div class='date'>${vo.reg_date}</div>
					</div>
				</div>
			</div>
			<div class='col align-self-center text-end'>
				<c:if test="${sessionScope.member.userId==vo.userId || sessionScope.member.membership > 50}">
				<span class='reply-dropdown'><i class='bi bi-three-dots-vertical'></i></span>
				</c:if>
				<div class='reply-menu'>
					<c:choose>
						<c:when test="${sessionScope.member.userId==vo.userId}">
							<div class='deleteReplyAnswer reply-menu-item' data-replyNum='${vo.replyNum}' data-answer='${vo.answer}'>삭제</div>
							<div class='hideReplyAnswer reply-menu-item' data-replyNum='${vo.replyNum}' data-showReply='${vo.showReply}'>${vo.showReply == 1 ? "숨김":"표시"}</div>
						</c:when>
						<c:when test="${sessionScope.member.membership > 50 }">
							<div class='deleteReplyAnswer reply-menu-item' data-replyNum='${vo.replyNum}' data-answer='${vo.answer}'>삭제</div>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<div class='p-2 ${vo.showReply == 0 ? "text-primary text-opacity-50":""}'>
			${vo.content}
		</div>
	</div>
</c:forEach>
