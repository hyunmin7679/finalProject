<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div id="hidgd" style="min-width: 310px; height: 400px; margin: 0 auto"></div>


 <script type="text/javascript">
 
 $(function(){
	 
	 let selectedYear = ${selectedYear};
	 
	 if(selectedYear == null || typeof selectedYear === 'undefined'){
		 selectedYear = 2024; 
	 }
	 let beforeYear = -selectedYear;
	 
	 let url = "${pageContext.request.contextPath}/admin/statistics/higtchart?selectedYear="+selectedYear;
	 
	 
	 $.getJSON(url, function(data){
		
		var jsonData = data.list;
		var monthsArray = [];
		
		jsonData.forEach(function(item) {
	           monthsArray.push(item.pay);
	    });
		
		var jsonData2 = data.list2;
		var monthsArray2 = [];
		
		jsonData2.forEach(function(item) {
	           monthsArray2.push(item.pay);
	    });
		
		
        Highcharts.chart('hidgd', {
            chart: {
                type: 'column'
            },
            title: {
                text: '매출현황',
                align: 'center'
            },
            subtitle: {
            },
            xAxis: {
                categories: ['1월', '2월', '3월', '4월', '5월', '6월','7월','8월','9월','10월','11월','12월'],
                crosshair: true,
                accessibility: {
                    description: 'Countries'
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: ' '
                },
            	labels: {
                formatter: function () {
                    return this.value / 1000; 
                }
            }
            },
            tooltip: {
                valueSuffix: ' 원'
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [
                {
                    name: '2024',
                    data: monthsArray
                },
                {
                    name: '2023',
                    data: monthsArray2
                }
            ]
        });
        
	 });
 });
    </script>