<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
  

  

  

      
      

      
      
      <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0   d-xl-none ">
        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
          <i class="bx bx-menu bx-sm"></i>
        </a>
      </div>
      

      <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">

        

        
        <!-- Search -->
        <div class="navbar-nav align-items-center">
          <div class="nav-item navbar-search-wrapper mb-0">
            <a class="nav-item nav-link search-toggler px-0" href="javascript:void(0);">
              <i class="bx bx-search bx-sm"></i>
              <span class="d-none d-md-inline-block text-muted">Search (Ctrl+/)</span>
            </a>
          </div>
        </div>
        <!-- /Search -->
        


        

        <ul class="navbar-nav flex-row align-items-center ms-auto">
          

          

          <!-- Language -->
          <li class="nav-item dropdown-language dropdown me-2 me-xl-0">
            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
              <i class='bx bx-globe bx-sm'></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li>
                <a class="dropdown-item" href="javascript:void(0);" data-language="en" data-text-direction="ltr">
                  <span class="align-middle">English</span>
                </a>
              </li>
              <li>
                <a class="dropdown-item" href="javascript:void(0);" data-language="fr" data-text-direction="ltr">
                  <span class="align-middle">French</span>
                </a>
              </li>
              <li>
                <a class="dropdown-item" href="javascript:void(0);" data-language="ar" data-text-direction="rtl">
                  <span class="align-middle">Arabic</span>
                </a>
              </li>
              <li>
                <a class="dropdown-item" href="javascript:void(0);" data-language="de" data-text-direction="ltr">
                  <span class="align-middle">German</span>
                </a>
              </li>
            </ul>
          </li>
          <!-- /Language -->

          <!-- Quick links  -->
          <li class="nav-item dropdown-shortcuts navbar-dropdown dropdown me-2 me-xl-0">
            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
              <i class='bx bx-grid-alt bx-sm'></i>
            </a>
            <div class="dropdown-menu dropdown-menu-end py-0">
              <div class="dropdown-menu-header border-bottom">
                <div class="dropdown-header d-flex align-items-center py-3">
                  <h5 class="text-body mb-0 me-auto">Shortcuts</h5>
                  <a href="javascript:void(0)" class="dropdown-shortcuts-add text-body" data-bs-toggle="tooltip" data-bs-placement="top" title="Add shortcuts"><i class="bx bx-sm bx-plus-circle"></i></a>
                </div>
              </div>
              <div class="dropdown-shortcuts-list scrollable-container">
                <div class="row row-bordered overflow-visible g-0">
                  <div class="dropdown-shortcuts-item col">
                    <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                      <i class="bx bx-calendar fs-4"></i>
                    </span>
                    <a href="app-calendar.html" class="stretched-link">Calendar</a>
                    <small class="text-muted mb-0">Appointments</small>
                  </div>
                  <div class="dropdown-shortcuts-item col">
                    <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                      <i class="bx bx-food-menu fs-4"></i>
                    </span>
                    <a href="app-invoice-list.html" class="stretched-link">Invoice App</a>
                    <small class="text-muted mb-0">Manage Accounts</small>
                  </div>
                </div>
                <div class="row row-bordered overflow-visible g-0">
                  <div class="dropdown-shortcuts-item col">
                    <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                      <i class="bx bx-user fs-4"></i>
                    </span>
                    <a href="app-user-list.html" class="stretched-link">User App</a>
                    <small class="text-muted mb-0">Manage Users</small>
                  </div>
                  <div class="dropdown-shortcuts-item col">
                    <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                      <i class="bx bx-check-shield fs-4"></i>
                    </span>
                    <a href="app-access-roles.html" class="stretched-link">Role Management</a>
                    <small class="text-muted mb-0">Permission</small>
                  </div>
                </div>
                <div class="row row-bordered overflow-visible g-0">
                  <div class="dropdown-shortcuts-item col">
                    <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                      <i class="bx bx-pie-chart-alt-2 fs-4"></i>
                    </span>
                    <a href="index.html" class="stretched-link">Dashboard</a>
                    <small class="text-muted mb-0">User Profile</small>
                  </div>
                  <div class="dropdown-shortcuts-item col">
                    <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                      <i class="bx bx-cog fs-4"></i>
                    </span>
                    <a href="pages-account-settings-account.html" class="stretched-link">Setting</a>
                    <small class="text-muted mb-0">Account Settings</small>
                  </div>
                </div>
                <div class="row row-bordered overflow-visible g-0">
                  <div class="dropdown-shortcuts-item col">
                    <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                      <i class="bx bx-help-circle fs-4"></i>
                    </span>
                    <a href="pages-faq.html" class="stretched-link">FAQs</a>
                    <small class="text-muted mb-0">FAQs & Articles</small>
                  </div>
                  <div class="dropdown-shortcuts-item col">
                    <span class="dropdown-shortcuts-icon bg-label-secondary rounded-circle mb-2">
                      <i class="bx bx-window-open fs-4"></i>
                    </span>
                    <a href="modal-examples.html" class="stretched-link">Modals</a>
                    <small class="text-muted mb-0">Useful Popups</small>
                  </div>
                </div>
              </div>
            </div>
          </li>
          <!-- Quick links -->

          
          <!-- Style Switcher -->
          <li class="nav-item dropdown-style-switcher dropdown me-2 me-xl-0">
            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
              <i class='bx bx-sm'></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-end dropdown-styles">
              <li>
                <a class="dropdown-item" href="javascript:void(0);" data-theme="light">
                  <span class="align-middle"><i class='bx bx-sun me-2'></i>Light</span>
                </a>
              </li>
              <li>
                <a class="dropdown-item" href="javascript:void(0);" data-theme="dark">
                  <span class="align-middle"><i class="bx bx-moon me-2"></i>Dark</span>
                </a>
              </li>
              <li>
                <a class="dropdown-item" href="javascript:void(0);" data-theme="system">
                  <span class="align-middle"><i class="bx bx-desktop me-2"></i>System</span>
                </a>
              </li>
            </ul>
          </li>
          <!-- / Style Switcher-->
          

          <!-- Notification -->
          <li class="nav-item dropdown-notifications navbar-dropdown dropdown me-3 me-xl-1">
            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
              <i class="bx bx-bell bx-sm"></i>
              <span class="badge bg-danger rounded-pill badge-notifications">5</span>
            </a>
            <ul class="dropdown-menu dropdown-menu-end py-0">
              <li class="dropdown-menu-header border-bottom">
                <div class="dropdown-header d-flex align-items-center py-3">
                  <h5 class="text-body mb-0 me-auto">Notification</h5>
                  <a href="javascript:void(0)" class="dropdown-notifications-all text-body" data-bs-toggle="tooltip" data-bs-placement="top" title="Mark all as read"><i class="bx fs-4 bx-envelope-open"></i></a>
                </div>
              </li>
              <li class="dropdown-notifications-list scrollable-container">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item list-group-item-action dropdown-notifications-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <div class="avatar">
                          <img src="../../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle">
                        </div>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Congratulation Lettie 🎉</h6>
                        <p class="mb-0">Won the monthly best seller gold badge</p>
                        <small class="text-muted">1h ago</small>
                      </div>
                      <div class="flex-shrink-0 dropdown-notifications-actions">
                        <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
                        <a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="bx bx-x"></span></a>
                      </div>
                    </div>
                  </li>
                  <li class="list-group-item list-group-item-action dropdown-notifications-item">
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
                        <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
                        <a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="bx bx-x"></span></a>
                      </div>
                    </div>
                  </li>
                  <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <div class="avatar">
                          <img src="../../assets/img/avatars/2.png" alt class="w-px-40 h-auto rounded-circle">
                        </div>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">New Message ✉️</h6>
                        <p class="mb-0">You have new message from Natalie</p>
                        <small class="text-muted">1h ago</small>
                      </div>
                      <div class="flex-shrink-0 dropdown-notifications-actions">
                        <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
                        <a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="bx bx-x"></span></a>
                      </div>
                    </div>
                  </li>
                  <li class="list-group-item list-group-item-action dropdown-notifications-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <div class="avatar">
                          <span class="avatar-initial rounded-circle bg-label-success"><i class="bx bx-cart"></i></span>
                        </div>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Whoo! You have new order 🛒 </h6>
                        <p class="mb-0">ACME Inc. made new order $1,154</p>
                        <small class="text-muted">1 day ago</small>
                      </div>
                      <div class="flex-shrink-0 dropdown-notifications-actions">
                        <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
                        <a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="bx bx-x"></span></a>
                      </div>
                    </div>
                  </li>
                  <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <div class="avatar">
                          <img src="../../assets/img/avatars/9.png" alt class="w-px-40 h-auto rounded-circle">
                        </div>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Application has been approved 🚀 </h6>
                        <p class="mb-0">Your ABC project application has been approved.</p>
                        <small class="text-muted">2 days ago</small>
                      </div>
                      <div class="flex-shrink-0 dropdown-notifications-actions">
                        <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
                        <a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="bx bx-x"></span></a>
                      </div>
                    </div>
                  </li>
                  <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <div class="avatar">
                          <span class="avatar-initial rounded-circle bg-label-success"><i class="bx bx-pie-chart-alt"></i></span>
                        </div>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Monthly report is generated</h6>
                        <p class="mb-0">July monthly financial report is generated </p>
                        <small class="text-muted">3 days ago</small>
                      </div>
                      <div class="flex-shrink-0 dropdown-notifications-actions">
                        <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
                        <a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="bx bx-x"></span></a>
                      </div>
                    </div>
                  </li>
                  <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <div class="avatar">
                          <img src="../../assets/img/avatars/5.png" alt class="w-px-40 h-auto rounded-circle">
                        </div>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Send connection request</h6>
                        <p class="mb-0">Peter sent you connection request</p>
                        <small class="text-muted">4 days ago</small>
                      </div>
                      <div class="flex-shrink-0 dropdown-notifications-actions">
                        <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
                        <a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="bx bx-x"></span></a>
                      </div>
                    </div>
                  </li>
                  <li class="list-group-item list-group-item-action dropdown-notifications-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <div class="avatar">
                          <img src="../../assets/img/avatars/6.png" alt class="w-px-40 h-auto rounded-circle">
                        </div>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">New message from Jane</h6>
                        <p class="mb-0">Your have new message from Jane</p>
                        <small class="text-muted">5 days ago</small>
                      </div>
                      <div class="flex-shrink-0 dropdown-notifications-actions">
                        <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
                        <a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="bx bx-x"></span></a>
                      </div>
                    </div>
                  </li>
                  <li class="list-group-item list-group-item-action dropdown-notifications-item marked-as-read">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <div class="avatar">
                          <span class="avatar-initial rounded-circle bg-label-warning"><i class="bx bx-error"></i></span>
                        </div>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">CPU is running high</h6>
                        <p class="mb-0">CPU Utilization Percent is currently at 88.63%,</p>
                        <small class="text-muted">5 days ago</small>
                      </div>
                      <div class="flex-shrink-0 dropdown-notifications-actions">
                        <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
                        <a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="bx bx-x"></span></a>
                      </div>
                    </div>
                  </li>
                </ul>
              </li>
              <li class="dropdown-menu-footer border-top p-3">
                <button class="btn btn-primary text-uppercase w-100">view all notifications</button>
              </li>
            </ul>
          </li>
          <!--/ Notification -->
          <!-- User -->
          <li class="nav-item navbar-dropdown dropdown-user dropdown">
            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
              <div class="avatar avatar-online">
                <img src="../../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle">
              </div>
            </a>
            <ul class="dropdown-menu dropdown-menu-end">
              <li>
                <a class="dropdown-item" href="pages-account-settings-account.html">
                  <div class="d-flex">
                    <div class="flex-shrink-0 me-3">
                      <div class="avatar avatar-online">
                        <img src="../../assets/img/avatars/1.png" alt class="w-px-40 h-auto rounded-circle">
                      </div>
                    </div>
                    <div class="flex-grow-1">
                      <span class="fw-medium d-block">John Doe</span>
                      <small class="text-muted">Admin</small>
                    </div>
                  </div>
                </a>
              </li>
              <li>
                <div class="dropdown-divider"></div>
              </li>
              <li>
                <a class="dropdown-item" href="pages-profile-user.html">
                  <i class="bx bx-user me-2"></i>
                  <span class="align-middle">My Profile</span>
                </a>
              </li>
              <li>
                <a class="dropdown-item" href="pages-account-settings-account.html">
                  <i class="bx bx-cog me-2"></i>
                  <span class="align-middle">Settings</span>
                </a>
              </li>
              <li>
                <a class="dropdown-item" href="pages-account-settings-billing.html">
                  <span class="d-flex align-items-center align-middle">
                    <i class="flex-shrink-0 bx bx-credit-card me-2"></i>
                    <span class="flex-grow-1 align-middle">Billing</span>
                    <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                  </span>
                </a>
              </li>
              <li>
                <div class="dropdown-divider"></div>
              </li>
              <li>
                <a class="dropdown-item" href="pages-faq.html">
                  <i class="bx bx-help-circle me-2"></i>
                  <span class="align-middle">FAQ</span>
                </a>
              </li>
              <li>
                <a class="dropdown-item" href="pages-pricing.html">
                  <i class="bx bx-dollar me-2"></i>
                  <span class="align-middle">Pricing</span>
                </a>
              </li>
              <li>
                <div class="dropdown-divider"></div>
              </li>
              <li>
                <a class="dropdown-item" href="auth-login-cover.html" target="_blank">
                  <i class="bx bx-power-off me-2"></i>
                  <span class="align-middle">Log Out</span>
                </a>
              </li>
            </ul>
          </li>
          <!--/ User -->
          

        </ul>
      </div>

      
      <!-- Search Small Screens -->
      <div class="navbar-search-wrapper search-input-wrapper  d-none">
        <input type="text" class="form-control search-input container-xxl border-0" placeholder="Search..." aria-label="Search...">
        <i class="bx bx-x bx-sm search-toggler cursor-pointer"></i>
      </div>
      
      
  </nav>
  

  
