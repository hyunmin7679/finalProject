<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

      

      <!-- Content wrapper -->
      <div class="content-wrapper">

        <!-- Content -->
        
          <div class="container-xxl flex-grow-1 container-p-y">
            
<h4 class="py-3 mb-4">
  <span>&nbsp;&nbsp;</span>관리자 리스트</h4>           


<!-- Users List Table -->
<div class="card">
  <div class="card-header border-bottom">
    <h5 class="card-title">계정 분류</h5>
  </div>
  <div class="card-datatable" >
    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">
    	<div class="row mx-2">
    		<div class="col-md-2">
    			<div class="me-3">
    				<div class="dataTables_length" id="DataTables_Table_0_length">
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
    		<div class="col-md-10">
    			<div class="dt-action-buttons text-xl-end text-lg-start text-md-end text-start d-flex align-items-center justify-content-end flex-md-row flex-column mb-3 mb-md-0">
    				<div id="DataTables_Table_0_filter" class="dataTables_filter">
    					<label>
    						<input type="search" class="form-control" placeholder="검색" aria-controls="DataTables_Table_0">
    					</label>
    				</div>
    			</div>
    		</div>
    	</div>
    	<table class="datatables-users table border-top dataTable no-footer dtr-column" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" style="width: 100%;">
      <thead>
        <tr>
        	<th class="control sorting_disabled dtr-hidden" rowspan="1" colspan="1" style="width: 0px;" aria-label=""></th>
        	<th class="sorting sorting_desc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 268px;" aria-label="User: activate to sort column ascending" aria-sort="descending">사원</th>
        	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 129px;" aria-label="Role: activate to sort column ascending">입사일자</th>
        	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 83px;" aria-label="Plan: activate to sort column ascending">부서</th>
        	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 161px;" aria-label="Billing: activate to sort column ascending">연봉</th>
        	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 81px;" aria-label="Status: activate to sort column ascending">직원상태</th>
        	<th class="sorting_disabled" rowspan="1" colspan="1" style="width: 106px;" aria-label="Actions"></th>
        </tr>
      </thead>
      <tbody >
      	<tr class="odd" >
      		<td class="  control" tabindex="0" ></td>
      		<td class="sorting_1">
      			<div class="d-flex justify-content-start align-items-center user-name">
      				<div class="avatar-wrapper"><div class="avatar avatar-sm me-3">
      					<img src="../../bootstrapTemp/assets/img/avatars/robot.jpg" alt="Avatar" class="rounded-circle">
      				</div>
      			</div>
	      			<div class="d-flex flex-column">
	      				<a href="app-user-view-account.html" class="text-body text-truncate">
	      					<span class="fw-medium">이름</span>
	      				</a>
	      				<small class="text-muted">직원이메일</small>
	      			</div>
      			</div>
      		</td>
      		<td>
	      		<span class="text-truncate d-flex align-items-center">
	      		2017년 10월 8일</span>
      		</td>
      		<td>
      			<span class="fw-medium">홍보</span>
      		</td>
      		<td>$14,541</td>
      		<td>
      			<span class="badge bg-label-success">재직</span>
      		</td>
      		<td>
      			<div class="d-inline-block text-nowrap">
      				<button class="btn btn-sm btn-icon dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
      					<i class="bx bx-dots-vertical-rounded me-2"></i>
      				</button>
	      			<div class="dropdown-menu dropdown-menu-end m-0">
	      				<a href="javascript:;" class="dropdown-item text-danger">삭제</a>
	      			</div>
      			</div>
      		</td>
      	</tr>
      </tbody>
    </table>
    <div class="row mx-2" style="width: 100%;">
    	<div class="col-sm-12 col-md-6 mt-3">
    		<div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">Showing 1 to 10 of 50 entries</div>
    	</div>
    	<div class="col-sm-12 col-md-6 mt-3">
    		<div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
    			<ul class="pagination justify-content-end pe-2">
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
    				<li class="paginate_button page-item next" id="DataTables_Table_0_next">
    					<a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="next" tabindex="0" class="page-link">Next</a>
    				</li>
    			</ul>
    		</div>
    	</div>
    </div>
   </div>
  </div>
  <!-- Offcanvas to add new user -->
  <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasAddUser" aria-labelledby="offcanvasAddUserLabel">
    <div class="offcanvas-header">
      <h5 id="offcanvasAddUserLabel" class="offcanvas-title">Add User</h5>
      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body mx-0 flex-grow-0">
      <form class="add-new-user pt-0 fv-plugins-bootstrap5 fv-plugins-framework" id="addNewUserForm" onsubmit="return false" novalidate="novalidate">
        <div class="mb-3 fv-plugins-icon-container">
          <label class="form-label" for="add-user-fullname">Full Name</label>
          <input type="text" class="form-control" id="add-user-fullname" placeholder="John Doe" name="userFullname" aria-label="John Doe">
        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div></div>
        <div class="mb-3 fv-plugins-icon-container">
          <label class="form-label" for="add-user-email">Email</label>
          <input type="text" id="add-user-email" class="form-control" placeholder="john.doe@example.com" aria-label="john.doe@example.com" name="userEmail">
        <div class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div></div>
        <div class="mb-3">
          <label class="form-label" for="add-user-contact">Contact</label>
          <input type="text" id="add-user-contact" class="form-control phone-mask" placeholder="+1 (609) 988-44-11" aria-label="john.doe@example.com" name="userContact">
        </div>
        <div class="mb-3">
          <label class="form-label" for="add-user-company">Company</label>
          <input type="text" id="add-user-company" class="form-control" placeholder="Web Developer" aria-label="jdoe1" name="companyName">
        </div>
        <div class="mb-3">
          <label class="form-label" for="country">Country</label>
          <div class="position-relative"><select id="country" class="select2 form-select select2-hidden-accessible" data-select2-id="country" tabindex="-1" aria-hidden="true">
            <option value="" data-select2-id="2">Select</option>
            <option value="Australia">Australia</option>
            <option value="Bangladesh">Bangladesh</option>
            <option value="Belarus">Belarus</option>
            <option value="Brazil">Brazil</option>
            <option value="Canada">Canada</option>
            <option value="China">China</option>
            <option value="France">France</option>
            <option value="Germany">Germany</option>
            <option value="India">India</option>
            <option value="Indonesia">Indonesia</option>
            <option value="Israel">Israel</option>
            <option value="Italy">Italy</option>
            <option value="Japan">Japan</option>
            <option value="Korea">Korea, Republic of</option>
            <option value="Mexico">Mexico</option>
            <option value="Philippines">Philippines</option>
            <option value="Russia">Russian Federation</option>
            <option value="South Africa">South Africa</option>
            <option value="Thailand">Thailand</option>
            <option value="Turkey">Turkey</option>
            <option value="Ukraine">Ukraine</option>
            <option value="United Arab Emirates">United Arab Emirates</option>
            <option value="United Kingdom">United Kingdom</option>
            <option value="United States">United States</option>
          </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="1" style="width: 352px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-country-container"><span class="select2-selection__rendered" id="select2-country-container" role="textbox" aria-readonly="true"><span class="select2-selection__placeholder">Select Country</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span></div>
        </div>
        <div class="mb-3">
          <label class="form-label" for="user-role">User Role</label>
          <select id="user-role" class="form-select">
            <option value="subscriber">Subscriber</option>
            <option value="editor">Editor</option>
            <option value="maintainer">Maintainer</option>
            <option value="author">Author</option>
            <option value="admin">Admin</option>
          </select>
        </div>
        <div class="mb-4">
          <label class="form-label" for="user-plan">Select Plan</label>
          <select id="user-plan" class="form-select">
            <option value="basic">Basic</option>
            <option value="enterprise">Enterprise</option>
            <option value="company">Company</option>
            <option value="team">Team</option>
          </select>
        </div>
        <button type="submit" class="btn btn-primary me-sm-3 me-1 data-submit">Submit</button>
        <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="offcanvas">Cancel</button>
      <input type="hidden"></form>
    </div>
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
        <!-- Content wrapper -->
      </div>