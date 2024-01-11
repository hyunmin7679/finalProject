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
								let url = "${pageContext.request.contextPath}/admin/product/deleteOptionDetail";
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
								let url = "${pageContext.request.contextPath}/admin/product/deleteOptionDetail";
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
<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">



		<h4 class="py-3 mb-4">
			<span>&nbsp;&nbsp;</span>상품 관리
		</h4>

		<!-- Product List Widget -->





		<div class="card mb-5 me-3 first"
			style="width: 50%; height: 400px; float: left;"></div>

		<div class="card mb-5 second" style="width: 48%; height: 400px;">

		</div>



		<!-- Product List Table -->
		<div class="card">
			<div class="card-header">
				<h5 class="card-title">분류</h5>
				<div
					class="d-flex justify-content-between align-items-center row py-3 gap-3 gap-md-0 sort">
					<div class="col-md-4 product_status">
						<select id="ProductStatus"
							class="form-select text-capitalize maincategory">
							<option class="allcate" value="100">::메인 카테고리::</option>

							<option value="0">사료</option>
							<option value="1">간식</option>
							<option value="2">용품</option>
						</select>
					</div>
					<div class="col-md-4 product_category">
						<select id="subStatus" name="categoryNum"
							class="form-select subcategory">
							<option class="allcate" value="20">:: 카테고리 선택 ::</option>

						</select>
					</div>
					<div class="col-md-4 product_stock">
						<select id="StockStatus" class="form-select text-capitalize"><option
								value="">재고</option>
							<option value="0">재고 없음</option>
							<option value="1">재고 있음</option></select>
					</div>
				</div>
			</div>
			<div class="card-datatable table-responsive">
				<div id="DataTables_Table_0_wrapper"
					class="dataTables_wrapper dt-bootstrap5 no-footer">
					<div class="card-header d-flex border-top py-md-0">
						<div class="" style="">
							<div id="DataTables_Table_0_filter" class="dataTables_filter">
								<label style="margin-top: 4%;"> <input type="search"
									id=kwd name="kwd" class="form-control" placeholder="상품 검색"
									value="${kwd}" aria-controls="DataTables_Table_0">
								</label>
							</div>
						</div>
						<div class="col-auto p-1">
							<button type="button" class="btn btn-light"
								onclick="searchList()">
								<i class='bx bx-search-alt'></i>
							</button>
						</div>
						<div style="width: 45%"></div>
						<div
							class="d-flex justify-content-start justify-content-md-end align-items-baseline"
							style="width: 35%;">
							<div
								class="dt-action-buttons d-flex align-items-start align-items-md-center justify-content-sm-center mb-3 mb-sm-0">

								<div class="dt-buttons d-flex flex-wrap ms-2 mt-1">
									<button class="btn btn-secondary mb-1" type="button"
										data-bs-toggle="offcanvas" data-bs-target="#offcanvasScroll"
										aria-controls="offcanvasScroll">
										<span><i class="bx bx-plus me-0 me-sm-1 mb-1"></i> <span
											class="d-none d-sm-inline-block">상품 추가</span> </span>
									</button>
								</div>
								<div class="offcanvas offcanvas-end product-add "
									data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1"
									id="offcanvasScroll" aria-labelledby="offcanvasScrollLabel">
									<div class="offcanvas-header">
										<button type="button" class="btn-close text-reset"
											data-bs-dismiss="offcanvas" aria-label="Close"></button>
									</div>
									<div class="body-main">

										<form name="productForm" method="post"
											enctype="multipart/form-data">
											<table class="table mt-5 table-form">
												<tr>
													<td class="table-light col-sm-2">카테고리</td>
													<td>
														<div class="row">
															<div class="col-6 pe-1">
																<select name="parentNum"
																	class="form-select requiredOption">
																	<option class="allcate" value="">:: 메인 카테고리 선택
																		::</option>

																	<option value="0">사료</option>

																	<option value="1">간식</option>

																	<option value="2">용품</option>

																</select>
															</div>
															<div class="col-6 ps-1">
																<select name="categoryNum"
																	class="form-select requiredOption2">
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
															<option value="0">일반상품</option>
															<c:if test="${not empty dto.productNum}">
																<option value="1">특가상품</option>
																<option value="2">기획상품</option>
															</c:if>
													</select></td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">상품가격</td>
													<td><input type="text" name="price"
														class="form-control price-tag" value="${dto.price}"></td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">할인율</td>
													<td><input type="text" name="discountRate"
														class="form-control" value="${dto.discountRate}">
														<small class="form-control-plaintext help-block">할인율이
															0인 경우 상품가격이 판매가격입니다.</small></td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">적립금</td>
													<td><input type="text" name="savedMoney"
														class="form-control" value="${dto.savedMoney}"></td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">배송비</td>
													<td><input type="text" name="delivery"
														class="form-control" value="${dto.delivery}"> <small
														class="form-control-plaintext help-block">배송비가 0인
															경우 무료 배송입니다.</small></td>
												</tr>

												<tr>
													<td class="table-light col-sm-2">상위 옵션</td>
													<td>
														<div class="mb-2">
															<input type="text" name="optionName" class="form-control"
																style="width: 250px;" placeholder="옵션명" value="기본">
														</div>
														<div class="row option-area">
															<div
																class="col-auto pe-0 d-flex flex-row optionValue-area">
																<div class="input-group pe-1">
																	<input type="text" name="optionValues"
																		class="form-control" style="flex: none; width: 90px;"
																		placeholder="옵션값" value="${vo.optionValue}"> <i
																		class="bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus"></i>
																</div>
															</div>
															<div class="col-auto">
																<button type="button" class="btn btn-light btnOptionAdd">추가</button>
															</div>
														</div> <small class="form-control-plaintext help-block">판매
															상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
													</td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">하위 옵션</td>
													<td>
														<div class="mb-2">
															<input type="text" name="optionName2"
																style="width: 250px;" class="form-control"
																placeholder="옵션명" value="기본">
														</div>
														<div class="row option-area2">
															<div
																class="col-auto pe-0 d-flex flex-row optionValue-area2">

																<div class="input-group pe-1">
																	<input type="text" name="optionValues2"
																		class="form-control" style="flex: none; width: 90px;"
																		placeholder="옵션값" value=""> <input
																		type="hidden" name="detailNums2" value=""> <i
																		class="bi bi-dash input-group-text ps-2 pe-2 bg-white option-minus2"></i>
																</div>
															</div>
															<div class="col-auto">
																<button type="button"
																	class="btn btn-light btnOptionAdd2">추가</button>
															</div>
														</div> <small class="form-control-plaintext help-block">판매
															상품이 존재하면 옵션은 삭제 되지 않습니다.</small>
													</td>
												</tr>

												<tr>
													<td class="table-light col-sm-2">상품 진열</td>
													<td>
														<div class="pt-2 pb-2">
															<input type="radio" name="productShow"
																class="form-check-input" id="productShow1" value="1"
																${dto.productShow==1 ? "checked='checked'" : "" }>
															<label class="form-check-label" for="productShow1">상품진열</label>
															&nbsp;&nbsp; <input type="radio" name="productShow"
																class="form-check-input" id="productShow0" value="0"
																${dto.productShow==0 ? "checked='checked'" : "" }>
															<label class="form-check-label" for="productShow0">진열안함</label>
														</div>
													</td>
												</tr>

												<tr>
													<td class="table-light col-sm-2">상품설명</td>
													<td><textarea name="content" id="ir1"
															class="form-control"
															style="max-width: 95%; height: 290px;">${dto.content}</textarea></td>
												</tr>
												<tr>
													<td class="table-light col-sm-2">대표이미지</td>
													<td>
														<div class="thumbnail-viewer">
															<img class="item img-add"
																style="width: 48px; height: 48px;"
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
														</div> <input type="file" name="addFiles" accept="image/*"
														multiple class="form-control" style="display: none;">
													</td>
												</tr>

												</tbody>
											</table>

											<table class="table table-borderless">
												<tbody>
													<tr>
														<td class="text-center">

															<button type="button" class="btn btn-dark add-product">등록완료</button>
															<button type="reset" class="btn btn-light">다시입력</button>
															<button type="button" class="btn btn-light"
																onclick="location.href='/pet/admin/productManage/';">등록취소</button>
													</tr>
											</table>
										</form>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<table
					class="datatables-products table border-top dataTable no-footer dtr-column collapsed"
					id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info"
					style="width: 100%;">
					<thead>
						<tr>
							<th class="sorting sorting_asc" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								width="100px;"
								aria-label="product: activate to sort column descending"
								aria-sort="ascending">상품명</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								width="10%"
								aria-label="category: activate to sort column ascending">카테고리</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								width="50px;"
								aria-label="sku: activate to sort column ascending">코드</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								width="50px;"
								aria-label="price: activate to sort column ascending">가격</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								width="100px;"
								aria-label="qty: activate to sort column ascending">재고량</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								width="100px;"
								aria-label="status: activate to sort column ascending">옵션1</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								width="100px;"
								aria-label="status: activate to sort column ascending">옵션2</th>
							<th class="sorting" tabindex="0"
								aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
								width="100px;"
								aria-label="status: activate to sort column ascending">상태</th>
							<th class="sorting_disabled" rowspan="1" colspan="1"
								style="width: 0px;" aria-label="Actions"></th>
						</tr>
					</thead>
					<tbody class="product-list">
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="content-backdrop fade"></div>

