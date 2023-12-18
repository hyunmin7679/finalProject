<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><tiles:insertAttribute name="title" /></title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrapTemp/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrapTemp/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrapTemp/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrapTemp/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrapTemp/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<link rel="${pageContext.request.contextPath}/bootstrapTempstylesheet"
	href="${pageContext.request.contextPath}/bootstrapTemp/assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrapTemp/assets/vendor/js/helpers.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrapTemp/assets/js/config.js"></script>


<!--  
<script>
        $(document).ready(function () {
            $('.menu-toggle').click(function () {
            	var $parentLi = $(this).parent('li');
            	
                $(this).next('.menu-sub').slideToggle();
                
               
                $parentLi.siblings('li').removeClass('active');

                $parentLi.toggleClass('active');
                
            });
        });
</script>
-->

<!--  
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/jquery/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.4.2/css/all.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu2.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main2.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/forms.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/paginate.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ui-css.css" type="text/css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menu2.js"></script>
	-->
</head>

<body>

	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">

			<tiles:insertAttribute name="left" />

			<div class="layout-page">
				<tiles:insertAttribute name="body" />
			</div>


			<div id="loadingLayout"
				style="display: none; position: absolute; left: 0; top: 0; width: 100%; height: 100%; z-index: 9000; background: #eee;">
				<div class="loader"></div>
			</div>


		</div>
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/jquery/js/jquery.ui.datepicker-ko.js"></script>
-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrapTemp/assets/vendor/libs/jquery/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrapTemp/assets/vendor/libs/popper/popper.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrapTemp/assets/vendor/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrapTemp/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script
	src="${pageContext.request.contextPath}/bootstrapTemp/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrapTemp/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- 
<script>
        $(document).ready(function () {
            $('.menu-toggle').click(function () {
            	var $parentLi = $(this).parent('li');

                $(this).next('.menu-sub').slideToggle();

                // 기존에 활성화된 메뉴의 active 클래스를 제거
                $parentLi.siblings('li').removeClass('active');

                // 클릭한 메뉴에 active 클래스를 토글
                $parentLi.toggleClass('active');
            });
        });
</script>
  -->
<!-- Main JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrapTemp/assets/js/main.js"></script>

<!-- Page JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/bootstrapTemp/assets/js/dashboards-analytics.js"></script>

</body>
</html>