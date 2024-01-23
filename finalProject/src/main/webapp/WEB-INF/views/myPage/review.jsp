<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-title2 {
    color: #424951;
    padding-top: 10px;
    padding-bottom: 5px;
    margin: 0 0 25px 0;
  }

.body-container {
	max-width: 1000px;
}

.nav-tabs .nav-link {
	min-width: 170px;
	background: #f3f5f7;
	border-radius: 0;
	border-right: 1px solid #dbdddf;
	color: #333;
	font-weight: 600;
}
.nav-tabs .nav-link.active {
	background: #3d3d4f;
	color: #fff;
}
.tab-pane { min-height: 300px; }

.score-star { font-size: 0; letter-spacing: -4px; }
.score-star .item {
	font-size: 22px; letter-spacing: 1px; display: inline-block;
	color: #ccc; text-decoration: none; vertical-align: middle;
}
.score-star .item:first-child{ margin-left: 0; }
.score-star .on { color: #00D8FF; }

.md-img img { width: 150px; height: 150px; cursor: pointer; object-fit: cover; }
.deleteReview, .deleteQuestion { cursor: pointer; padding-left: 5px; }
.deleteReview:hover, .deleteQuestion:hover { font-weight: 500; color: #2478FF; }
.non-data {text-align: center; margin:30px; padding-top: 20px; font-weight: bold; font-size: 16px; color: gray;}

</style>

<script type="text/javascript">
$(function(){
	$("button[role='tab']").on('click', function(){
		const tab = $(this).attr("aria-controls");
		
		if(tab === "1") {
			listReview(1);
		} else if(tab === "2"){
			listQna(1);
		} else if(tab === "3"){
			listCommunity(1);
		} else if(tab === "4"){
			listLike(1);
		}
	});
	
	let mode = "${mode}";
	
	if(mode === "qna") {
		listQna(1);
	} else if (mode === "community") {
		listCommunity(1);
	} else if (mode === "like") {
		listLike(1);
	} else {
	    listReview(1);
	}
	
	
});

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
</script>

<div class="container">
	<div class="body-container">
			<div class="body-title2">
		  	 	<p style="font-size: 22px;"><span style="border-bottom: 12px solid #dcf1fb; padding: 0 0 0 0.2em; width: 100%"><i class="fa-regular fa-rectangle-list"></i> 내 활동</span></p>
			</div>
			
		<div class="body-main">

			<ul class="nav nav-tabs mt-5" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link ${mode=='review'?'active':'' }" id="tab-1" data-bs-toggle="tab" data-bs-target="#tab-pane-1" type="button" role="tab" aria-controls="1" aria-selected="false"> 리뷰 </button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link ${mode=='qna'?'active':'' }" id="tab-2" data-bs-toggle="tab" data-bs-target="#tab-pane-2" type="button" role="tab" aria-controls="2" aria-selected="false"> 상품문의 </button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link ${mode=='community'?'active':'' }" id="tab-3" data-bs-toggle="tab" data-bs-target="#tab-pane-3" type="button" role="tab" aria-controls="3" aria-selected="false"> 커뮤니티 글 </button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link ${mode=='like'?'active':'' }" id="tab-4" data-bs-toggle="tab" data-bs-target="#tab-pane-4" type="button" role="tab" aria-controls="4" aria-selected="false"> 좋아요한 글 </button>
				</li>
			</ul>
			
			<div class="tab-content pt-2" id="myTabContent">
				<div class="tab-pane fade ${mode=='review'?'active show':'' }" id="tab-pane-1" role="tabpanel" aria-labelledby="tab-1" tabindex="0">
					<div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">상품 리뷰</p> 
					</div>
					
					<div class="mt-2 list-review"></div>
				</div>
				
				<div class="tab-pane fade ${mode=='qna'?'active show':'' }" id="tab-pane-2" role="tabpanel" aria-labelledby="tab-2" tabindex="0">
					<div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">상품문의</p> 
					</div>
					
					<div class="mt-2 list-qna"></div>
				</div>
				
				<div class="tab-pane fade ${mode=='community'?'active show':'' }" id="tab-pane-3" role="tabpanel" aria-labelledby="tab-3" tabindex="0">
					<div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">커뮤니티 글</p> 
					</div>
			
					<div class="mt-1 p-2 list-community"></div>
				</div>
				
				<div class="tab-pane fade ${mode=='like'?'active show':'' }" id="tab-pane-4" role="tabpanel" aria-labelledby="tab-4" tabindex="0">
					<div class="mt-3 pt-3 border-bottom">
						<p class="fs-4 fw-semibold">좋아요한 글</p> 
					</div>
			
					<div class="mt-1 p-2 list-like"></div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
// review -------------
function listReview(page) {
	let url = '${pageContext.request.contextPath}/review/list2';
	let query = 'pageNo='+page;
	
	const fn = function(data) {
		printReview(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);	
}

function printReview(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	let out = '';
	for(let item of data.list) {
		let num = item.num;
		let userName = item.userName;
		let score = item.score;
		let review = item.review;
		let review_date = item.review_date;
		let answer = item.answer;
		let answer_date = item.answer_date;
		let listFilename = item.listFilename;
		
		let productName = item.productName;
		let optionValue = item.optionValue;
		let optionValue2 = item.optionValue2;
		
		out += '<div class="mt-3 border-bottom">';
		out += '  <div class="p-2 fw-semibold">';
		out +=        productName+'('+ optionValue+'/'+optionValue2+')';
		out += '  </div>';
		out += '    <div class="col text-end"><span>'+review_date+'</span>';
		out += '       <span class="deleteReview" data-num="'+num+'" data-page="' +pageNo+'"><i class="fa-solid fa-circle-xmark" style="color: #db0000;"></i></div>';	
		out += '  <div class="row p-2">';
		out += '    <div class="col-auto pt-0 ps-2 pe-1 score-star">';
		for(let i=1; i<=5; i++) {
			out += '  <span class="item fs-6 ' + (score>=i ? 'on' : '') + '"><i class="bi bi-star-fill"></i></span>';
		}
		out += '    </div>';
		out += '  </div>';
		out += '  <div class="mt-2 p-2">' + review + '</div>'; 

		if(listFilename && listFilename.length > 0) {
			out += '<div class="row gx-1 mt-2 mb-1 p-1">';
				for(let f of listFilename) {
					out += '<div class="col-md-auto md-img">';
					out += '  <img class="border rounded" src="${pageContext.request.contextPath}/uploads/review/'+f+'">';
					out += '</div>';
				}
			out += '</div>';
		}  
		    
		if(answer) {
			out += '  <div class="p-3 pt-0">';
			out += '    <div class="bg-light">';
			out += '      <div class="p-2 pb-0">';
			out += '        <label class="text-bg-primary px-2"> 관리자 </label> <label>' + answer_date + '</label>';
			out += '      </div>';
			out += '      <div class="p-2 pt-1">' + answer + '</div>';
			out += '    </div>';
			out += '  </div>';
		}
		out += '</div>';
	}
	if(dataCount > 0) {
		out += '<div class="page-navigation">' + paging + '</div>';
	} else {
		out += '<div class="non-data">등록하신 리뷰가 없습니다.</div>';
	}
	
	$('.list-review').html(out);	
}  

$(function(){
	$('.list-review').on('click', '.deleteReview', function(){
		
		if(! confirm('리뷰를 삭제하시겠습니까 ? ')) {
		    return false;
		}
		
		let num = $(this).attr('data-num');
		let page = $(this).attr('data-page');
		
		let url = '${pageContext.request.contextPath}/review/delete';
		let query = 'num=' + num + '&pageNo=' + page;
		
		const fn = function(data) {

			listReview(page);
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

//qna ---------------------------------------------------------------------------

function listQna(page) {
	let url = '${pageContext.request.contextPath}/proqna/list2';
	let query = 'pageNo='+page;
	
	const fn = function(data) {
		printQna(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);	
}

function printQna(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	console.log(dataCount);
	
	let out = '';
	for(let item of data.list) {
		let num = item.num;
		let userName = item.userName;
		let question = item.question;
		let question_date = item.question_date;
		let answer = item.answer;
		let answer_date = item.answer_date;
		let answerState = answer_date ? '<span class="text-primary">답변완료</span>' : '<span class="text-secondary">답변대기</span>';
		let listFilename = item.listFilename;
		let productName = item.productName;

		out += '<div class="mt-1 border-bottom">';
		out += '  <div class="mt-2 p-2 fw-semibold">' + productName + '</div>';
		out += '  <div class="p-2">' + question + '</div>';

		if(listFilename && listFilename.length > 0) {
			out += '<div class="row gx-1 mt-2 mb-1 p-1">';
				for(let f of listFilename) {
					out += '<div class="col-md-auto md-img">';
					out += '  <img class="border rounded" src="${pageContext.request.contextPath}/uploads/qna/'+f+'">';
					out += '</div>';
				}
			out += '</div>';
		}
		out += '  <div class= p-2 text-end">';
		out += '     <div class="col-auto pt-2 pe-0 text-end">' + answerState + '</div>';
		out += '     <div class="col-auto pt-2 px-0 text-end ">&nbsp;&nbsp;<span>'+question_date+'</span>';
		out += '       <span class="deleteQuestion" data-num="'+num+'" data-page="' +pageNo+'"><i class="fa-solid fa-circle-xmark" style="color: #db0000;"></i></span></div>';	
		out += '      </div>';
		if(answer) {
			out += '  <div class="col pt-2 text-end"><button class="btn btnAnswerView"> <i class="bi bi-chevron-down"></i> </button></div>';
		}
		out += '  </div>';
		if(answer) {
			out += '  <div class="p-3 pt-0 answer-content" style="display: none;">';
			out += '    <div class="bg-light">';
			out += '      <div class="p-3 pb-0">';
			out += '        <label class="text-bg-primary px-2"> 관리자 </label> <label>' + answer_date + '</label>';
			out += '      </div>';
			out += '      <div class="p-3 pt-1">' + answer + '</div>';
			out += '    </div>';
			out += '  </div>';
		}
		out += '</div>';
	}
	
	if(dataCount > 0) {
		out += '<div class="page-navigation">' + paging + '</div>';
	} else {
		out += '<div class="non-data">등록하신 상품문의가 없습니다.</div>';
	}

	$('.list-qna').html(out);
}

$(function(){
	$('.list-qna').on('click', '.deleteQuestion', function(){
		
		if(! confirm('상품문의를 삭제하시겠습니까 ? ')) {
		    return false;
		}
		
		let num = $(this).attr('data-num');
		let page = $(this).attr('data-page');
		
		let url = '${pageContext.request.contextPath}/proqna/delete';
		let query = 'num=' + num + '&pageNo=' + page;
		
		const fn = function(data) {

			listQna(page);
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

//community ---------------------------------------------------------------------------

function listCommunity(page) {
	let url = '${pageContext.request.contextPath}/bbs/list2';
	let query = 'pageNo='+page;
	
	const fn = function(data) {
		printCommunity(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);	
}


function printCommunity(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	let out = '';
	for(let item of data.list) {
		let communityNum = item.communityNum;
		let userName = item.userName;
		let subject = item.subject;
		let content = item.content;
		let reg_date = item.reg_date;
		let hitCount = item.hitCount;
		let replyCount = item.replyCount;
		let listFilename = item.listFilename;

		out += '<div class="mt-1 border-bottom">';
		out += '  <div class="mt-2 p-2 fw-semibold">' + subject + '</div>';
		out += '     <div class="col-auto pt-2 px-0 text-end">&nbsp;&nbsp;<span>'+reg_date+'</span>';
		out += '        <span class="deleteCommunity" data-communityNum="' + communityNum + '" data-page="' +pageNo+'"><i class="fa-solid fa-circle-xmark" style="color: #db0000;"></i></span>';
		out += '      </div>';
		out += '  <div class="p-2">' + content + '</div>';

		if(listFilename && listFilename.length > 0) {
			out += '<div class="row gx-1 mt-2 mb-1 p-1">';
				for(let f of listFilename) {
					out += '<div class="col-md-auto md-img">';
					out += '  <img class="border rounded" src="${pageContext.request.contextPath}/uploads/bbs/'+f+'">';
					out += '</div>';
				}
			out += '</div>';
		}
		out += '  <div class="p-2 text-end">';
		out += '     <div class="col-auto pt-2 pe-0"><i class="fa-regular fa-eye"></i> ' + hitCount + '</div>';
		out += '  </div>';
		out += '</div>';
	}
	
	if(dataCount > 0) {
		out += '<div class="page-navigation">' + paging + '</div>';
	} else {
		out += '<div class="non-data">등록하신 게시글이 없습니다.</div>';
	}

	$('.list-community').html(out);
}

$(function(){
	$('.list-community').on('click', '.deleteCommunity', function(){
		
		if(! confirm('커뮤니티 글을 삭제하시겠습니까 ? ')) {
		    return false;
		}
		
		let communityNum = $(this).attr('data-communityNum');
		let page = $(this).attr('data-page');
		
		let url = '${pageContext.request.contextPath}/bbs/delete';
		let query = 'communityNum=' + communityNum + '&pageNo=' + page;
		
		const fn = function(data) {
			listCommunity(page);
		};
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});

// like ---------------------------------------------------------------------------

function listLike(page) {
	let url = '${pageContext.request.contextPath}/bbs/likeList2';
	let query = 'pageNo='+page;
	
	const fn = function(data) {
		printLike(data);
	};
	ajaxFun(url, 'get', query, 'json', fn);	
}

function printLike(data) {
	let dataCount = data.dataCount;
	let pageNo = data.pageNo;
	let total_page = data.total_page;
	let size = data.size;
	let paging = data.paging;
	
	let out = '';
	for(let item of data.list) {
		let communityNum = item.communityNum;
		let subject = item.subject;
		let content = item.content;
		let reg_date = item.reg_date;
		let hitCount = item.hitCount;
		let userId = item.userId;
		//let answerState = answer_date ? '<span class="text-primary">답변완료</span>' : '<span class="text-secondary">답변대기</span>';
		let listFilename = item.listFilename;
	//	let productName = item.productName; 

		out += '<div class="mt-1 border-bottom">';
		out += '  <div class="mt-2 p-2 fw-semibold">' + subject + '</div>';
		out += '  <div class="p-2">' + content + '</div>';

		if(listFilename && listFilename.length > 0) {
			out += '<div class="row gx-1 mt-2 mb-1 p-1">';
				for(let f of listFilename) {
					out += '<div class="col-md-auto md-img">';
					out += '  <img class="border rounded" src="${pageContext.request.contextPath}/uploads/bbs/'+f+'">';
					out += '</div>';
				}
			out += '</div>';
		}
		out += '  <div class="col p-2 text-end">';
		out += '     <div class="col-auto pt-2 px-0"><i class="fa-regular fa-eye"></i>'+hitCount+'&nbsp;&nbsp;|&nbsp;&nbsp;<span>'+reg_date+'</span>';
		out += '      </div>';
		out += '  </div>';
		out += '</div>';
	}
	
	if(dataCount > 0) {
		out += '<div class="page-navigation">' + paging + '</div>';
	} else {
		out += '<div class="non-data">좋아요 누른 게시글이 없습니다.</div>';
	}

	$('.list-like').html(out);
}



</script>
