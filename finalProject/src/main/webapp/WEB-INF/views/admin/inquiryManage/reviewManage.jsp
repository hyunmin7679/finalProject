<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


      <!-- Content wrapper -->
      <div class="content-wrapper">

        <!-- Content -->
        
          <div class="container-xxl flex-grow-1 container-p-y">
            
            

<h4 class="py-3 mb-4">
  <span>&nbsp;&nbsp;</span>리뷰 관리
</h4>

<div class="row mb-4 g-4">
  <div class="col-md-6">
    <div class="card h-100">
      <div class="card-body row widget-separator">
        <div class="col-sm-5 border-shift border-end">
          <h2 >평균점수<i class='bx bxs-star mb-2 ms-1'></i></h2>
          <br><br>
          <p class="fw-medium mb-1">총 187개의 리뷰</p>
          <span class="badge bg-label-secondary p-2 mb-3 mb-sm-0">+5주</span>
          <hr class="d-sm-none">
        </div>

        <div class="col-sm-7 gy-1 text-nowrap d-flex flex-column justify-content-between ps-4 gap-2 pe-3">
          <div class="d-flex align-items-center gap-3">
            <small>5</small>
            <div class="progress w-100" style="height:10px;">
              <div class="progress-bar bg-primary" role="progressbar" style="width: 70%" aria-valuenow="61.50" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <small class="w-px-20 text-end">124</small>
          </div>
          <div class="d-flex align-items-center gap-3">
            <small>4</small>
            <div class="progress w-100" style="height:10px;">
              <div class="progress-bar bg-primary" role="progressbar" style="width: 30%" aria-valuenow="24" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <small class="w-px-20 text-end">40</small>
          </div>
          <div class="d-flex align-items-center gap-3">
            <small>3</small>
            <div class="progress w-100" style="height:10px;">
              <div class="progress-bar bg-primary" role="progressbar" style="width: 15%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <small class="w-px-20 text-end">12</small>
          </div>
          <div class="d-flex align-items-center gap-3">
            <small>2</small>
            <div class="progress w-100" style="height:10px;">
              <div class="progress-bar bg-primary" role="progressbar" style="width: 10%" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <small class="w-px-20 text-end">7</small>
          </div>
          <div class="d-flex align-items-center gap-3">
            <small>1</small>
            <div class="progress w-100" style="height:10px;">
              <div class="progress-bar bg-primary" role="progressbar" style="width: 5%" aria-valuenow="2" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <small class="w-px-20 text-end">2</small>
          </div>

        </div>
      </div>
    </div>
  </div>
  <div class="col-md-6">
    <div class="card h-100">
      <div class="card-body row">
        <div class="col-sm-5">
          <div class="mb-5">
            <h4 class="mb-2 text-nowrap">리뷰 통계</h4>
            <p class="mb-0"> <span class="me-2">12개의 새로운 리뷰</span> <span class="badge bg-label-success">+8.4%</span></p>
          </div>

          <div>
            <h5 class="mb-2 fw-normal">
              <span class="text-success me-1">87%</span>긍정적 리뷰
            </h5>
            <small class="text-muted">1주일 기준</small>
          </div>
        </div>
        <div class="col-sm-7 d-flex justify-content-sm-end align-items-end">
          <div id="reviewsChart"></div>
        </div>

      </div>
    </div>
  </div>
</div>

