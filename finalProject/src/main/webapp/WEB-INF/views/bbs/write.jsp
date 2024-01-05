<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		
<form name="boardForm" method="post" enctype="multipart/form-data">
	<table class="table mt-5 write-form">
		<tr>
			<td class="bg-light col-sm-2" scope="row">제 목</td>
			<td>
				<input type="text" name="subject" class="form-control" value="${dto.subject}">
			</td>
		</tr>
     
		<tr>
			<td class="bg-light col-sm-2" scope="row">작성자명</td>
				<td>
				<p class="form-control-plaintext">${sessionScope.member.userName}</p>
			</td>
		</tr>
		
		<tr>
			<td class="bg-light col-sm-2" scope="row">카테고리</td>
				<td>
				<select name="categoryNum" class="form-select">
					<option value="1" ${dto.communityNum == 1 ? "selected" : ""} >나눔</option>
					<option value="2" ${dto.communityNum == 2 ? "selected" : ""}>상담</option>
					<option value="3" ${dto.communityNum == 3 ? "selected" : ""}>자유</option>
					<option value="4" ${dto.communityNum == 4 ? "selected" : ""}>산책메이트</option>
				</select>
			</td>
		</tr>

		<tr>
			<td class="bg-light col-sm-2" scope="row">내 용</td>
			<td>
				<textarea name="content" id="ir1" class="form-control" style="width: 99%; height: 300px;">${dto.content}</textarea>
			</td>
		</tr>
		
		<tr>
			<td class="bg-light col-sm-2" scope="row" >산책로이름</td>
			<td>
				<input type="text" name="parkname" class="form-control" value="${dto.parkname}">
			</td>
		</tr>
		<tr>
			<td class="bg-light col-sm-2" scope="row">산책로주소</td>
			<td>
				<input type="text" name="park" class="form-control" value="${dto.park}">
			</td>
		</tr>
		
		<tr>
			<td class="bg-light col-sm-2" scope="row">이미지</td>
			<td>
				<div class="img-grid"><img class="item img-add rounded" src="${pageContext.request.contextPath}/resources/images/add_photo.png"></div>
				<input type="file" name="selectFile" accept="image/*" multiple style="display: none;" class="form-control">
			</td>
		</tr>
		
		<c:if test="${mode=='update'}">
			<tr>
				<td class="bg-light col-sm-2" scope="row">등록이미지</td>
				<td> 
					<div class="img-box">
						<c:forEach var="vo" items="${listFile}">
							<img src="${pageContext.request.contextPath}/uploads/bbs/${vo.filename}"
								class="delete-img"
								data-fileNum="${vo.fileNum}">
						</c:forEach>
					</div>
				</td>
			</tr>
		</c:if>
	</table>
	
	<table class="table table-borderless" data-mode = "${mode}">
			<tr>
			<td class="text-center">
				<button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i class="bi bi-check2"></i></button>
				<button type="reset" class="btn btn-light">다시입력</button>
				<button type="button" class="btn btn-light" onclick="sendCancel('${pageNo}');">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i class="bi bi-x"></i></button>
				<c:if test="${mode=='update'}">
					<input type="hidden" name="communityNum" value="${dto.communityNum}">
					<input type="hidden" name="fileNum" value="${dto.fileNum}">
				</c:if>
			</td>
		</tr>
	</table>
</form>

<c:if test="${mode=='update'}">
	<script type="text/javascript">
		$(function(){
			$(".delete-img").click(function(){
				if(! confirm("이미지를 삭제 하시겠습니까 ?")) {
					return false;
				}
				
				let $img = $(this);
				let fileNum = $img.attr("data-fileNum");
				let url="${pageContext.request.contextPath}/bbs/deleteFile";
				
				$.ajaxSetup({ beforeSend: function(e) { e.setRequestHeader('AJAX', true); } });
				$.post(url, {fileNum:fileNum}, function(data){
					$img.remove();
				}, "json").fail(function(){
					alert('error....');
				});
			});
		});
	</script>
</c:if>


<script type="text/javascript">

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		
		let mode = "${mode}";
		let url = "${pageContext.request.contextPath}/bbs/" + mode;
	    let page = "${pageNo}";
	    let formData = new FormData(elClickedObj);
	    
	    const fn = function(data){
			let state = data.state;
	        if(state === "false") {
	            alert("게시물을 추가(수정)하지 못했습니다. !!!");
	            return false;
	        }
	        
	    	if(! page) {
	    		page = "1";
	    	}
	    	
	    	listPage(page);
		};
		
		ajaxFun(url, "post", formData, "json", fn, true);
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}

$(function(){
	var sel_files = [];
	
	$(".write-form").on("click", ".img-add", function(event){
		$("form[name=boardForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=boardForm] input[name=selectFile]").change(function(){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.boardForm.selectFile.files = dt.files;
			
	    	return false;
	    }
	    
       for(let file of this.files) {
       	sel_files.push(file);
       	
           const reader = new FileReader();
			const $img = $("<img>", {class:"item img-item"});
			$img.attr("data-filename", file.name);
           reader.onload = e => {
           	$img.attr("src", e.target.result);
           };
			reader.readAsDataURL(file);
           
           $(".img-grid").append($img);
       }
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.boardForm.selectFile.files = dt.files;		
	    
	});
	
	$(".write-form").on("click", ".img-item", function(event) {
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
	    for(let i = 0; i < sel_files.length; i++) {
	    	if(filename === sel_files[i].name){
	    		sel_files.splice(i, 1);
	    		break;
			}
	    }
	
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.boardForm.selectFile.files = dt.files;
		
		$(this).remove();
	});
});
</script>
