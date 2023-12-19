<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<script>
var qnaNum = -1;
$(document).ready(function(){
    $('.qa_li .question').click(function(){
        q = $(".qa_li .question").index(this);
        if(q!=qnaNum){
            $('.qa_li .answer').stop(true, true).slideUp(400);
            $('.qa_li').removeClass('open');
            TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.3, {rotation:0});
            qnaNum = q;
            $('.qa_li').eq(qnaNum).addClass('open');
            $('.qa_li .answer').eq(qnaNum).stop(true, true).slideDown(400);
            TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.1, {rotation:180});
        }else{
            $('.qa_li .answer').eq(qnaNum).stop(true, true).slideUp(400);
            $('.qa_li').eq(qnaNum).removeClass('open');
            TweenMax.to($('.qa_li').eq(qnaNum).find('.question p'), 0.3, {rotation:0});
            qnaNum = -1;
        }
    });
});  

//탭
$(function(){
	$("button[role='tab']").on('click', function(){
		const tab = $(this).attr("aria-controls");
		
		if(tab === "1") { // 전체
			//location.href = "${pageContext.request.contextPath}/admin/order/status";
		} else if( tab === "2") { // 회원
			//location.href = "${pageContext.request.contextPath}/admin/order/delivery";
		} else if( tab === "3") { // 결제
			
		} else if( tab === "4") { // 배송
			
		} else if( tab === "5") { // 기타
			
		} 
	});
});
</script>
<style type="text/css">
@import url('http://fonts.googleapis.com/earlyaccess/notosanskr.css');

