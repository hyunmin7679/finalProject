<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/heatmap.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<style>
.clickable-icon {
        cursor: pointer;
    }
.onm {
    color: black; /* 또는 다른 원하는 색상 */
    /* 기타 스타일 */
}

/* 마우스 호버 상태의 스타일 */
.onm.hovered {
    background-color: lightgray; /* 원하는 배경색상 */
    /* 기타 스타일 */
}
</style>
<!-- / Navbar -->



<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">


		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">커뮤니티관리 /</span> 인기 게시글<span>(좋아요,
				댓글수, 조회수)</span>
		</h4>

		<!-- Examples -->
		<div class="row mb-5">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<div class="col-md-6 col-lg-4 mb-3">
					<div class="card h-100">
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/uploads/bbs/${dto.fileName}"
							alt="Card image cap" />
						<div class="card-body">
							<h5 class="card-title">제목 : ${dto.subject }</h5>
							<p class="card-text">
								<i class="fa-regular fa-eye"></i> : ${dto.viewCount }
								&nbsp;&nbsp;|&nbsp;&nbsp; <i class='bx bxs-like'></i> :
								${dto.likeCount} &nbsp;&nbsp;|&nbsp;&nbsp; <i
									class='bx bxs-message-square-dots'></i> ${dto.replyCount }
							</p>
							<a class="btn btn-outline-primary article "
								data-communityNum="${dto.communityNum }"
								data-categoryNum="${dto.categoryNum}"> >게시글로이동</a>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<!-- Examples -->

		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light"></span> 게시글 관리
		</h4>


		<div class="row">





			<!-- Overview & Sales Activity -->
			<div class="col-md-6 col-lg-4 mb-4 communityList">
				
			</div>
			<!--/ Overview & Sales Activity -->

			<!-- 카테고리별 인기순 그래프  -->
			<div class="col-md-12 col-lg-8 mb-4 bestCategory"></div>




			<!--/ Total Income -->
		</div>
		<div class="row"></div>


	</div>
	<!-- / Content -->



	<div class="content-backdrop fade"></div>
</div>
<!-- Content wrapper -->
<script>

$(function(){
	 bestCategory();
	 communityList(1);
});


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




function bestCategory() {
	
	let url = "${pageContext.request.contextPath}/admin/community/bestCategoryList";
	let query = '';
	
	let selector = ".bestCategory";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}


function communityList(page) {
	
	let url = "${pageContext.request.contextPath}/admin/community/communityList";
	let query = 'page='+page;
	
	let selector = ".communityList";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}



function changeColor(element, onHover) {
    if (onHover) {
        element.classList.add('hovered'); // 원하는 CSS 클래스로 변경
    } else {
        element.classList.remove('hovered'); // 기본 CSS 클래스로 복원
    }
}
$('body').on('click', '.showNoState', function() {    
	 let selectshowNo = $(this).data("showno");
	 let showNo;
	 if(selectshowNo == 1 ){
		 showNo = 0
	 }else{
		 showNo = 1
	 }
	 console.log(showNo);
	 
	 
	 let query = "showNo="+showNo
	 let url = "${pageContext.request.contextPath}/admin/community/showState";
	 
	 const fn = function(data){
		 communityList(1);
	 };
	 
	 ajaxFun(url, "post", query, "json", fn);
	 
	 
});







</script>