<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div id="daychart"></div>



<script type="text/javascript">

	
		

	$(function() {
		
		let gogo = '${gogo}';
		console.log(gogo);
		let url = "${pageContext.request.contextPath}/admin/statistics/dayChart?gogo="+gogo;
		
		$.getJSON(url, function(data1) {
			
		var jsonData = data1.list;
        var monthsArray = [];
        
		const data = jsonData.map(item => ({
	            date: item.daySale_date,
	            temperature: item.daySale
	     }));
		
		const weekdays = [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ];

		// The function takes in a dataset and calculates how many empty tiles needed
		// before and after the dataset is plotted.
		function generateChartData(data) {

			// Calculate the starting weekday index (0-6 of the first date in the given
			// array)
			const firstWeekday = new Date(data[0].date).getDay(), monthLength = data.length, lastElement = data[monthLength - 1].date, lastWeekday = new Date(
					lastElement).getDay(), lengthOfWeek = 6, emptyTilesFirst = firstWeekday, chartData = [];

			// Add the empty tiles before the first day of the month with null values to
			// take up space in the chart
			for (let emptyDay = 0; emptyDay < emptyTilesFirst; emptyDay++) {
				chartData.push({
					x : emptyDay,
					y : 5,
					value : null,
					date : null,
					custom : {
						empty : true
					}
				});
			}

			// Loop through and populate with temperature and dates from the dataset
			for (let day = 1; day <= monthLength; day++) {
				// Get date from the given data array
				const date = data[day - 1].date;
				// Offset by thenumber of empty tiles
				const xCoordinate = (emptyTilesFirst + day - 1) % 7;
				const yCoordinate = Math.floor((firstWeekday + day - 1) / 7);
				const id = day;

				// Get the corresponding temperature for the current day from the given
				// array
				const temperature = data[day - 1].temperature;

				chartData.push({
					x : xCoordinate,
					y : 5 - yCoordinate,
					value : temperature,
					date : new Date(date).getTime(),
					custom : {
						monthDay : id
					}
				});
			}

			// Fill in the missing values when dataset is looped through.
			const emptyTilesLast = lengthOfWeek - lastWeekday;
			for (let emptyDay = 1; emptyDay <= emptyTilesLast; emptyDay++) {
				chartData.push({
					x : (lastWeekday + emptyDay) % 7,
					y : 0,
					value : null,
					date : null,
					custom : {
						empty : true
					}
				});
			}
			return chartData;
		}
		
		
		
		const chartData = generateChartData(data);

		Highcharts
				.chart(
						'daychart',
						{
							chart : {
								type : 'heatmap'
							},

							title : {
								text : '일별 판매현황',
								align : 'center'
							},

							subtitle : {
								text : '',
								align : 'left'
							},

							accessibility : {
								landmarkVerbosity : 'one'
							},

							tooltip : {
								 enabled: true,
							        outside: true,
							        zIndex: 20,
							        headerFormat: '',
							        pointFormat: '{#unless point.custom.empty}{point.date:%A, %b %e, %Y}: {point.value:.1f}원{/unless}',
							        nullFormat: '<div style="padding: 3px; border: 1px solid #ccc; background-color: #fff;">No data</div>'
							},

							xAxis : {
								categories : weekdays,
								opposite : true,
								lineWidth : 26,
								offset : 13,
								lineColor : 'rgba(27, 26, 37, 0.2)',
								labels : {
									rotation : 0,
									y : 20,
									style : {
										textTransform : 'uppercase',
										fontWeight : 'bold'
									}
								},
								accessibility : {
									description : 'weekdays',
									rangeDescription : 'X Axis is showing all 7 days of the week, starting with Sunday.'
								}
							},

							yAxis : {
								min : 0,
								max : 5,
								accessibility : {
									description : 'weeks'
								},
								visible : false
							},

							legend : {
								enabled: false  // 오른쪽 바(legend)를 숨김
							},

							colorAxis : {
								 min: 0,
								    max: 1,  // Set max value to 1 to make all colors the same
								    stops: [
								    	  [0, 'rgba(0, 0, 255, 0.1)'],  // Very light blue color
								    ],
								    labels: {
								        format: '{value} 원'
								    }
							},

							series : [ {
								keys : [ 'x', 'y', 'value', 'date', 'id' ],
								data : chartData,
								nullColor : 'rgba(196, 196, 196, 0.2)',
								borderWidth : 2,
								borderColor : 'rgba(196, 196, 196, 0.2)',
								dataLabels : [
										{
											enabled : true,
											format : '{#unless point.custom.empty}{point.value:.0f} 원{/unless}',
											style : {
												textOutline : 'none',
												fontWeight : 'normal',
												fontSize : '1rem'
											}
										},
										{
											enabled : true,
											align : 'left',
											verticalAlign : 'top',
											format : '{#unless point.custom.empty}{point.custom.monthDay}{/unless}',
											backgroundColor : 'whitesmoke',
											padding : 2,
											style : {
												textOutline : 'none',
												color : 'rgba(70, 70, 92, 1)',
												fontSize : '0.8rem',
												fontWeight : 'bold',
												opacity : 0.5,
												
											},
											x : 1,
											y : 1
										} ]
							} ]
						});
		});
	});
</script>