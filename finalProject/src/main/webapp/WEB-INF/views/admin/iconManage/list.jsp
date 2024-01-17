<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<style>
.img-viewer {
	cursor: pointer;
	border: 1px solid #ccc;
	width: 100px;
	height: 100px;
	background-image: url(../../bootstrapTemp/assets/img/avatars/blank.png);
	position: relative;
	z-index: 9999;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

<!-- Content wrapper -->
<div class="content-wrapper container">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">


		<h4 class="py-3 mb-4">&nbsp;&nbsp;아이콘 관리</h4>


		




		<!-- Icon container -->
		<div id="nav-content"></div>
		

		<!-- modal -->
		<div class="modal fade" id="editUser" tabindex="-1" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog modal-lg modal-simple modal-edit-user">
				<div class="modal-content p-3 p-md-5">
					<div class="modal-body write-form">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
						<div class="text-center mb-4">
							<h3>아이콘 추가</h3>
							<p>유저를 위한 아이콘을 추가하세요</p>
						</div>
						<form id="iconForm" name="iconForm" method="post"
							enctype="multipart/form-data" class="row g-3">
							<div class="col-12  mt-3" style="margin: auto;">
								<input style="text-align: center;" type="text"
									id="iconName" name="iconName"
									class="form-control" placeholder="아이콘 이름">
							</div>
							<div class="col-12  mt-3">
								<input style="text-align: center;" type="text"
									id="iconPrice" name="iconPrice" class="form-control"
									placeholder="가격">
							</div>
							<div class="col-12 mt-3">
								<select id="modalEditUserStatus" name="iconCategory"
									class="form-select" aria-label="Default select example">
									<option style="text-align: center;">카테고리</option>
									<option value="1">강아지</option>
									<option value="2">고양이</option>
									<option value="3">기타</option>
								</select>
							</div>
							<div class="col-12 mt-3 d-flex justify-content-center"
								style="text-align: center;">
								<div class="img-viewer"></div>
								<input type="file" name="selectFile" class="form-control"
									style="display: none;">

								<!-- 
								<img alt="이미지" src="../../bootstrapTemp/assets/img/avatars/blank.png"
								style="width: 100px; height: 100px;">
								 -->
							</div>

							<div class="col-12 text-center ">
								<button type="button"
									class="btn btn-secondary me-sm-3 me-1 btnSendOk">확인</button>
								<button type="reset" class="btn btn-label-secondary"
									data-bs-dismiss="modal" aria-label="Close">Cancel</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Buttons -->


	</div>
	<!-- / Content -->




	<!-- Footer -->
	<footer class="content-footer footer bg-footer-theme"> </footer>
	<!-- / Footer -->


	<div class="content-backdrop fade"></div>
</div>

<script type="text/javascript">


// ajax
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
		    	} else if(jqXHR.status === 401) {
		    		return false;
		    	} else if(jqXHR.status === 402) {
		    		alert('권한이 없습니다.');
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
});


$(function(){
	$('.container').on('click', '.btnSendOk', function() {
		//  글 등록 완료
		const f = document.iconForm;
		
		let str;
			
		str = f.iconName.value.trim();
		if(!str) {
			alert('아이콘 이름 입력해주세요. ');
			f.iconName.focus();
			return false;
		}

		str = f.iconPrice.value.trim();
	    if(!str) {
	        alert('가격을 입력하세요. ');
	        f.iconPrice.focus();
	        return;
	    }
	    
	    // iconCategory
	     if(!f.iconCategory.value) {
	        alert('카테고리를 선택해주세요. ');
	        f.iconCategory.focus();
	        return;
	    }
	   
	    if( ! f.selectFile.value ) {
	        alert('이미지 파일을 추가 하세요. ');
	        f.selectFile.focus();
	        return;
		}
		    
		let url = "${pageContext.request.contextPath}/admin/iconManage/iconRegi";
		
	    let formData = new FormData(f);
	
		const fn = function(data){
			let state = data.state;
	        if(state === "false") {
	            alert("아이콘 추가하지 못했습니다. !!!");
	            return false;
	        }

	       /*  $('#searchInput').val('');
	        $('#searchWord').val('');
	        
			$('.list-content').empty(); */
	    	// loadContent(1);
			listPage(1);
	    	$('#editUser').modal('hide');
		};
		
		ajaxFun(url, 'post', formData, 'json', fn, true);
	});
});



$(function(){
	$('.container').on('click', '.btnUpdate', function() {
		//  글 수정 완료
		const f = document.iconForm;
		
		let url = "${pageContext.request.contextPath}/admin/iconManage/iconUpdate";
		
	    let formData = new FormData(f);
	
		const fn = function(data){
			let state = data.state;
	        if(state === "false") {
	            alert("아이콘 수정 불가능");
	            return false;
	        }

			listPage(1);
	    	$('#editUser').modal('hide');
		};
		
		ajaxFun(url, 'post', formData, 'json', fn, true);
	});
});



