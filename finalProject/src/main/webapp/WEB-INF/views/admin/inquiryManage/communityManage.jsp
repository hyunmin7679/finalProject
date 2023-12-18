<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  
<!-- / Navbar -->

      

      <!-- Content wrapper -->
      <div class="content-wrapper">

        <!-- Content -->
        
          <div class="container-xxl flex-grow-1 container-p-y">
            
            
<h4 class="py-3 mb-4"><span class="text-muted fw-light">커뮤니티관리 /</span> 인기 게시글 </h4>

<!-- Examples -->
<div class="row mb-5">

  <div class="col-md-6 col-lg-4 mb-3">
    <div class="card h-100">
      <img class="card-img-top" src="${pageContext.request.contextPath}/bootstrapTemp/assets/img/elements/2.jpg" alt="Card image cap" />
      <div class="card-body">
        <h5 class="card-title">글제목</h5>
        <p class="card-text">
          글내용@@@@@@@@@@@@@@@@@@@
        </p>
        <p class="card-text"> 
        <i class="fa-regular fa-eye"></i> : 2 | <i class='bx bxs-like'></i> : 2 
        </p>
        <a href="javascript:void(0)" class="btn btn-outline-primary">Go somewhere</a>
      </div>
    </div>
  </div>
  
   <div class="col-md-6 col-lg-4 mb-3">
    <div class="card h-100">
      <img class="card-img-top" src="${pageContext.request.contextPath}/bootstrapTemp/assets/img/elements/2.jpg" alt="Card image cap" />
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">
          Some quick example text to build on the card title and make up the bulk of the card's content.
        </p>
        <a href="javascript:void(0)" class="btn btn-outline-primary">Go somewhere</a>
      </div>
    </div>
  </div>
  
   <div class="col-md-6 col-lg-4 mb-3">
    <div class="card h-100">
      <img class="card-img-top" src="${pageContext.request.contextPath}/bootstrapTemp/assets/img/elements/2.jpg" alt="Card image cap" />
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">
          Some quick example text to build on the card title and make up the bulk of the card's content.
        </p>
        <a href="javascript:void(0)" class="btn btn-outline-primary">Go somewhere</a>
      </div>
    </div>
  </div>
  
</div>
<!-- Examples -->

<h4 class="py-3 mb-4"><span class="text-muted fw-light"></span> 게시글 인기순 통계
</h4>


