<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="card h-100">
	<div class="card-header">
		<h5 class="card-title mb-0">게시글 리스트</h5>
	</div>
	<div class="card-body">
		<div class="report-list">
			<c:forEach var="dto2" items="${list2}" varStatus="status">
				<div class="report-list-item rounded-2 mb-3">
					<div class="d-flex align-items-start">
						<div class="justify-content-between align-items-end w-100  gap-2">
							<div class="d-flex flex-column onmouse">
							
								<span class="showNoState" 
								data-showNo = "${dto2.showNo}"
								data-communityNum="${dto2.communityNum }">
									<c:if test="${dto2.showNo == 1 }">
										<i class="bx bxs-show clickable-icon"></i>
									</c:if>
									<c:if test="${dto2.showNo == 0 }">
										<i class="bx bxs-hide clickable-icon"></i>
									</c:if>
								</span> 
								
								<span class="article onm" 
									data-communityNum="${dto.communityNum }"
									data-categoryNum="${dto.categoryNum}"
									onmouseover="changeColor(this, true)"
									onmouseout="changeColor(this, false)"> ${status.index + 1}.제목
									: ${dto2.subject} &nbsp;&nbsp; | &nbsp;&nbsp;<i
									class="fa-regular fa-eye"></i> : ${dto2.viewCount }
									&nbsp;&nbsp; | &nbsp;&nbsp;<i class='bx bxs-like'></i> :
									${dto2.likeCount} |

								</span>

							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="text-align: center">${paging}</div>
	</div>
</div>

<script>

$(function() {
    // 글 제목을 클릭할 때의 동작
    $('.article').on('click', function() {
        let communityNum = $(this).data("communitynum");
        let categoryNum = $(this).data("categorynum");

        // 이동할 URL 생성
        let url = "${pageContext.request.contextPath}/bbs/main?communityNum=" + communityNum + "&categoryNum=" + categoryNum;
        
        // 페이지 이동
        window.location.href = url;
    });
    

   
    
});
</script>