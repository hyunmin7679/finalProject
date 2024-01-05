<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


			<table class="table mt-5 mb-0 board-article">
				<thead>
					<tr>
						<td colspan="2" align="center">
							${dto.subject}
						</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td width="50%">
							이름 : ${dto.userName} | ${friendCount}
								<i class="fa-solid fa-user-plus"></i>
						</td>

						<td align="right">
							${dto.reg_date} | 조회 ${dto.hitCount}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" style="border-bottom: none;">
							<div class="row row-cols-6 img-box">
								<c:forEach var="vo" items="${listFile}">
									<div class="col p-1">
										<img src="${pageContext.request.contextPath}/uploads/bbs/${vo.filename}"
											class="imageViewer img-thumbnail w-100 h-100" style="max-height: 130px;">
									</div>
								</c:forEach>
							</div>
						</td>
					</tr>
					
					<c:if test="${dto.park != ' '}">
					<tr>
					    <td style="border: none;">
							산책주소 : ${dto.park}  
						</td>
					</tr>
					</c:if>
					<tr>
						<td colspan="2" valign="top" height="200" style="border-bottom: none;">
							${dto.content}
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="text-center p-3" style="border-bottom: none;">
							<button type="button" class="btn btn-outline-secondary btnSendBoardLike" data-communityNum="${dto.communityNum}" title="좋아요"><i class="bi ${userBoardLiked ? 'bi-hand-thumbs-up-fill':'bi-hand-thumbs-up' }"></i>&nbsp;&nbsp;<span id="boardLikeCount">${dto.boardLikeCount}</span></button>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							이전글 :
							<c:if test="${not empty prevDto}">	
								<a href="javascript:articleView('${prevDto.communityNum}', '${pageNo}');">${prevDto.subject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							다음글 :
							<c:if test="${not empty nextDto}">
								<a href="javascript:articleView('${nextDto.communityNum}', '${pageNo}');">${nextDto.subject}</a>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="table table-borderless mb-2">
				<tr>
					<td width="50%">
						<c:choose>
							<c:when test="${sessionScope.member.userId==dto.userId}">
								<button type="button" class="btn btn-light" onclick="updateForm('${dto.communityNum}', '${pageNo}');">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-light" disabled>수정</button>
							</c:otherwise>
						</c:choose>
				    	
						<c:choose>
				    		<c:when test="${sessionScope.member.userId==dto.userId}">
				    			<button type="button" class="btn btn-light" onclick="deleteOk('${dto.communityNum}', '${pageNo}');">삭제</button>
				    		</c:when>
				    		<c:otherwise>
				    			<button type="button" class="btn btn-light" disabled>삭제</button>
				    		</c:otherwise>
				    	</c:choose>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="listPage('${pageNo}');">리스트</button>
					</td>
				</tr>
			</table>
			
			<div class="reply" data-communityNum="${dto.communityNum}">
				<form name="replyForm" method="post">
					<div class='form-header'>
						<span class="bold">댓글</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가해 주세요.</span>
					</div>
					
					<table class="table table-borderless reply-form">
						<tr>
							<td>
								<textarea class='form-control' name="content"></textarea>
							</td>
						</tr>
						<tr>
						   <td align='right'>
						        <button type='button' class='btn btn-light btnSendReply'>댓글 등록</button>
						    </td>
						 </tr>
					</table>
				</form>
				
				<div id="listReply"></div>
			</div>
			
			<div>
				<form name="addfriend" method="post">
					<div>
						
					</div>
				
				</form>
			</div>