<!-- review List Table -->
<div class="card">
  <div class="card-datatable ">
    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">
    	<div class="card-header d-flex align-items-md-center pb-md-2 flex-wrap justify-content-end" style="width: 100%;">
    		<div class="me-2 ms-n2" >
	    		<div id="DataTables_Table_0_filter" class="dataTables_filter">
	    			<label>
	    				<input type="search" class="form-control" placeholder="리뷰 검색" aria-controls="DataTables_Table_0">
	    			</label>
	    		</div>
    		</div>
    		<div class="review_filter mb-2 mt-2">
		   	<select id="Review" class="form-select" >
		   		<option value=""> All </option>
		   		<option value="Pending" class="text-capitalize">상품명</option>
		   		<option value="Published" class="text-capitalize">작성자명</option>
		   		<option value="Pending" class="text-capitalize">작성일자</option>
		   	</select>
		   </div>
    	<div class="dt-action-buttons text-xl-end text-lg-start text-md-end text-start d-flex align-items-end align-items-md-center justify-content-md-end pt-0 gap-3 flex-wrap">
    		<div class="dataTables_length  md-3 mb-2" id="DataTables_Table_0_length" style="padding-left: 750px;">
		    	<label>
		    		<select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="form-select">
			    		<option value="10">10</option>
			    		<option value="25">25</option>
			    		<option value="50">50</option>
			    		<option value="100">100</option>
			    	</select>
			    </label>
		   </div>
		  </div>
		 </div>
		 <table class="datatables-review table dataTable no-footer dtr-column collapsed" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" style="width: 100%;">
	      <thead>
        	<tr>
        	<th class="control sorting_disabled pe-0" rowspan="1" colspan="1" style="width: 10px;" aria-label=""></th>
        	<th class="sorting_disabled dt-checkboxes-cell dt-checkboxes-select-all" rowspan="1" colspan="1" style="width: 50px;" data-col="1" aria-label=""><input type="checkbox" class="form-check-input"></th>
        	<th class="sorting sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 50px;" aria-label="Product: activate to sort column descending" aria-sort="ascending">상품</th>
        	<th class="text-nowrap sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 40px;" aria-label="Reviewer: activate to sort column ascending">작성자</th>
        	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width:40px;" aria-label="Review: activate to sort column ascending">별점</th>
        	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 10px;" aria-label="Date: activate to sort column ascending">날짜</th>
        	<th class="sorting_disabled dtr-hidden" rowspan="1" colspan="1" style="width: 10px; " aria-label="Actions"></th>
        	</tr>
      </thead>
      <tbody>
      	<tr class="odd">
      		<td class="control" tabindex="0" style=""></td>
      		<td class="  dt-checkboxes-cell"><input type="checkbox" class="dt-checkboxes form-check-input"></td>
      		<td class="sorting_1">
      			<div class="d-flex justify-content-start align-items-center customer-name">
	      			<div class="avatar-wrapper">
		      			<div class="avatar me-2 rounded-2 bg-label-secondary">
		      				<img src="../../bootstrapTemp/assets/img/avatars/robot.jpg" alt="Product-9" class="rounded-2">
		      			</div>
	      			</div>
	      				<div class="d-flex flex-column">
	      					<span class="fw-medium text-nowrap">상품명</span>
	      					<small class="text-muted">상품설명</small>
	      				</div>
      			</div>
      		</td>
      	<td>
      		<div class="d-flex justify-content-start align-items-center customer-name">
      			<div class="avatar-wrapper">
      				<div class="avatar me-2">
      					<img src="../../bootstrapTemp/assets/img/avatars/robot.jpg" alt="Avatar" class="rounded-circle">
      				</div>
      			</div>
	      		<div class="d-flex flex-column">
	      			<a href="app-ecommerce-customer-details-overview.html">
	      				<span class="fw-medium">작성자닉네임</span>
	      			</a>
	      			<small class="text-muted text-nowrap">작성자 아이디</small>
	      		</div>
      		</div>
      	</td>
      	<td>
      		<div>
      			<div class="read-only-ratings ps-0 mb-2 jq-ry-container" readonly="readonly" style="width:150px;">
      				<div class="jq-ry-group-wrapper">
      					<div class="jq-ry-normal-group jq-ry-group" style="width: 100%;">
      						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray">
      							<path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path>
      						</svg>
      						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;">
      							<path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path>
      						</svg>
      						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;">
      							<path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path>
      						</svg>
      						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;">
      							<path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path>
      						</svg>
      						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;">
      							<path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path>
      						</svg>
     					</div>
     										
     				</div>
     			</div>
     			<p class="fw-medium mb-1 text-truncate text-capitalize">제목</p>
     			<small class="text-break pe-3">내용</small>
     		</div>
     	</td>
     	<td><span class="text-nowrap">작성일</span></td>
     	<td class="dtr-hidden">
     		<div class="text-xxl-center"><div class="dropdown">
     			<a href="javascript:;" class="btn dropdown-toggle hide-arrow text-body p-0" data-bs-toggle="dropdown">
     				<i class="bx bx-dots-vertical-rounded"></i>
     			</a>
     		<div class="dropdown-menu dropdown-menu-end">
     			<a href="javascript:;" class="dropdown-item delete-record text-danger">숨김</a>
     		</div>
     	</div>
     </div>
    </td>
    </tr>
  
    		
   </tbody>
    </table>
    	<div class="row mx-2 " style="width: 100%;">
    		<div class="col-sm-12 col-md-6">
    			<div class="dataTables_info mt-3" id="DataTables_Table_0_info" role="status" aria-live="polite">1-10개/100개 중</div>
    		</div>
    		<div class="col-sm-12 col-md-6 mt-3 " >
    			<div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
    				<ul class="pagination justify-content-end">
    					<li class="paginate_button page-item previous disabled" id="DataTables_Table_0_previous">
    						<a aria-controls="DataTables_Table_0" aria-disabled="true" role="link" data-dt-idx="previous" tabindex="0" class="page-link">Previous</a>
    					</li>
    					<li class="paginate_button page-item active">
    						<a href="#" aria-controls="DataTables_Table_0" role="link" aria-current="page" data-dt-idx="0" tabindex="0" class="page-link">1</a>
    					</li>
    					<li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="1" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="2" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="3" tabindex="0" class="page-link">4</a></li><li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="4" tabindex="0" class="page-link">5</a></li><li class="paginate_button page-item disabled" id="DataTables_Table_0_ellipsis"><a aria-controls="DataTables_Table_0" aria-disabled="true" role="link" data-dt-idx="ellipsis" tabindex="0" class="page-link">…</a></li><li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="9" tabindex="0" class="page-link">10</a></li><li class="paginate_button page-item next" id="DataTables_Table_0_next"><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="next" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div>
  </div>
</div>


          </div>
          <!-- / Content -->

          
          

<!-- Footer -->
<footer class="content-footer footer bg-footer-theme">
  <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
    <div class="mb-2 mb-md-0">
      © <script>
      document.write(new Date().getFullYear())

      </script>
      , made with ❤️ by <a href="https://themeselection.com" target="_blank" class="footer-link fw-medium">ThemeSelection</a>
    </div>
    <div class="d-none d-lg-inline-block">
      
      <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
      <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>
      
      <a href="https://demos.themeselection.com/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a>
      
      
      <a href="https://themeselection.com/support/" target="_blank" class="footer-link d-none d-sm-inline-block">Support</a>
      
    </div>
  </div>
</footer>
<!-- / Footer -->

          
          <div class="content-backdrop fade"></div>
        </div>