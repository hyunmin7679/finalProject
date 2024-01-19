<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table class="table mt-5 mb-0 board-article">
	<thead>
		<tr>
			<td colspan="2" align="center">${dto.subject}</td>
		</tr>
	</thead>

	<tbody>
		<tr>
			<td width="50%">이름 : ${dto.userName}
			</td>
			<c:if test="${sessionScope.member.userId != dto.userId }">
			<td align="right">
				 <a class="frind-add"
				data-userName="${dto.userName}"> | <i class="fa-solid fa-user-plus"></i></a>
			</td>
			</c:if>

			<td align="right">${dto.reg_date} | 조회 ${dto.hitCount}</td>
		</tr>

		<tr>
			<td colspan="2" style="border-bottom: none;">
				<div class="row row-cols-6 img-box">
					<c:forEach var="vo" items="${listFile}">
						<div class="col p-1">
							<img
								src="${pageContext.request.contextPath}/uploads/bbs/${vo.filename}"
								class="imageViewer img-thumbnail w-100 h-100"
								style="max-height: 130px;">
						</div>
					</c:forEach>
				</div>
			</td>
		</tr>

		
		<tr>
			<td colspan="2" valign="top" height="200"
				style="border-bottom: none;">${dto.content}</td>
		</tr>
		<tr>
			<td colspan="2" id= "map1"style="width:100%;height:350px;">
				
			</td>
		</tr>
		<c:if test="${dto.park != ' '}">
			<tr>
				<td style="border: none;">산책주소 : ${dto.park}, 총 거리 : ${mapList[0].distance }m</td>
			</tr>
		</c:if>

		<tr>
			<td colspan="2" class="text-center p-3" style="border-bottom: none;">
				<button type="button"
					class="btn btn-outline-secondary btnSendBoardLike"
					data-communityNum="${dto.communityNum}" title="좋아요">
					<i
						class="bi ${userBoardLiked ? 'bi-hand-thumbs-up-fill':'bi-hand-thumbs-up' }"></i>&nbsp;&nbsp;<span
						id="boardLikeCount">${dto.boardLikeCount}</span>
				</button>
			</td>
		</tr>
		
		

		<tr>
			<td colspan="2">이전글 : <c:if test="${not empty prevDto}">
					<a
						href="javascript:articleView('${prevDto.communityNum}', '${pageNo}');">${prevDto.subject}</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2">다음글 : <c:if test="${not empty nextDto}">
					<a
						href="javascript:articleView('${nextDto.communityNum}', '${pageNo}');">${nextDto.subject}</a>
				</c:if>
			</td>
		</tr>
	</tbody>
</table>
<table class="table table-borderless mb-2">
	<tr>
		<td width="50%"><c:choose>
				<c:when test="${sessionScope.member.userId==dto.userId && dto.park == ' '}">
					<button type="button" class="btn btn-light"
						onclick="updateForm('${dto.communityNum}', '${pageNo}');">수정</button>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose> <c:choose>
				<c:when test="${sessionScope.member.userId==dto.userId}">
					<button type="button" class="btn btn-light"
						onclick="deleteOk('${dto.communityNum}', '${pageNo}');">삭제</button>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose></td>
			
			<c:if test="${sessionScope.member.userId!=dto.userId}">
			<td><button type="button" class="btn btn-light btnUserReportSubmit" data-num="${dto.communityNum}" data-reportUrl="${reportUrl}">신고</button></td>
			</c:if>
			
		<td class="text-end">
			<button type="button" class="btn btn-light"
				onclick="listPage('${pageNo}');">리스트</button>
		</td>
	</tr>
</table>

<c:forEach var="item" items="${mapList}">
    <div class="item" style="display: none;">
        <span class="name">${item.la}</span>
        <span class="value">${item.ma}</span>
    </div>
</c:forEach>


<div class="reply" data-communityNum="${dto.communityNum}">
	<form name="replyForm" method="post">
		<div class='form-header'>
			<span class="bold">댓글</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의
				게시를 삼가해 주세요.</span>
		</div>

		<table class="table table-borderless reply-form">
			<tr>
				<td><textarea class='form-control' name="content"></textarea></td>
			</tr>
			<tr>
				<td align='right'>
					<button type='button' class='btn btn-light btnSendReply'>댓글
						등록</button>
				</td>
			</tr>
		</table>
	</form>

	<div id="listReply"></div>
</div>

<div>
	<form name="addfriend" method="post">
		<div></div>

	</form>
</div>

<!-- 친구추가 모달 -->
<div class="modal fade" id="frindModal" tabindex="-1" aria-labelledby="frindModalLabel"
				aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		
			<div class="modal-header">
				<h5 class="modal-title" id="frindModalLabel">친구추가</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
			<div class="modal-body"></div>
		</div>
	</div>
</div>	

<!-- 신고하기 창 -->
<div class="modal fade" id="userReportModal" tabindex="-1" aria-labelledby="userReportModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="userReportModalLabel">신고하기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="p-1">
					<form name="userReportForm" method="post" class="row justify-content-center">
						<div>
						<div class="col-8 p-1">
							<select name="reason" class="form-select">
								<option value=""> ::신고사유를 선택해주세요:: </option>
								<option value="1" >광고</option>
								<option value="2" >도배</option>
								<option value="3" >음란물</option>
								<option value="4" >지나친 욕설</option>
								<option value="5" >개인정보침해</option>
								<option value="6" >저작권침해</option>
								<option value="7" >기타</option>
							</select>
						</div>
							<div class="col p-1">
								<input type="text" name="content" class="form-control" placeholder="사유를 입력 하세요">
							</div>
						</div>	
						
						<div class="col-auto p-1">
							<input type="hidden" name="communityNum" value="${dto.communityNum}">
							<input type="hidden" name="reportUrl" value="/bbs/article/${dto.communityNum}">
							<button type="button" class="btn btn-light btnUserReportOk"> 신고하기 </button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<c:if test="${dto.park != ' '}">
<script>

var items = document.querySelectorAll('.item');


var linePath = [];

for (var i = 0; i < items.length; i++) {
    var name = parseFloat(items[i].querySelector('.name').textContent);
    var value = parseFloat(items[i].querySelector('.value').textContent);
    
    // LatLng 객체를 생성하여 linePath 배열에 추가
    linePath.push(new kakao.maps.LatLng(value, name));
}


var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(linePath[0].getLat(), linePath[0].getLng()), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};  

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


//선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
/* var linePath = [
new kakao.maps.LatLng(33.43292854051273, 126.5754264080158),
new kakao.maps.LatLng(33.44389850153134, 126.81145915912177),
new kakao.maps.LatLng(33.360798383319036, 126.80682503829333) 
]; */

//지도에 표시할 선을 생성합니다
var polyline = new kakao.maps.Polyline({
path: linePath, // 선을 구성하는 좌표배열 입니다
strokeWeight: 5, // 선의 두께 입니다
strokeColor: '#FFAE00', // 선의 색깔입니다
strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
strokeStyle: 'solid' // 선의 스타일입니다
});

//지도에 선을 표시합니다 
polyline.setMap(map);  



</script>
</c:if>