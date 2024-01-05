<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paginate-boot.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=05a2937d99f19b82637494048cbe786d&libraries=services"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<style type="text/css">
.body-container {
	max-width: 850px;
}

.board-article img { max-width: 650px; }

.img-box img {
    width: 50px;
    height: 50px;
    margin-right: 5px;
    flex: 0 0 auto;
    cursor: pointer;
    border: 1px solid #c2c2c2;
    border-radius: 10px;
}

.img-grid .item {
    object-fit: cover;
    width: 50px;
    height: 50px;
    cursor: pointer;
    border: 1px solid #c2c2c2;
    border-radius: 10px;
}

img, svg {
    vertical-align: middle;
}
</style>

<script type="text/javascript">

</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-app"></i> 게시판 </h3>
		</div>
		
	<form name="bbsSearchForm" method="post">
		<input type="hidden" name="schType" value="all">
	    <input type="hidden" name="kwd" value="">
	</form>
	
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
		</div>
		
		<div class="body-main content-frame"></div>
	</div>
	
	<form name="searchForm" method="post">
		<input type="hidden" name="schType" value="all">
		<input type="hidden" name="kwd" value="">
	</form>
	
</div>

<script>
function login() {
	location.href = '${pageContext.request.contextPath}/member/login';
}

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			dataType: dataType,
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

// ----------------------------------------------------
//### 게시판 #########
$(function(){
	listPage(1);
	
    $("button[role='tab']").on("click", function(e){
		// const tab = $(this).attr("aria-controls");
    	listPage(1);
    	
    });
});

// 게시글의 글리스트 및 페이징 처리
function listPage(page) {
	const $tab = $("button[role='tab'].active");
	let categoryNum = $tab.attr("data-categoryNum");
	
	let url = "${pageContext.request.contextPath}/bbs/list";
	let query = "pageNo="+page+"&categoryNum="+categoryNum;
	let search = $('form[name=searchForm]').serialize();
	
	query = query+"&"+search;
	
	console.log(query);
	
	let selector = ".content-frame";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "text", fn);
}

// 검색
function searchList() {
	const f = document.searchForm;
	
	f.schType.value = $("#schType").val();
	f.kwd.value = $.trim($("#kwd").val());
	listPage(1);
}

// 새로고침
function reloadBoard() {
	const f = document.searchForm;
	f.schType.value = "all";
	f.kwd.value = "";
	
	listPage(1);
}

// 글등록 폼
function writeForm() {
	
	let url = "${pageContext.request.contextPath}/bbs/write";
	let query = "tmp="+new Date().getTime();
	let selector = ".content-frame";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "text", fn);
}  


// 글쓰기 취소, 수정 취소
function sendCancel(page) {
	if( ! page ) {
		page = "1";
	}
	
	listPage(page);
}


// 등록/수정 유효성 검사
function check() {
    const f = document.boardForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return false;
    }

	str = f.content.value;
	if( !str || str === "<p><br></p>" ) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return false;
    }
    
    return true;
}

// 게시글 보기, 이전글/다음글
function articleView(communityNum, page) {
	let url = "${pageContext.request.contextPath}/bbs/article";
	let query = "communityNum=" + communityNum;
	let search = $("form[name=searchForm]").serialize();
	query = query + "&pageNo=" + page + "&" + search;
	let selector = ".content-frame";
	
	
	
	const fn = function(data){
		$(selector).html(data);
		
		replyListPage(1);
	};
	
	ajaxFun(url, "get", query, "text", fn);
}

// ----------------------------------------------------------
// 글 수정
function updateForm(communityNum, page) {
	let url = "${pageContext.request.contextPath}/bbs/update";
	let query = "communityNum=" + communityNum + "&pageNo=" + page;

	let selector = ".content-frame";
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "text", fn);
}