<div class="row">
  


 

  <!-- Overview & Sales Activity -->
  <div class="col-md-6 col-lg-4 mb-4">
    <div class="card h-100">
      <div class="card-header">
        <h5 class="card-title mb-0">신고 누적순 게시글</h5>
      </div>
      <div class="card-body">
            <div class="report-list">
              <div class="report-list-item rounded-2 mb-3">
                <div class="d-flex align-items-start">
                  <div class="report-list-icon shadow-sm me-2">
                    <img src="../../assets/svg/icons/paypal-icon.svg" width="22" height="22" alt="">
                  </div>
                  <div class="d-flex justify-content-between align-items-end w-100 flex-wrap gap-2">
                    <div class="d-flex flex-column">
                      <span>글제목</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
    </div>
  </div>
  <!--/ Overview & Sales Activity -->

  <!-- Total Income -->
  <div class="col-md-12 col-lg-8 mb-4">
    <div class="card">
      <div class="row row-bordered g-0">
        <div class="col-md-8">
          <div class="card-header">
            <h5 class="card-title mb-0">카테고리별 인기순</h5>
            <small class="card-subtitle">조회수/좋아요/댓글등으로 통계</small>
          </div>
          <div class="card-body">
         	<!-- chart -->
            <div id="totalIncomeChart">


									<svg id="SvgjsSvg2843" width="435" height="270"
										xmlns="http://www.w3.org/2000/svg" version="1.1"
										xmlns:xlink="http://www.w3.org/1999/xlink"
										xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg"
										xmlns:data="ApexChartsNS" transform="translate(0, 0)"
										style="background: transparent;">
										<g id="SvgjsG2845"
											class="apexcharts-inner apexcharts-graphical"
											transform="translate(32.291666984558105, -5)">
										<defs id="SvgjsDefs2844">
										<linearGradient id="SvgjsLinearGradient2849" x1="0" y1="0"
											x2="0" y2="1">
										<stop id="SvgjsStop2850" stop-opacity="0.4"
											stop-color="rgba(216,227,240,0.4)" offset="0"></stop>
										<stop id="SvgjsStop2851" stop-opacity="0.5"
											stop-color="rgba(190,209,230,0.5)" offset="1"></stop>
										<stop id="SvgjsStop2852" stop-opacity="0.5"
											stop-color="rgba(190,209,230,0.5)" offset="1"></stop></linearGradient>
										<clipPath id="gridRectMaskvcwz8vps">
										<rect id="SvgjsRect2854" width="382.6979160308838"
											height="248.269332818985" x="-2" y="0" rx="0" ry="0"
											opacity="1" stroke-width="0" stroke="none"
											stroke-dasharray="0" fill="#fff"></rect></clipPath>
										<clipPath id="forecastMaskvcwz8vps"></clipPath>
										<clipPath id="nonForecastMaskvcwz8vps"></clipPath>
										<clipPath id="gridRectMarkerMaskvcwz8vps">
										<rect id="SvgjsRect2855" width="382.6979160308838"
											height="252.269332818985" x="-2" y="-2" rx="0" ry="0"
											opacity="1" stroke-width="0" stroke="none"
											stroke-dasharray="0" fill="#fff"></rect></clipPath></defs>
										<rect id="SvgjsRect2853" width="0" height="248.269332818985"
											x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0"
											stroke-dasharray="3" fill="url(#SvgjsLinearGradient2849)"
											class="apexcharts-xcrosshairs" y2="248.269332818985"
											filter="none" fill-opacity="0.9"></rect>
										<g id="SvgjsG2916"
											class="apexcharts-yaxis apexcharts-xaxis-inversed" rel="0">
										<g id="SvgjsG2917"
											class="apexcharts-yaxis-texts-g apexcharts-xaxis-inversed-texts-g"
											transform="translate(0, 0)">
										<text id="SvgjsText2918" font-family="Public Sans" x="-15"
											y="22.569939347180455" text-anchor="end"
											dominant-baseline="auto" font-size="13px" font-weight="400"
											fill="#a1acb8"
											class="apexcharts-text apexcharts-yaxis-label "
											style="font-family: &quot;Public Sans&quot;;">
										<tspan id="SvgjsTspan2919">6</tspan>
										<title>6</title></text>
										<text id="SvgjsText2920" font-family="Public Sans" x="-15"
											y="63.94816148367795" text-anchor="end"
											dominant-baseline="auto" font-size="13px" font-weight="400"
											fill="#a1acb8"
											class="apexcharts-text apexcharts-yaxis-label "
											style="font-family: &quot;Public Sans&quot;;">
										<tspan id="SvgjsTspan2921">5</tspan>
										<title>5</title></text>
										<text id="SvgjsText2922" font-family="Public Sans" x="-15"
											y="105.32638362017545" text-anchor="end"
											dominant-baseline="auto" font-size="13px" font-weight="400"
											fill="#a1acb8"
											class="apexcharts-text apexcharts-yaxis-label "
											style="font-family: &quot;Public Sans&quot;;">
										<tspan id="SvgjsTspan2923">4</tspan>
										<title>4</title></text>
										<text id="SvgjsText2924" font-family="Public Sans" x="-15"
											y="146.70460575667295" text-anchor="end"
											dominant-baseline="auto" font-size="13px" font-weight="400"
											fill="#a1acb8"
											class="apexcharts-text apexcharts-yaxis-label "
											style="font-family: &quot;Public Sans&quot;;">
										<tspan id="SvgjsTspan2925">3</tspan>
										<title>3</title></text>
										<text id="SvgjsText2926" font-family="Public Sans" x="-15"
											y="188.08282789317045" text-anchor="end"
											dominant-baseline="auto" font-size="13px" font-weight="400"
											fill="#a1acb8"
											class="apexcharts-text apexcharts-yaxis-label "
											style="font-family: &quot;Public Sans&quot;;">
										<tspan id="SvgjsTspan2927">2</tspan>
										<title>2</title></text>
										<text id="SvgjsText2928" font-family="Public Sans" x="-15"
											y="229.46105002966794" text-anchor="end"
											dominant-baseline="auto" font-size="13px" font-weight="400"
											fill="#a1acb8"
											class="apexcharts-text apexcharts-yaxis-label "
											style="font-family: &quot;Public Sans&quot;;">
										<tspan id="SvgjsTspan2929">1</tspan>
										<title>1</title></text></g></g>
										<g id="SvgjsG2896"
											class="apexcharts-xaxis apexcharts-yaxis-inversed">
										<g id="SvgjsG2897" class="apexcharts-xaxis-texts-g"
											transform="translate(0, -8.666666666666666)">
										<text id="SvgjsText2898"
											font-family="Helvetica, Arial, sans-serif"
											x="378.6979160308838" y="278.269332818985"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan2900">35%</tspan>
										<title>35%</title></text>
										<text id="SvgjsText2901"
											font-family="Helvetica, Arial, sans-serif"
											x="302.858332824707" y="278.269332818985"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan2903">28%</tspan>
										<title>28%</title></text>
										<text id="SvgjsText2904"
											font-family="Helvetica, Arial, sans-serif"
											x="227.0187496185303" y="278.269332818985"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan2906">21%</tspan>
										<title>21%</title></text>
										<text id="SvgjsText2907"
											font-family="Helvetica, Arial, sans-serif"
											x="151.17916641235354" y="278.269332818985"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan2909">14%</tspan>
										<title>14%</title></text>
										<text id="SvgjsText2910"
											font-family="Helvetica, Arial, sans-serif"
											x="75.33958320617677" y="278.269332818985"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="400" fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan2912">7%</tspan>
										<title>7%</title></text>
										<text id="SvgjsText2913"
											font-family="Helvetica, Arial, sans-serif" x="-0.5"
											y="278.269332818985" text-anchor="middle"
											dominant-baseline="auto" font-size="13px" font-weight="400"
											fill="#a1acb8"
											class="apexcharts-text apexcharts-xaxis-label "
											style="font-family: Helvetica, Arial, sans-serif;">
										<tspan id="SvgjsTspan2915">0%</tspan>
										<title>0%</title></text></g></g>
										<g id="SvgjsG2930" class="apexcharts-grid">
										<g id="SvgjsG2931" class="apexcharts-gridlines-horizontal"></g>
										<g id="SvgjsG2932" class="apexcharts-gridlines-vertical">
										<line id="SvgjsLine2933" x1="0" y1="0" x2="0"
											y2="248.269332818985" stroke="#eceef1" stroke-dasharray="10"
											stroke-linecap="butt" class="apexcharts-gridline"></line>
										<line id="SvgjsLine2934" x1="76.03958320617676" y1="0"
											x2="76.03958320617676" y2="248.269332818985" stroke="#eceef1"
											stroke-dasharray="10" stroke-linecap="butt"
											class="apexcharts-gridline"></line>
										<line id="SvgjsLine2935" x1="152.07916641235352" y1="0"
											x2="152.07916641235352" y2="248.269332818985"
											stroke="#eceef1" stroke-dasharray="10" stroke-linecap="butt"
											class="apexcharts-gridline"></line>
										<line id="SvgjsLine2936" x1="228.11874961853027" y1="0"
											x2="228.11874961853027" y2="248.269332818985"
											stroke="#eceef1" stroke-dasharray="10" stroke-linecap="butt"
											class="apexcharts-gridline"></line>
										<line id="SvgjsLine2937" x1="304.15833282470703" y1="0"
											x2="304.15833282470703" y2="248.269332818985"
											stroke="#eceef1" stroke-dasharray="10" stroke-linecap="butt"
											class="apexcharts-gridline"></line>
										<line id="SvgjsLine2938" x1="380.1979160308838" y1="0"
											x2="380.1979160308838" y2="248.269332818985" stroke="#eceef1"
											stroke-dasharray="10" stroke-linecap="butt"
											class="apexcharts-gridline"></line></g>
										<line id="SvgjsLine2940" x1="0" y1="248.269332818985"
											x2="378.6979160308838" y2="248.269332818985"
											stroke="transparent" stroke-dasharray="0"
											stroke-linecap="butt"></line>
										<line id="SvgjsLine2939" x1="0" y1="1" x2="0"
											y2="248.269332818985" stroke="transparent"
											stroke-dasharray="0" stroke-linecap="butt"></line></g>
										<g id="SvgjsG2856"
											class="apexcharts-bar-series apexcharts-plot-series">
										<g id="SvgjsG2857" class="apexcharts-series" rel="1"
											seriesName="seriesx1" data:realIndex="0">
										<path id="SvgjsPath2861"
											d="M 0.1 6.206733320474626L 371.7979160308838 6.206733320474626Q 378.7979160308838 6.206733320474626 378.7979160308838 13.206733320474626L 378.7979160308838 28.171488816022872Q 378.7979160308838 35.17148881602287 371.7979160308838 35.17148881602287L 371.7979160308838 35.17148881602287L 0.1 35.17148881602287L 0.1 35.17148881602287Q 0.1 35.17148881602287 0.1 35.17148881602287L 0.1 6.206733320474626Q 0.1 6.206733320474626 0.1 6.206733320474626z"
											fill="rgba(105,108,255,0.85)" fill-opacity="1"
											stroke-opacity="1" stroke-linecap="round" stroke-width="0"
											stroke-dasharray="0" class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskvcwz8vps)"
											pathTo="M 0.1 6.206733320474626L 371.7979160308838 6.206733320474626Q 378.7979160308838 6.206733320474626 378.7979160308838 13.206733320474626L 378.7979160308838 28.171488816022872Q 378.7979160308838 35.17148881602287 371.7979160308838 35.17148881602287L 371.7979160308838 35.17148881602287L 0.1 35.17148881602287L 0.1 35.17148881602287Q 0.1 35.17148881602287 0.1 35.17148881602287L 0.1 6.206733320474626Q 0.1 6.206733320474626 0.1 6.206733320474626z"
											pathFrom="M 0.1 6.206733320474626L 0.1 6.206733320474626L 0.1 35.17148881602287L 0.1 35.17148881602287L 0.1 35.17148881602287L 0.1 35.17148881602287L 0.1 35.17148881602287L 0.1 6.206733320474626"
											cy="47.584955456972125" cx="378.7979160308838" j="0" val="35"
											barHeight="28.964755495548246" barWidth="378.6979160308838"></path>
										<path id="SvgjsPath2867"
											d="M 0.1 47.584955456972125L 209.49880916050503 47.584955456972125Q 216.49880916050503 47.584955456972125 216.49880916050503 54.584955456972125L 216.49880916050503 69.54971095252037Q 216.49880916050503 76.54971095252037 209.49880916050503 76.54971095252037L 209.49880916050503 76.54971095252037L 0.1 76.54971095252037L 0.1 76.54971095252037Q 0.1 76.54971095252037 0.1 76.54971095252037L 0.1 47.584955456972125Q 0.1 47.584955456972125 0.1 47.584955456972125z"
											fill="rgba(3,195,236,0.85)" fill-opacity="1"
											stroke-opacity="1" stroke-linecap="round" stroke-width="0"
											stroke-dasharray="0" class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskvcwz8vps)"
											pathTo="M 0.1 47.584955456972125L 209.49880916050503 47.584955456972125Q 216.49880916050503 47.584955456972125 216.49880916050503 54.584955456972125L 216.49880916050503 69.54971095252037Q 216.49880916050503 76.54971095252037 209.49880916050503 76.54971095252037L 209.49880916050503 76.54971095252037L 0.1 76.54971095252037L 0.1 76.54971095252037Q 0.1 76.54971095252037 0.1 76.54971095252037L 0.1 47.584955456972125Q 0.1 47.584955456972125 0.1 47.584955456972125z"
											pathFrom="M 0.1 47.584955456972125L 0.1 47.584955456972125L 0.1 76.54971095252037L 0.1 76.54971095252037L 0.1 76.54971095252037L 0.1 76.54971095252037L 0.1 76.54971095252037L 0.1 47.584955456972125"
											cy="88.96317759346962" cx="216.49880916050503" j="1" val="20"
											barHeight="28.964755495548246" barWidth="216.39880916050504"></path>
										<path id="SvgjsPath2873"
											d="M 0.1 88.96317759346962L 144.57916641235352 88.96317759346962Q 151.57916641235352 88.96317759346962 151.57916641235352 95.96317759346962L 151.57916641235352 110.92793308901787Q 151.57916641235352 117.92793308901787 144.57916641235352 117.92793308901787L 144.57916641235352 117.92793308901787L 0.1 117.92793308901787L 0.1 117.92793308901787Q 0.1 117.92793308901787 0.1 117.92793308901787L 0.1 88.96317759346962Q 0.1 88.96317759346962 0.1 88.96317759346962z"
											fill="rgba(113,221,55,0.85)" fill-opacity="1"
											stroke-opacity="1" stroke-linecap="round" stroke-width="0"
											stroke-dasharray="0" class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskvcwz8vps)"
											pathTo="M 0.1 88.96317759346962L 144.57916641235352 88.96317759346962Q 151.57916641235352 88.96317759346962 151.57916641235352 95.96317759346962L 151.57916641235352 110.92793308901787Q 151.57916641235352 117.92793308901787 144.57916641235352 117.92793308901787L 144.57916641235352 117.92793308901787L 0.1 117.92793308901787L 0.1 117.92793308901787Q 0.1 117.92793308901787 0.1 117.92793308901787L 0.1 88.96317759346962Q 0.1 88.96317759346962 0.1 88.96317759346962z"
											pathFrom="M 0.1 88.96317759346962L 0.1 88.96317759346962L 0.1 117.92793308901787L 0.1 117.92793308901787L 0.1 117.92793308901787L 0.1 117.92793308901787L 0.1 117.92793308901787L 0.1 88.96317759346962"
											cy="130.34139972996712" cx="151.57916641235352" j="2"
											val="14" barHeight="28.964755495548246"
											barWidth="151.47916641235352"></path>
										<path id="SvgjsPath2879"
											d="M 0.1 130.34139972996712L 122.939285496303 130.34139972996712Q 129.939285496303 130.34139972996712 129.939285496303 137.34139972996712L 129.939285496303 152.30615522551537Q 129.939285496303 159.30615522551537 122.939285496303 159.30615522551537L 122.939285496303 159.30615522551537L 0.1 159.30615522551537L 0.1 159.30615522551537Q 0.1 159.30615522551537 0.1 159.30615522551537L 0.1 130.34139972996712Q 0.1 130.34139972996712 0.1 130.34139972996712z"
											fill="rgba(133,146,163,0.85)" fill-opacity="1"
											stroke-opacity="1" stroke-linecap="round" stroke-width="0"
											stroke-dasharray="0" class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskvcwz8vps)"
											pathTo="M 0.1 130.34139972996712L 122.939285496303 130.34139972996712Q 129.939285496303 130.34139972996712 129.939285496303 137.34139972996712L 129.939285496303 152.30615522551537Q 129.939285496303 159.30615522551537 122.939285496303 159.30615522551537L 122.939285496303 159.30615522551537L 0.1 159.30615522551537L 0.1 159.30615522551537Q 0.1 159.30615522551537 0.1 159.30615522551537L 0.1 130.34139972996712Q 0.1 130.34139972996712 0.1 130.34139972996712z"
											pathFrom="M 0.1 130.34139972996712L 0.1 130.34139972996712L 0.1 159.30615522551537L 0.1 159.30615522551537L 0.1 159.30615522551537L 0.1 159.30615522551537L 0.1 159.30615522551537L 0.1 130.34139972996712"
											cy="171.71962186646462" cx="129.939285496303" j="3" val="12"
											barHeight="28.964755495548246" barWidth="129.839285496303"></path>
										<path id="SvgjsPath2885"
											d="M 0.1 171.71962186646462L 101.29940458025251 171.71962186646462Q 108.29940458025251 171.71962186646462 108.29940458025251 178.71962186646462L 108.29940458025251 193.68437736201287Q 108.29940458025251 200.68437736201287 101.29940458025251 200.68437736201287L 101.29940458025251 200.68437736201287L 0.1 200.68437736201287L 0.1 200.68437736201287Q 0.1 200.68437736201287 0.1 200.68437736201287L 0.1 171.71962186646462Q 0.1 171.71962186646462 0.1 171.71962186646462z"
											fill="rgba(255,62,29,0.85)" fill-opacity="1"
											stroke-opacity="1" stroke-linecap="round" stroke-width="0"
											stroke-dasharray="0" class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskvcwz8vps)"
											pathTo="M 0.1 171.71962186646462L 101.29940458025251 171.71962186646462Q 108.29940458025251 171.71962186646462 108.29940458025251 178.71962186646462L 108.29940458025251 193.68437736201287Q 108.29940458025251 200.68437736201287 101.29940458025251 200.68437736201287L 101.29940458025251 200.68437736201287L 0.1 200.68437736201287L 0.1 200.68437736201287Q 0.1 200.68437736201287 0.1 200.68437736201287L 0.1 171.71962186646462Q 0.1 171.71962186646462 0.1 171.71962186646462z"
											pathFrom="M 0.1 171.71962186646462L 0.1 171.71962186646462L 0.1 200.68437736201287L 0.1 200.68437736201287L 0.1 200.68437736201287L 0.1 200.68437736201287L 0.1 200.68437736201287L 0.1 171.71962186646462"
											cy="213.09784400296212" cx="108.29940458025251" j="4"
											val="10" barHeight="28.964755495548246"
											barWidth="108.19940458025252"></path>
										<path id="SvgjsPath2891"
											d="M 0.1 213.09784400296212L 90.47946412222726 213.09784400296212Q 97.47946412222726 213.09784400296212 97.47946412222726 220.09784400296212L 97.47946412222726 235.06259949851037Q 97.47946412222726 242.06259949851037 90.47946412222726 242.06259949851037L 90.47946412222726 242.06259949851037L 0.1 242.06259949851037L 0.1 242.06259949851037Q 0.1 242.06259949851037 0.1 242.06259949851037L 0.1 213.09784400296212Q 0.1 213.09784400296212 0.1 213.09784400296212z"
											fill="rgba(255,171,0,0.85)" fill-opacity="1"
											stroke-opacity="1" stroke-linecap="round" stroke-width="0"
											stroke-dasharray="0" class="apexcharts-bar-area" index="0"
											clip-path="url(#gridRectMaskvcwz8vps)"
											pathTo="M 0.1 213.09784400296212L 90.47946412222726 213.09784400296212Q 97.47946412222726 213.09784400296212 97.47946412222726 220.09784400296212L 97.47946412222726 235.06259949851037Q 97.47946412222726 242.06259949851037 90.47946412222726 242.06259949851037L 90.47946412222726 242.06259949851037L 0.1 242.06259949851037L 0.1 242.06259949851037Q 0.1 242.06259949851037 0.1 242.06259949851037L 0.1 213.09784400296212Q 0.1 213.09784400296212 0.1 213.09784400296212z"
											pathFrom="M 0.1 213.09784400296212L 0.1 213.09784400296212L 0.1 242.06259949851037L 0.1 242.06259949851037L 0.1 242.06259949851037L 0.1 242.06259949851037L 0.1 242.06259949851037L 0.1 213.09784400296212"
											cy="254.47606613945962" cx="97.47946412222726" j="5" val="9"
											barHeight="28.964755495548246" barWidth="97.37946412222726"></path>
										<g id="SvgjsG2859" class="apexcharts-bar-goals-markers"
											style="pointer-events: none">
										<g id="SvgjsG2860" className="apexcharts-bar-goals-groups"></g>
										<g id="SvgjsG2866" className="apexcharts-bar-goals-groups"></g>
										<g id="SvgjsG2872" className="apexcharts-bar-goals-groups"></g>
										<g id="SvgjsG2878" className="apexcharts-bar-goals-groups"></g>
										<g id="SvgjsG2884" className="apexcharts-bar-goals-groups"></g>
										<g id="SvgjsG2890" className="apexcharts-bar-goals-groups"></g></g></g>
										<g id="SvgjsG2858" class="apexcharts-datalabels"
											data:realIndex="0">
										<g id="SvgjsG2863" class="apexcharts-data-labels"
											transform="rotate(0)">
										<text id="SvgjsText2865" font-family="Public Sans"
											x="189.44895801544192" y="25.022444560527802"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="200" fill="#ffffff"
											class="apexcharts-datalabel" cx="189.44895801544192"
											cy="25.022444560527802"
											style="font-family: &quot;Public Sans&quot;;">UI Design</text></g>
										<g id="SvgjsG2869" class="apexcharts-data-labels"
											transform="rotate(0)">
										<text id="SvgjsText2871" font-family="Public Sans"
											x="108.29940458025251" y="66.4006666970253"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="200" fill="#ffffff"
											class="apexcharts-datalabel" cx="108.29940458025251"
											cy="66.4006666970253"
											style="font-family: &quot;Public Sans&quot;;">UX Design</text></g>
										<g id="SvgjsG2875" class="apexcharts-data-labels"
											transform="rotate(0)">
										<text id="SvgjsText2877" font-family="Public Sans"
											x="75.83958320617675" y="107.7788888335228"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="200" fill="#ffffff"
											class="apexcharts-datalabel" cx="75.83958320617675"
											cy="107.7788888335228"
											style="font-family: &quot;Public Sans&quot;;">Music</text></g>
										<g id="SvgjsG2881" class="apexcharts-data-labels"
											transform="rotate(0)">
										<text id="SvgjsText2883" font-family="Public Sans"
											x="65.0196427481515" y="149.1571109700203"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="200" fill="#ffffff"
											class="apexcharts-datalabel" cx="65.0196427481515"
											cy="149.1571109700203"
											style="font-family: &quot;Public Sans&quot;;">Animation</text></g>
										<g id="SvgjsG2887" class="apexcharts-data-labels"
											transform="rotate(0)">
										<text id="SvgjsText2889" font-family="Public Sans"
											x="54.199702290126254" y="190.53533310651778"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="200" fill="#ffffff"
											class="apexcharts-datalabel" cx="54.199702290126254"
											cy="190.53533310651778"
											style="font-family: &quot;Public Sans&quot;;">React</text></g>
										<g id="SvgjsG2893" class="apexcharts-data-labels"
											transform="rotate(0)">
										<text id="SvgjsText2895" font-family="Public Sans"
											x="48.789732061113625" y="231.9135552430153"
											text-anchor="middle" dominant-baseline="auto"
											font-size="13px" font-weight="200" fill="#ffffff"
											class="apexcharts-datalabel" cx="48.789732061113625"
											cy="231.9135552430153"
											style="font-family: &quot;Public Sans&quot;;">SEO</text></g></g></g>
										<line id="SvgjsLine2941" x1="0" y1="0" x2="378.6979160308838"
											y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1"
											stroke-linecap="butt" class="apexcharts-ycrosshairs"></line>
										<line id="SvgjsLine2942" x1="0" y1="0" x2="378.6979160308838"
											y2="0" stroke-dasharray="0" stroke-width="0"
											stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line>
										<g id="SvgjsG2943" class="apexcharts-yaxis-annotations"></g>
										<g id="SvgjsG2944" class="apexcharts-xaxis-annotations"></g>
										<g id="SvgjsG2945" class="apexcharts-point-annotations"></g></g>
										<g id="SvgjsG2846" class="apexcharts-annotations"></g></svg>




								</div>
            <!-- /chat  -->
          </div>
        </div>
       
        
      </div>
    </div>
    <!--/ Total Income -->
  </div>
  <!--/ Total Income -->
</div>
<div class="row">
  
 
 

  
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
      