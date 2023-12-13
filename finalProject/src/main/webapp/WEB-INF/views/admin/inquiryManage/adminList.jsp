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
					class='bx bx-globe bx-sm'></i>
			</a>
				<ul class="dropdown-menu dropdown-menu-end">
					<li><a class="dropdown-item" href="javascript:void(0);"
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
					class='bx bx-grid-alt bx-sm'></i>
			</a>
				<div class="dropdown-menu dropdown-menu-end py-0">
					<div class="dropdown-menu-header border-bottom">
						<div class="dropdown-header d-flex align-items-center py-3">
							<h5 class="text-body mb-0 me-auto">Shortcuts</h5>
							<a href="javascript:void(0)"
								class="dropdown-shortcuts-add text-body"
								data-bs-toggle="tooltip" data-bs-placement="top"
								title="Add shortcuts"><i class="bx bx-sm bx-plus-circle"></i></a>
						</div>
					</div>
					<div class="dropdown-shortcuts-list scrollable-container">
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
									class="text-muted mb-0">FAQs & Articles</small>
							</div>
							<div class="dropdown-shortcuts-item col">
								<span
									class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
									<i class="bx bx-window-open fs-4"></i>
								</span> <a href="modal-examples.html" class="stretched-link">Modals</a>
								<small class="text-muted mb-0">Useful Popups</small>
							</div>
						</div>
					</div>
				</div>
			</li>
			<!-- Quick links -->


			<!-- Style Switcher -->
			<li class="nav-item dropdown-style-switcher dropdown me-2 me-xl-0">
				<a class="nav-link dropdown-toggle hide-arrow"
				href="javascript:void(0);" data-bs-toggle="dropdown"> <i
					class='bx bx-sm'></i>
			</a>
				<ul class="dropdown-menu dropdown-menu-end dropdown-styles">
					<li><a class="dropdown-item" href="javascript:void(0);"
						data-theme="light"> <span class="align-middle"><i
								class='bx bx-sun me-2'></i>Light</span>
					</a></li>
					<li><a class="dropdown-item" href="javascript:void(0);"
						data-theme="dark"> <span class="align-middle"><i
								class="bx bx-moon me-2"></i>Dark</span>
					</a></li>
					<li><a class="dropdown-item" href="javascript:void(0);"
						data-theme="system"> <span class="align-middle"><i
								class="bx bx-desktop me-2"></i>System</span>
					</a></li>
				</ul>
			</li>
			<!-- / Style Switcher-->


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
								title="Mark all as read"><i class="bx fs-4 bx-envelope-open"></i></a>
						</div>
					</li>
					<li class="dropdown-notifications-list scrollable-container">
						<ul class="list-group list-group-flush">
							<li
								class="list-group-item list-group-item-action dropdown-notifications-item">
								<div class="d-flex">
									<div class="flex-shrink-0 me-3">
										<div class="avatar">
											<img src="../../assets/img/avatars/1.png" alt
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
											<img src="../../assets/img/avatars/2.png" alt
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
											<img src="../../assets/img/avatars/9.png" alt
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
											<img src="../../assets/img/avatars/5.png" alt
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
											<img src="../../assets/img/avatars/6.png" alt
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
						<img src="../../assets/img/avatars/1.png" alt
							class="w-px-40 h-auto rounded-circle">
					</div>
			</a>
				<ul class="dropdown-menu dropdown-menu-end">
					<li><a class="dropdown-item"
						href="pages-account-settings-account.html">
							<div class="d-flex">
								<div class="flex-shrink-0 me-3">
									<div class="avatar avatar-online">
										<img src="../../assets/img/avatars/1.png" alt
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


	<!-- Search Small Screens -->
	<div class="navbar-search-wrapper search-input-wrapper  d-none">
		<input type="text"
			class="form-control search-input container-xxl border-0"
			placeholder="Search..." aria-label="Search..."> <i
			class="bx bx-x bx-sm search-toggler cursor-pointer"></i>
	</div>


</nav>



<!-- / Navbar -->