<div class="modal fade modalwrap" id="insertStock" tabindex="-1"
	role="dialog" aria-labelledby="editUserLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 style="margin: auto;" class="modal-title" id="productname"></h5>
			</div>
			<div class="modal-body" style="font: bold; margin: auto;">
				<input type="text" name="productNum" id="productNum" value=""
					style="display: none;" /> <input type="text" name="detailNumber1"
					id="detailNumber1" value="" style="display: none;" /> <input
					type="text" name="detailNumber2" id="detailNumber2" value=""
					style="display: none;" /> <input type="text" name="optionName1"
					id="optionName1" value="" style="display: none;" /> <input
					type="text" name="optionValue1" id="optionValue1" value=""
					style="display: none;" /> <input type="text" name="optionName2"
					id="optionName2" value="" style="display: none;" /> <input
					type="text" name="optionValue2" id="optionValue2" value=""
					style="display: none;" /> <input type="text" name="productName"
					id="productName" value="" style="display: none;" />
				<div style="text-align: center;" id="productinfo"></div>
				<div style="text-align: center;">재고 증감 수량을 입력하세요</div>
				<div class="col-12  mt-3" style="margin: auto;">
					<input style="text-align: center;" type="text" id="rememo"
						name="rememo" class="form-control" placeholder="수량">
				</div>
			</div>
			<div class="modal-footer" style="margin: auto;">
				<button type="button" class="btn btn-danger answerconfirm"
					id="stockconfirm" data-productNum="" data-detailNumber1=""
					data-detailNumber2="" data-optionName1="" data-optionValue1=""
					data-optionName2="" data-optionValue2="">확인</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<form name="searchForm" method="post">
	<input type="hidden" name="kwd" value="">
