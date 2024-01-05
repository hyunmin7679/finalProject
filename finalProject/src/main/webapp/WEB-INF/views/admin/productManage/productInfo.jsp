<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.table-form .thumbnail-viewer {
	cursor: pointer;
	border: 1px solid #c2c2c2;
	width: 50px;
	height: 50px;
	border-radius: 10px;
	background-image:
		url("${pageContext.request.contextPath}/resources/images/add_photo.png");
	position: relative;
	z-index: 9999;
	background-repeat: no-repeat;
	background-size: cover;
}

.table-form .img-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, 54px);
	grid-gap: 2px;
}

.table-form .img-grid .item {
	object-fit: cover;
	width: 50px;
	height: 50px;
	border-radius: 10px;
	border: 1px solid #c2c2c2;
	cursor: pointer;
}
</style>

<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<script type="text/javascript">
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



$(function() {
		$(".btnOptionAdd")
				.click(
						function() {
							let $el = $(this).closest(".option-area").find(
									".optionValue-area");
							if ($el.find(".input-group").length >= 5) {
								alert("옵션은 최대 5개까지 가능합니다.");
								return false;
							}
							let $option = $(
									".option-area .optionValue-area .input-group:first-child")
									.clone();

							$option.find("input[type=hidden]").remove();
							$option.find("input[name=optionValues]")
									.removeAttr("value");
							$option.find("input[name=optionValues]").val("");
							$el.append($option);
						});

		$(".option-area")
				.on(
						"click",
						".option-minus",
						function() {
							let $minus = $(this);
							let $el = $minus.closest(".option-area").find(
									".optionValue-area");

							// 수정에서 등록된 자료 삭제
							let mode = "${mode}";
							if (mode === "update"
									&& $minus.parent(".input-group").find(
											"input[name=detailNums]").length === 1) {
								// 저장된 옵션값중 최소 하나는 삭제되지 않도록 설정
								if ($el
										.find(".input-group input[name=detailNums]").length <= 1) {
									alert("옵션값은 최소 하나이상 필요합니다.");
									return false;
								}

								if (!confirm("옵션값을 삭제 하시겠습니까 ? ")) {
									return false;
								}

								let detailNum = $minus.parent(".input-group")
										.find("input[name=detailNums]").val();
								let url = "${pageContext.request.contextPath}/admin/productManage/deleteOptionDetail";
								$.post(url, {
									detailNum : detailNum
								},
										function(data) {
											if (data.state === "true") {
												$minus.closest(".input-group")
														.remove();
											} else {
												alert("옵션값을 삭제할 수 없습니다.");
											}
										}, "json");

								return false;
							}

							if ($el.find(".input-group").length <= 1) {
								$el.find("input[name=optionValues]").val("");
								return false;
							}

							$minus.closest(".input-group").remove();
						});
	});

	$(function() {
		$(".btnOptionAdd2")
				.click(
						function() {
							let $el = $(this).closest(".option-area2").find(
									".optionValue-area2");
							if ($el.find(".input-group").length >= 5) {
								alert("옵션 값은 최대 5개까지 가능합니다.");
								return false;
							}
							let $option = $(
									".option-area2 .optionValue-area2 .input-group:first-child")
									.clone();

							$option.find("input[type=hidden]").remove();
							$option.find("input[name=optionValues2]")
									.removeAttr("value");
							$option.find("input[name=optionValues2]").val("");
							$el.append($option);
						});

		$(".option-area2")
				.on(
						"click",
						".option-minus2",
						function() {
							let $minus = $(this);
							let $el = $minus.closest(".option-area2").find(
									".optionValue-area2");

							// 수정에서 등록된 자료 삭제
							let mode = "${mode}";
							if (mode === "update"
									&& $minus.parent(".input-group").find(
											"input[name=detailNums2]").length === 1) {
								// 저장된 옵션값중 최소 하나는 삭제되지 않도록 설정
								if ($el
										.find(".input-group input[name=detailNums2]").length <= 1) {
									alert("옵션값은 최소 하나이상 필요합니다.");
									return false;
								}

								if (!confirm("옵션값을 삭제 하시겠습니까 ? ")) {
									return false;
								}

								let detailNum = $minus.parent(".input-group")
										.find("input[name=detailNums2]").val();
								let url = "${pageContext.request.contextPath}/admin/productManage/deleteOptionDetail";
								$.post(url, {
									detailNum : detailNum
								},
										function(data) {
											if (data.state === "true") {
												$minus.closest(".input-group")
														.remove();
											} else {
												alert("옵션값을 삭제할 수 없습니다.");
											}
										}, "json");

							}

							if ($el.find(".input-group").length <= 1) {
								$el.find("input[name=optionValues2]").val("");
								return false;
							}

							$minus.closest(".input-group").remove();
						});
	});