<!-- / Navbar -->

      

      <!-- Content wrapper -->
      <div class="content-wrapper">

        <!-- Content -->
        
          <div class="container-xxl flex-grow-1 container-p-y">
            
            

<h4 class="py-3 mb-4">
  <span class="text-muted fw-light">eCommerce / </span>Manage reviews
</h4>

<div class="row mb-4 g-4">
  <div class="col-md-6">
    <div class="card h-100">
      <div class="card-body row widget-separator">
        <div class="col-sm-5 border-shift border-end">
          <h2 class="text-primary">4.89<i class='bx bxs-star mb-2 ms-1'></i></h2>
          <p class="fw-medium mb-1">Total 187 reviews</p>
          <p class="text-muted">All reviews are from genuine customers</p>
          <span class="badge bg-label-primary p-2 mb-3 mb-sm-0">+5 This week</span>
          <hr class="d-sm-none">
        </div>

        <div class="col-sm-7 gy-1 text-nowrap d-flex flex-column justify-content-between ps-4 gap-2 pe-3">
          <div class="d-flex align-items-center gap-3">
            <small>5 Star</small>
            <div class="progress w-100" style="height:10px;">
              <div class="progress-bar bg-primary" role="progressbar" style="width: 70%" aria-valuenow="61.50" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <small class="w-px-20 text-end">124</small>
          </div>
          <div class="d-flex align-items-center gap-3">
            <small>4 Star</small>
            <div class="progress w-100" style="height:10px;">
              <div class="progress-bar bg-primary" role="progressbar" style="width: 30%" aria-valuenow="24" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <small class="w-px-20 text-end">40</small>
          </div>
          <div class="d-flex align-items-center gap-3">
            <small>3 Star</small>
            <div class="progress w-100" style="height:10px;">
              <div class="progress-bar bg-primary" role="progressbar" style="width: 15%" aria-valuenow="12" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <small class="w-px-20 text-end">12</small>
          </div>
          <div class="d-flex align-items-center gap-3">
            <small>2 Star</small>
            <div class="progress w-100" style="height:10px;">
              <div class="progress-bar bg-primary" role="progressbar" style="width: 10%" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <small class="w-px-20 text-end">7</small>
          </div>
          <div class="d-flex align-items-center gap-3">
            <small>1 Star</small>
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
            <h4 class="mb-2 text-nowrap">Reviews statistics</h4>
            <p class="mb-0"> <span class="me-2">12 New reviews</span> <span class="badge bg-label-success">+8.4%</span></p>
          </div>

          <div>
            <h5 class="mb-2 fw-normal">
              <span class="text-success me-1">87%</span>Positive reviews
            </h5>
            <small class="text-muted">Weekly Report</small>
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
  <div class="card-datatable table-responsive">
    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer"><div class="card-header d-flex align-items-md-center pb-md-2 flex-wrap"><div class="me-5 ms-n2"><div id="DataTables_Table_0_filter" class="dataTables_filter"><label><input type="search" class="form-control" placeholder="Search Review" aria-controls="DataTables_Table_0"></label></div></div><div class="dt-action-buttons text-xl-end text-lg-start text-md-end text-start d-flex align-items-end align-items-md-center justify-content-md-end pt-0 gap-3 flex-wrap"><div class="dataTables_length mt-0 mt-md-3" id="DataTables_Table_0_length"><label><select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="form-select"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select></label></div><div class="review_filter"><select id="Review" class="form-select"><option value=""> All </option><option value="Pending" class="text-capitalize">Pending</option><option value="Published" class="text-capitalize">Published</option></select></div><div class="mx-0 me-md-n3 mt-sm-0"><div class="dt-buttons"><button class="dt-button buttons-collection dropdown-toggle btn btn-label-secondary me-3" tabindex="0" aria-controls="DataTables_Table_0" type="button" aria-haspopup="dialog" aria-expanded="false"><span><i class="bx bx-export me-1"></i>Export</span><span class="dt-down-arrow">▼</span></button> </div></div></div></div><table class="datatables-review table dataTable no-footer dtr-column collapsed" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" style="width: 1392px;">
      <thead>
        <tr><th class="control sorting_disabled" rowspan="1" colspan="1" style="width: 0px;" aria-label=""></th><th class="sorting_disabled dt-checkboxes-cell dt-checkboxes-select-all" rowspan="1" colspan="1" style="width: 19px;" data-col="1" aria-label=""><input type="checkbox" class="form-check-input"></th><th class="sorting sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 239px;" aria-label="Product: activate to sort column descending" aria-sort="ascending">Product</th><th class="text-nowrap sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 206px;" aria-label="Reviewer: activate to sort column ascending">Reviewer</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 394px;" aria-label="Review: activate to sort column ascending">Review</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 89px;" aria-label="Date: activate to sort column ascending">Date</th><th class="text-nowrap sorting dtr-hidden" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 78px; display: none;" aria-label="Status: activate to sort column ascending">Status</th><th class="sorting_disabled dtr-hidden" rowspan="1" colspan="1" style="width: 61px; display: none;" aria-label="Actions">Actions</th></tr>
      </thead><tbody><tr class="odd"><td class="control" tabindex="0" style=""></td><td class="  dt-checkboxes-cell"><input type="checkbox" class="dt-checkboxes form-check-input"></td><td class="sorting_1"><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2 rounded-2 bg-label-secondary"><img src="../../assets/img/ecommerce-images/product-9.png" alt="Product-9" class="rounded-2"></div></div><div class="d-flex flex-column"><span class="fw-medium text-nowrap">Air Jordan</span><small class="text-muted">Air Jordan is a line of basketball shoes produced by Nike</small></div></div></td><td><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2"><img src="../../assets/img/avatars/5.png" alt="Avatar" class="rounded-circle"></div></div><div class="d-flex flex-column"><a href="app-ecommerce-customer-details-overview.html"><span class="fw-medium">Gisela Leppard</span></a><small class="text-muted text-nowrap">gleppard8@yandex.ru</small></div></div></td><td><div><div class="read-only-ratings ps-0 mb-2 jq-ry-container" readonly="readonly" style="width: 112px;"><div class="jq-ry-group-wrapper"><div class="jq-ry-normal-group jq-ry-group"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div><div class="jq-ry-rated-group jq-ry-group" style="width: 38.3929%;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div></div></div><p class="fw-medium mb-1 text-truncate text-capitalize">ut mauris</p><small class="text-break pe-3">Fusce consequat. Nulla nisl. Nunc nisl.</small></div></td><td><span class="text-nowrap">Apr 20, 2020</span></td><td class="dtr-hidden" style="display: none;"><span class="badge bg-label-success" text-capitalized="">Published</span></td><td class="dtr-hidden" style="display: none;"><div class="text-xxl-center"><div class="dropdown"><a href="javascript:;" class="btn dropdown-toggle hide-arrow text-body p-0" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></a><div class="dropdown-menu dropdown-menu-end"><a href="javascript:;" class="dropdown-item">Download</a><a href="javascript:;" class="dropdown-item">Edit</a><a href="javascript:;" class="dropdown-item">Duplicate</a><div class="dropdown-divider"></div><a href="javascript:;" class="dropdown-item delete-record text-danger">Delete</a></div></div></div></td></tr><tr class="even"><td class="control" tabindex="0" style=""></td><td class="  dt-checkboxes-cell"><input type="checkbox" class="dt-checkboxes form-check-input"></td><td class="sorting_1"><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2 rounded-2 bg-label-secondary"><img src="../../assets/img/ecommerce-images/product-13.png" alt="Product-13" class="rounded-2"></div></div><div class="d-flex flex-column"><span class="fw-medium text-nowrap">Amazon Fire TV</span><small class="text-muted">4K UHD smart TV, stream live TV without cable</small></div></div></td><td><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2"><span class="avatar-initial rounded-circle bg-label-primary">TV</span></div></div><div class="d-flex flex-column"><a href="app-ecommerce-customer-details-overview.html"><span class="fw-medium">Tracey Ventham</span></a><small class="text-muted text-nowrap">tventhamc@thetimes.co.uk</small></div></div></td><td><div><div class="read-only-ratings ps-0 mb-2 jq-ry-container" readonly="readonly" style="width: 112px;"><div class="jq-ry-group-wrapper"><div class="jq-ry-normal-group jq-ry-group"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div><div class="jq-ry-rated-group jq-ry-group" style="width: 58.9286%;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div></div></div><p class="fw-medium mb-1 text-truncate text-capitalize">at nunc commodo placerat praesent</p><small class="text-break pe-3">Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.</small></div></td><td><span class="text-nowrap">Mar 17, 2021</span></td><td class="dtr-hidden" style="display: none;"><span class="badge bg-label-success" text-capitalized="">Published</span></td><td class="dtr-hidden" style="display: none;"><div class="text-xxl-center"><div class="dropdown"><a href="javascript:;" class="btn dropdown-toggle hide-arrow text-body p-0" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></a><div class="dropdown-menu dropdown-menu-end"><a href="javascript:;" class="dropdown-item">Download</a><a href="javascript:;" class="dropdown-item">Edit</a><a href="javascript:;" class="dropdown-item">Duplicate</a><div class="dropdown-divider"></div><a href="javascript:;" class="dropdown-item delete-record text-danger">Delete</a></div></div></div></td></tr><tr class="odd"><td class="control" tabindex="0" style=""></td><td class="  dt-checkboxes-cell"><input type="checkbox" class="dt-checkboxes form-check-input"></td><td class="sorting_1"><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2 rounded-2 bg-label-secondary"><img src="../../assets/img/ecommerce-images/product-15.png" alt="Product-15" class="rounded-2"></div></div><div class="d-flex flex-column"><span class="fw-medium text-nowrap">Apple iPad</span><small class="text-muted">10.2-inch Retina Display, 64GB</small></div></div></td><td><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2"><img src="../../assets/img/avatars/10.png" alt="Avatar" class="rounded-circle"></div></div><div class="d-flex flex-column"><a href="app-ecommerce-customer-details-overview.html"><span class="fw-medium">Jabez Heggs</span></a><small class="text-muted text-nowrap">jheggse@nba.com</small></div></div></td><td><div><div class="read-only-ratings ps-0 mb-2 jq-ry-container" readonly="readonly" style="width: 112px;"><div class="jq-ry-group-wrapper"><div class="jq-ry-normal-group jq-ry-group"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div><div class="jq-ry-rated-group jq-ry-group" style="width: 17.8571%;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div></div></div><p class="fw-medium mb-1 text-truncate text-capitalize">ac consequat</p><small class="text-break pe-3">Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.</small></div></td><td><span class="text-nowrap">Apr 21, 2020</span></td><td class="dtr-hidden" style="display: none;"><span class="badge bg-label-success" text-capitalized="">Published</span></td><td class="dtr-hidden" style="display: none;"><div class="text-xxl-center"><div class="dropdown"><a href="javascript:;" class="btn dropdown-toggle hide-arrow text-body p-0" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></a><div class="dropdown-menu dropdown-menu-end"><a href="javascript:;" class="dropdown-item">Download</a><a href="javascript:;" class="dropdown-item">Edit</a><a href="javascript:;" class="dropdown-item">Duplicate</a><div class="dropdown-divider"></div><a href="javascript:;" class="dropdown-item delete-record text-danger">Delete</a></div></div></div></td></tr><tr class="even"><td class="control" tabindex="0" style=""></td><td class="  dt-checkboxes-cell"><input type="checkbox" class="dt-checkboxes form-check-input"></td><td class="sorting_1"><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2 rounded-2 bg-label-secondary"><img src="../../assets/img/ecommerce-images/product-5.png" alt="Product-5" class="rounded-2"></div></div><div class="d-flex flex-column"><span class="fw-medium text-nowrap">Apple Watch Series 7</span><small class="text-muted">Starlight Aluminum Case with Starlight Sport Band.</small></div></div></td><td><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2"><img src="../../assets/img/avatars/9.png" alt="Avatar" class="rounded-circle"></div></div><div class="d-flex flex-column"><a href="app-ecommerce-customer-details-overview.html"><span class="fw-medium">Ethel Zanardii</span></a><small class="text-muted text-nowrap">ezanardii4@mapy.cz</small></div></div></td><td><div><div class="read-only-ratings ps-0 mb-2 jq-ry-container" readonly="readonly" style="width: 112px;"><div class="jq-ry-group-wrapper"><div class="jq-ry-normal-group jq-ry-group"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div><div class="jq-ry-rated-group jq-ry-group" style="width: 17.8571%;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div></div></div><p class="fw-medium mb-1 text-truncate text-capitalize">etiam faucibus cursus</p><small class="text-break pe-3">Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.</small></div></td><td><span class="text-nowrap">Jun 12, 2020</span></td><td class="dtr-hidden" style="display: none;"><span class="badge bg-label-warning" text-capitalized="">Pending</span></td><td class="dtr-hidden" style="display: none;"><div class="text-xxl-center"><div class="dropdown"><a href="javascript:;" class="btn dropdown-toggle hide-arrow text-body p-0" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></a><div class="dropdown-menu dropdown-menu-end"><a href="javascript:;" class="dropdown-item">Download</a><a href="javascript:;" class="dropdown-item">Edit</a><a href="javascript:;" class="dropdown-item">Duplicate</a><div class="dropdown-divider"></div><a href="javascript:;" class="dropdown-item delete-record text-danger">Delete</a></div></div></div></td></tr><tr class="odd"><td class="control" tabindex="0" style=""></td><td class="  dt-checkboxes-cell"><input type="checkbox" class="dt-checkboxes form-check-input"></td><td class="sorting_1"><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2 rounded-2 bg-label-secondary"><img src="../../assets/img/ecommerce-images/product-16.png" alt="Product-16" class="rounded-2"></div></div><div class="d-flex flex-column"><span class="fw-medium text-nowrap">BANGE Anti Theft Backpack</span><small class="text-muted">Smart Business Laptop Fits 15.6 Inch Notebook</small></div></div></td><td><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2"><img src="../../assets/img/avatars/3.png" alt="Avatar" class="rounded-circle"></div></div><div class="d-flex flex-column"><a href="app-ecommerce-customer-details-overview.html"><span class="fw-medium">Micaela Rowesby</span></a><small class="text-muted text-nowrap">mrowesbyf@surveymonkey.com</small></div></div></td><td><div><div class="read-only-ratings ps-0 mb-2 jq-ry-container" readonly="readonly" style="width: 112px;"><div class="jq-ry-group-wrapper"><div class="jq-ry-normal-group jq-ry-group"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div><div class="jq-ry-rated-group jq-ry-group" style="width: 17.8571%;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div></div></div><p class="fw-medium mb-1 text-truncate text-capitalize">mattis egestas metus</p><small class="text-break pe-3">Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.</small></div></td><td><span class="text-nowrap">Dec 11, 2021</span></td><td class="dtr-hidden" style="display: none;"><span class="badge bg-label-success" text-capitalized="">Published</span></td><td class="dtr-hidden" style="display: none;"><div class="text-xxl-center"><div class="dropdown"><a href="javascript:;" class="btn dropdown-toggle hide-arrow text-body p-0" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></a><div class="dropdown-menu dropdown-menu-end"><a href="javascript:;" class="dropdown-item">Download</a><a href="javascript:;" class="dropdown-item">Edit</a><a href="javascript:;" class="dropdown-item">Duplicate</a><div class="dropdown-divider"></div><a href="javascript:;" class="dropdown-item delete-record text-danger">Delete</a></div></div></div></td></tr><tr class="even"><td class="control" tabindex="0" style=""></td><td class="  dt-checkboxes-cell"><input type="checkbox" class="dt-checkboxes form-check-input"></td><td class="sorting_1"><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2 rounded-2 bg-label-secondary"><img src="../../assets/img/ecommerce-images/product-18.png" alt="Product-18" class="rounded-2"></div></div><div class="d-flex flex-column"><span class="fw-medium text-nowrap">Canon EOS Rebel T7</span><small class="text-muted">18-55mm Lens | Built-in Wi-Fi | 24.1 MP CMOS Sensor</small></div></div></td><td><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2"><span class="avatar-initial rounded-circle bg-label-primary">EB</span></div></div><div class="d-flex flex-column"><a href="app-ecommerce-customer-details-overview.html"><span class="fw-medium">Emery Breitling</span></a><small class="text-muted text-nowrap">ebreitlingh@friendfeed.com</small></div></div></td><td><div><div class="read-only-ratings ps-0 mb-2 jq-ry-container" readonly="readonly" style="width: 112px;"><div class="jq-ry-group-wrapper"><div class="jq-ry-normal-group jq-ry-group"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div><div class="jq-ry-rated-group jq-ry-group" style="width: 100%;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div></div></div><p class="fw-medium mb-1 text-truncate text-capitalize">nec nisi vulputate</p><small class="text-break pe-3">Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.</small></div></td><td><span class="text-nowrap">Dec 1, 2020</span></td><td class="dtr-hidden" style="display: none;"><span class="badge bg-label-warning" text-capitalized="">Pending</span></td><td class="dtr-hidden" style="display: none;"><div class="text-xxl-center"><div class="dropdown"><a href="javascript:;" class="btn dropdown-toggle hide-arrow text-body p-0" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></a><div class="dropdown-menu dropdown-menu-end"><a href="javascript:;" class="dropdown-item">Download</a><a href="javascript:;" class="dropdown-item">Edit</a><a href="javascript:;" class="dropdown-item">Duplicate</a><div class="dropdown-divider"></div><a href="javascript:;" class="dropdown-item delete-record text-danger">Delete</a></div></div></div></td></tr><tr class="odd"><td class="control" tabindex="0" style=""></td><td class="  dt-checkboxes-cell"><input type="checkbox" class="dt-checkboxes form-check-input"></td><td class="sorting_1"><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2 rounded-2 bg-label-secondary"><img src="../../assets/img/ecommerce-images/product-3.png" alt="Product-3" class="rounded-2"></div></div><div class="d-flex flex-column"><span class="fw-medium text-nowrap">Dohioue Wall Clock</span><small class="text-muted">Modern 10 Inch Battery Operated Wall Clocks</small></div></div></td><td><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2"><img src="../../assets/img/avatars/9.png" alt="Avatar" class="rounded-circle"></div></div><div class="d-flex flex-column"><a href="app-ecommerce-customer-details-overview.html"><span class="fw-medium">Francyne Coulthurst</span></a><small class="text-muted text-nowrap">fcoulthurst2@upenn.edu</small></div></div></td><td><div><div class="read-only-ratings ps-0 mb-2 jq-ry-container" readonly="readonly" style="width: 112px;"><div class="jq-ry-group-wrapper"><div class="jq-ry-normal-group jq-ry-group"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div><div class="jq-ry-rated-group jq-ry-group" style="width: 38.3929%;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div></div></div><p class="fw-medium mb-1 text-truncate text-capitalize">neque libero convallis</p><small class="text-break pe-3">Phasellus in felis. Donec semper sapien a libero. Nam dui.</small></div></td><td><span class="text-nowrap">Aug 10, 2020</span></td><td class="dtr-hidden" style="display: none;"><span class="badge bg-label-success" text-capitalized="">Published</span></td><td class="dtr-hidden" style="display: none;"><div class="text-xxl-center"><div class="dropdown"><a href="javascript:;" class="btn dropdown-toggle hide-arrow text-body p-0" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></a><div class="dropdown-menu dropdown-menu-end"><a href="javascript:;" class="dropdown-item">Download</a><a href="javascript:;" class="dropdown-item">Edit</a><a href="javascript:;" class="dropdown-item">Duplicate</a><div class="dropdown-divider"></div><a href="javascript:;" class="dropdown-item delete-record text-danger">Delete</a></div></div></div></td></tr><tr class="even"><td class="control" tabindex="0" style=""></td><td class="  dt-checkboxes-cell"><input type="checkbox" class="dt-checkboxes form-check-input"></td><td class="sorting_1"><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2 rounded-2 bg-label-secondary"><img src="../../assets/img/ecommerce-images/product-2.png" alt="Product-2" class="rounded-2"></div></div><div class="d-flex flex-column"><span class="fw-medium text-nowrap">Echo Dot (4th Gen)</span><small class="text-muted">Echo Dot Smart speaker with Alexa</small></div></div></td><td><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2"><img src="../../assets/img/avatars/13.png" alt="Avatar" class="rounded-circle"></div></div><div class="d-flex flex-column"><a href="app-ecommerce-customer-details-overview.html"><span class="fw-medium">Stacey Hallgalley</span></a><small class="text-muted text-nowrap">shallgalley1@google.nl</small></div></div></td><td><div><div class="read-only-ratings ps-0 mb-2 jq-ry-container" readonly="readonly" style="width: 112px;"><div class="jq-ry-group-wrapper"><div class="jq-ry-normal-group jq-ry-group"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div><div class="jq-ry-rated-group jq-ry-group" style="width: 100%;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div></div></div><p class="fw-medium mb-1 text-truncate text-capitalize">libero ut</p><small class="text-break pe-3">Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.</small></div></td><td><span class="text-nowrap">Mar 21, 2021</span></td><td class="dtr-hidden" style="display: none;"><span class="badge bg-label-success" text-capitalized="">Published</span></td><td class="dtr-hidden" style="display: none;"><div class="text-xxl-center"><div class="dropdown"><a href="javascript:;" class="btn dropdown-toggle hide-arrow text-body p-0" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></a><div class="dropdown-menu dropdown-menu-end"><a href="javascript:;" class="dropdown-item">Download</a><a href="javascript:;" class="dropdown-item">Edit</a><a href="javascript:;" class="dropdown-item">Duplicate</a><div class="dropdown-divider"></div><a href="javascript:;" class="dropdown-item delete-record text-danger">Delete</a></div></div></div></td></tr><tr class="odd"><td class="control" tabindex="0" style=""></td><td class="  dt-checkboxes-cell"><input type="checkbox" class="dt-checkboxes form-check-input"></td><td class="sorting_1"><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2 rounded-2 bg-label-secondary"><img src="../../assets/img/ecommerce-images/product-19.png" alt="Product-19" class="rounded-2"></div></div><div class="d-flex flex-column"><span class="fw-medium text-nowrap">Honiway Wall Mirror</span><small class="text-muted">Decorative 12 inch Rustic Wood Mirror Sunburst Boho</small></div></div></td><td><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2"><img src="../../assets/img/avatars/12.png" alt="Avatar" class="rounded-circle"></div></div><div class="d-flex flex-column"><a href="app-ecommerce-customer-details-overview.html"><span class="fw-medium">Wilona Fields</span></a><small class="text-muted text-nowrap">wfieldsi@columbia.edu</small></div></div></td><td><div><div class="read-only-ratings ps-0 mb-2 jq-ry-container" readonly="readonly" style="width: 112px;"><div class="jq-ry-group-wrapper"><div class="jq-ry-normal-group jq-ry-group"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div><div class="jq-ry-rated-group jq-ry-group" style="width: 17.8571%;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div></div></div><p class="fw-medium mb-1 text-truncate text-capitalize">parturient montes nascetur ridiculus</p><small class="text-break pe-3">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.</small></div></td><td><span class="text-nowrap">Mar 30, 2020</span></td><td class="dtr-hidden" style="display: none;"><span class="badge bg-label-success" text-capitalized="">Published</span></td><td class="dtr-hidden" style="display: none;"><div class="text-xxl-center"><div class="dropdown"><a href="javascript:;" class="btn dropdown-toggle hide-arrow text-body p-0" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></a><div class="dropdown-menu dropdown-menu-end"><a href="javascript:;" class="dropdown-item">Download</a><a href="javascript:;" class="dropdown-item">Edit</a><a href="javascript:;" class="dropdown-item">Duplicate</a><div class="dropdown-divider"></div><a href="javascript:;" class="dropdown-item delete-record text-danger">Delete</a></div></div></div></td></tr><tr class="even"><td class="control" tabindex="0" style=""></td><td class="  dt-checkboxes-cell"><input type="checkbox" class="dt-checkboxes form-check-input"></td><td class="sorting_1"><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2 rounded-2 bg-label-secondary"><img src="../../assets/img/ecommerce-images/product-4.png" alt="Product-4" class="rounded-2"></div></div><div class="d-flex flex-column"><span class="fw-medium text-nowrap">INZCOU Running Shoes</span><small class="text-muted">Lightweight Tennis Shoes Non Slip Gym Workout Shoes</small></div></div></td><td><div class="d-flex justify-content-start align-items-center customer-name"><div class="avatar-wrapper"><div class="avatar me-2"><span class="avatar-initial rounded-circle bg-label-warning">NM</span></div></div><div class="d-flex flex-column"><a href="app-ecommerce-customer-details-overview.html"><span class="fw-medium">Nate De Mitris</span></a><small class="text-muted text-nowrap">nde3@intel.com</small></div></div></td><td><div><div class="read-only-ratings ps-0 mb-2 jq-ry-container" readonly="readonly" style="width: 112px;"><div class="jq-ry-group-wrapper"><div class="jq-ry-normal-group jq-ry-group"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="gray" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div><div class="jq-ry-rated-group jq-ry-group" style="width: 58.9286%;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20px" height="20px" fill="#f39c12" style="margin-left: 3px;"><path d="M12,2 L15.09,8.09 L22,9.9 L17,14 L18.18,20 L12,17.5 L5.82,20 L7,14 L2,9.9 L8.91,8.09 L12,2 Z"></path></svg></div></div></div><p class="fw-medium mb-1 text-truncate text-capitalize">accumsan tellus nisi eu</p><small class="text-break pe-3">Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.</small></div></td><td><span class="text-nowrap">Dec 18, 2021</span></td><td class="dtr-hidden" style="display: none;"><span class="badge bg-label-warning" text-capitalized="">Pending</span></td><td class="dtr-hidden" style="display: none;"><div class="text-xxl-center"><div class="dropdown"><a href="javascript:;" class="btn dropdown-toggle hide-arrow text-body p-0" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></a><div class="dropdown-menu dropdown-menu-end"><a href="javascript:;" class="dropdown-item">Download</a><a href="javascript:;" class="dropdown-item">Edit</a><a href="javascript:;" class="dropdown-item">Duplicate</a><div class="dropdown-divider"></div><a href="javascript:;" class="dropdown-item delete-record text-danger">Delete</a></div></div></div></td></tr></tbody>
    </table><div class="row mx-2"><div class="col-sm-12 col-md-6"><div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">Showing 1 to 10 of 100 entries</div></div><div class="col-sm-12 col-md-6"><div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="DataTables_Table_0_previous"><a aria-controls="DataTables_Table_0" aria-disabled="true" role="link" data-dt-idx="previous" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="DataTables_Table_0" role="link" aria-current="page" data-dt-idx="0" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="1" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="2" tabindex="0" class="page-link">3</a></li><li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="3" tabindex="0" class="page-link">4</a></li><li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="4" tabindex="0" class="page-link">5</a></li><li class="paginate_button page-item disabled" id="DataTables_Table_0_ellipsis"><a aria-controls="DataTables_Table_0" aria-disabled="true" role="link" data-dt-idx="ellipsis" tabindex="0" class="page-link">…</a></li><li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="9" tabindex="0" class="page-link">10</a></li><li class="paginate_button page-item next" id="DataTables_Table_0_next"><a href="#" aria-controls="DataTables_Table_0" role="link" data-dt-idx="next" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div>
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