</form>
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





var sort;
var subsort;
var stocksort;

window.onload=function(){
	sort = 100;
	listPage(1);
}

$("#ProductStatus").on("change", function() {
    var selectedValue = $(this).val();   
    sort = selectedValue; 
    console.log(sort);
    
    
    
    listPage(1);
});

$("#subStatus").on("change", function() {
    var subValue = $(this).val();
    
    
    subsort = subValue; 
    
    subsortpage(1);
});

$("#StockStatus").on("change", function() {
    var stockValue = $(this).val();
    
    
    stocksort = stockValue; 
    
    stockpage(1);
});


/*
function productlist(page, sort){
	
	let url = "${pageContext.request.contextPath}/admin/productManage/"+sort+"/list"; 
	let query = "pageNo="+page;
	let search = $('form[name=searchForm]').serialize();
	query = query+"&"+search;
	let selector = ".product-list";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);

}
*/
function listPage(page) {
	let url = "${pageContext.request.contextPath}/admin/productManage/list"; 
	let query = "sort="+sort+"&page="+page;
	let search = $('form[name=searchForm]').serialize();
	query = query+"&"+search;
	let selector = ".product-list";
	
	const fn = function(data){
		$(selector).html(data);
	};
	// ajaxFun(url, 'get', query, 'html', fn);
	ajaxFun(url, 'get', query, 'html', fn);
}

function searchList(){
	const f = document.searchForm; 
	f.kwd.value = $.trim($("#kwd").val());	
	subsort=20;
	subsortpage(1);
	
}
function subsortpage(page){
	
	let url = "${pageContext.request.contextPath}/admin/productManage/sublist"; 
	let query = "subsort="+subsort+"&page="+page;
	let search = $('form[name=searchForm]').serialize();
	query = query+"&"+search;
	let selector = ".product-list";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);

}


function stockpage(page){
	
	let url = "${pageContext.request.contextPath}/admin/productManage/stocklist"; 
	let query = "stocksort="+stocksort+"&page="+page;
	let search = $('form[name=searchForm]').serialize();
	query = query+"&"+search;
	let selector = ".product-list";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);

}
// 대표(썸네일) 이미지
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
		let url="${pageContext.request.contextPath}/admin/product/deleteFile";
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