</script>
<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="py-3 mb-4">
			<span>&nbsp;&nbsp;</span>상세 페이지
		</h4>

		<div class="body-main">
			<form name="productForm" method="post" enctype="multipart/form-data">
				<table class="table mt-5 table-form">
					<tr>
						<td class="table-light col-sm-2">카테고리</td>
						<td>
							<div class="row">
								<div class="col-6 pe-1">
									<select name="parentNum" class="form-select requiredOption">
										<option class="allcate" value="">:: 메인 카테고리 선택 ::</option>

										<option value="0" >사료</option>

										<option value="1" >간식</option>

										<option value="2" >용품</option>

									</select>
								</div>
								<div class="col-6 ps-1">
									<select name="categoryNum" class="form-select requiredOption2">
										<option class="allcate" value="">:: 카테고리 선택 ::</option>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품명</td>
						<td><input type="text" name="productName"
							class="form-control" value="${dto.productName}"></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품구분</td>
						<td><select name="special" class="form-select">
								<option value="0" ${dto.special==0 ? 'selected' : '' }>일반상품</option>
								<c:if test="${not empty dto.productNum}">
									<option value="1" ${dto.special==1 ? 'selected' : '' }>특가상품</option>
									<option value="2" ${dto.special==2 ? 'selected' : '' }>기획상품</option>
								</c:if>
						</select></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">상품가격</td>
						<td><input type="text" name="price" data-price=${dto.price }
							class="form-control price-tag" value="${dto.price}"></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">할인율</td>
						<td><input type="text" name="discountRate"
							class="form-control" value="${dto.discountRate}"> <small
							class="form-control-plaintext help-block">할인율이 0인 경우
								상품가격이 판매가격입니다.</small></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">적립금</td>
						<td><input type="text" name="savedMoney" class="form-control"
							value="${dto.savedMoney}"></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">배송비</td>
						<td><input type="text" name="delivery" class="form-control"
							value="${dto.delivery}"> <small
							class="form-control-plaintext help-block">배송비가 0인 경우 무료
								배송입니다.</small></td>
					</tr>

					<tr>
						<td class="table-light col-sm-2">상위 옵션</td>
						<td>
							<div class="mb-2">
								<input type="text" name="optionName" class="form-control"
									style="width: 250px;" placeholder="옵션명" value="${dto.optionName}">
								<c:if test="${mode=='update'}">
									<input type="hidden" name="optionNum" value="${dto.optionNum}">
								</c:if>
							</div>
							<div class="row option-area">
								<div class="col-auto pe-0 d-flex flex-row optionValue-area">
									<c:forEach var="vo" items="${listOptionDetail}">
										<div class="input-group pe-1">
											<input type="text" name="optionValues" class="form-control"
												style="flex: none; width: 90px;" placeholder="옵션값"
												value="${vo.optionValue}"> <input type="hidden"
												name="detailNums" value="${vo.detailNum}"> <i
												class="bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus"></i>
										</div>
									</c:forEach>
									
									<c:if test="${empty listOptionDetail || listOptionDetail.size() < 1}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues' class='form-control' style='flex:none; width: 90px;' placeholder='옵션값' >
											<i class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus'></i>
										</div>
									</c:if>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btnOptionAdd">추가</button>
								</div>
							</div> <small class="form-control-plaintext help-block">판매 상품이
								존재하면 옵션은 삭제 되지 않습니다.</small>
						</td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">하위 옵션</td>
						<td>
							<div class="mb-2">
								<input type="text" name="optionName2" style="width: 250px;"
									class="form-control" placeholder="옵션명"
									value="${dto.optionName2}">
								<c:if test="${mode=='update'}">
									<input type="hidden" name="optionNum2"
										value="${dto.optionNum2}">
								</c:if>
							</div>
							<div class="row option-area2">
								<div class="col-auto pe-0 d-flex flex-row optionValue-area2">
									<c:forEach var="vo" items="${listOptionDetail2}">
										<div class="input-group pe-1">
											<input type="text" name="optionValues2" class="form-control"
												style="flex: none; width: 90px;" placeholder="옵션값"
												value="${vo.optionValue}"> <input type="hidden"
												name="detailNums2" value="${vo.detailNum}"> <i
												class="bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus2"></i>
										</div>
									</c:forEach>
									<c:if
										test="${empty listOptionDetail2 || listOptionDetail2.size() < 1}">
										<div class='input-group pe-1'>
											<input type='text' name='optionValues2' class='form-control'
												style='flex: none; width: 90px;' placeholder='옵션값'>
											<i
												class='bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus2'></i>
										</div>
									</c:if>
								</div>
								<div class="col-auto">
									<button type="button" class="btn btn-light btnOptionAdd2">추가</button>
								</div>
							</div> <small class="form-control-plaintext help-block">판매 상품이
								존재하면 옵션은 삭제 되지 않습니다.</small>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2">상품 진열</td>
						<td>
							<div class="pt-2 pb-2">
								<input type="radio" name="productShow" class="form-check-input"
									id="productShow1" value="1"
									${dto.productShow==1 ? "checked='checked'" : "" }> <label
									class="form-check-label" for="productShow1">상품진열</label>
								&nbsp;&nbsp; <input type="radio" name="productShow"
									class="form-check-input" id="productShow0" value="0"
									${dto.productShow==0 ? "checked='checked'" : "" }> <label
									class="form-check-label" for="productShow0">진열안함</label>
							</div>
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2">상품설명</td>
						<td><textarea name="content" id="ir1" class="form-control"
								style="max-width: 95%; height: 290px;">${dto.content}</textarea></td>
					</tr>
					<tr>
						<td class="table-light col-sm-2">대표이미지</td>
						<td>
							<div class="thumbnail-viewer">
								<img class="item img-add" style="width: 48px; height: 48px;"
									src="../../bootstrapTemp/assets/img/images/camera.png">
							</div> <input type="file" name="thumbnailFile" accept="image/*"
							class="form-control" style="display: none;">
						</td>
					</tr>

					<tr>
						<td class="table-light col-sm-2">추가이미지</td>
						<td>
							<div class="img-grid">
								<img class="item img-add"
									src="../../bootstrapTemp/assets/img/images/camera.png">
								<c:forEach var="vo" items="${listFile}">
									<img
										src="${pageContext.request.contextPath}/uploads/product/${vo.filename}"
										class="item delete-img" data-fileNum="${vo.fileNum}"
										data-filename="${vo.filename}">
								</c:forEach>
							</div> <input type="file" name="addFiles" accept="image/*" multiple
							class="form-control" style="display: none;">
						</td>
					</tr>

					</tbody>
				</table>

				<table class="table table-borderless">
					<tbody>
						<tr>
							<td class="text-center">

								<button type="button" class="btn btn-dark add-product">${mode=="update"?"수정완료":"등록완료"}</button>
								<button type="reset" class="btn btn-light">다시입력</button>
								<button type="button" class="btn btn-light"
									onclick="location.href='/pet/admin/productManage/';">${mode=="update"?"수정취소":"등록취소"}</button>
								<c:if test="${mode=='update'}">
									<input type="hidden" name="productNum"
										value="${dto.productNum}">
									<input type="hidden" name="thumbnail" value="${dto.thumbnail}">
									<input type="hidden" name="page" value="${page}">
								</c:if>
							</td>
						</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">

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
		    	} else if(jqXHR.status === 402) {
		    		alert('권한이 없습니다.');
		    		return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	} else if(jqXHR.status === 410) {
		    		alert('삭제된 게시물입니다.');
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



$(function () {
	$(".requiredOption").change(function(){
		
		let sort = $(this).val();
		
		$(".requiredOption2 option").each(function(){
			
			if($(this).is(":first-child")) {
				return true; // continue
			}
			
			$(this).remove();
        });
		
		
		
		let url = "${pageContext.request.contextPath}/admin/productManage/productDetail";
		$.get(url, {sort:sort}, function(data){
			$(data).each(function(index, item){
				
				let categoryNum = item.categoryNum;
				let sort = item.sort;
				let categoryName = item.categoryName;
				
				$(".requiredOption2").append("<option value='"+categoryNum+"'>"+categoryName+"</option>");
			});
		});
		
	});
});

$(function () {
	$(".maincategory").change(function(){
		
		let sort = $(this).val();
		
		$(".subcategory option").each(function(){
			
			if($(this).is(":first-child")) {
				return true; // continue
			}
			
			$(this).remove();
        });
		console.log(sort);
		
		
		let url = "${pageContext.request.contextPath}/admin/productManage/productDetail";
		$.get(url, {sort:sort}, function(data){
			$(data).each(function(index, item){
				
				let categoryNum = item.categoryNum;
				let sort = item.sort;
				let categoryName = item.categoryName;
				
				$(".subcategory").append("<option value='"+categoryNum+"'>"+categoryName+"</option>");
				console.log(categoryNum);
			});
		});
		
	});
});

$(function(){
	$('.content-wrapper').on('click','.add-product', function(){
		
		const f  = document.productForm;
		
	    
	    let url = "${pageContext.request.contextPath}/admin/productManage/update";
		
		let formData = new FormData(f);
		
		const fn = function(data){
			let state = data.state;
			if(state=="false"){
				alert("상품 등록에 실패했습니다.");
				return false;
			} else{
				 window.location.href = "${pageContext.request.contextPath}/admin/productManage/";
			}
			
		};
		ajaxFun(url,'post',formData, 'json', fn,true);
		
	});
	
});
$(function(){
	var img = "${dto.thumbnail}";
	if( img ) {
		img = "${pageContext.request.contextPath}/uploads/product/"+img;
		$(".table-form .thumbnail-viewer").empty();
		$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
	}
	
	$(".table-form .thumbnail-viewer").click(function(){
		$("form[name=productForm] input[name=thumbnailFile]").trigger("click");
	});
	
	$("form[name=productForm] input[name=thumbnailFile]").change(function(){
		let file = this.files[0];
		
		if(! file) {
			$(".table-form .thumbnail-viewer").empty();
			
			if( img ) {
				img = "${pageContext.request.contextPath}/uploads/product/"+img;
			} else {
				img = "${pageContext.request.contextPath}/resources/images/add_photo.png";
			}
			$(".table-form .thumbnail-viewer").css("background-image", "url("+img+")");
			
			return false;
		}
		
		if( ! file.type.match("image.*") ) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) { // 파일의 내용을 다 읽었으면
			$(".table-form .thumbnail-viewer").empty();
			$(".table-form .thumbnail-viewer").css("background-image", "url("+e.target.result+")");
		};
		reader.readAsDataURL( file );
	});
});

