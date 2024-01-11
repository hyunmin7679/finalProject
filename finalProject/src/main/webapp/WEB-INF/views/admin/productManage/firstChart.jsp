<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>
<script type="text/javascript">

$(function(){
	
    let url = "${pageContext.request.contextPath}/admin/productManage/chart1"; 
    $.getJSON(url, function(data){
      chartsCate1(data);   
    });
    
    
    function chartsCate1(data){
    	console.log(data);
    	
    	let weekData=[];
    	for (let item of data.chart1){
    		
    		let obj = {'카테고리':item.product_category, '3주 전':item.three_weeks_ago,'2주 전':item.two_weeks_ago, '1주 전':item.one_week_ago,'이번주':item.this_week};
    		weekData.push(obj);
    	}
    	var chartDom = document.getElementById('first');
    	var myChart = echarts.init(chartDom);
    	var option;
    	
    	option = {
    	  legend: {},
    	  tooltip: {},
    	  dataset: {
    	    source:weekData
    	  },
    	  xAxis: [
    	    { type: 'category', gridIndex: 0 },
    	    { type: 'category', gridIndex: 1 }
    	  ],
    	  yAxis: [{ gridIndex: 0 }, { gridIndex: 1 }],
    	  grid: [{ bottom: '18.4%'}, { top: '55%' }],
    	  series: [
    		    // These series are in the first grid.
    		    // These series are in the second grid.
    		    { type: 'bar', seriesLayoutBy: 'row' },
    		    { type: 'bar', seriesLayoutBy: 'row' },
    		    { type: 'bar', seriesLayoutBy: 'row' },
    		    { type: 'bar', seriesLayoutBy: 'row' }
    		  ]
    	};

    	option && myChart.setOption(option);
    	
    
    
    
    }
});    



</script>

<div id="first" style="min-width: 45%; min-height: 380px;" class="mt-4">

</div>

