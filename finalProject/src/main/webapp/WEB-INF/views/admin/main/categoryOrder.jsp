<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>
<script type="text/javascript">
  $(function(){
    let url = "${pageContext.request.contextPath}/admin/statistics/chart"; 
    $.getJSON(url, function(data){
      chartsCate(data);   
    });
    
    function chartsCate(data){
      var chartDom = document.getElementById('orderStatisticsChart');
      var myChart = echarts.init(chartDom);
      var option = {
        tooltip: {
          trigger: 'item'
        },
        series: [
          {
            
            type: 'pie',
            radius: ['50%', '70%'],
            avoidLabelOverlap: false,
            label: {
              show: false,
              position: 'center'
            },
            emphasis: {
              label: {
                show: true,
                fontSize: 25,
                fontWeight: 'bold'
              }
            },
            labelLine: {
              show: false
            },
            data: [
              { value: data.feedcount, name: data.feedrange },
              { value: data.snackcount, name: data.snackrange },
              { value: data.stuffcount, name: data.stuffrange }
            ]
          }
        ]
      };
      
      myChart.setOption(option);
    }
  });
</script>

<div class="card h-100">
	<div
		class="card-header d-flex align-items-center justify-content-between pb-0">
		<div class="card-title mb-0">
			<h5 class="m-0 me-2">카테고리별 주문현황</h5>
		</div>
		<div class="dropdown">
			<button class="btn p-0" type="button" id="orederStatistics"
				data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				
			</button>
			<div class="dropdown-menu dropdown-menu-end"
				aria-labelledby="orederStatistics">
				<a class="dropdown-item" href="javascript:void(0);">새로고침</a> <a
					class="dropdown-item" href="javascript:void(0);">주간</a> <a
					class="dropdown-item" href="javascript:void(0);">월간</a> <a
					class="dropdown-item" href="javascript:void(0);">연간</a>
			</div>
		</div>
	</div>
	<div class="card-body">
		<div class="d-flex justify-content-between align-items-center mb-3"
			style="position: relative;">
			<div class="d-flex flex-column align-items-center gap-1">
				<h2 class="mb-2">${total}</h2>
				<span>전체 주문 수</span>
			</div>
			<div id="orderStatisticsChart" style="min-height: 230px; min-width: 230px;">
				
			</div>
			<div class="resize-triggers">
				<div class="expand-trigger">
					<div style="width: 298px; height: 139px;"></div>
				</div>
				<div class="contract-trigger"></div>
			</div>
		</div>
		<ul class="p-0 m-0">
			<li class="d-flex mb-4 pb-1">
				<div class="avatar flex-shrink-0 me-3">
					<span class="avatar-initial rounded bg-label-primary"><i
						class="bx bx-mobile-alt"></i></span>
				</div>
				<div
					class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
					<div class="me-2">
						<h6 class="mb-0">${feedrange}</h6>
					</div>
					<div class="user-progress">
						<small class="fw-semibold">${feedcount }건</small>
					</div>
				</div>
			</li>
			<li class="d-flex mb-4 pb-1">
				<div class="avatar flex-shrink-0 me-3">
					<span class="avatar-initial rounded bg-label-success"><i
						class="bx bx-closet"></i></span>
				</div>
				<div
					class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
					<div class="me-2">
						<h6 class="mb-0">${snackrange }</h6>
					</div>
					<div class="user-progress">
						<small class="fw-semibold">${snackcount }건</small>
					</div>
				</div>
			</li>
			<li class="d-flex mb-4 pb-1">
				<div class="avatar flex-shrink-0 me-3">
					<span class="avatar-initial rounded bg-label-warning"><i
						class="bx bx-home-alt"></i></span>
				</div>
				<div
					class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
					<div class="me-2">
						<h6 class="mb-0">${stuffrange }</h6>
					</div>
					<div class="user-progress">
						<small class="fw-semibold">${stuffcount }건</small>
					</div>
				</div>
			</li>
		</ul>
	</div>
</div>