// 글 삭제
function deleteOk(communityNum, page) {
	
	let url = "${pageContext.request.contextPath}/bbs/delete";
	let query = "communityNum=" + communityNum + "&pageNo=" + page;
	
	if(! confirm("게시글을 삭제하시겠습니까 ? ")) {
		  return;
	}
	
	const fn = function(data){
		listPage(page);
	};
	ajaxFun(url, "post", query, "json", fn);
}

//---------------------------------------------------
// ### 게시글 공감 #########
// 게시글 공감 여부
$(function (){
	$('.content-frame').on('click', '.btnSendBoardLike', function(){
		const $i = $(this).find('i');
		let userLiked = $i.hasClass('bi-hand-thumbs-up-fill');
		let msg = userLiked ? '게시글 공감을 취소하시겠습니까 ? ' : '게시글에 공감하십니까 ? ';
		
		if(! confirm( msg )) {
			return false;
		}
		
		let url = '${pageContext.request.contextPath}/bbs/insertBoardLike';
		let communityNum = $(this).attr('data-communityNum');
		let query = 'communityNum=' + communityNum + '&userLiked=' + userLiked;
		
		const fn = function(data){
			let state = data.state;
			if(state === 'true') {
				if( userLiked ) {
					$i.removeClass('bi-hand-thumbs-up-fill').addClass('bi-hand-thumbs-up');
				} else {
					$i.removeClass('bi-hand-thumbs-up').addClass('bi-hand-thumbs-up-fill');
				}
				
				let count = data.boardLikeCount;
				$('#boardLikeCount').text(count);
			} else if(state === 'liked') {
				alert('게시글 공감은 한번만 가능합니다. !!!');
			} else if(state === "false") {
				alert('게시물 공감 여부 처리가 실패했습니다. !!!');
			}
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

//---------------------------------------------------
// ### 댓글 #########
// 댓글의 페이징 처리
function replyListPage(page) {
	let communityNum = $('.reply').attr("data-communityNum");
	
	let url = '${pageContext.request.contextPath}/bbs/listReply';
	let query = 'communityNum=' + communityNum + '&page=' + page;
	let selector = '#listReply';
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, 'get', query, 'text', fn);
}

// 리플 등록
$(function(){
	$('.content-frame').on('click', '.btnSendReply', function(){
		let communityNum = $('.reply').attr("data-communityNum");
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
	$('.content-frame').on('click', '.reply-dropdown', function(){
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
	
	$('.content-frame').on('click', function() {
		if($(event.target.parentNode).hasClass('reply-dropdown')) {
			return false;
		}
		$(".reply-menu").hide();
	});
});

// 댓글 삭제
$(function(){
	$('.content-frame').on('click', '.deleteReply', function(){
		if(! confirm('댓글을 삭제하시겠습니까 ? ')) {
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
	$('.content-frame').on('click', '.btnReplyAnswerLayout', function(){
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
	$('.content-frame').on('click', '.btnSendReplyAnswer', function(){
		let communityNum =  $('.reply').attr("data-communityNum");
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
	$('.content-frame').on('click', '.deleteReplyAnswer', function(){
		if(! confirm('댓글을 삭제하시겠습니까 ? ')) {
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
	$('.content-frame').on('click', '.hideReply', function(){
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
	$('.content-frame').on('click', '.hideReplyAnswer', function(){
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

// --------------------------------------------------------
/*
// 친구추가 모달
$(function(){
	$(".friend").click(function(){
		
		let userName = $(this).attr('data-userName');
		let url = '${pageContext.request.contextPath}/bbs/article';
		let query = 'userName=' + userName;
		let selector = "#friendModal";
		
		const fn = function(data){
			//let friend = data.friend;
			let selector = '#friendModal';
			$(selector).modal("show");
		};
		
		
	ajaxFun(url, 'post', query, 'json', fn);
	});
	
});  

$(function() {
	$(".friend").click(function(){
	
		$("#friendModal").modal("show");
	});
	
}); */







</script>

