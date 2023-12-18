<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>





<!-- / Navbar -->



<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">


		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">주문관리 /</span> 배송조회
		</h4>
		
		
			<!-- On route vehicles Table -->
			<div class="col-12 order-5" >
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@ -->
			<div class="card-title mb-0 pb-3">
							<h5 class="m-0 me-2">배송완료조회</h5>
			</div>
			
			<!-- Bordered Table -->
<div class="card">
  <div class="card-body">
    <div class="table-responsive text-nowrap">
      <table class="table table-bordered" style="width: 1330px;">
        <thead>
          <tr class="text-center" style="background-color: gray;">
            <th colspan="5">배송주문조회</th>
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
            	<div class="text-center pb-0 pt-3"><button class="btn btn-secondary" style="width: 100px;">검색</button> </div>    </div>
      
    </div>
  </div>
</div>
<!--/ Bordered Table -->
			
			<br/>
			<!--  @@@@@@@@@@@@@@@@@@@ -->
				<div class="card-title m-0 pb-3">
							<h5 class="m-0 me-2">검색결과(1)</h5>
				</div>
				
				<div class="card">
					<div class="card-header d-flex align-items-center justify-content-between">
						<div class="dropdown">
							<!-- <button class="btn btn-secondary p-2 m-0" type="button" id="routeVehicles">
								배송준비중 처리
							</button>
							<button class="btn btn-label-dark p-2 m-0" type="button" id="routeVehicles">
								배송보류 처리
							</button> -->
							<div class="p-1 m-1"style="font-size: 15px; "><strong>배송완료</strong></div>
						</div>
					</div>
					<div class="card-datatable"  >
						<div id="DataTables_Table_0_wrapper"  
							class="dataTables_wrapper dt-bootstrap5 no-footer" >
							<div class="table-responsive"   >
								<table
									class="dt-route-vehicles table dataTable no-footer dtr-column"
									id="DataTables_Table_0"
									aria-describedby="DataTables_Table_0_info"
									style="width: 1360px;">
									<thead class="border-top">
										<tr>
											<th class="control sorting_disabled dtr-hidden" rowspan="1"
												colspan="1" style="width: 0px; display: none;" aria-label=""></th>
											<th
												class="sorting_disabled dt-checkboxes-cell dt-checkboxes-select-all"
												rowspan="1" colspan="1" style="width: 18px;" data-col="1"
												aria-label=""><input type="checkbox"
												class="form-check-input"></th>
											<th class="sorting sorting_asc" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 154px;"
												aria-label="location: activate to sort column descending"
												aria-sort="ascending">주문일자<div>(결제일)</div></th>
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
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 217px;"
												aria-label="warnings: activate to sort column ascending">배송비</th>
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
												aria-label="progress: activate to sort column ascending">상품구매금액</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 240px;"
												aria-label="progress: activate to sort column ascending">총결제금액</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd">
											<td class="  control" tabindex="0" style="display: none;"></td>
											<td class="  dt-checkboxes-cell"><input type="checkbox"
												class="dt-checkboxes form-check-input"></td>
											<td><div class="text-body"> 2012-12-12
																		13:12:15</div>
																		
																		<div class="text-body">
																		(2012-12-12
																		13:14:15)</div></td>	
											<td><div class="text-body">9910091151</div></td>	
											<td><div class="text-body">김현민</div></td>
											<td><div class="text-body">자체배송
											12333333</div></td>
											<td><div class="text-body">2000원</div></td>
											<td><div class="text-body">바나나/검정</div></td>
											<td><div class="text-body text-center">1</div></td>
											<td><div class="text-body">2000원</div></td>
											<td><div class="text-body">2000원</div></td>
										</tr>
										
										<!--  
										<tr class="even">
											<td class="  control" tabindex="0" style="display: none;"></td>
											<td class="  dt-checkboxes-cell"><input type="checkbox"
												class="dt-checkboxes form-check-input"></td>
											<td class="sorting_1"><div
													class="d-flex justify-content-start align-items-center user-name">
													<div class="avatar-wrapper">
														<div class="avatar me-2">
															<span
																class="avatar-initial rounded-circle bg-label-secondary"><i
																class="bx bxs-truck"></i></span>
														</div>
													</div>
													<div class="d-flex flex-column">
														<a class="text-body fw-medium"
															href="app-logistics-fleet.html">VOL-182964</a>
													</div>
												</div></td>
											<td><div class="text-body">Saintes, France</div></td>
											<td><div class="text-body">Roma, Italy</div></td>
											<td><span class="badge rounded bg-label-primary">fuel
													problems</span></td>
											<td><div class="d-flex align-items-center">
													<div div="" class="progress w-100" style="height: 8px;">
														<div class="progress-bar" role="progressbar"
															style="width: 82%;" aria-valuenow="82" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
													<div class="text-body ms-3">82%</div>
												</div></td>
										</tr>
										-->
									
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
			<!--/ On route vehicles Table -->


	</div>
	<!-- / Content -->




	<!-- Footer -->
	<footer class="content-footer footer bg-footer-theme">
		<div
			class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
			<div class="mb-2 mb-md-0">
				©
				<script>
					document.write(new Date().getFullYear())
				</script>
				, made with ❤️ by <a href="https://themeselection.com"
					target="_blank" class="footer-link fw-medium">ThemeSelection</a>
			</div>
			<div class="d-none d-lg-inline-block">

				<a href="https://themeselection.com/license/"
					class="footer-link me-4" target="_blank">License</a> <a
					href="https://themeselection.com/" target="_blank"
					class="footer-link me-4">More Themes</a> <a
					href="https://demos.themeselection.com/sneat-bootstrap-html-admin-template/documentation/"
					target="_blank" class="footer-link me-4">Documentation</a> <a
					href="https://themeselection.com/support/" target="_blank"
					class="footer-link d-none d-sm-inline-block">Support</a>

			</div>
		</div>
	</footer>
	<!-- / Footer -->


	<div class="content-backdrop fade"></div>
</div>