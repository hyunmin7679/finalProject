<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">



		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">쿠폰관리 /</span> 쿠폰리스트
		</h4>

		<div class="app-ecommerce-category" data-select2-id="8">
		
			<!-- Category List Table -->
			
			<div class="card">
				<div class="card-datatable">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper dt-bootstrap5 no-footer">
						<div class="card-header d-flex flex-wrap py-0">
							
							<div class="me-5 ms-n2 pe-5 pt-3 mb-3">
							
								<div class="d-flex justify-content-between align-items-center row gap-md-0">

													<div class="col-4 product_status" style="width: 200px;">
														<select id="ProductStatus"
															class="form-select text-capitalize">
															<option value="">쿠폰코드	</option>
														</select>
													</div>
													<div class="col product_category">
														<input class="form-control" type="text" name="#" value="">
													</div>
												</div>
							</div>
							
									
									<div class="dataTables_length mt-0 mt-md-3"
										id="DataTables_Table_0_length" style="padding-left: 600px;">
										<label><select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="form-select">
											
												<option value="10">10</option>
												<option value="20">20</option>
												<option value="50">50</option>
												<option value="70">70</option>
												<option value="100">100</option></select></label>
									</div>
									<div class="dt-buttons pt-3">
										<button class="dt-button add-new btn btn-primary ms-2"
											tabindex="0" aria-controls="DataTables_Table_0" type="button"
											data-bs-toggle="offcanvas"
											data-bs-target="#offcanvasEcommerceCategoryList">
											<span><i class="bx bx-plus me-0 me-sm-1">
											</i>쿠폰추가</span>
										</button>
									</div>
								
							
							
						</div>
						<table
									class="dt-route-vehicles table dataTable no-footer dtr-column"
									id="DataTables_Table_0"
									aria-describedby="DataTables_Table_0_info"
									style="width: 1360px;">
									<thead class="border-top" >
										<tr>
											<th class="control sorting_disabled dtr-hidden" rowspan="1"
												colspan="1" style="width: 0px; display: none;" aria-label=""></th>
											
											<th class="sorting sorting_asc" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 154px;"
												aria-label="location: activate to sort column descending"
												aria-sort="ascending">쿠폰코드
												</th>
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 247px;"
												aria-label="starting route: activate to sort column ascending">사용가능
												카테고리
												</th>
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 247px;"
												aria-label="starting route: activate to sort column ascending">쿠폰이름
												</th>
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 245px;"
												aria-label="ending route: activate to sort column ascending">할인율
												</th>
											<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 280px;"
												aria-label="progress: activate to sort column ascending">시작일</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 280px;"
												aria-label="progress: activate to sort column ascending">종료일</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 280px;"
												aria-label="progress: activate to sort column ascending">지급수</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 280px;"
												aria-label="progress: activate to sort column ascending">사용수</th>
												<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 100px;"
												aria-label="progress: activate to sort column ascending">삭제</th>
										</tr>
										
									</thead>
									<tbody>
										<tr class="odd">
											<td class="  control" tabindex="0" style="display: none;"></td>
											
											<td><div class="text-body">21212</div></td>	
											<td><div class="text-body">애견</div></td>	
											<td><div class="text-body">쿠폰이름</div></td>
											<td>
											<div class="m-0 p-0">10%</div>
											</td>
											<td><div class="text-body">2012-12-12 12:12:12</div></td>
											<td><div class="text-body">2012-12-12 12:12:12</div></td>
											<td><div class="text-body">132</div></td>
											<td><div class="text-body">100</div></td>
											<td><div class="text-body">
											
											
											<button class="btn btn-sm btn-icon delete-record me-2">
												<i class="bx bx-trash"></i>
											</button>
										</div>
											</td>
											
										</tr>
										<!--  -->
								
									
									
									</tbody>
								</table>
								
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
			<!-- Offcanvas to add new customer -->
			<div class="offcanvas offcanvas-end" tabindex="-1"
				id="offcanvasEcommerceCategoryList"
				aria-labelledby="offcanvasEcommerceCategoryListLabel">
				<!-- Offcanvas Header -->
				<div class="offcanvas-header py-4">
					<h5 id="offcanvasEcommerceCategoryListLabel"
						class="offcanvas-title">쿠폰 추가</h5>
					<button type="button"
						class="btn-close bg-label-secondary text-reset"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<!-- Offcanvas Body -->
				<div class="offcanvas-body border-top">
					<form class="pt-0 fv-plugins-bootstrap5 fv-plugins-framework"
						id="eCommerceCategoryListForm" onsubmit="return true"
						novalidate="novalidate"
						data-select2-id="eCommerceCategoryListForm">
						<!-- Title -->
						<div class="mb-3 fv-plugins-icon-container">
							<label class="form-label" for="ecommerce-category-title">쿠폰코드</label>
							<input type="text" class="form-control"
								id="ecommerce-category-title" placeholder="쿠폰코드입력해주세요"
								name="categoryTitle" aria-label="category title">
							</div>
							
							<div class="mb-3 fv-plugins-icon-container">
							<label class="form-label" for="ecommerce-category-title">쿠폰이름</label>
							<input type="text" class="form-control"
								id="ecommerce-category-title" placeholder="쿠폰코드입력해주세요"
								name="categoryTitle" aria-label="category title">
							</div>
					
						<!-- Parent category -->
						<div class="mb-3 ecommerce-select2-dropdown">
							<label class="form-label"
								for="ecommerce-category-parent-category">사용가능한카테고리</label>
							<div class="position-relative">
								<select id="ecommerce-category-parent-category"
									class="select2 form-select select2-hidden-accessible"
									data-placeholder="Select parent category"
									data-select2-id="ecommerce-category-parent-category"
									tabindex="-1" aria-hidden="true">
									<option value="" data-select2-id="2">Select parent
										Category</option>
									<option value="Household">Household</option>
									<option value="Management">Management</option>
									<option value="Electronics">Electronics</option>
									<option value="Office">Office</option>
									<option value="Automotive">Automotive</option>
								</select>
							</div>
						</div>
						<!-- Description -->
						
						<!-- Status -->
						<div class="row mb-4 ecommerce-select2-dropdown" data-select2-id="7">
							<div class="col pe-0 me-0">
							<label class="form-label" for="ecommerce-category-title">할인율</label>
							<input style="width: 150px; font-size: 10px;" type="text" class="form-control pe-0"id="ecommerce-category-title" placeholder="할인율을 입력해주세요"
								name="categoryTitle" >
							</div>
							<div class="col" style="padding-top: 33px; padding-left: 0">%</div>
						</div>
						
						
						<div>
						<div class="row mb-4 ecommerce-select2-dropdown" data-select2-id="7">
						<label class="form-label" for="ecommerce-category-title">기간</label>
						 <div class="row ps-4">
							      	<div class="col-2 col-2 p-0"  style="width: 150px; font-size: 50px;"><input class="form-control" type="date"></div>
							      		<i style="width: 30px;" class='bx bx-minus col-1 pt-2 pe-4'></i>
							      	<div class="col-2 col-2 p-0"  style="width: 150px; font-size: 50px;"><input class="form-control" type="date"></div>
						 </div>
						 </div>
						</div>
						<!-- Submit and reset -->
						<div class="mb-3">
							<button type="submit"
								class="btn btn-primary me-sm-3 me-1 data-submit">추가하기</button>
						</div>
						<input type="hidden">
					</form>
				</div>
			</div>
		</div>

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
				2023 , made with ❤️ by <a href="https://themeselection.com"
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