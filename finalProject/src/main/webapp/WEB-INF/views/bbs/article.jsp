<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}

.board-article img { max-width: 650px; }

</style>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05a2937d99f19b82637494048cbe786d&libraries=services"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<c:if test="${sessionScope.member.userId==dto.userId||sessionScope.member.membership>50}">
	<script type="text/javascript">
		function deleteBoard() {
		    if(confirm('게시글을 삭제 하시 겠습니까 ? ')) {
			    let query = 'communityNum=${dto.communityNum}&${query}';
			    let url = '${pageContext.request.contextPath}/bbs/delete?' + query;
		    	location.href = url;
		    }
		}
	</script>
</c:if>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-app"></i> 게시판 </h3>
		</div>
		
		<div class="body-main">

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
							이름 : ${dto.userName}
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
						<td>
							<div id="map" class="map"></div>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="text-center p-3" style="border-bottom: none;">
							<button type="button" class="btn btn-outline-secondary btnSendBoardLike" title="좋아요"><i class="bi ${userBoardLiked ? 'bi-hand-thumbs-up-fill':'bi-hand-thumbs-up' }"></i>&nbsp;&nbsp;<span id="communityLikeCount">${dto.communityLikeCount}</span></button>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							이전글 :
							<c:if test="${not empty prevDto}">	
								<a href="${pageContext.request.contextPath}/bbs/article?communityNum=${prevDto.communityNum}&page=${page}">${prevDto.subject}</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							다음글 :
							<c:if test="${not empty nextDto}">
								<a href="${pageContext.request.contextPath}/bbs/article?communityNum=${nextDto.communityNum}&page=${page}">${nextDto.subject}</a>
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
								<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/update?communityNum=${dto.communityNum}&page=${page}';">수정</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-light" disabled>수정</button>
							</c:otherwise>
						</c:choose>
				    	
						<c:choose>
				    		<c:when test="${sessionScope.member.userId==dto.userId || sessionScope.member.membership>50}">
				    			<button type="button" class="btn btn-light" onclick="deleteBoard();">삭제</button>
				    		</c:when>
				    		<c:otherwise>
				    			<button type="button" class="btn btn-light" disabled>삭제</button>
				    		</c:otherwise>
				    	</c:choose>
					</td>
					<td class="text-end">
						<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/bbs/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
			
			<div class="reply">
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

		</div>
	</div>
</div>

<script type="text/javascript">
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

