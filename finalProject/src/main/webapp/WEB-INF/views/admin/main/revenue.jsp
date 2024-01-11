<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="chart"></div>

<div
	class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
	<div class="d-flex">
		<div class="me-2">
			<span class="badge bg-label-primary p-2"><i
				class="bx bx-dollar text-primary"></i></span>
		</div>
		<div class="d-flex flex-column">
			<small>2024</small>
			 <h6 style="font-size: 10px;" class="mb-0" id="currentY"></h6>
		</div>
	</div>
	<div class="d-flex">
		<div class="me-2">
			<span class="badge bg-label-info p-2"><i
				class="bx bx-wallet text-info"></i></span>
		</div>
		<div class="d-flex flex-column">
			<small>2023</small>
			 <h6 style="font-size: 10px;"  class="mb-0" id="beforeY"></h6>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		
		let url = "${pageContext.request.contextPath}/admin/statistics/roundedPercentage";

		$.getJSON(url, function(data) {
			let currentY = data.currentY;
			let beforeY = data.beforeY;
			 $("#currentY").text(new Intl.NumberFormat().format(currentY) + "원");
		     $("#beforeY").text(new Intl.NumberFormat().format(beforeY) + "원");

			
			
			var options = {
				series : [ data.increasePercentage ],
				chart : {
					height : 350,
					type : 'radialBar',
					offsetY : -10
				},
				plotOptions : {
					radialBar : {
						startAngle : -135,
						endAngle : 135,
						dataLabels : {
							name : {
								fontSize : '16px',
								color : undefined,
								offsetY : 120
							},
							value : {
								offsetY : 76,
								fontSize : '22px',
								color : undefined,
								formatter : function(val) {
									return val + "%";
								}
							}
						}
					}
				},
				fill : {
					type : 'gradient',
					gradient : {
						shade : 'dark',
						shadeIntensity : 0.5,
						gradientToColors : [ '#FFD700' ], // 끝 색상
						inverseColors : false,
						opacityFrom : 1,
						opacityTo : 1,
						stops : [ 0, 100 ],
					},
				},
				stroke : {
					dashArray : 4
				},
				labels : [ '매출 성장' ],
			};

			var chart = new ApexCharts(document.querySelector("#chart"),
					options);
			chart.render();
		});
	});
</script>