$(function(){
	$('.container').on('click', '.deleteIcon', function() {

		let iconNum = $(this).attr('data-num');
		let iconImage = $(this).attr('data-iconImage');
		
		let url = '${pageContext.request.contextPath}/admin/iconManage/deleteIcon';
		let query = 'iconNum=' + iconNum + '&iconImage=' + iconImage;
		
		if(! confirm("아이콘을 삭제하시겠습니까 ? ")) {
			  return;
		}
		
		const fn = function(data){
			listPage(1);
	    	$('#editUser').modal('hide');
	    	$('#modalCenter').modal('hide');
		};
		
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});





//글리스트 및 페이징 처리
function listPage(page) {
	
	let url = "${pageContext.request.contextPath}/admin/iconManage/icons";
	
	let schType = $('#ProductStatus').val();
    let kwd = $('input[name="kwd"]').val();
    console.log(schType);
    console.log(kwd);
	
	let query = "page="+page+"&schType="+schType+"&kwd="+encodeURIComponent(kwd);
	
	
	let selector = "#nav-content";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "text", fn);
}

function searchIcon() {
	listPage(1);
}







// 이미지 추가
$(function() {
	$(".write-form .img-viewer").click(function(){
		$("form[name=iconForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=iconForm] input[name=selectFile]").change(function(){
		let file = this.files[0];
		
		
		if(! file) {
			$(".write-form .img-viewer").empty();
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/photo/" + img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			
			$(".write-form .img-viewer").css("background-image", "url("+img+")");
			
			return false;
		} 
		
		let reader = new FileReader();
		reader.onload = function(e) {
			$(".write-form .img-viewer").empty();
			$(".write-form .img-viewer").css("background-image", "url("+e.target.result+")");
		}
		reader.readAsDataURL(file);
	});
});



$(function(){
    let isUpdateIconClicked = false; // updateIcon 함수가 클릭되었는지 여부를 저장하는 변수

    // updateIcon 함수가 클릭되면 실행되는 코드
    $('.container').on('click', '.updateIcon', function() {
        const f = document.iconForm;
        let iconNum = $(this).attr('data-num');
        let iconImage = $(this).attr('data-iconImage');
        let iconName = $(this).attr('data-iconname');
        let iconPrice = $(this).attr('data-iconPrice');
        let iconCategory = $(this).attr('data-iconcategory');
        
       
		img = "${pageContext.request.contextPath}/uploads/photo/" + iconImage;

        // 이미지 뷰어 설정
        let imgViewer = $('.img-viewer');
        imgViewer.css({
        	'cursor': 'pointer',
            'border': '1px solid #ccc',
            'width': '100px',
            'height': '100px',
            'background-image': 'url('+img+')',
            'position': 'relative',
            'z-index': '9999',
            'background-repeat': 'no-repeat',
            'background-size': 'cover'
        });
		
        console.log(iconImage);
        // 폼 필드 값 설정
        f.iconName.value = iconName;
        f.iconPrice.value = iconPrice;
        f.iconCategory.value = iconCategory;
        
        
        $('#iconForm').append('<input type="hidden" name="iconNum" value="' + iconNum + '">');


        // updateIcon 함수가 클릭되었음을 표시
        isUpdateIconClicked = true;
        
        $('.btnSendOk').removeClass('btnSendOk').addClass('btnUpdate').text('수정');


        $('#modalCenter').modal('hide');
        // modal 초기화 코드를 실행하지 않도록 함
        $('#editUser').modal('show');
    });

    // 모달이 열릴 때의 초기화 코드
    $('#editUser').on('show.bs.modal', function (event) {
        if (!isUpdateIconClicked) { // updateIcon 함수가 클릭되지 않았을 때만 초기화 코드 실행
            // 폼 초기화
            $('#iconForm')[0].reset();
            let imgViewer = $('.img-viewer');
            
            // 스타일 변경
            imgViewer.css({
                'cursor': 'pointer',
                'border': '1px solid #ccc',
                'width': '100px',
                'height': '100px',
                'background-image': 'url(../../bootstrapTemp/assets/img/avatars/blank.png)',
                'position': 'relative',
                'z-index': '9999',
                'background-repeat': 'no-repeat',
                'background-size': 'cover'
            });
            $('.btnUpdate').removeClass('btnUpdate').addClass('btnSendOk').text('확인');
            $('#iconForm input[name="iconNum"]').remove();
        }

        // 초기화 이후 다시 초기화 플래그를 false로 설정
        isUpdateIconClicked = false;
    });
});


</script>

