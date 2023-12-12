<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<aside id="layout-menu"
	class="layout-menu menu-vertical menu bg-menu-theme">
	<div class="app-brand demo">
		<a href="${pageContext.request.contextPath}/" class="app-brand-link">
		<img src="${pageContext.request.contextPath}/bootstrapTemp/assets/img/avatars/admin.png" 
		alt="관리자 이미" class="w-px-50 h-auto rounded-circle" />
		 <span class="app-brand-text demo menu-text fw-bolder ms-2">관리자</span>
		</a> <a href="javascript:void(0);"
			class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
			<i class="bx bx-chevron-left bx-sm align-middle"></i>
		</a>
	</div>

	<div class="menu-inner-shadow"></div>

	<ul class="menu-inner py-1">
		<!-- 메인 페이지 -->
			<li class="menu-item ${left=='dashboard'?'active':''}">
				<a href="${pageContext.request.contextPath}/admin" class="menu-link"> 
					<i class="menu-icon tf-icons bx bx-home-circle"></i>
					<div data-i18n="Analytics">MainPage</div>
				</a>
			</li>
			
		<!-- 상품 관리 -->
		<li class="menu-item ${left=='productManage'? 'active open':''}"><a href="${pageContext.request.contextPath}/admin/inquiryManage/productManage"
			class="menu-link"> <i class='menu-icon tf-icons bx bx-cart-alt'></i>
				<div data-i18n="productManage">상품 관리</div>
		
		</a></li>
		
		<!-- 주문 관리 -->
		<li class="menu-item"><a href="javascript:void(0);"
			class="menu-link menu-toggle"> <i
				class="menu-icon tf-icons bx bx-credit-card"></i>
				<div data-i18n="Authentications">주문 관리</div>
		</a>
			<ul class="menu-sub">
				<li class="menu-item"><a href="auth-login-basic.html"
					class="menu-link" target="_blank">
						<div data-i18n="Basic">배송 관리</div>
				</a></li>
				<li class="menu-item"><a href="auth-register-basic.html"
					class="menu-link" target="_blank">
						<div data-i18n="Basic">교환/반품/취소</div>
				</a></li>
			</ul></li>
		
		<!-- 리뷰 관리 -->
		<li class="menu-item ${left=='reviewManage'? 'active open':''}"><a href="${pageContext.request.contextPath}/admin/inquiryManage/reviewManage"
			class="menu-link"> <i class='menu-icon tf-icons bx bx-star'></i>
				<div data-i18n="reviewManage">리뷰 관리</div>
		</a></li>
		
		<!-- 회원 관리 -->
		<li class="menu-item ${left=='UserControl'? 'active open':''}"><a href="javascript:void(0);"
			class="menu-link menu-toggle"> <i
				class="menu-icon tf-icons bx bx-group"></i>
				<div data-i18n="UserControl">회원 관리</div>
		</a>
			<ul class="menu-sub">
				<li class="menu-item ${sub=='userlist'?'active':''}"><a href="${pageContext.request.contextPath}/admin/inquiryManage/users"
					class="menu-link">
						<div data-i18n="userlist">회원 리스트</div>
				</a></li>
				<li class="menu-item ${sub=='usersinfo'?'active':''}"><a href="${pageContext.request.contextPath}/admin/inquiryManage/usersinfo"
					class="menu-link">
						<div data-i18n="usersinfo">회원 상세</div>
				</a></li>
			</ul></li>
			
		<!-- 일반 관리 -->
		<li class="menu-item ${left=='csManage'? 'active':''}" ><a href="${pageContext.request.contextPath}/admin/inquiryManage/csManage"
			class="menu-link"> <i class='menu-icon tf-icons bx bx-cube-alt'></i>
				<div data-i18n="csManage">일반 관리</div>
		</a></li>
		
		<!-- 아이콘 관리 -->
		<li class="menu-item ${left=='iconControl'? 'active':''}">
			<a href="${pageContext.request.contextPath}/admin/inquiryManage/icons"class="menu-link"> 
				<i class='menu-icon tf-icons bx bx-face'></i>
				<div data-i18n="icons">아이콘 관리</div>
		</a></li>
		
		<!-- 커뮤니티 관리 -->
		<li class="menu-item"><a href="cards-basic.html"
			class="menu-link"> <i class='menu-icon tf-icons bx bx-been-here'></i>
				<div data-i18n="Basic">커뮤니티 관리</div>
		</a></li>
		
		<!-- 쿠폰 관리 -->
		<li class="menu-item"><a href="cards-basic.html"
			class="menu-link"> <i class='menu-icon tf-icons bx bxs-discount'></i>
				<div data-i18n="Basic">쿠폰 관리</div>
		</a></li>
			
		<!-- 계정 관리 -->
		<li class="menu-item ${left=='adminAuthentication'? 'active open':''}"><a href="javascript:void(0);"
			class="menu-link menu-toggle"> <i
				class="menu-icon tf-icons bx bx-lock-open-alt"></i>
				<div data-i18n="adminAuthentication">계정 관리</div>
		</a>
			<ul class="menu-sub">
				<li class="menu-item"><a href="${pageContext.request.contextPath}/admin/inquiryManage/adminList"
					class="menu-link">
						<div data-i18n="adminList">관리자 리스트</div>
				</a></li>
				<li class="menu-item"><a href="${pageContext.request.contextPath}/admin/inquiryManage/adminAccount"
					class="menu-link">
						<div data-i18n="adminAccount">관리자 추가</div>
				</a></li>
			</ul></li>
			
		
	</ul>
</aside>
