<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">

<style type="text/css">
.body-container {
	max-width: 800px;
}


.img-box img {
    width: 50px;
    height: 50px;
    margin-right: 5px;
    flex: 0 0 auto;
    cursor: pointer;
    border: 1px solid #c2c2c2;
    border-radius: 10px;
}

img, svg {
    vertical-align: middle;
}

.img-grid .item {
	object-fit:cover;
	width: 50px; height: 50px; border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}
.delete-file { cursor: pointer; }
.delete-file:hover { color: #0d58ba; }
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<script type="text/javascript">
    function sendOk() {
        const f = document.noticeForm;

    	let str = f.subject.value;
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

    	f.action="${pageContext.request.contextPath}/notice/${mode}";
		f.submit();
        return true;
    }
</script>

<div class="body-container">
    <div class="body-title">
		<h2><i class="fas fa-clipboard-list"></i> 공지사항 </h2>
    </div>
    
    <div class="body-main">
    	
		<form name="noticeForm" method="post" enctype="multipart/form-data">
			<table class="table table-border border-top2 table-form">
				<tr> 
					<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td> 
						<input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
					</td>
				</tr>
			
				<tr> 
					<td>공지여부</td>
					<td> 
						<input type="checkbox" name="notice" id="notice" class="form-check-input" value="1" ${dto.notice==1 ? "checked":"" }>
						<label for="notice" class="form-check-label">공지</label>
					</td>
				</tr>

				<tr> 
					<td>출력여부</td>
					<td> 
						<input type="checkbox" name="showNotice" id="showNotice" class="form-check-input" value="1" ${mode=="write" || dto.showNotice==1 ? "checked":"" }>
						<label for="showNotice" class="form-check-label">표시</label>
					</td>
				</tr>
			  
				<tr> 
					<td>작성자</td>
					<td> 
						<p class="form-control-plaintext">${sessionScope.member.userName}</p>
					</td>
				</tr>
			
				<tr> 
					<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					<td valign="top"> 
						<textarea name="content" class="form-control" style="max-width: 97%; height: 290px;">${dto.content}</textarea>
					</td>
				</tr>
			  
				<tr>
					<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
					<td> 
						<input type="file" name="selectFile" class="form-control" multiple>
					</td>
				</tr>
	              
				<c:if test="${mode=='update'}">
					<c:forEach var="vo" items="${listFile}">
						<tr> 
							<td>첨부된파일</td>
							<td> 
								<span class="delete-file" data-fileNum="${vo.fileNum}"><i class="fa-solid fa-trash-can"></i></span> 
								${vo.originalFilename}
							</td>
						  </tr>
					</c:forEach>
				</c:if>
			</table>
				
			<table class="table">
				<tr> 
					<td align="center">
						<button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
						<button type="reset" class="btn">다시입력</button>
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/list';">${mode=='update'?'수정취소':'등록취소'}</button>
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

<c:if test="${mode=='update'}">
	<script type="text/javascript">
		$('.delete-file').click(function(){
			if(! confirm('선택한 파일을 삭제 하시겠습니까 ? ')) {
				return false;
			}
			
			let $tr = $(this).closest('tr');
			let fileNum = $(this).attr('data-fileNum');
			let url = '${pageContext.request.contextPath}/notice/deleteFile';
			
			$.ajaxSetup({ beforeSend: function(e) { e.setRequestHeader('AJAX', true); } });
			$.post(url, {fileNum:fileNum}, function(data){
				$($tr).remove();
			}, 'json').fail(function(){
				alert('error...');
			});
		});
	</script>
</c:if>

