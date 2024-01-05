<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!-- / Navbar -->



<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">


		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">신고관리 /</span> 신고 게시물 조회
		</h4>
		<div class="row">


			<div class="col-xl-6">

				<div class="nav-align-top mb-4" style="width: 1360px;">

					<ul class="nav nav-pills mb-3 nav-fill" role="tablist"
						style="width: 500px;">
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link active" role="tab"
								data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home"
								aria-controls="navs-pills-justified-home" aria-selected="false"
								tabindex="-1">
								<i class="tf-icons bx bx-home me-1"></i> 신고 당한 게시물 <span
									class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger ms-1">3</span>
							</button>
						</li>
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link " role="tab"
								data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home"
								aria-controls="navs-pills-justified-profile"
								aria-selected="true">
								<i class="tf-icons bx bx-user me-1"></i> 신고처리 게시물
							</button>
						</li>
						<!-- 
        <li class="nav-item" role="presentation">
          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-messages" aria-controls="navs-pills-justified-messages" aria-selected="false" tabindex="-1"><i class="tf-icons bx bx-message-square me-1"></i></button>
        </li>
         -->
					</ul>
					<div class="tab-content" style="width: 1380px;">

						<div class="tab-pane fade active show"
							id="navs-pills-justified-home" role="tabpanel">



							<div class=" text-nowrap">
								<table class="table table-bordered" style="width: 1330px;">
									<thead>
										<tr class="text-center" style="background-color: gray;">
											<th colspan="5">조회하기</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="width: 6%; text-align: center;"><span
												class="fw-medium">카테고리</span></td>
											<td colspan="4">

												<div
													class="d-flex justify-content-between align-items-center row gap-md-0">

													<div class="col-4 product_status" style="width: 300px;">
														<select id="ProductStatus"
															class="form-select text-capitalize">
															<option value="">카테고리전체</option>
														</select>
													</div>
												</div>
											</td>

										</tr>
										<tr>
											<td style="text-align: center;"><span class="fw-medium">기간</span></td>
											<td colspan="4">

												<div
													class="d-flex justify-content-between align-items-center row gap-md-0">

													<div class="col-4 product_status" style="width: 300px;">
														<select id="ProductStatus"
															class="form-select text-capitalize">
															<option value="">등록일자</option>
														</select>
													</div>
													<div class="col product_category">
														<div class="row">
															<div class="col-2 col-2">
																<input class="form-control" type="date">
															</div>
															<i style="width: 30px;"
																class='bx bx-minus col-1 pt-2 pe-4'></i>
															<div class="col-2 col-2">
																<input class="form-control" type="date">
															</div>
														</div>
													</div>
												</div>
											</td>

										</tr>
										<tr>
											<td style="text-align: center;"><span class="fw-medium">게시글찾기</span></td>
											<td colspan="4">

												<div
													class="d-flex justify-content-between align-items-center row gap-md-0">

													<div class="col-4 product_status" style="width: 300px;">
														<select id="ProductStatus"
															class="form-select text-capitalize">
															<option value="">제목</option>
															<option value="">유저아이디</option>
														</select>
													</div>
													<div class="col product_category">
														<input class="form-control" type="text" name="#" value="">
													</div>
												</div>
											</td>

										</tr>
									</tbody>
								</table>
								<div class="text-center pb-0 pt-3">
									<button class="btn btn-secondary" style="width: 100px;">검색</button>
								</div>
							</div>
							<!--/ Bordered Table -->


							<br />
							<!--  @@@@@@@@@@@@@@@@@@@ -->
							<div class="reportlist" id="reportlist"></div>


						</div>



					</div>

				</div>
			</div>
			<!--/ User Content -->
		</div>
	</div>
</div>








<!-- Footer -->
<footer class="content-footer footer bg-footer-theme"> </footer>



<script type="text/javascript">
//ajax
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

//글리스트 및 페이징 처리
function listPage(page) {
	
	let url = "${pageContext.request.contextPath}/admin/reportManage/reportList";
	
	// let schType = $('#ProductStatus').val();
    // let kwd = $('input[name="kwd"]').val();
    // console.log(schType);
    // console.log(kwd);
	
	let query = "page="+page
	
	
	let selector = "#reportlist";
	
	const fn = function(data){
		 $(selector).html(data);
	};
	
	ajaxFun(url, "get", query, "text", fn);
}

</script>










