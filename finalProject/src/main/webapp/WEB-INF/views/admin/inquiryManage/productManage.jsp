<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

      <!-- Content wrapper -->
      <div class="content-wrapper">

        <!-- Content -->
        
          <div class="container-xxl flex-grow-1 container-p-y">
            
            

<h4 class="py-3 mb-4">
  <span>&nbsp;&nbsp;</span>상품 관리
</h4>

<!-- Product List Widget -->

<div class="card mb-4">
  <div class="card-widget-separator-wrapper">
    <div class="card-body card-widget-separator">
      <div class="row gy-4 gy-sm-1">
        <div class="col-sm-6 col-lg-3">
          <div class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-3 pb-sm-0">
            <div>
              <h6 class="mb-2">올해 판매액</h6>
              <h4 class="mb-2">₩ 얼마얼마</h4>
              <p class="mb-0"><span class="text-muted me-2">작년대비 증감 판매액</span><span class="badge bg-label-success">+x%</span></p>
            </div>
            <div class="avatar me-sm-4">
              <span class="avatar-initial rounded bg-label-secondary">
                <i class="bx bx-money bx-sm"></i>
              </span>
            </div>
          </div>
          <hr class="d-none d-sm-block d-lg-none me-4">
        </div>
        <div class="col-sm-6 col-lg-3">
          <div class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-3 pb-sm-0">
            <div>
              <h6 class="mb-2">프로모션 금액(특가/기획)</h6>
              <h4 class="mb-2">₩ 얼마얼마</h4>
              <p class="mb-0"><span class="text-muted me-2">작년대비 증감 프로모션 금액</span><span class="badge bg-label-success">+x%</span></p>
            </div>
            <div class="avatar me-lg-4">
              <span class="avatar-initial rounded bg-label-secondary">
                <i class="bx bxs-offer bx-sm"></i>
              </span>
            </div>
          </div>
          <hr class="d-none d-sm-block d-lg-none">
        </div>
        <div class="col-sm-6 col-lg-3">
          <div class="d-flex justify-content-between align-items-start border-end pb-3 pb-sm-0 card-widget-3">
            <div>
              <h6 class="mb-2">쿠폰 할인금액</h6>
              <h4 class="mb-2">₩ 얼마얼마</h4>
              <p class="mb-0 text-muted">쿠폰 사용량 x </p>
            </div>
            <div class="avatar me-sm-4">
              <span class="avatar-initial rounded bg-label-secondary">
                <i class="bx bxs-coupon bx-sm"></i>
              </span>
            </div>
          </div>
        </div>
        <div class="col-sm-6 col-lg-3">
          <div class="d-flex justify-content-between align-items-start">
            <div>
              <h6 class="mb-2">총 판매건수</h6>
              <h4 class="mb-2">얼마얼마</h4>
              <p class="mb-0"><span class="text-muted me-2">작년대비 판매 증감</span><span class="badge bg-label-danger">-x%</span></p>
            </div>
            <div class="avatar">
              <span class="avatar-initial rounded bg-label-secondary">
                <i class="bx bx-package bx-sm"></i>
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Product List Table -->
<div class="card">
  <div class="card-header">
    <h5 class="card-title">분류</h5>
    <div class="d-flex justify-content-between align-items-center row py-3 gap-3 gap-md-0">
      <div class="col-md-4 product_status"><select id="ProductStatus" class="form-select text-capitalize"><option value="">상품 상태</option><option value="ss">상품준비중</option><option value="Scheduled">배송준비중</option><option value="Publish">배송중</option><option value="Inactive">배송완료</option></select></div>
      <div class="col-md-4 product_category"><select id="ProductCategory" class="form-select text-capitalize"><option value="">카테고리</option><option value="Household">의류</option><option value="Office">산책용품</option><option value="Electronics">리빙</option><option value="Shoes">장난감</option><option value="Accessories">리빙</option><option value="Game">장난감</option></select></div>
      <div class="col-md-4 product_stock"><select id="ProductStock" class="form-select text-capitalize"><option value=""> 재고 </option><option value="Out_of_Stock">재고 없음</option><option value="In_Stock">재고 있음</option></select></div>
    </div>
  </div>
  <div class="card-datatable table-responsive">
    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">
   <div class="card-header d-flex border-top py-md-0">
    	<div class="me-2" style="width: 25%;">
    		<div id="DataTables_Table_0_filter" class="dataTables_filter">
    			<label style="margin-top: 4%;">
    				<input type="search" class="form-control" placeholder="상품 검색" aria-controls="DataTables_Table_0">
    			</label>
    		</div>
    	</div>
    	<div style="width: 45%"></div>
    <div class="d-flex justify-content-start justify-content-md-end align-items-baseline" style="width: 35%;">
    	<div class="dt-action-buttons d-flex align-items-start align-items-md-center justify-content-sm-center mb-3 mb-sm-0" >
    		<div class="dataTables_length mb-2 pb-1"  id="DataTables_Table_0_length">
    			<label >
    				<select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="form-select mt-2 me-2">
    				<option value="7">7</option>
    				<option value="10">10</option>
    				<option value="20">20</option>
    				<option value="50">50</option>
    				<option value="70">70</option>
    				<option value="100">100</option>
    				</select>
    			</label>
    		</div>
	    	<div class="dt-buttons d-flex flex-wrap ms-2">
	    		<button class="dt-button add-new btn btn-secondary mb-1" tabindex="0" aria-controls="DataTables_Table_0" type="button">
	    		<span><i class="bx bx-plus me-0 me-sm-1 mb-1"></i>
	    		<span class="d-none d-sm-inline-block">상품 추가</span>
	    		</span>
	    		</button>
	    	</div>
    	</div>
    </div>
   </div>
    <table class="datatables-products table border-top dataTable no-footer dtr-column collapsed" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" style="width: 100%;">
      <thead>
        <tr>
        	<th class="control sorting_disabled" rowspan="1" colspan="1" style="width: 6px;" aria-label=""></th>
        	<th class="sorting_disabled dt-checkboxes-cell dt-checkboxes-select-all" rowspan="1" colspan="1" style="width: 19px;" data-col="1" aria-label="">
        	<input type="checkbox" class="form-check-input"></th>
        	<th class="sorting sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 300px;" aria-label="product: activate to sort column descending" aria-sort="ascending">상품명</th>
        	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 132px;" aria-label="category: activate to sort column ascending">카테고리</th>
        	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 48px;" aria-label="sku: activate to sort column ascending">코드</th>
        	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 48px;" aria-label="price: activate to sort column ascending">가격</th>
        	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 50px; padding-right: 10px;" aria-label="qty: activate to sort column ascending">재고량</th>
        	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 37px; " aria-label="status: activate to sort column ascending">상태</th>
        	<th class="sorting_disabled" rowspan="1" colspan="1" style="width: 0px;" aria-label="Actions"></th>
        </tr>
      </thead>
      <tbody>
      	<tr class="odd">
      		<td class="control" tabindex="0" style=""></td>
      		<td class="  dt-checkboxes-cell">
      			<input type="checkbox" class="dt-checkboxes form-check-input">
      		</td>
      		<td class="sorting_1">
      			<div class="d-flex justify-content-start align-items-center product-name">
      				<div class="avatar-wrapper">
      					<div class="avatar avatar me-2 rounded-2 bg-label-secondary">
      						<img src="../../bootstrapTemp/assets/img/avatars/robot.jpg" alt="1" class="rounded-2">
      					</div>
      				</div>
      				<div class="d-flex flex-column">
      					<h6 class="text-body text-nowrap mb-0">상품명</h6>
      					<small class="text-muted text-truncate d-none d-sm-block">상품 설명</small>
      				</div>
      			</div>
      		</td>
      		<td>
	      		<span class="text-truncate d-flex align-items-center">
	      			<span class="avatar-sm rounded-circle d-flex justify-content-center align-items-center bg-label-info me-2">
	      				<i class="bx bx-walk"></i>
	      			</span>Shoes
	      		</span>
      		</td>
      		<td>
      			<span>31063</span>
      		</td>
      		<td>
      			<span>$125</span>
      		</td>
      		<td>
      			<span>942</span>
      		</td>
      		<td class="dtr-hidden">
      			<span class="badge bg-label-success" text-capitalized="">active</span>
      		</td>
      		<td class="dtr-hidden">
	      		<div class="d-inline-block text-nowrap">
	      			<button class="btn btn-sm btn-icon dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
	      				<i class="bx bx-dots-vertical-rounded me-2"></i>
	      			</button>
		      		<div class="dropdown-menu dropdown-menu-end m-0">
		      			<a href="javascript:0;" class="dropdown-item">수정</a>
		      			<a href="javascript:0;" class="dropdown-item">삭제</a>
		      		</div>
	      		</div>
      		</td>
      	</tr>
    </table>
    <div class="row mx-2">
    	<div class="col-sm-12 col-md-6 mt-4">
    		<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">1-7개/100개 중 </div>
    	</div>
    		<div class="col-sm-12 col-md-6 mt-3 " style="padding-left: 14%;">
    			<div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
    				<ul class="pagination">
    					<li class="paginate_button page-item previous disabled" id="DataTables_Table_0_previous">
    						<a aria-controls="DataTables_Table_0" aria-disabled="true" role="link" data-dt-idx="previous" tabindex="0" class="page-link">Previous</a>
    					</li>
    					<li class="paginate_button page-item active">
    						<a href="#" aria-controls="DataTables_Table_0" role="link" aria-current="page" data-dt-idx="0" tabindex="0" class="page-link">1</a>
    					</li>
    					<li class="paginate_button page-item ">
    						<a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="1" tabindex="0" class="page-link">2</a>
    					</li>
    					<li class="paginate_button page-item ">
    						<a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="2" tabindex="0" class="page-link">3</a>
    					</li>
    					<li class="paginate_button page-item ">
    						<a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="3" tabindex="0" class="page-link">4</a>
    					</li>
    					<li class="paginate_button page-item ">
    						<a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="4" tabindex="0" class="page-link">5</a>
    					</li>
    					<li class="paginate_button page-item disabled" id="DataTables_Table_0_ellipsis">
    						<a aria-controls="DataTables_Table_0" aria-disabled="true" role="link" data-dt-idx="ellipsis" tabindex="0" class="page-link">…</a>
    					</li>
    					<li class="paginate_button page-item ">
    						<a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="14" tabindex="0" class="page-link">15</a>
    					</li>
    					<li class="paginate_button page-item next" id="DataTables_Table_0_next">
    						<a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="next" tabindex="0" class="page-link">Next</a>
    					</li>
    				</ul>
    			</div>
    		</div>
    	</div>
    </div>
  </div>
</div>

          </div>
          <!-- / Content -->

          
          

<!-- Footer -->
<footer class="content-footer footer bg-footer-theme">
  <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
    <div class="mb-2 mb-md-0">
     
    </div>
    <div class="d-none d-lg-inline-block">
      
    </div>
  </div>
</footer>
<!-- / Footer -->

          
          <div class="content-backdrop fade"></div>
        </div>   