//게시글 공감 여부
$(function(){
	$('.btnSendBoardLike').click(function(){
		const $i = $(this).find('i');
		let userCommunityLiked = $i.hasClass('bi-hand-thumbs-up-fill');
		let msg = userCommunityLiked ? '게시글 공감을 취소하시겠습니까 ? ' : '게시글에 공감하십니까 ? ';
		
		if(! confirm( msg )) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/bbs/insertBoardLike';
		let communityNum = '${dto.communityNum}';
		let query = 'communityNum=' + communityNum + '&userCommunityLiked=' + userCommunityLiked;
		
		const fn = function(data){
			let state = data.state;
			if(state === 'true') {
				if( userCommunityLiked ) {
					$i.removeClass('bi-hand-thumbs-up-fill').addClass('bi-hand-thumbs-up');
				} else {
					$i.removeClass('bi-hand-thumbs-up').addClass('bi-hand-thumbs-up-fill');
				}
				
				let count = data.communityLikeCount;
				$('#communityLikeCount').text(count);
			} else if(state === 'liked') {
				alert('게시글 공감은 한번만 가능합니다. !!!');
			} else if(state === "false") {
				alert('게시물 공감 여부 처리가 실패했습니다. !!!');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});


// 페이징 처리
$(function(){
	listPage(1);
});

function listPage(page) {
	let url = '${pageContext.request.contextPath}/bbs/listReply';
	let query = 'communityNum=${dto.communityNum}&pageNo=' + page;
	let selector = '#listReply';
	
	const fn = function(data){
		$(selector).html(data);
	};
	// ajaxFun(url, 'get', query, 'html', fn);
	ajaxFun(url, 'get', query, 'text', fn);
}

// 리플 등록
$(function(){
	$('.btnSendReply').click(function(){
		let communityNum = '${dto.communityNum}';
		const $tb = $(this).closest('table');

		let content = $tb.find('textarea').val().trim();
		if(! content) {
			$tb.find('textarea').focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		let url = '${pageContext.request.contextPath}/bbs/insertReply';
		let query = 'communityNum=' + communityNum + '&content=' + content + '&answer=0';
		
		const fn = function(data){
			$tb.find('textarea').val('');
			
			let state = data.state;
			if(state === 'true') {
				listPage(1);
			} else if(state === 'false') {
				alert('댓글을 추가 하지 못했습니다.');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

// 삭제, 신고 메뉴
$(function(){
	$('.reply').on('click', '.reply-dropdown', function(){
		const $menu = $(this).next('.reply-menu');
		if($menu.is(':visible')) {
			$menu.fadeOut(100);
		} else {
			$('.reply-menu').hide();
			$menu.fadeIn(100);

			let pos = $(this).offset(); // 선택한 요소 집합의 첫 번째 요소의 위치를 HTML 문서를 기준으로 반환
			$menu.offset( {left:pos.left-70, top:pos.top+20} );
		}
	});
	
	$('.reply').on('click', function() {
		if($(event.target.parentNode).hasClass('reply-dropdown')) {
			return false;
		}
		$(".reply-menu").hide();
	});
});

// 댓글 삭제
$(function(){
	$('.reply').on('click', '.deleteReply', function(){
		if(! confirm('게시물을 삭제하시겠습니까 ? ')) {
		    return false;
		}
		
		let replyNum = $(this).attr('data-replyNum');
		let page = $(this).attr('data-pageNo');
		
		let url = '${pageContext.request.contextPath}/bbs/deleteReply';
		let query = 'replyNum=' + replyNum + '&mode=reply';
		
		const fn = function(data){
			// let state = data.state;
			listPage(page);
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

// 댓글 좋아요 / 싫어요
/*$(function(){
	// 댓글 좋아요 / 싫어요 등록
	$('.reply').on('click', '.btnSendReplyLike', function(){
		let replyNum = $(this).attr('data-replyNum');
		let replyLike = $(this).attr('data-replyLike');
		const $btn = $(this);
		
		let msg = '게시물이 마음에 들지 않으십니까 ?';
		if(replyLike === '1') {
			msg = '게시물에 공감하십니까 ?';
		}
		
		if(! confirm(msg)) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/bbs/insertReplyLike';
		let query = 'replyNum=' + replyNum + '&replyLike=' + replyLike;
		
		const fn = function(data){
			let state = data.state;
			if(state === 'true') {
				let likeCount = data.likeCount;
				let disLikeCount = data.disLikeCount;
				
				$btn.parent('td').children().eq(0).find('span').html(likeCount);
				$btn.parent('td').children().eq(1).find('span').html(disLikeCount);
			} else if(state === 'liked') {
				alert('게시물 공감 여부는 한번만 가능합니다. !!!');
			} else {
				alert('게시물 공감 여부 처리가 실패했습니다. !!!');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});*/

// 댓글별 답글 리스트
function listReplyAnswer(answer) {
	let url = '${pageContext.request.contextPath}/bbs/listReplyAnswer';
	let query = 'answer=' + answer;
	let selector = '#listReplyAnswer' + answer;
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, 'get', query, 'text', fn);
}

// 댓글별 답글 개수
function countReplyAnswer(answer) {
	let url = '${pageContext.request.contextPath}/bbs/countReplyAnswer';
	let query = 'answer=' + answer;
	
	const fn = function(data){
		let count = data.count;
		let selector = '#answerCount' + answer;
		$(selector).html(count);
	};
	
	ajaxFun(url, 'post', query, 'json', fn);
}

// 답글 버튼(댓글별 답글 등록폼 및 답글리스트)
$(function(){
	$('.reply').on('click', '.btnReplyAnswerLayout', function(){
		const $trReplyAnswer = $(this).closest('tr').next();
		
		let isVisible = $trReplyAnswer.is(':visible');
		let replyNum = $(this).attr('data-replyNum');
			
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
            
			// 답글 리스트
			listReplyAnswer(replyNum);
			
			// 답글 개수
			countReplyAnswer(replyNum);
		}
	});
	
});

// 댓글별 답글 등록
$(function(){
	$('.reply').on('click', '.btnSendReplyAnswer', function(){
		let communityNum = '${dto.communityNum}';
		let replyNum = $(this).attr('data-replyNum');
		const $td = $(this).closest('td');
		
		let content = $td.find('textarea').val().trim();
		if(! content) {
			$td.find('textarea').focus();
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/bbs/insertReply';
		// let formData = 'num=' + num + '&content=' + encodeURIComponent(content) + '&answer=' + replyNum;
		let formData = {communityNum:communityNum, content:content, answer:replyNum}; // formData를 객체로 전송하면 인코딩하면 안됨
		
		const fn = function(data){
			$td.find('textarea').val('');
			
			var state = data.state;
			if(state === 'true') {
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum);
			}
		};
		
		ajaxFun(url, 'post', formData, 'json', fn);
	});
});

// 댓글별 답글 삭제
$(function(){
	$('.reply').on('click', '.deleteReplyAnswer', function(){
		if(! confirm('게시물을 삭제하시겠습니까 ? ')) {
		    return false;
		}
		
		let replyNum = $(this).attr('data-replyNum');
		let answer = $(this).attr('data-answer');
		
		let url = '${pageContext.request.contextPath}/bbs/deleteReply';
		let query = 'replyNum=' + replyNum + '&mode=answer';
		
		const fn = function(data){
			listReplyAnswer(answer);
			countReplyAnswer(answer);
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

// 댓글 숨김기능
$(function(){
	$('.reply').on('click', '.hideReply', function(){
		let $menu = $(this);
		
		let replyNum = $(this).attr('data-replyNum');
		let showReply = $(this).attr('data-showReply');
		let msg = '댓글을 숨김 하시겠습니까 ? ';
		if(showReply === '0') {
			msg = '댓글 숨김을 해제 하시겠습니까 ? ';
		}
		if(! confirm(msg)) {
			return false;
		}
		
		showReply = showReply === '1' ? '0' : '1';
		
		let url = '${pageContext.request.contextPath}/bbs/replyShowHide';
		let query = 'replyNum=' + replyNum + '&showReply=' + showReply;
		
		const fn = function(data){
			if(data.state === 'true') {
				let $item = $($menu).closest('tr').next('tr').find('td');
				if(showReply === "1") {
					$item.removeClass('text-primary').removeClass('text-opacity-50');
					$menu.attr('data-showReply', '1');
					$menu.html('숨김');
				} else {
					$item.addClass('text-primary').addClass('text-opacity-50');
					$menu.attr('data-showReply', '0');
					$menu.html('표시');
				}
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});


// 답글 숨김기능
$(function(){
	$('.reply').on('click', '.hideReplyAnswer', function(){
		let $menu = $(this);
		
		let replyNum = $(this).attr('data-replyNum');
		let showReply = $(this).attr('data-showReply');
		
		let msg = '댓글을 숨김 하시겠습니까 ? ';
		if(showReply === '0') {
			msg = '댓글 숨김을 해제 하시겠습니까 ? ';
		}
		if(! confirm(msg)) {
			return false;
		}
		
		showReply = showReply === '1' ? '0' : '1';
		
		let url = '${pageContext.request.contextPath}/bbs/replyShowHide';
		let query = 'replyNum=' + replyNum + '&showReply='+showReply;
		
		const fn = function(data){
			if(data.state === 'true') {
				let $item = $($menu).closest('.row').next('div');
				if(showReply === '1') {
					$item.removeClass('text-primary').removeClass('text-opacity-50');
					$menu.attr('data-showReply', '1');
					$menu.html('숨김');
				} else {
					$item.addClass('text-primary').addClass('text-opacity-50');
					$menu.attr('data-showReply', '0');
					$menu.html('표시');
				}
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

// 카카오맵 API 
	var mapContainer = document.getElementById('map');
	var mapOption = {
		center: new kakao.maps.LatLng(37.557714093880406, 126.92450981105797),  // 지도의 중심좌표 : 위도(latitude), 경도(longitude)
		level: 3  // 지도의 레벨(확대, 축소 정도)
	};
	
	// 지도를 생성
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 주소-좌표 변환 객체를 생성
	var geocoder = new kakao.maps.services.Geocoder();
	
	// AJAX - 마커를 출력할 위도/경도 및 제목을 불러오기
	var url = "${pageContext.request.contextPath}/bbs/regions";
	var query = null;
	var fn = function(data) {
		createMarker(data);
	}
	ajaxFun(url, "get", query, "json", fn);

	function createMarker(data) {
		$(data.list).each(function(index, item){
			var num = item.num;
			var subject = item.subject;
			var addr = item.addr;
			
			// 주소로 마커 찍기
			geocoder.addressSearch(addr, function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시
			        var infowindow = new kakao.maps.InfoWindow({
			        	content:"<div class='marker-info'>"+subject+"</div>"
			        });

			        // 지도의 중심을 결과값으로 받은 위치로 이동
			        // map.setCenter(coords);
			        
				    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));			        
			    } 
			});
			
		});
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}			
		
	}
	
// -----------------------------------------------------------------	
	
/*var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   mapOption = {
       center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
       level: 3 // 지도의 확대 레벨
   };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${meet.addr1}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">모임장소:${meet.addr1}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});   */

</script>
