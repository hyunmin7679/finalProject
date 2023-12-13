<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<nav
	class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
	id="layout-navbar">











	<div
		class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0   d-xl-none ">
		<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
			<i class="bx bx-menu bx-sm"></i>
		</a>
	</div>


	<div class="navbar-nav-right d-flex align-items-center"
		id="navbar-collapse">




		<!-- Search -->
		<div class="navbar-nav align-items-center">
			<div class="nav-item navbar-search-wrapper mb-0">
				<a class="nav-item nav-link search-toggler px-0"
					href="javascript:void(0);"> <i class="bx bx-search bx-sm"></i>
					<span class="d-none d-md-inline-block text-muted">Search
						(Ctrl+/)</span>
				</a>
			</div>
		</div>
		<!-- /Search -->





		<ul class="navbar-nav flex-row align-items-center ms-auto">




			<!-- Language -->
			<li class="nav-item dropdown-language dropdown me-2 me-xl-0"><a
				class="nav-link dropdown-toggle hide-arrow"
				href="javascript:void(0);" data-bs-toggle="dropdown"> <i
					class="bx bx-globe bx-sm"></i>
			</a>
				<ul class="dropdown-menu dropdown-menu-end">
					<li><a class="dropdown-item active" href="javascript:void(0);"
						data-language="en" data-text-direction="ltr"> <span
							class="align-middle">English</span>
					</a></li>
					<li><a class="dropdown-item" href="javascript:void(0);"
						data-language="fr" data-text-direction="ltr"> <span
							class="align-middle">French</span>
					</a></li>
					<li><a class="dropdown-item" href="javascript:void(0);"
						data-language="ar" data-text-direction="rtl"> <span
							class="align-middle">Arabic</span>
					</a></li>
					<li><a class="dropdown-item" href="javascript:void(0);"
						data-language="de" data-text-direction="ltr"> <span
							class="align-middle">German</span>
					</a></li>
				</ul></li>
			<!-- /Language -->

			<!-- Quick links  -->
			<li
				class="nav-item dropdown-shortcuts navbar-dropdown dropdown me-2 me-xl-0">
				<a class="nav-link dropdown-toggle hide-arrow"
				href="javascript:void(0);" data-bs-toggle="dropdown"
				data-bs-auto-close="outside" aria-expanded="false"> <i
					class="bx bx-grid-alt bx-sm"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-end py-0">
					<div class="dropdown-menu-header border-bottom">
						<div class="dropdown-header d-flex align-items-center py-3">
							<h5 class="text-body mb-0 me-auto">Shortcuts</h5>
							<a href="javascript:void(0)"
								class="dropdown-shortcuts-add text-body"
								data-bs-toggle="tooltip" data-bs-placement="top"
								aria-label="Add shortcuts"
								data-bs-original-title="Add shortcuts"><i
								class="bx bx-sm bx-plus-circle"></i></a>
						</div>
					</div>
					<div class="dropdown-shortcuts-list scrollable-container ps">
						<div class="row row-bordered overflow-visible g-0">
							<div class="dropdown-shortcuts-item col">
								<span
									class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
									<i class="bx bx-calendar fs-4"></i>
								</span> <a href="app-calendar.html" class="stretched-link">Calendar</a>
								<small class="text-muted mb-0">Appointments</small>
							</div>
							<div class="dropdown-shortcuts-item col">
								<span
									class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
									<i class="bx bx-food-menu fs-4"></i>
								</span> <a href="app-invoice-list.html" class="stretched-link">Invoice
									App</a> <small class="text-muted mb-0">Manage Accounts</small>
							</div>
						</div>
						<div class="row row-bordered overflow-visible g-0">
							<div class="dropdown-shortcuts-item col">
								<span
									class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
									<i class="bx bx-user fs-4"></i>
								</span> <a href="app-user-list.html" class="stretched-link">User
									App</a> <small class="text-muted mb-0">Manage Users</small>
							</div>
							<div class="dropdown-shortcuts-item col">
								<span
									class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
									<i class="bx bx-check-shield fs-4"></i>
								</span> <a href="app-access-roles.html" class="stretched-link">Role
									Management</a> <small class="text-muted mb-0">Permission</small>
							</div>
						</div>
						<div class="row row-bordered overflow-visible g-0">
							<div class="dropdown-shortcuts-item col">
								<span
									class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
									<i class="bx bx-pie-chart-alt-2 fs-4"></i>
								</span> <a href="index.html" class="stretched-link">Dashboard</a> <small
									class="text-muted mb-0">User Profile</small>
							</div>
							<div class="dropdown-shortcuts-item col">
								<span
									class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
									<i class="bx bx-cog fs-4"></i>
								</span> <a href="pages-account-settings-account.html"
									class="stretched-link">Setting</a> <small
									class="text-muted mb-0">Account Settings</small>
							</div>
						</div>
						<div class="row row-bordered overflow-visible g-0">
							<div class="dropdown-shortcuts-item col">
								<span
									class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
									<i class="bx bx-help-circle fs-4"></i>
								</span> <a href="pages-faq.html" class="stretched-link">FAQs</a> <small
									class="text-muted mb-0">FAQs &amp; Articles</small>
							</div>
							<div class="dropdown-shortcuts-item col">
								<span
									class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
									<i class="bx bx-window-open fs-4"></i>
								</span> <a href="modal-examples.html" class="stretched-link">Modals</a>
								<small class="text-muted mb-0">Useful Popups</small>
							</div>
						</div>
						<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
							<div class="ps__thumb-x" tabindex="0"
								style="left: 0px; width: 0px;"></div>
						</div>
						<div class="ps__rail-y" style="top: 0px; right: 0px;">
							<div class="ps__thumb-y" tabindex="0"
								style="top: 0px; height: 0px;"></div>
						</div>
					</div>
				</div>
			</li>
			<!-- Quick links -->



			<!-- Notification -->
			<li
				class="nav-item dropdown-notifications navbar-dropdown dropdown me-3 me-xl-1">
				<a class="nav-link dropdown-toggle hide-arrow"
				href="javascript:void(0);" data-bs-toggle="dropdown"
				data-bs-auto-close="outside" aria-expanded="false"> <i
					class="bx bx-bell bx-sm"></i> <span
					class="badge bg-danger rounded-pill badge-notifications">5</span>
			</a>
				<ul class="dropdown-menu dropdown-menu-end py-0">
					<li class="dropdown-menu-header border-bottom">
						<div class="dropdown-header d-flex align-items-center py-3">
							<h5 class="text-body mb-0 me-auto">Notification</h5>
							<a href="javascript:void(0)"
								class="dropdown-notifications-all text-body"
								data-bs-toggle="tooltip" data-bs-placement="top"
								aria-label="Mark all as read"
								data-bs-original-title="Mark all as read"><i
								class="bx fs-4 bx-envelope-open"></i></a>
						</div>
					</li>
					<li class="dropdown-notifications-list scrollable-container ps">
						<ul class="list-group list-group-flush">
							<li
								class="list-group-item list-group-item-action dropdown-notifications-item">
								<div class="d-flex">
									<div class="flex-shrink-0 me-3">
										<div class="avatar">
											<img src="../../assets/img/avatars/1.png" alt=""
												class="w-px-40 h-auto rounded-circle">
										</div>
									</div>
									<div class="flex-grow-1">
										<h6 class="mb-1">Congratulation Lettie 🎉</h6>
										<p class="mb-0">Won the monthly best seller gold badge</p>
										<small class="text-muted">1h ago</small>
									</div>
									<div class="flex-shrink-0 dropdown-notifications-actions">
										<a href="javascript:void(0)"
											class="dropdown-notifications-read"><span
											class="badge badge-dot"></span></a> <a href="javascript:void(0)"
											class="dropdown-notifications-archive"><span
											class="bx bx-x"></span></a>
									</div>
								</div>
							</li>
							<li
								class="list-group-item list-group-item-action dropdown-notifications-item">
								<div class="d-flex">
									<div class="flex-shrink-0 me-3">
										<div class="avatar">
											<span class="avatar-initial rounded-circle bg-label-danger">CF</span>
										</div>
									</div>
									<div class="flex-grow-1">
										<h6 class="mb-1">Charles Franklin</h6>
										<p class="mb-0">Accepted your connection</p>
										<small class="text-muted">12hr ago</small>
									</div>
									<div class="flex-shrink-0 dropdown-notifications-actions">
										<a href="javascript:void(0)"
											class="dropdown-notifications-read"><span
											class="badge badge-dot"></span></a> <a href="javascript:void(0)"
											class="dropdown-notifications-archive"><span
											class="bx bx-x"></span></a>
									</div>
								</div>
							</li>
							<li
								class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
								<div class="d-flex">
									<div class="flex-shrink-0 me-3">
										<div class="avatar">
											<img src="../../assets/img/avatars/2.png" alt=""
												class="w-px-40 h-auto rounded-circle">
										</div>
									</div>
									<div class="flex-grow-1">
										<h6 class="mb-1">New Message ✉️</h6>
										<p class="mb-0">You have new message from Natalie</p>
										<small class="text-muted">1h ago</small>
									</div>
									<div class="flex-shrink-0 dropdown-notifications-actions">
										<a href="javascript:void(0)"
											class="dropdown-notifications-read"><span
											class="badge badge-dot"></span></a> <a href="javascript:void(0)"
											class="dropdown-notifications-archive"><span
											class="bx bx-x"></span></a>
									</div>
								</div>
							</li>
							<li
								class="list-group-item list-group-item-action dropdown-notifications-item">
								<div class="d-flex">
									<div class="flex-shrink-0 me-3">
										<div class="avatar">
											<span class="avatar-initial rounded-circle bg-label-success"><i
												class="bx bx-cart"></i></span>
										</div>
									</div>
									<div class="flex-grow-1">
										<h6 class="mb-1">Whoo! You have new order 🛒</h6>
										<p class="mb-0">ACME Inc. made new order $1,154</p>
										<small class="text-muted">1 day ago</small>
									</div>
									<div class="flex-shrink-0 dropdown-notifications-actions">
										<a href="javascript:void(0)"
											class="dropdown-notifications-read"><span
											class="badge badge-dot"></span></a> <a href="javascript:void(0)"
											class="dropdown-notifications-archive"><span
											class="bx bx-x"></span></a>
									</div>
								</div>
							</li>
							<li
								class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
								<div class="d-flex">
									<div class="flex-shrink-0 me-3">
										<div class="avatar">
											<img src="../../assets/img/avatars/9.png" alt=""
												class="w-px-40 h-auto rounded-circle">
										</div>
									</div>
									<div class="flex-grow-1">
										<h6 class="mb-1">Application has been approved 🚀</h6>
										<p class="mb-0">Your ABC project application has been
											approved.</p>
										<small class="text-muted">2 days ago</small>
									</div>
									<div class="flex-shrink-0 dropdown-notifications-actions">
										<a href="javascript:void(0)"
											class="dropdown-notifications-read"><span
											class="badge badge-dot"></span></a> <a href="javascript:void(0)"
											class="dropdown-notifications-archive"><span
											class="bx bx-x"></span></a>
									</div>
								</div>
							</li>
							<li
								class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
								<div class="d-flex">
									<div class="flex-shrink-0 me-3">
										<div class="avatar">
											<span class="avatar-initial rounded-circle bg-label-success"><i
												class="bx bx-pie-chart-alt"></i></span>
										</div>
									</div>
									<div class="flex-grow-1">
										<h6 class="mb-1">Monthly report is generated</h6>
										<p class="mb-0">July monthly financial report is generated
										</p>
										<small class="text-muted">3 days ago</small>
									</div>
									<div class="flex-shrink-0 dropdown-notifications-actions">
										<a href="javascript:void(0)"
											class="dropdown-notifications-read"><span
											class="badge badge-dot"></span></a> <a href="javascript:void(0)"
											class="dropdown-notifications-archive"><span
											class="bx bx-x"></span></a>
									</div>
								</div>
							</li>
							<li
								class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
								<div class="d-flex">
									<div class="flex-shrink-0 me-3">
										<div class="avatar">
											<img src="../../assets/img/avatars/5.png" alt=""
												class="w-px-40 h-auto rounded-circle">
										</div>
									</div>
									<div class="flex-grow-1">
										<h6 class="mb-1">Send connection request</h6>
										<p class="mb-0">Peter sent you connection request</p>
										<small class="text-muted">4 days ago</small>
									</div>
									<div class="flex-shrink-0 dropdown-notifications-actions">
										<a href="javascript:void(0)"
											class="dropdown-notifications-read"><span
											class="badge badge-dot"></span></a> <a href="javascript:void(0)"
											class="dropdown-notifications-archive"><span
											class="bx bx-x"></span></a>
									</div>
								</div>
							</li>
							<li
								class="list-group-item list-group-item-action dropdown-notifications-item">
								<div class="d-flex">
									<div class="flex-shrink-0 me-3">
										<div class="avatar">
											<img src="../../assets/img/avatars/6.png" alt=""
												class="w-px-40 h-auto rounded-circle">
										</div>
									</div>
									<div class="flex-grow-1">
										<h6 class="mb-1">New message from Jane</h6>
										<p class="mb-0">Your have new message from Jane</p>
										<small class="text-muted">5 days ago</small>
									</div>
									<div class="flex-shrink-0 dropdown-notifications-actions">
										<a href="javascript:void(0)"
											class="dropdown-notifications-read"><span
											class="badge badge-dot"></span></a> <a href="javascript:void(0)"
											class="dropdown-notifications-archive"><span
											class="bx bx-x"></span></a>
									</div>
								</div>
							</li>
							<li
								class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
								<div class="d-flex">
									<div class="flex-shrink-0 me-3">
										<div class="avatar">
											<span class="avatar-initial rounded-circle bg-label-warning"><i
												class="bx bx-error"></i></span>
										</div>
									</div>
									<div class="flex-grow-1">
										<h6 class="mb-1">CPU is running high</h6>
										<p class="mb-0">CPU Utilization Percent is currently at
											88.63%,</p>
										<small class="text-muted">5 days ago</small>
									</div>
									<div class="flex-shrink-0 dropdown-notifications-actions">
										<a href="javascript:void(0)"
											class="dropdown-notifications-read"><span
											class="badge badge-dot"></span></a> <a href="javascript:void(0)"
											class="dropdown-notifications-archive"><span
											class="bx bx-x"></span></a>
									</div>
								</div>
							</li>
						</ul>
						<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
							<div class="ps__thumb-x" tabindex="0"
								style="left: 0px; width: 0px;"></div>
						</div>
						<div class="ps__rail-y" style="top: 0px; right: 0px;">
							<div class="ps__thumb-y" tabindex="0"
								style="top: 0px; height: 0px;"></div>
						</div>
					</li>
					<li class="dropdown-menu-footer border-top p-3">
						<button class="btn btn-primary text-uppercase w-100">view
							all notifications</button>
					</li>
				</ul>
			</li>
			<!--/ Notification -->
			<!-- User -->
			<li class="nav-item navbar-dropdown dropdown-user dropdown"><a
				class="nav-link dropdown-toggle hide-arrow"
				href="javascript:void(0);" data-bs-toggle="dropdown">
					<div class="avatar avatar-online">
						<img src="../../assets/img/avatars/1.png" alt=""
							class="w-px-40 h-auto rounded-circle">
					</div>
			</a>
				<ul class="dropdown-menu dropdown-menu-end">
					<li><a class="dropdown-item"
						href="pages-account-settings-account.html">
							<div class="d-flex">
								<div class="flex-shrink-0 me-3">
									<div class="avatar avatar-online">
										<img src="../../assets/img/avatars/1.png" alt=""
											class="w-px-40 h-auto rounded-circle">
									</div>
								</div>
								<div class="flex-grow-1">
									<span class="fw-medium d-block">John Doe</span> <small
										class="text-muted">Admin</small>
								</div>
							</div>
					</a></li>
					<li>
						<div class="dropdown-divider"></div>
					</li>
					<li><a class="dropdown-item" href="pages-profile-user.html">
							<i class="bx bx-user me-2"></i> <span class="align-middle">My
								Profile</span>
					</a></li>
					<li><a class="dropdown-item"
						href="pages-account-settings-account.html"> <i
							class="bx bx-cog me-2"></i> <span class="align-middle">Settings</span>
					</a></li>
					<li><a class="dropdown-item"
						href="pages-account-settings-billing.html"> <span
							class="d-flex align-items-center align-middle"> <i
								class="flex-shrink-0 bx bx-credit-card me-2"></i> <span
								class="flex-grow-1 align-middle">Billing</span> <span
								class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
						</span>
					</a></li>
					<li>
						<div class="dropdown-divider"></div>
					</li>
					<li><a class="dropdown-item" href="pages-faq.html"> <i
							class="bx bx-help-circle me-2"></i> <span class="align-middle">FAQ</span>
					</a></li>
					<li><a class="dropdown-item" href="pages-pricing.html"> <i
							class="bx bx-dollar me-2"></i> <span class="align-middle">Pricing</span>
					</a></li>
					<li>
						<div class="dropdown-divider"></div>
					</li>
					<li><a class="dropdown-item" href="auth-login-cover.html"
						target="_blank"> <i class="bx bx-power-off me-2"></i> <span
							class="align-middle">Log Out</span>
					</a></li>
				</ul></li>
			<!--/ User -->


		</ul>
	</div>




