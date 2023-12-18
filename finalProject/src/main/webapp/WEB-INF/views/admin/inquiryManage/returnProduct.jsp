<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  

  
<!-- / Navbar -->

      

      <!-- Content wrapper -->
      <div class="content-wrapper">

        <!-- Content -->
        
          <div class="container-xxl flex-grow-1 container-p-y">
            
            
<h4 class="py-3 mb-4">
  <span class="text-muted fw-light">주문관리/</span> 반품상품조회
</h4>
<div class="row">
 

 <div class="col-xl-6">
   
    <div class="nav-align-top mb-4" style="width: 1360px;">
    
      <ul class="nav nav-pills mb-3 nav-fill" role="tablist" style="width: 500px;">
        <li class="nav-item" role="presentation">
          <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-home" aria-controls="navs-pills-justified-home" aria-selected="false" tabindex="-1"><i class="tf-icons bx bx-home me-1"></i> 반품신청된상품 <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger ms-1">3</span></button>
        </li>
        <li class="nav-item" role="presentation">
          <button type="button" class="nav-link " role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-profile" aria-controls="navs-pills-justified-profile" aria-selected="true"><i class="tf-icons bx bx-user me-1"></i> 반품완료</button>
        </li>
        <!-- 
        <li class="nav-item" role="presentation">
          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-pills-justified-messages" aria-controls="navs-pills-justified-messages" aria-selected="false" tabindex="-1"><i class="tf-icons bx bx-message-square me-1"></i></button>
        </li>
         -->
      </ul>
      <div class="tab-content" style="width: 1380px;">
        <div class="tab-pane fade active show" id="navs-pills-justified-home" role="tabpanel">
        		
        		
        		
		    <div class=" text-nowrap">
		      <table class="table table-bordered" style="width: 1330px;">
		        <thead>
		          <tr class="text-center" style="background-color: gray;">
		            <th colspan="5">반품상품조회</th>
		          </tr>
		        </thead>
		        <tbody>
		          <tr>
		            <td style="width: 6%; text-align: center;"><span class="fw-medium">검색어</span></td>
		            <td colspan="4" >
		           
		            <div class="d-flex justify-content-between align-items-center row gap-md-0">
		      		
		      		<div class="col-4 product_status" style="width: 300px;">
		      		<select id="ProductStatus" class="form-select text-capitalize">
		      		<option value="">주문번호</option>
		      		</select>
		      		</div>
					      <div class="col product_category">
					      <input class="form-control" type="text" name="#" value="">
					      </div>
		    			</div>
		            </td>
		            
		          </tr>
		          <tr>
		            <td style="text-align: center;"><span class="fw-medium">기간</span></td>
		            <td colspan="4" >
		           
		            <div class="d-flex justify-content-between align-items-center row gap-md-0">
		      		
		      		<div class="col-4 product_status" style="width: 300px;">
		      		<select id="ProductStatus" class="form-select text-capitalize">
		      		<option value="">주문일자</option>
		      		</select>
		      		</div>
					      <div class="col product_category">
						      <div class="row">
							      	<div class="col-2 col-2"><input class="form-control" type="date"></div>
							      		<i style="width: 30px;" class='bx bx-minus col-1 pt-2 pe-4'></i>
							      	<div class="col-2 col-2"><input class="form-control" type="date"></div>
						      </div>
					      </div>
		    			</div>
		            </td>
		            
		          </tr>
		          <tr>
		            <td style="text-align: center;"> <span class="fw-medium">상품</span></td>
		             <td colspan="4" >
		           
		            <div class="d-flex justify-content-between align-items-center row gap-md-0">
		      		
		      		<div class="col-4 product_status" style="width: 300px;">
		      		<select id="ProductStatus" class="form-select text-capitalize">
		      		<option value="">상품명</option>
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
		      								<div class="text-center pb-0 pt-3"><button class="btn btn-secondary" style="width: 100px;">검색</button> </div>
		      
		    </div>
		<!--/ Bordered Table -->
		
		
		<br/>
			<!--  @@@@@@@@@@@@@@@@@@@ -->
				<div class="card-title m-0 pb-3">
							<h5 class="m-0 me-2">검색결과(1)</h5>
				</div>
				
				<div class="card"  style="border:1px solid lightgray;">
					
					<div class="card-datatable"  >
						<div id="DataTables_Table_0_wrapper"  
							class="dataTables_wrapper dt-bootstrap5 no-footer" >
							<div class="">
								<table
									class="dt-route-vehicles table dataTable no-footer dtr-column"
									id="DataTables_Table_0"
									aria-describedby="DataTables_Table_0_info"
									style="width: 1330px;">
									<thead class="border-top">
										<tr>
											<th class="control sorting_disabled dtr-hidden" rowspan="1"
												colspan="1" style="width: 0px; display: none;" aria-label=""></th>
											
											<th class="sorting sorting_asc" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 154px;"
												aria-label="location: activate to sort column descending"
												aria-sort="ascending">취소신청일
												</th>
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 247px;"
												aria-label="starting route: activate to sort column ascending">주문번호
												</th>
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 247px;"
												aria-label="starting route: activate to sort column ascending">주문자
												</th>
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 245px;"
												aria-label="ending route: activate to sort column ascending">운송장번호
												</th>
											<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 280px;"
												aria-label="progress: activate to sort column ascending">상품명/옵션</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 100px;"
												aria-label="progress: activate to sort column ascending">수량</th>
												
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 280px;"
												aria-label="progress: activate to sort column ascending">취소금액</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 280px;"
												aria-label="progress: activate to sort column ascending">결제수단</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 350px;"
												aria-label="progress: activate to sort column ascending">주문상태</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 100px;"
												aria-label="progress: activate to sort column ascending">반품처리</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd">
											<td class="  control" tabindex="0" style="display: none;"></td>
											
											<td><div class="text-body"> 2012-12-12
																		13:12:15</div></td>	
											<td><div class="text-body">9910091151</div></td>	
											<td><div class="text-body">김현민</div></td>
											<td>
											<div class="m-0 p-0">1234456</div>
											</td>
											<td><div class="text-body">바나나/검정</div></td>
											<td><div class="text-body text-center">1</div></td>
											<td><div class="text-body">2000원</div></td>
											<td><div class="text-body">카카오페이</div></td>
											<td><div class="text-body">취소신청[구매자]</div></td>
											<td><div class="text-body">
											<button type="button" style="font-size: 13px; width: 50px;" class="btn btn-primary m-0 p-0" data-bs-toggle="modal" data-bs-target="#backDropModal">처리<i class='bx bx-right-arrow-alt'></i></button>
											</div>
											</td>
										</tr>
									
									</tbody>
								</table>
							</div>
							<div class="row d-flex align-items-center">
								
								<div class="col-sm-12 col-md-6" style="padding-left:500px; padding-top: 10px;">
									<div class="dataTables_paginate paging_simple_numbers"
										id="DataTables_Table_0_paginate">
										<ul class="pagination">
											<li class="paginate_button page-item previous disabled"
												id="DataTables_Table_0_previous"><a
												aria-controls="DataTables_Table_0" aria-disabled="true"
												role="link" data-dt-idx="previous" tabindex="0"
												class="page-link">Previous</a></li>
											<li class="paginate_button page-item active"><a href="#"
												aria-controls="DataTables_Table_0" role="link"
												aria-current="page" data-dt-idx="0" tabindex="0"
												class="page-link">1</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" role="link"
												data-dt-idx="1" tabindex="0" class="page-link">2</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" role="link"
												data-dt-idx="2" tabindex="0" class="page-link">3</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" role="link"
												data-dt-idx="3" tabindex="0" class="page-link">4</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" role="link"
												data-dt-idx="4" tabindex="0" class="page-link">5</a></li>
											<li class="paginate_button page-item next"
												id="DataTables_Table_0_next"><a href="#"
												aria-controls="DataTables_Table_0" role="link"
												data-dt-idx="next" tabindex="0" class="page-link">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
        
        </div>
        
        
        
        
        <div class="tab-pane fade " id="navs-pills-justified-profile" role="tabpanel">
          <div class=" text-nowrap">
		      <table class="table table-bordered" style="width: 1330px;">
		        <thead>
		          <tr class="text-center" style="background-color: gray;">
		            <th colspan="5">반품상품조회</th>
		          </tr>
		        </thead>
		        <tbody>
		          <tr>
		            <td style="width: 6%; text-align: center;"> <span class="fw-medium">검색어</span></td>
		            <td colspan="4" >
		           
		            <div class="d-flex justify-content-between align-items-center row gap-md-0">
		      		
		      		<div class="col-4 product_status" style="width: 300px;">
		      		<select id="ProductStatus" class="form-select text-capitalize">
		      		<option value="">주문번호</option>
		      		</select>
		      		</div>
					      <div class="col product_category">
					      <input class="form-control" type="text" name="#" value="">
					      </div>
		    			</div>
		            </td>
		            
		          </tr>
		          <tr>
		            <td style="text-align: center;"> <span class="fw-medium">기간</span></td>
		            <td colspan="4" >
		           
		            <div class="d-flex justify-content-between align-items-center row gap-md-0">
		      		
		      		<div class="col-4 product_status" style="width: 300px;">
		      		<select id="ProductStatus" class="form-select text-capitalize">
		      		<option value="">주문일자</option>
		      		</select>
		      		</div>
					      <div class="col product_category">
					      <div class="row">
							      	<div class="col-2 col-2"><input class="form-control" type="date"></div>
							      		<i style="width: 30px;" class='bx bx-minus col-1 pt-2 pe-4'></i>
							      	<div class="col-2 col-2"><input class="form-control" type="date"></div>
						      </div>
					      </div>
		    			</div>
		            </td>
		            
		          </tr>
		          <tr>
		            <td style="text-align: center;"><span class="fw-medium">상품</span></td>
		             <td colspan="4" >
		           
		            <div class="d-flex justify-content-between align-items-center row gap-md-0">
		      		
		      		<div class="col-4 product_status" style="width: 300px;">
		      		<select id="ProductStatus" class="form-select text-capitalize">
		      		<option value="">상품명</option>
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
		      								<div class="text-center pb-0 pt-3"><button class="btn btn-secondary" style="width: 100px;">검색</button> </div>
		      
		    </div>
		<!--/ Bordered Table -->
		
		
		<br/>
			<!--  @@@@@@@@@@@@@@@@@@@ -->
				<div class="card-title m-0 pb-3">
							<h5 class="m-0 me-2">검색결과(1)</h5>
				</div>
				
				<div class="card"  style="border:1px solid lightgray;">
					
					<div class="card-datatable"  >
						<div id="DataTables_Table_0_wrapper"  
							class="dataTables_wrapper dt-bootstrap5 no-footer" >
							<div class="">
								<table
									class="dt-route-vehicles table dataTable no-footer dtr-column"
									id="DataTables_Table_0"
									aria-describedby="DataTables_Table_0_info"
									style="width: 1330px;">
									<thead class="border-top">
										<tr>
											<th class="control sorting_disabled dtr-hidden" rowspan="1"
												colspan="1" style="width: 0px; display: none;" aria-label=""></th>
											
											<th class="sorting sorting_asc" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 154px;"
												aria-label="location: activate to sort column descending"
												aria-sort="ascending">취소신청일
												</th>
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 247px;"
												aria-label="starting route: activate to sort column ascending">주문번호
												</th>
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 247px;"
												aria-label="starting route: activate to sort column ascending">주문자
												</th>
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 245px;"
												aria-label="ending route: activate to sort column ascending">운송장번호
												</th>
											<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 280px;"
												aria-label="progress: activate to sort column ascending">상품명/옵션</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 100px;"
												aria-label="progress: activate to sort column ascending">수량</th>
												
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 280px;"
												aria-label="progress: activate to sort column ascending">취소금액</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 280px;"
												aria-label="progress: activate to sort column ascending">결제수단</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 350px;"
												aria-label="progress: activate to sort column ascending">주문상태</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 200px;"
												aria-label="progress: activate to sort column ascending">반품처리</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd">
											<td class="  control" tabindex="0" style="display: none;"></td>
											
											<td><div class="text-body"> 2012-12-12
																		13:12:15</div></td>	
											<td><div class="text-body">9910091151</div></td>	
											<td><div class="text-body">김현민</div></td>
											<td>
											<div class="m-0 p-0">1234456</div>
											</td>
											<td><div class="text-body">바나나/검정</div></td>
											<td><div class="text-body text-center">1</div></td>
											<td><div class="text-body">2000원</div></td>
											<td><div class="text-body">카카오페이</div></td>
											<td><div class="text-body">취소신청[구매자]</div></td>
											<td><div class="text-body">반품완료</div></td>
											
										</tr>
										<!--  -->
								
									
									
									</tbody>
								</table>
							</div>
							<div class="row d-flex align-items-center">
								
								<div class="col-sm-12 col-md-6" style="padding-left:500px; padding-top: 10px;">
									<div class="dataTables_paginate paging_simple_numbers"
										id="DataTables_Table_0_paginate">
										<ul class="pagination">
											<li class="paginate_button page-item previous disabled"
												id="DataTables_Table_0_previous"><a
												aria-controls="DataTables_Table_0" aria-disabled="true"
												role="link" data-dt-idx="previous" tabindex="0"
												class="page-link">Previous</a></li>
											<li class="paginate_button page-item active"><a href="#"
												aria-controls="DataTables_Table_0" role="link"
												aria-current="page" data-dt-idx="0" tabindex="0"
												class="page-link">1</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" role="link"
												data-dt-idx="1" tabindex="0" class="page-link">2</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" role="link"
												data-dt-idx="2" tabindex="0" class="page-link">3</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" role="link"
												data-dt-idx="3" tabindex="0" class="page-link">4</a></li>
											<li class="paginate_button page-item "><a href="#"
												aria-controls="DataTables_Table_0" role="link"
												data-dt-idx="4" tabindex="0" class="page-link">5</a></li>
											<li class="paginate_button page-item next"
												id="DataTables_Table_0_next"><a href="#"
												aria-controls="DataTables_Table_0" role="link"
												data-dt-idx="next" tabindex="0" class="page-link">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
        </div>
       <!--  
        <div class="tab-pane fade" id="navs-pills-justified-messages" role="tabpanel">
          <p>
            Oat cake chupa chups dragée donut toffee. Sweet cotton candy jelly beans macaroon gummies cupcake gummi
            bears
            cake chocolate.
          </p>
          <p class="mb-0">
            Cake chocolate bar cotton candy apple pie tootsie roll ice cream apple pie brownie cake. Sweet roll icing
            sesame snaps caramels danish toffee. Brownie biscuit dessert dessert. Pudding jelly jelly-o tart brownie
            jelly.
          </p>
        </div> -->
        
      </div>
      
    </div>
  </div>
  <!--/ User Content -->
