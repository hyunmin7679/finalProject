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
			<span class="text-muted fw-light">Logistics /</span> Dashboard
		</h4>

		
			<!-- On route vehicles Table -->
			<div class="col-12 order-5" >
				<div class="card">
					<div
						class="card-header d-flex align-items-center justify-content-between">
						<div class="card-title mb-0">
							<h5 class="m-0 me-2">On route vehicles</h5>
						</div>
						<div class="dropdown">
							<button class="btn p-0" type="button" id="routeVehicles"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="bx bx-dots-vertical-rounded"></i>
							</button>
							<div class="dropdown-menu dropdown-menu-end"
								aria-labelledby="routeVehicles">
								<a class="dropdown-item" href="javascript:void(0);">Select
									All</a> <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
								<a class="dropdown-item" href="javascript:void(0);">Share</a>
							</div>
						</div>
					</div>
					<div class="card-datatable table-responsive">
						<div id="DataTables_Table_0_wrapper"
							class="dataTables_wrapper dt-bootstrap5 no-footer">
							<div class="table-responsive">
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
												aria-sort="ascending">location</th>
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 247px;"
												aria-label="starting route: activate to sort column ascending">starting
												route</th>
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 245px;"
												aria-label="ending route: activate to sort column ascending">ending
												route</th>
											<th class="sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 217px;"
												aria-label="warnings: activate to sort column ascending">warnings</th>
											<th class="w-20 sorting" tabindex="0"
												aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
												style="width: 240px;"
												aria-label="progress: activate to sort column ascending">progress</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd">
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
															href="app-logistics-fleet.html">VOL-159145</a>
													</div>
												</div></td>
											<td><div class="text-body">Paris 19, France</div></td>
											<td><div class="text-body">Dresden, Germany</div></td>
											<td><span class="badge rounded bg-label-success">No
													Warnings</span></td>
											<td><div class="d-flex align-items-center">
													<div div="" class="progress w-100" style="height: 8px;">
														<div class="progress-bar" role="progressbar"
															style="width: 60%;" aria-valuenow="60" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
													<div class="text-body ms-3">60%</div>
												</div></td>
										</tr>
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
										<tr class="odd">
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
															href="app-logistics-fleet.html">VOL-276904</a>
													</div>
												</div></td>
											<td><div class="text-body">Aulnay-sous-Bois,
													France</div></td>
											<td><div class="text-body">Torino, Italy</div></td>
											<td><span class="badge rounded bg-label-warning">Temperature
													Not Optimal</span></td>
											<td><div class="d-flex align-items-center">
													<div div="" class="progress w-100" style="height: 8px;">
														<div class="progress-bar" role="progressbar"
															style="width: 30%;" aria-valuenow="30" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
													<div class="text-body ms-3">30%</div>
												</div></td>
										</tr>
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
															href="app-logistics-fleet.html">VOL-300198</a>
													</div>
												</div></td>
											<td><div class="text-body">West Palm Beach, USA</div></td>
											<td><div class="text-body">Dresden, Germany</div></td>
											<td><span class="badge rounded bg-label-danger">Ecu
													Not Responding</span></td>
											<td><div class="d-flex align-items-center">
													<div div="" class="progress w-100" style="height: 8px;">
														<div class="progress-bar" role="progressbar"
															style="width: 90%;" aria-valuenow="90" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
													<div class="text-body ms-3">90%</div>
												</div></td>
										</tr>
										<tr class="odd">
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
															href="app-logistics-fleet.html">VOL-302781</a>
													</div>
												</div></td>
											<td><div class="text-body">Köln, Germany</div></td>
											<td><div class="text-body">Laspezia, Italy</div></td>
											<td><span class="badge rounded bg-label-info">Oil
													Leakage</span></td>
											<td><div class="d-flex align-items-center">
													<div div="" class="progress w-100" style="height: 8px;">
														<div class="progress-bar" role="progressbar"
															style="width: 24%;" aria-valuenow="24" aria-valuemin="0"
															aria-valuemax="100"></div>
													</div>
													<div class="text-body ms-3">24%</div>
												</div></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row d-flex align-items-center">
								<div class="col-sm-12 col-md-6">
									<div class="dataTables_info pt-0" id="DataTables_Table_0_info"
										role="status" aria-live="polite">Showing 1 to 5 of 25
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