// 수정에서 등록된 추가 이미지 삭제
$(function(){
	$(".delete-img").click(function(){
		if(! confirm("이미지를 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		let $img = $(this);
		let fileNum = $img.attr("data-fileNum");
		let filename = $img.attr("data-filename");
		let url="${pageContext.request.contextPath}/admin/productManage/deleteFile";
		$.post(url, {fileNum:fileNum, filename:filename}, function(data){
			$img.remove();
		}, "json");
	});
});

// 추가 이미지
$(function(){
	var sel_files = [];
	
	$("body").on("click", ".table-form .img-add", function(){
		$("form[name=productForm] input[name=addFiles]").trigger("click");
	});
	
	$("form[name=productForm] input[name=addFiles]").change(function(){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.productForm.addFiles.files = dt.files;
			
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
		document.productForm.addFiles.files = dt.files;
	});
	
	$("body").on("click", ".table-form .img-item", function(){
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ? ")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
		for(let i=0; i<sel_files.length; i++) {
			if(filename === sel_files[i].name) {
				sel_files.splice(i, 1);
				break;
			}
		}
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.productForm.addFiles.files = dt.files;		
		
		$(this).remove();
	});
});

$(document).ready(function() {
    $('input[name="price"]').on('input focusout', function() {
        var price = parseFloat($(this).val());

        if (!isNaN(price)) {
            var savedMoney = price * 0.03; 
            $('input[name="savedMoney"]').val(savedMoney); 
        } else {
            $('input[name="savedMoney"]').val(''); 
        }
    });
});


/*
$(document).ready(function() {
    var originalPrice = parseFloat($('input[name="price"]').data('price'));

    $('input[name="discountRate"]').on('input focusout', function() {
        var discountRate = parseFloat($(this).val());

        if (!isNaN(discountRate)) {
            var discountPrice = originalPrice * (100 - discountRate) * 0.01;
            $('input[name="price"]').val(discountPrice); 
        } else {
            $('input[name="price"]').val(originalPrice);
        }
    });
});
*/
</script>
