<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.4.3/echarts.min.js"></script>
<script type="text/javascript">

$(function(){
	
    let url = "${pageContext.request.contextPath}/admin/productManage/chart2"; 
    $.getJSON(url, function(data){
      chartsCate2(data);   
    });
    
    
    function chartsCate2(data){
		console.log(data);
    	
    	let dailyData=[];
    	let names=[];
    	for (let item of data.chart2){
    		
    		let obj={'name':item.allproduct_category,'type':'line', 'stack': '', 'data':[item.seven,item.six,item.five,item.four,item.three,item.two,item.one,item.today]}
    		dailyData.push(obj);
    		let n = {'name':item.allproduct_category}
    		names.push(n);
    	}
    	
    	
    	var chartDom = document.getElementById('second');
    	var myChart = echarts.init(chartDom);
    	var option;

    	option = {
    	  title: {
    	    text: ''
    	  },
    	  tooltip: {
    	    trigger: 'axis'
    	  },
    	  legend: {
    	    data:names
    	  },
    	  grid: {
    	    left: '3%',
    	    right: '4%',
    	    bottom: '3%',
    	    containLabel: true
    	  },
    	  toolbox: {
    	    feature: {
    	      saveAsImage: {}
    	    }
    	  },
    	  xAxis: {
    	    type: 'category',
    	    boundaryGap: false,
    	    data: ['7일전','6일전', '5일전', '4일전', '3일전', '이틀전', '어제', '오늘']
    	  },
    	  yAxis: {
    	    type: 'value'
    	  },
    	  series: dailyData
    	};

    	option && myChart.setOption(option);

    }
});    

</script>

<div id="second"style="min-width: 40%; min-height: 380px;" class="mt-2"></div>