</nav>

<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">



		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">eCommerce /</span> Category List
		</h4>

		<div class="app-ecommerce-category" data-select2-id="8">
		
			<!-- Category List Table -->
			
			<div class="card">
				<div class="card-datatable table-responsive">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper dt-bootstrap5 no-footer">
						<div class="card-header d-flex flex-wrap py-0">
							
							<div class="me-5 ms-n2 pe-5 pt-3 mb-3">
								<div id="DataTables_Table_0_filter" class="dataTables_filter">
									<label><input type="search" class="form-control"
										placeholder="Search Category"
										aria-controls="DataTables_Table_0"></label>
								</div>
							</div>
							
							<div class="d-flex justify-content-end justify-content-md-end align-items-baseline"  style="padding-left: 780px;">
								<div class="dt-action-buttons d-flex align-items-start align-items-md-center justify-content-sm-center gap-3 pt-0">
									
									<div class="dataTables_length mt-0 mt-md-3"
										id="DataTables_Table_0_length">
										<label><select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="form-select">
											<option value="7">7</option>
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
											</i>Add Category</span>
										</button>
									</div>
								</div>
							</div>
							
						</div>
						<table
							class="datatables-category-list table border-top dataTable no-footer dtr-column collapsed"
							id="DataTables_Table_0"
							aria-describedby="DataTables_Table_0_info" style="width: 1381px;">
							<thead>
								<tr>
									<th class="control sorting_disabled" rowspan="1" colspan="1"
										style="width: 0px;" aria-label=""></th>
									<th
										class="sorting_disabled dt-checkboxes-cell dt-checkboxes-select-all"
										rowspan="1" colspan="1" style="width: 18px;" data-col="1"
										aria-label=""><input type="checkbox" class="form-check-input"></th>
									<th class="sorting sorting_desc" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										style="width: 673px;"
										aria-label="Categories: activate to sort column ascending"
										aria-sort="descending">Categories</th>
									<th class="text-nowrap text-sm-end sorting" tabindex="0"
										aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
										style="width: 200px;"
										aria-label="Total Products &amp;nbsp;: activate to sort column ascending">Total
										Products &nbsp;</th>
									<th class="text-nowrap text-sm-end sorting_disabled dtr-hidden"
										rowspan="1" colspan="1" style="width: 170px;"
										aria-label="Total Earning">Total Earning</th>
									<th class="text-lg-center sorting_disabled dtr-hidden"
										rowspan="1" colspan="1" style="width: 112px;"
										aria-label="Actions">Actions</th>
								</tr>
							</thead>
							<tbody>
								<tr class="odd">
									<td class="control" tabindex="0" style=""></td>
									<td class="dt-checkboxes-cell" style=""><input type="checkbox" class="dt-checkboxes form-check-input"></td>
									<td class="sorting_1" style=""><div
											class="d-flex align-items-center">
											<div class="avatar-wrapper me-2 rounded-2 bg-label-secondary">
												<div class="avatar">
													<img src="../../assets/img/ecommerce-images/product-16.png"
														alt="" class="rounded-2">
												</div>
											</div>
											<div class="d-flex flex-column justify-content-center">
												<span class="text-body text-wrap fw-medium">Travel</span><span
													class="text-muted text-truncate mb-0 d-none d-sm-block"><small>Choose
														from wide range of travel accessories from popular brands</small></span>
											</div>
										</div></td>
									<td class="" style=""><div class="text-sm-end">4186</div></td>
									<td class="dtr-hidden" style=""><div
											class="fw-medium text-sm-end">$7912.99</div></td>
									<td class="dtr-hidden" style=""><div
											class="d-flex align-items-sm-center justify-content-sm-center">
											<button class="btn btn-sm btn-icon delete-record me-2">
												<i class="bx bx-trash"></i>
											</button>
											<button class="btn btn-sm btn-icon">
												<i class="bx bx-edit"></i>
											</button>
										</div></td>
								</tr>
							</tbody>
						</table>
						<div class="row mx-2">
							<div class="col-sm-12 col-md-6">
								<div class="dataTables_info" id="DataTables_Table_0_info"
									role="status" aria-live="polite">Showing 1 to 7 of 14
									entries</div>
							</div>
							<div class="col-sm-12 col-md-6">
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
						class="offcanvas-title">Add Category</h5>
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
							<label class="form-label" for="ecommerce-category-title">Title</label>
							<input type="text" class="form-control"
								id="ecommerce-category-title" placeholder="Enter category title"
								name="categoryTitle" aria-label="category title">
							<div
								class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
						</div>
						<!-- Slug -->
						<div class="mb-3 fv-plugins-icon-container">
							<label class="form-label" for="ecommerce-category-slug">Slug</label>
							<input type="text" id="ecommerce-category-slug"
								class="form-control" placeholder="Enter slug" aria-label="slug"
								name="slug">
							<div
								class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
						</div>
						<!-- Image -->
						<div class="mb-3">
							<label class="form-label" for="ecommerce-category-image">Attachment</label>
							<input class="form-control" type="file"
								id="ecommerce-category-image">
						</div>
						<!-- Parent category -->
						<div class="mb-3 ecommerce-select2-dropdown">
							<label class="form-label"
								for="ecommerce-category-parent-category">Parent category</label>
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
								</select><span
									class="select2 select2-container select2-container--default"
									dir="ltr" data-select2-id="1" style="width: 352px;"><span
									class="selection"><span
										class="select2-selection select2-selection--single"
										role="combobox" aria-haspopup="true" aria-expanded="false"
										tabindex="0" aria-disabled="false"
										aria-labelledby="select2-ecommerce-category-parent-category-container"><span
											class="select2-selection__rendered"
											id="select2-ecommerce-category-parent-category-container"
											role="textbox" aria-readonly="true"><span
												class="select2-selection__placeholder">Select parent
													category</span></span><span class="select2-selection__arrow"
											role="presentation"><b role="presentation"></b></span></span></span><span
									class="dropdown-wrapper" aria-hidden="true"></span></span>
							</div>
						</div>
						<!-- Description -->
						<div class="mb-3">
							<label class="form-label">Description</label>
							<div class="form-control p-0 pt-1">
								<div class="comment-editor border-0 ql-container ql-snow"
									id="ecommerce-category-description">
									<div class="ql-editor ql-blank" data-gramm="false"
										contenteditable="true"
										data-placeholder="Enter category description...">
										<p>
											<br>
										</p>
									</div>
									<div class="ql-clipboard" contenteditable="true" tabindex="-1"></div>
									<div class="ql-tooltip ql-hidden">
										<a class="ql-preview" rel="noopener noreferrer"
											target="_blank" href="about:blank"></a><input type="text"
											data-formula="e=mc^2" data-link="https://quilljs.com"
											data-video="Embed URL"><a class="ql-action"></a><a
											class="ql-remove"></a>
									</div>
								</div>
								<div class="comment-toolbar border-0 rounded ql-toolbar ql-snow">
									<div class="d-flex justify-content-end">
										<span class="ql-formats me-0">
											<button class="ql-bold" type="button">
												<svg viewBox="0 0 18 18"> <path class="ql-stroke"
														d="M5,4H9.5A2.5,2.5,0,0,1,12,6.5v0A2.5,2.5,0,0,1,9.5,9H5A0,0,0,0,1,5,9V4A0,0,0,0,1,5,4Z"></path> <path
														class="ql-stroke"
														d="M5,9h5.5A2.5,2.5,0,0,1,13,11.5v0A2.5,2.5,0,0,1,10.5,14H5a0,0,0,0,1,0,0V9A0,0,0,0,1,5,9Z"></path> </svg>
											</button>
											<button class="ql-italic" type="button">
												<svg viewBox="0 0 18 18"> <line class="ql-stroke"
														x1="7" x2="13" y1="4" y2="4"></line> <line
														class="ql-stroke" x1="5" x2="11" y1="14" y2="14"></line> <line
														class="ql-stroke" x1="8" x2="10" y1="14" y2="4"></line> </svg>
											</button>
											<button class="ql-underline" type="button">
												<svg viewBox="0 0 18 18"> <path class="ql-stroke"
														d="M5,3V9a4.012,4.012,0,0,0,4,4H9a4.012,4.012,0,0,0,4-4V3"></path> <rect
														class="ql-fill" height="1" rx="0.5" ry="0.5" width="12"
														x="3" y="15"></rect> </svg>
											</button>
											<button class="ql-list" value="ordered" type="button">
												<svg viewBox="0 0 18 18"> <line class="ql-stroke"
														x1="7" x2="15" y1="4" y2="4"></line> <line
														class="ql-stroke" x1="7" x2="15" y1="9" y2="9"></line> <line
														class="ql-stroke" x1="7" x2="15" y1="14" y2="14"></line> <line
														class="ql-stroke ql-thin" x1="2.5" x2="4.5" y1="5.5"
														y2="5.5"></line> <path class="ql-fill"
														d="M3.5,6A0.5,0.5,0,0,1,3,5.5V3.085l-0.276.138A0.5,0.5,0,0,1,2.053,3c-0.124-.247-0.023-0.324.224-0.447l1-.5A0.5,0.5,0,0,1,4,2.5v3A0.5,0.5,0,0,1,3.5,6Z"></path> <path
														class="ql-stroke ql-thin"
														d="M4.5,10.5h-2c0-.234,1.85-1.076,1.85-2.234A0.959,0.959,0,0,0,2.5,8.156"></path> <path
														class="ql-stroke ql-thin"
														d="M2.5,14.846a0.959,0.959,0,0,0,1.85-.109A0.7,0.7,0,0,0,3.75,14a0.688,0.688,0,0,0,.6-0.736,0.959,0.959,0,0,0-1.85-.109"></path> </svg>
											</button>
											<button class="ql-list" value="bullet" type="button">
												<svg viewBox="0 0 18 18"> <line class="ql-stroke"
														x1="6" x2="15" y1="4" y2="4"></line> <line
														class="ql-stroke" x1="6" x2="15" y1="9" y2="9"></line> <line
														class="ql-stroke" x1="6" x2="15" y1="14" y2="14"></line> <line
														class="ql-stroke" x1="3" x2="3" y1="4" y2="4"></line> <line
														class="ql-stroke" x1="3" x2="3" y1="9" y2="9"></line> <line
														class="ql-stroke" x1="3" x2="3" y1="14" y2="14"></line> </svg>
											</button>
											<button class="ql-link" type="button">
												<svg viewBox="0 0 18 18"> <line class="ql-stroke"
														x1="7" x2="11" y1="7" y2="11"></line> <path
														class="ql-even ql-stroke"
														d="M8.9,4.577a3.476,3.476,0,0,1,.36,4.679A3.476,3.476,0,0,1,4.577,8.9C3.185,7.5,2.035,6.4,4.217,4.217S7.5,3.185,8.9,4.577Z"></path> <path
														class="ql-even ql-stroke"
														d="M13.423,9.1a3.476,3.476,0,0,0-4.679-.36,3.476,3.476,0,0,0,.36,4.679c1.392,1.392,2.5,2.542,4.679.36S14.815,10.5,13.423,9.1Z"></path> </svg>
											</button>
											<button class="ql-image" type="button">
												<svg viewBox="0 0 18 18"> <rect class="ql-stroke"
														height="10" width="12" x="3" y="4"></rect> <circle
														class="ql-fill" cx="6" cy="7" r="1"></circle> <polyline
														class="ql-even ql-fill"
														points="5 12 5 11 7 9 8 10 11 7 13 9 13 12 5 12"></polyline> </svg>
											</button>
										</span>
									</div>
								</div>
							</div>

						</div>
						<!-- Status -->
						<div class="mb-4 ecommerce-select2-dropdown" data-select2-id="7">
							<label class="form-label">Select category status</label>
							<div class="position-relative" data-select2-id="6">
								<select id="ecommerce-category-status"
									class="select2 form-select select2-hidden-accessible"
									data-placeholder="Select category status"
									data-select2-id="ecommerce-category-status" tabindex="-1"
									aria-hidden="true">
									<option value="" data-select2-id="4">Select category
										status</option>
									<option value="Scheduled" data-select2-id="9">Scheduled</option>
									<option value="Publish" data-select2-id="10">Publish</option>
									<option value="Inactive" data-select2-id="11">Inactive</option>
								</select><span
									class="select2 select2-container select2-container--default select2-container--below"
									dir="ltr" data-select2-id="3" style="width: 352px;"><span
									class="selection"><span
										class="select2-selection select2-selection--single"
										role="combobox" aria-haspopup="true" aria-expanded="false"
										tabindex="0" aria-disabled="false"
										aria-labelledby="select2-ecommerce-category-status-container"><span
											class="select2-selection__rendered"
											id="select2-ecommerce-category-status-container"
											role="textbox" aria-readonly="true"><span
												class="select2-selection__placeholder">Select
													category status</span></span><span class="select2-selection__arrow"
											role="presentation"><b role="presentation"></b></span></span></span><span
									class="dropdown-wrapper" aria-hidden="true"></span></span>
							</div>
						</div>
						<!-- Submit and reset -->
						<div class="mb-3">
							<button type="submit"
								class="btn btn-primary me-sm-3 me-1 data-submit">Add</button>
							<button type="reset" class="btn bg-label-danger"
								data-bs-dismiss="offcanvas">Discard</button>
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