ul, li, p { list-style:none; padding:0; margin:0; }
.faq { font-family:'Noto Sans KR', sans-serif; margin-bottom:20px; }
.faq .qa_li { position:relative; display:block; padding:0; border-bottom:1px solid #ededed; cursor:pointer; }
.faq .qa_li .question { color:#222; font-size:16px; transition:color 0.3s ease-out; }
.faq .qa_li:hover .tit { color:#0a7ac8; }
.qa_li .question { position:relative; display:block; padding:25px 100px 25px 120px; background:url('https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_q.png') 40px center no-repeat; }
.qa_li .question .iconDiv { position:absolute; right:40px; top:50%; -webkit-transform:translateY(-50%); -moz-transform:translateY(-50%); -o-transform:translateY(-50%); -ms-transform:translateY(-50%); transform:translateY(-50%); }
.qa_li .answer { position:relative; display:none; padding:40px 120px; font-size:13px; color:#222; line-height:28px; background:#f6f6f6 url('https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_a.png') 40px 40px no-repeat; border-top:1px solid #e4e4e4; }
.modA { position:absolute; right:30px; bottom:30px;  }

.body-container {max-width: 800px; }
.fa-regular {text-align: center;}


i { color:#848484; width: 15px;}
a { color:#848484; font-size: 15px;}
a:hover {color: black; text-decoration: none;}
.category-bar { margin-top: 20px; margin-bottom:20px; display: flex; justify-content: center; border:1px solid #D8D8D8; border-radius: 30px;}
.bar-item{ width:100px; height:70px; text-align:center;  margin: 10px;}
.title {display: flex; justify-content: center;}
</style>


<div class="container body-container ">
    <div class="title">
       <h2>FAQ</h2>
    </div>
   
	<div class="category-bar">
		<div class="bar-item p-3">
			<a href="${pageContext.request.contextPath}/faq/main"><i class="fa-regular fa-circle-question fa-lg"></i><br>FAQ</a>
		</div>
		<div class="bar-item p-3">
			<a href="#" ><i class="fa-regular fa-file-lines fa-lg"></i><br>공지사항</a>
		</div>
		<div class="bar-item p-3">
			<a href="#"><i class="fa-solid fa-file-pen fa-lg"></i><br>문의사항</a>
		</div>
    </div>
	<form name="faqSearchForm" method="post">
		<input type="hidden" name="schType" value="all">
	    <input type="hidden" name="kwd" value="">
	</form>
	
	
	
		<div class="nav-align-top mb-4">
		   <ul class="nav nav-pills mb-3" role="tablist">   
		        <li class="nav-item" role="presentation">
					<button class="nav-link active" id="tab-0" data-bs-toggle="tab" data-bs-target="#nav-content" 
						type="button" role="tab" aria-controls="0" aria-selected="true" data-categoryNum="0">모두</button>
				</li>
				
				<c:forEach var="dto" items="${listCategory}" varStatus="status">
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="tab-${status.count}" data-bs-toggle="tab" 
							data-bs-target="#nav-content" type="button" role="tab" aria-controls="${status.count}" 
							aria-selected="true" data-categoryNum="${dto.categoryNum}">${dto.category}</button>
					</li>
				</c:forEach>
		   </ul>
		   
		   <div class="tab-content pt-2" id="nav-tabContent">
				
				<div class="tab-pane fade show active" id="nav-content" role="tabpanel" aria-labelledby="nav-tab-content"></div>
				
				<div class="row py-3">
					<div class="col">
						<button type="button" class="btn btn-light" onclick="reloadFaq();" title="새로고침"><i class="bi bi-arrow-counterclockwise"></i></button>
					</div>
					<div class="col-6 text-center">
						<form class="row" name="searchForm" method="post">
							<div class="col-auto p-1">
								<select name="schType" id="schType" class="form-select">
									<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
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
						</form>
					</div>
					<div class="col text-end">&nbsp;</div>
				</div>				
			</div>
		</div>
		   
			<ul class="faq">
			   <li class="qa_li">
			   	<div class="question">
			   		<p class="tit"> 작성된 후기가 보이지않아요. </p>
			   		  <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
			   	</div>
			      <div class="answer">
			         <p>작성한 후기가 두다뽀코별 후기 노출 기준에 맞지 않을 경우 삭제 또는 열람이 제한될 수 있습니다.</p>
			         <p>① 상품과 무관한 내용</p>
			         <p>② 성의없는 내용 작성 (동일한 내용 반복, 자음/모음 나열 등)</p>
			         <p>③ 허위 또는 과장, 광고 내용을 포함한 경우</p>
			         <p>④ 불법물, 음란물 또는 청소년유해매체물의 게시</p>
			         <p>⑤ 직접 촬영하지 않은 이미지 (상품페이지 등의 화면 캡처)</p>
			         <p>⑥ 구매 상품과 무관한 이미지 (바닥, 풍경, 연예인, 강아지, 고양이 등 구매한 상품이 보이지 않는
			            포토후기)</p>
			         <p>⑦ 그 외 서비스의 원활한 진행을 방해하는 것으로 판단되는 경우</p>
			         <p>⑧ 반품 등으로 구매가 취소된 경우</p>
			      </div>
			   </li>
			    
			   <li class="qa_li">
			   	<div class="question"> 
			   		<p class="tit">주문시 이미 인증된 휴대폰 번호라고 나와요.</p>
			   		<p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p> 
			   	</div>
			      <div class="answer">
			         휴대폰 번호 1개 당 인증은 1회만 가능합니다.
			         기존에 인증된 계정을 찾으시려면 아이디 찾기를 이용해 주시면 됩니다.
			         아이디 찾기를 통해 계정 확인이 어려운 경우 고객센터로 문의 부탁 드립니다.
			      </div>
			   </li>
			   
			   <li class="qa_li">
			   	<div class="question">
			   		<p class="tit">어떤 경우에 교환/반품이 불가능한가요? </p>
			   		<p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
			   	</div>
			      <div class="answer">
			         <p>교환/반품은 7일 이내에만 신청 가능합니다.</p>
			         <p>다만, 7일 이내에 신청하셔도 아래의 사유에 해당하면 교환/반품이 불가능합니다.</p>
			         <p>① 상품 사용, 상품 훼손 등으로 상품을 재판매하기 어려운 경우</p>
			         <p>② 포장 개봉, 포장 훼손, 라벨 또는 태그 제거 등으로 상품 가치가 상실된 경우</p>
			         <p>③ 택배상자를 이용하지 않고, 상품에 직접 송장을 부착하여 반품한 경우</p>
			         <p>④ 주문제작 상품 (예: 각인 이름표 등)</p>
			         <p>⑤ 상품 특성상 교환, 반품이 불가능한 경우</p>
			      </div>
			   </li>
			   
			   <li class="qa_li">
			    <div class="question">
			    	<p class="tit">토요일, 공휴일에 배송이 가능한가요? </p>
			    	<p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
			    </div>
			       <div class="answer">
			          택배사 운영 일정에 따라 배송이 진행되며, 토요일에는 배송이 되나 일요일, 공휴일에는 배송이 불가능합니다.
			          다만, 지역에 따라 토요일에 배송이 되지 않을 수 있습니다.
			       </div>
			   </li>
			</ul>
</div>

<script>
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

$(function(){
	listPage(1);
	
    $("button[role='tab']").on("click", function(e){
		// const tab = $(this).attr("aria-controls");
    	listPage(1);
    	
    });
});

// 글리스트 및 페이징 처리
function listPage(page) {
	const $tab = $("button[role='tab'].active");
	let categoryNum = $tab.attr("data-categoryNum");
	
	let url = "${pageContext.request.contextPath}/faq/list";
	let query = "pageNo="+page+"&categoryNum="+categoryNum;
	let search = $('form[name=faqSearchForm]').serialize();
	query = query+"&"+search;
	
	let selector = "#nav-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "text", fn);
}

//검색
function searchList() {
	const f = document.faqSearchForm;
	f.schType.value = $("#schType").val();
	f.kwd.value = $.trim($("#kwd").val());

	listPage(1);
}

// 새로고침
function reloadFaq() {
	const f = document.faqSearchForm;
	f.schType.value = "all";
	f.kwd.value = "";
	
	listPage(1);
}

</script>

