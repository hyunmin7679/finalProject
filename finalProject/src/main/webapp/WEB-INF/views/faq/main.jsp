<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

</script>
<style type="text/css">
@import url('http://fonts.googleapis.com/earlyaccess/notosanskr.css');

ul, li, p { list-style:none; padding:0; margin:0; }
.body-container {max-width: 800px; }
.fa-regular {text-align: center;}

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

<div class="container body-container ">
    <div class="title">
       <h3>FAQ</h3>
    </div>
   
	<div class="category-bar">
		<div class="bar-item p-3 active">
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
		<div class="bar-item p-3">
			<a href="${pageContext.request.contextPath}/qna/list"><i class="fa-solid fa-file-pen fa-lg"></i><br>문의사항</a>
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
						<div class="col p-1">
							<select name="schType" id="schType" class="form-select">
								<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
								<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
								<option value="content" ${schType=="content"?"selected":""}>내용</option>
							</select>
						</div>
						<div class="col-auto p-1">
							<input type="text" name="kwd" id="kwd" value="${kwd}" class="form-control">
						</div>
						<div class="col p-1">
							<button type="button" class="btn btn-light" onclick="searchList()"> <i class="bi bi-search"></i> </button>
						</div>
					</form>
				</div>
				<div class="col text-end">&nbsp;</div>
			</div>				
		</div>
	</div>		   
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