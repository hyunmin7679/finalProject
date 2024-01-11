<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="card">
	<div class="row row-bordered g-0">
		

			<div class="card-body" id="enedf">
				<!-- chart -->

			</div>
		


	</div>
</div>
<!--/ Total Income -->

<script type="text/javascript">
	$(function() {
		
		let url = "${pageContext.request.contextPath}/admin/community/bestChart";
		
		$.getJSON(url, function(data1) {
		var jsonData = data1.list;
	    var monthsArray = [];	
		
	    const data = jsonData.map(item => ({
	    	name: item.categoryName,
            y: item.postPercentage,
            drilldown:item.categoryName
     	}));
	    
		console.log(data);
		Highcharts
				.chart(
						'enedf',
						{
							chart : {
								type : 'column'
							},
							title : {
								align : 'left',
								text : '커뮤니티 게시글 카테고리 인기순'
							},
							subtitle : {
								align : 'left',
								text : ' '
							},
							accessibility : {
								announceNewData : {
									enabled : true
								}
							},
							xAxis : {
								type : 'category'
							},
							yAxis : {
								title : {
									text : '백분율'
								}

							},
							legend : {
								enabled : false
							},
							plotOptions : {
								series : {
									borderWidth : 0,
									dataLabels : {
										enabled : true,
										format : '{point.y:.1f}%'
									}
								}
							},

							tooltip : {
								headerFormat : '<span style="font-size:11px">{series.name}</span><br>',
								pointFormat : '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
							},

							series : [ {
								name : 'Category',
								colorByPoint : true,
								data : data
							} ],
						
						});
		});
	});
</script>