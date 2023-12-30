<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<style type="text/css">
.body-container {
	max-width: 870px;
}

</style>

<script type="text/javascript">
function sendOk() {
    const f = document.qnaForm;
	
    let str;
	str = f.q_subject.value;
	
	if(str == "[상품] 상품관련 문의"){
		if(!f.productName.value){
			alert("상품관련 문의 시 상품선택은 필수입니다.");
			str.focus();
			return;
		}	
	}

    f.action = "${pageContext.request.contextPath}/qna/${mode}";
    f.submit();
}

</script>

<div class="container">
	<div class="body-container">	
		<div class="body-title">
			<h3><i class="bi bi-exclamation-square"></i> 문의하기 </h3>
		</div>
		
		<div class="body-main">
			<form name="qnaForm" method="post">
				<table class="table mt-5 write-form">
					<tr>
						<td class="bg-light col-sm-2" scope="row">제 목</td>
						<td>
							<div class="row">
								<div class="col-sm-4">
									<select name="q_subject" class="form-select">
										<option value="">:: 제목 선택 ::</option>
										<option value="[상품] 상품관련 문의" ${dto.q_subject=="[상품] 상품관련 문의"?"selected":""}>[상품] 상품관련 문의</option>
										<option value="[배송] 배송관련 문의" ${dto.q_subject=="[배송] 배송관련 문의"?"selected":""}>[배송] 배송관련 문의</option>										
										<option value="[주문] 주문관련 문의" ${dto.q_subject=="[주문] 주문관련 문의"?"selected":""}>[주문] 주문관련 문의</option>										
										<option value="[반품/환불] 반품/환불 문의" ${dto.q_subject=="[반품/환불] 반품/환불 문의"?"selected":""}>[반품/환불] 반품/환불 문의</option>										
										<option value="[기타] 기타 문의" ${dto.q_subject=="[기타] 기타 문의"?"selected":""}>[기타] 기타 문의</option>										
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="bg-light col-sm-2" scope="row">상품명</td>
						<td>
							<c:if test="${mode=='write'}">
								<input type="text" name="productName" class="form-control" readonly>
								<button type="button" class="btn btn-light btn-append">상품선택</button>
								<span style="font-size: 13px; color: #003166;">상품문의 시 상품선택 바랍니다.</span>
							</c:if>
							
							<c:if test="${mode=='update'}"> 
								<input type="text" name="productName" class="form-control" readonly value="${dto.productName}">
								<button type="button" class="btn btn-light btn-append">상품선택</button>							
							</c:if>
							
							<input type="hidden" name="productNum" value="0">
						</td>
					</tr>
					
					<tr>
						<td class="bg-light col-sm-2" scope="row">작성자명</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>
					<tr>
						<td class="bg-light col-sm-2" scope="row">공개여부</td>
						<td class="py-3"> 
							<input type="radio" name="secret" id="secret1" class="form-check-input" 
								value="0" ${empty dto || dto.secret==0?"checked":"" }>
							<label class="form-check-label" for="secret1">공개</label>
							<input type="radio" name="secret" id="secret2" class="form-check-input"
								value="1" ${dto.secret==1?"checked":"" }>
							<label class="form-check-label" for="secret2">비공개</label>
						</td>
					</tr>
					<tr>
						<td class="bg-light col-sm-2" scope="row">내 용</td>
						<td>
							<textarea name="question" class="form-control"><c:if test="${mode=='write'}">※ 문의 시 상품명 또는 주문번호를 작성해주시면 정확하고 빠른 답변에 도움이 됩니다.</c:if>${dto.question}</textarea>
						</td>
					</tr>	
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
							<button type="reset" class="btn btn-light">다시입력</button>
							<button type="button" class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/qna/list';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>


<!-- 상품 검색 대화상자 -->
<div class="modal fade" id="productSearchModal" tabindex="-1" aria-labelledby="searchModalLabel"
				aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		
			<div class="modal-header">
				<h5 class="modal-title" id="searchViewerModalLabel">상품검색</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			
			<div class="modal-body">
                <div class="row search-form">
					<div class="col-4 pe-1">
						<select name="schType" class="form-select">
				            <option value="productName" ${schType=="productName"?"selected":""}>상품명</option>
				            <option value="all" ${schType=="all"?"selected":""}>코드+상품명</option>
			        	</select>
					</div>
					<div class="col ps-0 pe-1">
						<input type="text" name="kwd" value="${kwd}" class="form-control">
					</div>
					<div class="col-auto ps-0 pe-2">
						<button type="button" class="btn btn-light btn-productSearch" title="검색"><i class="bi bi-search"></i></button>
					</div>
                </div>
               	<div class='row mt-2 border-top border-bottom bg-light p-2'>
               	 	<div class='col-3 text-center'>상품코드</div>
               	 	<div class='col ps-2'>상품명</div>
               	</div>
                <div class="product-search-list"></div>
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
		settings.processData = false; 
		settings.contentType = false; 
	}
	
	$.ajax(url, settings);
}

$(function(){
	// 상품 선택 버튼
	$(".btn-append").click(function(){
		// 모달 뜸
		$(".search-form input[name=productNum]").val("");
		$(".search-form input[name=productName]").val("");
		$(".product-search-list").html("");

		$("#productSearchModal").modal("show");
	});
	
	// 모달 내 검색 버튼
	$(".btn-productSearch").click(function(){
    	
		let schType = $(".search-form select[name=schType]").val();
	    let kwd = $(".search-form input[name=kwd]").val();
		
	    let query = "schType="+schType+"&kwd="+encodeURIComponent(kwd);
	    let url = "${pageContext.request.contextPath}/qna/productSearch";
	    
	    
	    const fn = function(data) { 
	    	let out = "";
	    	for(let item of data.list) {
	    		let productNum = item.productNum;
	    		let productName = item.productName;
	    		//썸네일 추가할거면 여기에
	    		
	    		out += "<div class='row mb-2 p-2 border-bottom'>";
	    		out += "  <div class='col-3 text-center'>"+productNum+"</div>"
	    		out += "  <div class='col ps-2 search-productName' data-productNum='"+productNum+"'>"+productName+"</div>";
	    		out += "</div>";
	    	}
	    	$(".product-search-list").html(out);
		};
		
		ajaxFun(url, "get", query, "json", fn);
	});
	
	// 상품검색 대화상자-검색된 상품을 클릭한 경우
	$("body").on("click", '.search-productName', function(){
		let productNum = $(this).attr("data-productNum");
		let productName = $(this).text().trim();
		
		$(".write-form input[name=productNum]").val(productNum);
		$(".write-form input[name=productName]").val(productName);
		
		$("#productSearchModal").modal("hide");
		
	});
});

</script>