<!-- Content wrapper -->
<div class="content-wrapper">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">


		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">Invoice /</span> List
		</h4>

		<!-- Invoice List Widget -->
		<div class="card mb-4">
			<div class="card-widget-separator-wrapper">
				<div class="card-body card-widget-separator">
					<div class="row gy-4 gy-sm-1">
						<div class="col-sm-6 col-lg-3">
							<div
								class="d-flex justify-content-between align-items-start card-widget-1 border-end pb-3 pb-sm-0">
								<div>
									<h3 class="mb-1">24</h3>
									<p class="mb-0">Clients</p>
								</div>
								<div class="avatar me-sm-4">
									<span class="avatar-initial rounded bg-label-secondary">
										<i class="bx bx-user bx-sm"></i>
									</span>
								</div>
							</div>
							<hr class="d-none d-sm-block d-lg-none me-4">
						</div>
						<div class="col-sm-6 col-lg-3">
							<div
								class="d-flex justify-content-between align-items-start card-widget-2 border-end pb-3 pb-sm-0">
								<div>
									<h3 class="mb-1">165</h3>
									<p class="mb-0">Invoices</p>
								</div>
								<div class="avatar me-lg-4">
									<span class="avatar-initial rounded bg-label-secondary">
										<i class="bx bx-file bx-sm"></i>
									</span>
								</div>
							</div>
							<hr class="d-none d-sm-block d-lg-none">
						</div>
						<div class="col-sm-6 col-lg-3">
							<div
								class="d-flex justify-content-between align-items-start border-end pb-3 pb-sm-0 card-widget-3">
								<div>
									<h3 class="mb-1">$2.46k</h3>
									<p class="mb-0">Paid</p>
								</div>
								<div class="avatar me-sm-4">
									<span class="avatar-initial rounded bg-label-secondary">
										<i class="bx bx-check-double bx-sm"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-lg-3">
							<div class="d-flex justify-content-between align-items-start">
								<div>
									<h3 class="mb-1">$876</h3>
									<p class="mb-0">Unpaid</p>
								</div>
								<div class="avatar">
									<span class="avatar-initial rounded bg-label-secondary">
										<i class="bx bx-error-circle bx-sm"></i>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Invoice List Table -->
		<div class="card">
			<div class="card-datatable table-responsive">
				<div id="DataTables_Table_0_wrapper"
					class="dataTables_wrapper dt-bootstrap5 no-footer">
					<div class="row mx-1">
						<div
							class="col-12 col-md-6 d-flex align-items-center justify-content-center justify-content-md-start gap-3">
							<div class="dataTables_length" id="DataTables_Table_0_length">
								<label><select name="DataTables_Table_0_length"
									aria-controls="DataTables_Table_0" class="form-select"><option
											value="10">10</option>
										<option value="25">25</option>
										<option value="50">50</option>
										<option value="100">100</option></select></label>
							</div>
							<div
								class="dt-action-buttons text-xl-end text-lg-start text-md-end text-start mt-md-0 mt-3">
								<div class="dt-buttons">
									<button class="dt-button btn btn-primary" tabindex="0"
										aria-controls="DataTables_Table_0" type="button">
										<span><i class="bx bx-plus me-md-1"></i><span
											class="d-md-inline-block d-none">Create Invoice</span></span>
									</button>
								</div>
							</div>
						</div>
						<div
							class="col-12 col-md-6 d-flex align-items-center justify-content-end flex-column flex-md-row pe-3 gap-md-3">
							<div id="DataTables_Table_0_filter" class="dataTables_filter">
								<label><input type="search" class="form-control"
									placeholder="Search Invoice" aria-controls="DataTables_Table_0"></label>
							</div>
							<div class="invoice_status mb-3 mb-md-0">
								<select id="UserRole" class="form-select"><option
										value="">Select Status</option>
									<option value="Downloaded" class="text-capitalize">Downloaded</option>
									<option value="Draft" class="text-capitalize">Draft</option>
									<option value="Paid" class="text-capitalize">Paid</option>
									<option value="Partial Payment" class="text-capitalize">Partial
										Payment</option>
									<option value="Past Due" class="text-capitalize">Past
										Due</option>
									<option value="Sent" class="text-capitalize">Sent</option></select>
							</div>
						</div>
					</div>
					<table
						class="invoice-list-table table border-top dataTable no-footer dtr-column"
						id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info"
						style="width: 1392px;">
						<thead>
							<tr>
								<th class="control sorting dtr-hidden" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 0px; display: none;"
									aria-label=": activate to sort column ascending"></th>
								<th class="sorting sorting_desc" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 106px;"
									aria-label="#ID: activate to sort column ascending"
									aria-sort="descending">#ID</th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 77px;"
									aria-label=": activate to sort column ascending"><i
									class="bx bx-trending-up"></i></th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 384px;"
									aria-label="Client: activate to sort column ascending">Client</th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 110px;"
									aria-label="Total: activate to sort column ascending">Total</th>
								<th class="text-truncate sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 190px;"
									aria-label="Issued Date: activate to sort column ascending">Issued
									Date</th>
								<th class="sorting_disabled" rowspan="1" colspan="1"
									style="width: 143px;" aria-label="Balance">Balance</th>
								<th class="cell-fit sorting_disabled" rowspan="1" colspan="1"
									style="width: 76px;" aria-label="Actions">Actions</th>
							</tr>
						</thead>
						<tbody>
							<tr class="odd">
								<td class="control dtr-hidden" tabindex="0"
									style="display: none;"></td>
								<td class="sorting_1"><a href="app-invoice-preview.html"><span
										class="fw-medium">#5089</span></a></td>
								<td><span data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="<span>Sent<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 05/09/2020</span>"
									data-bs-original-title="<span>Sent<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 05/09/2020</span>"><span
										class="badge badge-center rounded-pill bg-label-secondary w-px-30 h-px-30"><i
											class="bx bx-paper-plane bx-xs"></i></span></span></td>
								<td><div
										class="d-flex justify-content-start align-items-center">
										<div class="avatar-wrapper">
											<div class="avatar avatar-sm me-2">
												<span class="avatar-initial rounded-circle bg-label-dark">JK</span>
											</div>
										</div>
										<div class="d-flex flex-column">
											<a href="pages-profile-user.html"
												class="text-body text-truncate"><span class="fw-medium">Jamal
													Kerrod</span></a><small class="text-truncate text-muted">Software
												Development</small>
										</div>
									</div></td>
								<td><span class="d-none">3077</span>$3077</td>
								<td><span class="d-none">20200509</span>09 May 2020</td>
								<td><span class="badge bg-label-success"> Paid </span></td>
								<td class="" style=""><div
										class="d-flex align-items-center">
										<a href="javascript:;" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Send Mail" data-bs-original-title="Send Mail"><i
											class="bx bx-send mx-1"></i></a><a
											href="app-invoice-preview.html" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Preview Invoice"
											data-bs-original-title="Preview Invoice"><i
											class="bx bx-show mx-1"></i></a>
										<div class="dropdown">
											<a href="javascript:;"
												class="btn dropdown-toggle hide-arrow text-body p-0"
												data-bs-toggle="dropdown"><i
												class="bx bx-dots-vertical-rounded"></i></a>
											<div class="dropdown-menu dropdown-menu-end">
												<a href="javascript:;" class="dropdown-item">Download</a><a
													href="app-invoice-edit.html" class="dropdown-item">Edit</a><a
													href="javascript:;" class="dropdown-item">Duplicate</a>
												<div class="dropdown-divider"></div>
												<a href="javascript:;"
													class="dropdown-item delete-record text-danger">Delete</a>
											</div>
										</div>
									</div></td>
							</tr>
							<tr class="even">
								<td class="control dtr-hidden" tabindex="0"
									style="display: none;"></td>
								<td class="sorting_1"><a href="app-invoice-preview.html"><span
										class="fw-medium">#5041</span></a></td>
								<td><span data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="<span>Sent<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 11/19/2020</span>"
									data-bs-original-title="<span>Sent<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 11/19/2020</span>"><span
										class="badge badge-center rounded-pill bg-label-secondary w-px-30 h-px-30"><i
											class="bx bx-paper-plane bx-xs"></i></span></span></td>
								<td><div
										class="d-flex justify-content-start align-items-center">
										<div class="avatar-wrapper">
											<div class="avatar avatar-sm me-2">
												<img src="../../assets/img/avatars/2.png" alt="Avatar"
													class="rounded-circle">
											</div>
										</div>
										<div class="d-flex flex-column">
											<a href="pages-profile-user.html"
												class="text-body text-truncate"><span class="fw-medium">Shamus
													Tuttle</span></a><small class="text-truncate text-muted">Software
												Development</small>
										</div>
									</div></td>
								<td><span class="d-none">2230</span>$2230</td>
								<td><span class="d-none">20201119</span>19 Nov 2020</td>
								<td><span class="badge bg-label-success"> Paid </span></td>
								<td class="" style=""><div
										class="d-flex align-items-center">
										<a href="javascript:;" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Send Mail" data-bs-original-title="Send Mail"><i
											class="bx bx-send mx-1"></i></a><a
											href="app-invoice-preview.html" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Preview Invoice"
											data-bs-original-title="Preview Invoice"><i
											class="bx bx-show mx-1"></i></a>
										<div class="dropdown">
											<a href="javascript:;"
												class="btn dropdown-toggle hide-arrow text-body p-0"
												data-bs-toggle="dropdown"><i
												class="bx bx-dots-vertical-rounded"></i></a>
											<div class="dropdown-menu dropdown-menu-end">
												<a href="javascript:;" class="dropdown-item">Download</a><a
													href="app-invoice-edit.html" class="dropdown-item">Edit</a><a
													href="javascript:;" class="dropdown-item">Duplicate</a>
												<div class="dropdown-divider"></div>
												<a href="javascript:;"
													class="dropdown-item delete-record text-danger">Delete</a>
											</div>
										</div>
									</div></td>
							</tr>
							<tr class="odd">
								<td class="control dtr-hidden" tabindex="0"
									style="display: none;"></td>
								<td class="sorting_1"><a href="app-invoice-preview.html"><span
										class="fw-medium">#5027</span></a></td>
								<td><span data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="<span>Partial Payment<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 09/25/2020</span>"
									data-bs-original-title="<span>Partial Payment<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 09/25/2020</span>"><span
										class="badge badge-center rounded-pill bg-label-success w-px-30 h-px-30"><i
											class="bx bx-adjust bx-xs"></i></span></span></td>
								<td><div
										class="d-flex justify-content-start align-items-center">
										<div class="avatar-wrapper">
											<div class="avatar avatar-sm me-2">
												<img src="../../assets/img/avatars/2.png" alt="Avatar"
													class="rounded-circle">
											</div>
										</div>
										<div class="d-flex flex-column">
											<a href="pages-profile-user.html"
												class="text-body text-truncate"><span class="fw-medium">Devonne
													Wallbridge</span></a><small class="text-truncate text-muted">Software
												Development</small>
										</div>
									</div></td>
								<td><span class="d-none">2787</span>$2787</td>
								<td><span class="d-none">20200925</span>25 Sep 2020</td>
								<td><span class="badge bg-label-success"> Paid </span></td>
								<td class="" style=""><div
										class="d-flex align-items-center">
										<a href="javascript:;" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Send Mail" data-bs-original-title="Send Mail"><i
											class="bx bx-send mx-1"></i></a><a
											href="app-invoice-preview.html" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Preview Invoice"
											data-bs-original-title="Preview Invoice"><i
											class="bx bx-show mx-1"></i></a>
										<div class="dropdown">
											<a href="javascript:;"
												class="btn dropdown-toggle hide-arrow text-body p-0"
												data-bs-toggle="dropdown"><i
												class="bx bx-dots-vertical-rounded"></i></a>
											<div class="dropdown-menu dropdown-menu-end">
												<a href="javascript:;" class="dropdown-item">Download</a><a
													href="app-invoice-edit.html" class="dropdown-item">Edit</a><a
													href="javascript:;" class="dropdown-item">Duplicate</a>
												<div class="dropdown-divider"></div>
												<a href="javascript:;"
													class="dropdown-item delete-record text-danger">Delete</a>
											</div>
										</div>
									</div></td>
							</tr>
							<tr class="even">
								<td class="control dtr-hidden" tabindex="0"
									style="display: none;"></td>
								<td class="sorting_1"><a href="app-invoice-preview.html"><span
										class="fw-medium">#5024</span></a></td>
								<td><span data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="<span>Partial Payment<br> <span class=&quot;fw-medium&quot;>Balance:</span> -$202<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 08/02/2020</span>"
									data-bs-original-title="<span>Partial Payment<br> <span class=&quot;fw-medium&quot;>Balance:</span> -$202<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 08/02/2020</span>"><span
										class="badge badge-center rounded-pill bg-label-success w-px-30 h-px-30"><i
											class="bx bx-adjust bx-xs"></i></span></span></td>
								<td><div
										class="d-flex justify-content-start align-items-center">
										<div class="avatar-wrapper">
											<div class="avatar avatar-sm me-2">
												<img src="../../assets/img/avatars/9.png" alt="Avatar"
													class="rounded-circle">
											</div>
										</div>
										<div class="d-flex flex-column">
											<a href="pages-profile-user.html"
												class="text-body text-truncate"><span class="fw-medium">Ariella
													Filippyev</span></a><small class="text-truncate text-muted">Unlimited
												Extended License</small>
										</div>
									</div></td>
								<td><span class="d-none">5285</span>$5285</td>
								<td><span class="d-none">20200802</span>02 Aug 2020</td>
								<td><span class="d-none">-$202</span>-$202</td>
								<td class="" style=""><div
										class="d-flex align-items-center">
										<a href="javascript:;" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Send Mail" data-bs-original-title="Send Mail"><i
											class="bx bx-send mx-1"></i></a><a
											href="app-invoice-preview.html" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Preview Invoice"
											data-bs-original-title="Preview Invoice"><i
											class="bx bx-show mx-1"></i></a>
										<div class="dropdown">
											<a href="javascript:;"
												class="btn dropdown-toggle hide-arrow text-body p-0"
												data-bs-toggle="dropdown"><i
												class="bx bx-dots-vertical-rounded"></i></a>
											<div class="dropdown-menu dropdown-menu-end">
												<a href="javascript:;" class="dropdown-item">Download</a><a
													href="app-invoice-edit.html" class="dropdown-item">Edit</a><a
													href="javascript:;" class="dropdown-item">Duplicate</a>
												<div class="dropdown-divider"></div>
												<a href="javascript:;"
													class="dropdown-item delete-record text-danger">Delete</a>
											</div>
										</div>
									</div></td>
							</tr>
							<tr class="odd">
								<td class="control dtr-hidden" tabindex="0"
									style="display: none;"></td>
								<td class="sorting_1"><a href="app-invoice-preview.html"><span
										class="fw-medium">#5020</span></a></td>
								<td><span data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="<span>Downloaded<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 12/15/2020</span>"
									data-bs-original-title="<span>Downloaded<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 12/15/2020</span>"><span
										class="badge badge-center rounded-pill bg-label-info w-px-30 h-px-30"><i
											class="bx bx-down-arrow-circle bx-xs"></i></span></span></td>
								<td><div
										class="d-flex justify-content-start align-items-center">
										<div class="avatar-wrapper">
											<div class="avatar avatar-sm me-2">
												<img src="../../assets/img/avatars/11.png" alt="Avatar"
													class="rounded-circle">
											</div>
										</div>
										<div class="d-flex flex-column">
											<a href="pages-profile-user.html"
												class="text-body text-truncate"><span class="fw-medium">Roy
													Southerell</span></a><small class="text-truncate text-muted">UI/UX
												Design &amp; Development</small>
										</div>
									</div></td>
								<td><span class="d-none">5219</span>$5219</td>
								<td><span class="d-none">20201215</span>15 Dec 2020</td>
								<td><span class="badge bg-label-success"> Paid </span></td>
								<td class="" style=""><div
										class="d-flex align-items-center">
										<a href="javascript:;" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Send Mail" data-bs-original-title="Send Mail"><i
											class="bx bx-send mx-1"></i></a><a
											href="app-invoice-preview.html" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Preview Invoice"
											data-bs-original-title="Preview Invoice"><i
											class="bx bx-show mx-1"></i></a>
										<div class="dropdown">
											<a href="javascript:;"
												class="btn dropdown-toggle hide-arrow text-body p-0"
												data-bs-toggle="dropdown"><i
												class="bx bx-dots-vertical-rounded"></i></a>
											<div class="dropdown-menu dropdown-menu-end">
												<a href="javascript:;" class="dropdown-item">Download</a><a
													href="app-invoice-edit.html" class="dropdown-item">Edit</a><a
													href="javascript:;" class="dropdown-item">Duplicate</a>
												<div class="dropdown-divider"></div>
												<a href="javascript:;"
													class="dropdown-item delete-record text-danger">Delete</a>
											</div>
										</div>
									</div></td>
							</tr>
							<tr class="even">
								<td class="control dtr-hidden" tabindex="0"
									style="display: none;"></td>
								<td class="sorting_1"><a href="app-invoice-preview.html"><span
										class="fw-medium">#4995</span></a></td>
								<td><span data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="<span>Partial Payment<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 06/09/2020</span>"
									data-bs-original-title="<span>Partial Payment<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 06/09/2020</span>"><span
										class="badge badge-center rounded-pill bg-label-success w-px-30 h-px-30"><i
											class="bx bx-adjust bx-xs"></i></span></span></td>
								<td><div
										class="d-flex justify-content-start align-items-center">
										<div class="avatar-wrapper">
											<div class="avatar avatar-sm me-2">
												<img src="../../assets/img/avatars/1.png" alt="Avatar"
													class="rounded-circle">
											</div>
										</div>
										<div class="d-flex flex-column">
											<a href="pages-profile-user.html"
												class="text-body text-truncate"><span class="fw-medium">Raynell
													Clendennen</span></a><small class="text-truncate text-muted">Template
												Customization</small>
										</div>
									</div></td>
								<td><span class="d-none">3313</span>$3313</td>
								<td><span class="d-none">20200609</span>09 Jun 2020</td>
								<td><span class="badge bg-label-success"> Paid </span></td>
								<td class="" style=""><div
										class="d-flex align-items-center">
										<a href="javascript:;" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Send Mail" data-bs-original-title="Send Mail"><i
											class="bx bx-send mx-1"></i></a><a
											href="app-invoice-preview.html" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Preview Invoice"
											data-bs-original-title="Preview Invoice"><i
											class="bx bx-show mx-1"></i></a>
										<div class="dropdown">
											<a href="javascript:;"
												class="btn dropdown-toggle hide-arrow text-body p-0"
												data-bs-toggle="dropdown"><i
												class="bx bx-dots-vertical-rounded"></i></a>
											<div class="dropdown-menu dropdown-menu-end">
												<a href="javascript:;" class="dropdown-item">Download</a><a
													href="app-invoice-edit.html" class="dropdown-item">Edit</a><a
													href="javascript:;" class="dropdown-item">Duplicate</a>
												<div class="dropdown-divider"></div>
												<a href="javascript:;"
													class="dropdown-item delete-record text-danger">Delete</a>
											</div>
										</div>
									</div></td>
							</tr>
							<tr class="odd">
								<td class="control dtr-hidden" tabindex="0"
									style="display: none;"></td>
								<td class="sorting_1"><a href="app-invoice-preview.html"><span
										class="fw-medium">#4993</span></a></td>
								<td><span data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="<span>Partial Payment<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 10/22/2020</span>"
									data-bs-original-title="<span>Partial Payment<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 10/22/2020</span>"><span
										class="badge badge-center rounded-pill bg-label-success w-px-30 h-px-30"><i
											class="bx bx-adjust bx-xs"></i></span></span></td>
								<td><div
										class="d-flex justify-content-start align-items-center">
										<div class="avatar-wrapper">
											<div class="avatar avatar-sm me-2">
												<span class="avatar-initial rounded-circle bg-label-primary">LA</span>
											</div>
										</div>
										<div class="d-flex flex-column">
											<a href="pages-profile-user.html"
												class="text-body text-truncate"><span class="fw-medium">Lutero
													Aloshechkin</span></a><small class="text-truncate text-muted">Unlimited
												Extended License</small>
										</div>
									</div></td>
								<td><span class="d-none">4836</span>$4836</td>
								<td><span class="d-none">20201022</span>22 Oct 2020</td>
								<td><span class="badge bg-label-success"> Paid </span></td>
								<td class="" style=""><div
										class="d-flex align-items-center">
										<a href="javascript:;" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Send Mail" data-bs-original-title="Send Mail"><i
											class="bx bx-send mx-1"></i></a><a
											href="app-invoice-preview.html" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Preview Invoice"
											data-bs-original-title="Preview Invoice"><i
											class="bx bx-show mx-1"></i></a>
										<div class="dropdown">
											<a href="javascript:;"
												class="btn dropdown-toggle hide-arrow text-body p-0"
												data-bs-toggle="dropdown"><i
												class="bx bx-dots-vertical-rounded"></i></a>
											<div class="dropdown-menu dropdown-menu-end">
												<a href="javascript:;" class="dropdown-item">Download</a><a
													href="app-invoice-edit.html" class="dropdown-item">Edit</a><a
													href="javascript:;" class="dropdown-item">Duplicate</a>
												<div class="dropdown-divider"></div>
												<a href="javascript:;"
													class="dropdown-item delete-record text-danger">Delete</a>
											</div>
										</div>
									</div></td>
							</tr>
							<tr class="even">
								<td class="control dtr-hidden" tabindex="0"
									style="display: none;"></td>
								<td class="sorting_1"><a href="app-invoice-preview.html"><span
										class="fw-medium">#4989</span></a></td>
								<td><span data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="<span>Past Due<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 08/01/2020</span>"
									data-bs-original-title="<span>Past Due<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 08/01/2020</span>"><span
										class="badge badge-center rounded-pill bg-label-danger w-px-30 h-px-30"><i
											class="bx bx-info-circle bx-xs"></i></span></span></td>
								<td><div
										class="d-flex justify-content-start align-items-center">
										<div class="avatar-wrapper">
											<div class="avatar avatar-sm me-2">
												<span class="avatar-initial rounded-circle bg-label-success">OG</span>
											</div>
										</div>
										<div class="d-flex flex-column">
											<a href="pages-profile-user.html"
												class="text-body text-truncate"><span class="fw-medium">Orson
													Grafton</span></a><small class="text-truncate text-muted">Unlimited
												Extended License</small>
										</div>
									</div></td>
								<td><span class="d-none">5293</span>$5293</td>
								<td><span class="d-none">20200801</span>01 Aug 2020</td>
								<td><span class="badge bg-label-success"> Paid </span></td>
								<td class="" style=""><div
										class="d-flex align-items-center">
										<a href="javascript:;" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Send Mail" data-bs-original-title="Send Mail"><i
											class="bx bx-send mx-1"></i></a><a
											href="app-invoice-preview.html" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Preview Invoice"
											data-bs-original-title="Preview Invoice"><i
											class="bx bx-show mx-1"></i></a>
										<div class="dropdown">
											<a href="javascript:;"
												class="btn dropdown-toggle hide-arrow text-body p-0"
												data-bs-toggle="dropdown"><i
												class="bx bx-dots-vertical-rounded"></i></a>
											<div class="dropdown-menu dropdown-menu-end">
												<a href="javascript:;" class="dropdown-item">Download</a><a
													href="app-invoice-edit.html" class="dropdown-item">Edit</a><a
													href="javascript:;" class="dropdown-item">Duplicate</a>
												<div class="dropdown-divider"></div>
												<a href="javascript:;"
													class="dropdown-item delete-record text-danger">Delete</a>
											</div>
										</div>
									</div></td>
							</tr>
							<tr class="odd">
								<td class="control dtr-hidden" tabindex="0"
									style="display: none;"></td>
								<td class="sorting_1"><a href="app-invoice-preview.html"><span
										class="fw-medium">#4989</span></a></td>
								<td><span data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="<span>Downloaded<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 09/23/2020</span>"
									data-bs-original-title="<span>Downloaded<br> <span class=&quot;fw-medium&quot;>Balance:</span> 0<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 09/23/2020</span>"><span
										class="badge badge-center rounded-pill bg-label-info w-px-30 h-px-30"><i
											class="bx bx-down-arrow-circle bx-xs"></i></span></span></td>
								<td><div
										class="d-flex justify-content-start align-items-center">
										<div class="avatar-wrapper">
											<div class="avatar avatar-sm me-2">
												<span class="avatar-initial rounded-circle bg-label-dark">LH</span>
											</div>
										</div>
										<div class="d-flex flex-column">
											<a href="pages-profile-user.html"
												class="text-body text-truncate"><span class="fw-medium">Lorine
													Hischke</span></a><small class="text-truncate text-muted">Unlimited
												Extended License</small>
										</div>
									</div></td>
								<td><span class="d-none">3623</span>$3623</td>
								<td><span class="d-none">20200923</span>23 Sep 2020</td>
								<td><span class="badge bg-label-success"> Paid </span></td>
								<td class="" style=""><div
										class="d-flex align-items-center">
										<a href="javascript:;" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Send Mail" data-bs-original-title="Send Mail"><i
											class="bx bx-send mx-1"></i></a><a
											href="app-invoice-preview.html" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Preview Invoice"
											data-bs-original-title="Preview Invoice"><i
											class="bx bx-show mx-1"></i></a>
										<div class="dropdown">
											<a href="javascript:;"
												class="btn dropdown-toggle hide-arrow text-body p-0"
												data-bs-toggle="dropdown"><i
												class="bx bx-dots-vertical-rounded"></i></a>
											<div class="dropdown-menu dropdown-menu-end">
												<a href="javascript:;" class="dropdown-item">Download</a><a
													href="app-invoice-edit.html" class="dropdown-item">Edit</a><a
													href="javascript:;" class="dropdown-item">Duplicate</a>
												<div class="dropdown-divider"></div>
												<a href="javascript:;"
													class="dropdown-item delete-record text-danger">Delete</a>
											</div>
										</div>
									</div></td>
							</tr>
							<tr class="even">
								<td class="control dtr-hidden" tabindex="0"
									style="display: none;"></td>
								<td class="sorting_1"><a href="app-invoice-preview.html"><span
										class="fw-medium">#4965</span></a></td>
								<td><span data-bs-toggle="tooltip" data-bs-html="true"
									aria-label="<span>Partial Payment<br> <span class=&quot;fw-medium&quot;>Balance:</span> $666<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 03/18/2021</span>"
									data-bs-original-title="<span>Partial Payment<br> <span class=&quot;fw-medium&quot;>Balance:</span> $666<br> <span class=&quot;fw-medium&quot;>Due Date:</span> 03/18/2021</span>"><span
										class="badge badge-center rounded-pill bg-label-success w-px-30 h-px-30"><i
											class="bx bx-adjust bx-xs"></i></span></span></td>
								<td><div
										class="d-flex justify-content-start align-items-center">
										<div class="avatar-wrapper">
											<div class="avatar avatar-sm me-2">
												<img src="../../assets/img/avatars/2.png" alt="Avatar"
													class="rounded-circle">
											</div>
										</div>
										<div class="d-flex flex-column">
											<a href="pages-profile-user.html"
												class="text-body text-truncate"><span class="fw-medium">Yelena
													O'Hear</span></a><small class="text-truncate text-muted">Unlimited
												Extended License</small>
										</div>
									</div></td>
								<td><span class="d-none">3789</span>$3789</td>
								<td><span class="d-none">20210318</span>18 Mar 2021</td>
								<td><span class="d-none">$666</span>$666</td>
								<td class="" style=""><div
										class="d-flex align-items-center">
										<a href="javascript:;" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Send Mail" data-bs-original-title="Send Mail"><i
											class="bx bx-send mx-1"></i></a><a
											href="app-invoice-preview.html" data-bs-toggle="tooltip"
											class="text-body" data-bs-placement="top"
											aria-label="Preview Invoice"
											data-bs-original-title="Preview Invoice"><i
											class="bx bx-show mx-1"></i></a>
										<div class="dropdown">
											<a href="javascript:;"
												class="btn dropdown-toggle hide-arrow text-body p-0"
												data-bs-toggle="dropdown"><i
												class="bx bx-dots-vertical-rounded"></i></a>
											<div class="dropdown-menu dropdown-menu-end">
												<a href="javascript:;" class="dropdown-item">Download</a><a
													href="app-invoice-edit.html" class="dropdown-item">Edit</a><a
													href="javascript:;" class="dropdown-item">Duplicate</a>
												<div class="dropdown-divider"></div>
												<a href="javascript:;"
													class="dropdown-item delete-record text-danger">Delete</a>
											</div>
										</div>
									</div></td>
							</tr>
						</tbody>
					</table>
					<div class="row mx-2">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_info" id="DataTables_Table_0_info"
								role="status" aria-live="polite">Showing 1 to 10 of 50
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
										aria-controls="DataTables_Table_0" role="link" data-dt-idx="1"
										tabindex="0" class="page-link">2</a></li>
									<li class="paginate_button page-item "><a href="#"
										aria-controls="DataTables_Table_0" role="link" data-dt-idx="2"
										tabindex="0" class="page-link">3</a></li>
									<li class="paginate_button page-item "><a href="#"
										aria-controls="DataTables_Table_0" role="link" data-dt-idx="3"
										tabindex="0" class="page-link">4</a></li>
									<li class="paginate_button page-item "><a href="#"
										aria-controls="DataTables_Table_0" role="link" data-dt-idx="4"
										tabindex="0" class="page-link">5</a></li>
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
<!-- Content wrapper -->