</div>
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="backDropModal" data-bs-backdrop="static" tabindex="-1" style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="orderDialogModalLabel">주문정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body pt-1">
				<div class="modal-order-detail">



					<div>
						<div class="mt-3">
							<div class="p-3 shadow bg-body rounded">
								<p class="fs-6 fw-semibold mb-0">주문 정보</p>
							</div>
							<div class="mt-3 p-2">
								<table class="table table-bordered mb-1">
									<tbody>
										<tr>
											<td class="table-light" width="105">주문번호</td>
											<td width="150">202312091000000003</td>
											<td class="table-light" width="105">주문자</td>
											<td width="150">관리자</td>
											<td class="table-light" width="105">주문일자</td>
											<td width="150">2023-12-13 01:05:37</td>
											<td class="table-light" width="120">주문상태</td>
											<td width="150">취소신청</td>
										</tr>
										<tr>
											<td class="table-light">쿠폰할인</td>
											<td class="text-primary">2,600</td>
											<td class="table-light">적림금 <div>사용액</div></td>
											<td class="text-primary">0</td>
											<td class="table-light">결제금액</td>
											<td class="text-primary">900,000</td>
											<td class="table-light">취소금액</td>
											<td class="text-warning order-cancelAmount"
												data-cancelamount="0">0</td>
										</tr>
										<tr>
											<td class="table-light">배송비</td>
											<td class="text-primary">0</td>
											<td class="table-light">배송업체</td>
											<td>자체배송</td>
											<td class="table-light">송장번호</td>
											<td>1234</td>
											<td class="table-light">상태변경일</td>
											<td>2023-12-13 01:07:35</td>
										</tr>
										<tr>
											<td class="table-light">결제구분</td>
											<td>카드결제</td>
											<td class="table-light">결제카드</td>
											<td>BC 카드</td>
											<td class="table-light">결제승인번호</td>
											<td>1234567890</td>
											<td class="table-light">승인일자</td>
											<td>2023-12-12 16:05:37</td>
										</tr>
										<tr>
											<td colspan="8">반품주소 : 인천 서구 </td>
										</tr>
									</tbody>
								</table>
								
								
							</div>
						</div>

						<div class="mt-2 border-top pt-2">
							<div class="p-3 shadow bg-body rounded">
								<p class="fs-6 fw-semibold mb-0">주문 상세정보</p>
							</div>
							<div class="mt-3 p-3">

								<table class="table board-list order-detail-list">
									<thead class="table-light" style="text-align: center;">
										<tr>
											<th width="30"><input type="checkbox" class="form-check-input"></th>
											<th width="130">상세번호</th>
											<th width="110">상품명</th>
											<th width="90">상품가격</th>
											<th width="90">할인가격</th>
											<th width="110">쿠폰사용</th>
											<th width="130">옵션</th>
											<th width="80">수량</th>
											<th width="120">주문총금액</th>
											<th width="90">적립금</th>
											<th width="140">주문상태</th>
											<th width="60">사진</th>
										</tr>
									</thead>

									<tbody style="text-align: center; width: auto;">
										<tr valign="middle" id="orderDetail-list5">
											<td width="30"><input type="checkbox" class="form-check-input"></td>
											<td>5</td>
											<td>고구마</td>
											<td>1,000,000</td>
											<td>900,000</td>
											<td>10%(1000)</td>
											<td>검정 / S</td>
											<td>1</td>
											<td>900,000</td>
											<td>3,000</td>
											<td>구매확정</td>
											<td><button type="button" id="openSecondModalBtn" class="btn p-0 m-0" data-bs-toggle="modal" data-bs-target="#basicModal">
									            <i class="menu-icon tf-icons bx bx-copy"></i>
									          </button></td>
										</tr>

									</tbody>
								</table>
								<table class="table table-borderless mb-1">
									<tbody>
										<tr>
											<td width="50%">
											<strong>반품사유 : memno</strong>
											</td>
											<td class="text-end">
												<div class="row justify-content-end delivery-update-area">
													<div class="col-auto">
														<button type="button"
															class="btn btn-primary btn-delivery-order"
															data-ordernum="202312091000000003" data-orderstate="2">반품접수완료</button>
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- /Modal -->

<div class="modal fade" id="basicModal" tabindex="-1"
	style="display: none;" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">

			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel1">이미지</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body" style="width: auto; height: auto">

				<div id="carouselExampleIndicators" class="carousel slide" style="width: auto; height: auto;">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${pageContext.request.contextPath}/uploads/img/zz.PNG" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/uploads/img/zz.PNG" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="${pageContext.request.contextPath}/uploads/img/zz.PNG" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>

			</div>

		</div>
	</div>
</div>


<!-- Footer -->
<footer class="content-footer footer bg-footer-theme">

</footer>
<!-- / Footer -->

        <!-- Content wrapper -->