$(function(){
	$('.product-add').on('click','.add-product', function(){
		
		const f  = document.productForm;
		
	    
	    let url = "${pageContext.request.contextPath}/admin/productManage/addproduct";
		
		let formData = new FormData(f);
		
		const fn = function(data){
			let state = data.state;
			if(state=="false"){
				alert("상품 등록에 실패했습니다.");
				return false;
			}
			
			$('#offcanvasScroll').offcanvas('hide');
		};
		ajaxFun(url,'post',formData, 'json', fn,true);
		
	});
	
});
$(function(){
	first();
	second();
})

function first(){
	let url="${pageContext.request.contextPath}/admin/productManage/first"
	let query = "";
	let selector = ".first";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
}

function second(){
	let url="${pageContext.request.contextPath}/admin/productManage/second"
	let query = "";
	let selector = ".second";
	
	const fn = function(data){
		$(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "html", fn);
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


function deleteProduct(productNum){
    	
		alert('해당 상품을 삭제하시겠습니까?');

    	let url = "${pageContext.request.contextPath}/admin/productManage/deleteProduct" 
    	let query ="productNum="+productNum;
    	const fn = function(data){
    		var sort = 5;
    		productlist(1, sort);
    	};
    	
    	ajaxFun(url, "post", query, "json", fn);

}


$(document).ready(function(){
	
	
	$('.product-list').on('click', '#stockButton', function() {
    	
        var productNum = $(this).attr('data-productNum');
        var detailNumber1 = $(this).attr('data-detailNumber1');
        var detailNumber2 = $(this).attr('data-detailNumber2');
        var optionName1 = $(this).attr('data-optionName1');
        var optionValue1 = $(this).attr('data-optionValue1');
        var optionName2 = $(this).attr('data-optionName2');
        var optionValue2 = $(this).attr('data-optionValue2');
        var productName = $(this).attr('data-productName');
        
        console.log(productNum);
        console.log(detailNumber1);
        console.log(detailNumber2);
        console.log(optionName1);
        console.log(optionValue1);
        console.log(optionName2);
        console.log(optionValue2);
        console.log(productName);
        
        $('.modal-body #productNum').val(productNum);
        $('.modal-body #detailNumber1').val(detailNumber1);
        $('.modal-body #detailNumber2').val(detailNumber2);
        $('.modal-body #optionName1').val(optionName1);
        $('.modal-body #optionValue1').val(optionValue1);
        $('.modal-body #optionName2').val(optionName2);
        $('.modal-body #optionValue2').val(optionValue2);
        $('.modal-body #productName').val(productName);
        
        var productna=productName+"재고입력";
        $('#productname').html(productna);
        
        optionName1 = (optionName1 === '기본') ? '' : optionName1;
        optionValue1 = (optionValue1 === '기본') ? '' : optionValue1;
        optionName2 = (optionName2 === '기본') ? '기본' : optionName2;
        optionValue2 = (optionValue2 === '기본') ? '' : optionValue2;

        var productinfo = optionName1 +":"+ optionValue1+"&nbsp;"+optionName2+":"+optionValue2;
        $('#productinfo').html(productinfo);
        
       
          
    });
	
	

	$('#stockconfirm').on('click', function() {
	    var productNum = $('#insertStock #productNum').val();        
	    $(this).data('productNum', productNum);
	    var detailNumber1 = $('#insertStock #detailNumber1').val();        
	    $(this).data('detailNumber1', detailNumber1);
	    var detailNumber2 = $('#insertStock #detailNumber2').val();        
	    $(this).data('detailNumber2', detailNumber2);
	    
	    var sancMemo = $('#rememo').val();
	    
	    insertStock(productNum,detailNumber1,detailNumber2,sancMemo);
	    
	    $('#insertStock').modal('hide');
	});
	
	
});


function insertStock(productNum,detailNumber1,detailNumber2,sancMemo){
	
	let url = "${pageContext.request.contextPath}/admin/productManage/"+productNum+"/insertStock";
	let query = "detailNumber1="+detailNumber1+"&detailNumber2="+detailNumber2+"&sancMemo="+sancMemo;
	const fn = function(data){
		productlist(1, 5);
	};
	ajaxFun(url, "post", query, "json", fn);
}




</script>
