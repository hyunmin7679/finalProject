<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.search-container {
	display: flex;
	align-items: center;
	position: relative;
}

.search-container input {
	width: 80%; /* 검색 필드의 너비 조절 */
	margin-right: 5px; /* 검색 필드와 검색 버튼 간격 조절 */
}

.search-container button {
	width: 20%; /* 검색 버튼의 너비 조절 */
}
</style>
<form name="boardForm" method="post" enctype="multipart/form-data">
	<table class="table mt-5 write-form">
		<tr>
			<td class="bg-light col-sm-2" scope="row">제 목</td>
			<td><input type="text" name="subject" class="form-control"
				value="${dto.subject}"></td>
		</tr>

		<tr>
			<td class="bg-light col-sm-2" scope="row">작성자명</td>
			<td>
				<p class="form-control-plaintext">${sessionScope.member.userName}</p>
			</td>
		</tr>

		<tr>
			<td class="bg-light col-sm-2" scope="row">카테고리</td>
			<td><select name="categoryNum" class="form-select">
					<option value="1" ${dto.communityNum == 1 ? "selected" : ""}>나눔</option>
					<option value="2" ${dto.communityNum == 2 ? "selected" : ""}>상담</option>
					<option value="3" ${dto.communityNum == 3 ? "selected" : ""}>자유</option>
					<option value="4" ${dto.communityNum == 4 ? "selected" : ""}>산책메이트</option>
			</select></td>
		</tr>

		<tr>
			<td class="bg-light col-sm-2" scope="row">내 용</td>
			<td><textarea name="content" id="ir1" class="form-control"
					style="width: 99%; height: 300px;">${dto.content}</textarea></td>
		</tr>
		<!-- 
		<tr>
			<td class="bg-light col-sm-2" scope="row" >산책로이름</td>
			<td>
				<input type="text" name="parkname" class="form-control" value="${dto.parkname}">
			</td>
		</tr>
		<tr>
			<td class="bg-light col-sm-2" scope="row">산책로주소</td>
			<td>
				<input type="text" name="park" class="form-control" value="${dto.park}">
			</td>
		</tr>
		 -->
		<tr>
			<td class="bg-light col-sm-2" scope="row">이미지</td>
			<td>
				<div class="img-grid">
					<img class="item img-add rounded"
						src="${pageContext.request.contextPath}/resources/images/add_photo.png">
				</div> <input type="file" name="selectFile" accept="image/*" multiple
				style="display: none;" class="form-control">
			</td>
		</tr>

		<c:if test="${mode=='update'}">
			<tr>
				<td class="bg-light col-sm-2" scope="row">등록이미지</td>
				<td>
					<div class="img-box">
						<c:forEach var="vo" items="${listFile}">
							<img
								src="${pageContext.request.contextPath}/uploads/bbs/${vo.filename}"
								class="delete-img" data-fileNum="${vo.fileNum}">
						</c:forEach>
					</div>
				</td>
			</tr>
		</c:if>
	</table>

	<table class="table table-borderless" data-mode="${mode}">
		<tr>
			<td class="text-center">
				<button type="button" class="btn btn-dark"
					onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i
						class="bi bi-check2"></i>
				</button>
				<button type="reset" class="btn btn-light">다시입력</button>
				<button type="button" class="btn btn-light"
					onclick="sendCancel('${pageNo}');">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i
						class="bi bi-x"></i>
				</button> <c:if test="${mode=='update'}">
					<input type="hidden" name="communityNum"
						value="${dto.communityNum}">
					<input type="hidden" name="fileNum" value="${dto.fileNum}">
				</c:if>
			</td>
		</tr>
	</table>

	<div id="addressSection" style="display: none;">
	<hr/>
		<div style="text-align: center; background: skyblue;">
			<h3>산책로 경로 지정해주기 or 장소 정해주기</h3>
		</div>
		<hr />
		<div class="search-container">
			<input type="text" name="park" id="park" class="form-control"
				placeholder="주소를 정확하게 검색해주세요">
			<button class="btn btn-outline-secondary" type="button"
				onclick="searchAddress()">검색</button>
		</div>
	</div>
	<input type="hidden" name="distance">
</form>


<div id="map" style="width: 100%; height: 350px;"></div>




<c:if test="${mode=='update'}">
	<script type="text/javascript">
		$(function(){
			$(".delete-img").click(function(){
				if(! confirm("이미지를 삭제 하시겠습니까 ?")) {
					return false;
				}
				
				let $img = $(this);
				let fileNum = $img.attr("data-fileNum");
				let url="${pageContext.request.contextPath}/bbs/deleteFile";
				
				$.ajaxSetup({ beforeSend: function(e) { e.setRequestHeader('AJAX', true); } });
				$.post(url, {fileNum:fileNum}, function(data){
					$img.remove();
				}, "json").fail(function(){
					alert('error....');
				});
			});
		});
	</script>
</c:if>


<script type="text/javascript">


var categorySelect = document.getElementsByName("categoryNum")[0];
categorySelect.addEventListener("change", function() {
    toggleAddressInput();
});

function toggleAddressInput() {
    var selectedCategory = document.getElementsByName("categoryNum")[0].value;
    var addressSection = document.getElementById("addressSection");

    // 카테고리 값이 4(산책메이트)이면 보이도록, 그 외에는 숨기도록 설정
    if (selectedCategory == 4) {
        addressSection.style.display = "block";
    } else {
        addressSection.style.display = "none";
    }
}


var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
	 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	 try {
		if(! check()) {
			return;
		}
		
		let mode = "${mode}";
		let url = "${pageContext.request.contextPath}/bbs/" + mode;
	    let page = "${pageNo}";
	    let formData = new FormData(elClickedObj);
	    
	    const fn = function(data){
			let state = data.state;
	        if(state === "false") {
	            alert("게시물을 추가(수정)하지 못했습니다. !!!");
	            return false;
	        }
	        
	    	if(! page) {
	    		page = "1";
	    	}
	    	
	    	listPage(page);
		};
		
		ajaxFun(url, "post", formData, "json", fn, true);
		
	} catch(e) {
	}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 12;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}

$(function(){
	var sel_files = [];
	
	$(".write-form").on("click", ".img-add", function(event){
		$("form[name=boardForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=boardForm] input[name=selectFile]").change(function(){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.boardForm.selectFile.files = dt.files;
			
	    	return false;
	    }
	    
       for(let file of this.files) {
       	sel_files.push(file);
       	
           const reader = new FileReader();
			const $img = $("<img>", {class:"item img-item"});
			$img.attr("data-filename", file.name);
           reader.onload = e => {
           	$img.attr("src", e.target.result);
           };
			reader.readAsDataURL(file);
           
           $(".img-grid").append($img);
       }
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.boardForm.selectFile.files = dt.files;		
	    
	});
	
	$(".write-form").on("click", ".img-item", function(event) {
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
	    for(let i = 0; i < sel_files.length; i++) {
	    	if(filename === sel_files[i].name){
	    		sel_files.splice(i, 1);
	    		break;
			}
	    }
	
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.boardForm.selectFile.files = dt.files;
		
		$(this).remove();
	});
});
</script>



<script>
var distanceAll = [];
var allCoordinates = [];
var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
var startLinePosition; // 첫 클릭할때 좌표

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(0, 0), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };


function searchAddress() {
	var address = document.getElementById('park').value;
	
	// kakao.maps.load(function() {
	    var geocoder = new kakao.maps.services.Geocoder();
	    geocoder.addressSearch(address, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            mapOption.center = new kakao.maps.LatLng(result[0].y, result[0].x);
	            var map = new kakao.maps.Map(mapContainer, mapOption);
	            initializeDrawing(map);
	        }else {
	        	alert('주소가 잘못침!!');
	        }
	    });
	// });
}


// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
function initializeDrawing(map) {

	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

	    // 마우스로 클릭한 위치입니다 
	    var clickPosition = mouseEvent.latLng;

	    // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
	    if (!drawingFlag) {

	        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
	        drawingFlag = true;
	        
	        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
	        deleteClickLine();
	        
	        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
	        deleteDistnce();

	        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
	        deleteCircleDot();
	    
	        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
	        clickLine = new kakao.maps.Polyline({
	            map: map, // 선을 표시할 지도입니다 
	            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
	            strokeWeight: 3, // 선의 두께입니다 
	            strokeColor: '#db4040', // 선의 색깔입니다
	            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle: 'solid' // 선의 스타일입니다
	        });
	        
	        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
	        moveLine = new kakao.maps.Polyline({
	            strokeWeight: 3, // 선의 두께입니다 
	            strokeColor: '#db4040', // 선의 색깔입니다
	            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle: 'solid' // 선의 스타일입니다    
	        });
	    
	        // 클릭한 지점에 대한 정보를 지도에 표시합니다
	        displayCircleDot(clickPosition, 0);
			
	        // 클릭한 좌표 저장
	        saveCoordinate(clickPosition);
	            
	    } else { // 선이 그려지고 있는 상태이면

	        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
	        var path = clickLine.getPath();

	        // 좌표 배열에 클릭한 위치를 추가합니다
	        path.push(clickPosition);
	        
	        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
	        clickLine.setPath(path);

	        var distance = Math.round(clickLine.getLength());
	        displayCircleDot(clickPosition, distance);
	        
	        
	        saveCoordinate(clickPosition);
	    }
	});
	    
	// 지도에 마우스무브 이벤트를 등록합니다
	// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
	kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

	    // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
	    if (drawingFlag){
	        
	        // 마우스 커서의 현재 위치를 얻어옵니다 
	        var mousePosition = mouseEvent.latLng; 

	        // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
	        var path = clickLine.getPath();
	        
	        // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
	        var movepath = [path[path.length-1], mousePosition];
	        moveLine.setPath(movepath);    
	        moveLine.setMap(map);
	        
	        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
	            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
	        
	        // 거리정보를 지도에 표시합니다
	        showDistance(content, mousePosition);   
	    }             
	});                 

	// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
	// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
	kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

	    // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
	    if (drawingFlag) {
	    	
	        
	        // 마우스무브로 그려진 선은 지도에서 제거합니다
	        moveLine.setMap(null);
	        moveLine = null;  
	        
	        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
	        var path = clickLine.getPath();
	    
	        // 선을 구성하는 좌표의 개수가 2개 이상이면
	        if (path.length > 1) {

	            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
	            if (dots[dots.length-1].distance) {
	                dots[dots.length-1].distance.setMap(null);
	                dots[dots.length-1].distance = null;    
	            }

	            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
	                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
	                
	            // 그려진 선의 거리정보를 지도에 표시합니다
	            showDistance(content, path[path.length-1]); 
	             
	                
	             
	        } else {

	            // 선을 구성하는 좌표의 개수가 1개 이하이면 
	            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
	            deleteClickLine();
	            deleteCircleDot(); 
	            deleteDistnce();

	        }
	        
	        // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
	        drawingFlag = false;
	        
	    }  
	    
	});    

	// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
	function deleteClickLine() {
	    if (clickLine) {
	        clickLine.setMap(null);    
	        clickLine = null;        
	    }
	}

	// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
	// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
	function showDistance(content, position) {
	    
	    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
	        
	        // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
	        distanceOverlay.setPosition(position);
	        distanceOverlay.setContent(content);
	        
	    } else { // 커스텀 오버레이가 생성되지 않은 상태이면
	        
	        // 커스텀 오버레이를 생성하고 지도에 표시합니다
	        distanceOverlay = new kakao.maps.CustomOverlay({
	            map: map, // 커스텀오버레이를 표시할 지도입니다
	            content: content,  // 커스텀오버레이에 표시할 내용입니다
	            position: position, // 커스텀오버레이를 표시할 위치입니다.
	            xAnchor: 0,
	            yAnchor: 0,
	            zIndex: 3  
	        });      
	    }
	}

	// 그려지고 있는 선의 총거리 정보와 
	// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
	function deleteDistnce () {
	    if (distanceOverlay) {
	        distanceOverlay.setMap(null);
	        distanceOverlay = null;
	    }
	}

	// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
	// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
	function displayCircleDot(position, distance) {

	    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
	    var circleOverlay = new kakao.maps.CustomOverlay({
	        content: '<span class="dot"></span>',
	        position: position,
	        zIndex: 1
	    });

	    // 지도에 표시합니다
	    circleOverlay.setMap(map);

	    if (distance > 0) {
	        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
	        var distanceOverlay = new kakao.maps.CustomOverlay({
	            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
	            position: position,
	            yAnchor: 1,
	            zIndex: 2
	        });

	        // 지도에 표시합니다
	        distanceOverlay.setMap(map);
	    }

	    // 배열에 추가합니다
	    dots.push({circle:circleOverlay, distance: distanceOverlay});
	    
		// 현민이
		
		
		distanceAll.push(distance);
	    console.log(distance);
	}

	// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
	function deleteCircleDot() {
	    var i;

	    for ( i = 0; i < dots.length; i++ ){
	        if (dots[i].circle) { 
	            dots[i].circle.setMap(null);
	        }

	        if (dots[i].distance) {
	            dots[i].distance.setMap(null);
	        }
	    }

	    dots = [];
	}

	// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
	// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
	// HTML Content를 만들어 리턴하는 함수입니다
	function getTimeHTML(distance) {

	    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
	    var walkkTime = distance / 67 | 0;
	    var walkHour = '', walkMin = '';

	    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
	    if (walkkTime > 60) {
	        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
	    }
	    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

	    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
	    var bycicleTime = distance / 227 | 0;
	    var bycicleHour = '', bycicleMin = '';

	    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
	    if (bycicleTime > 60) {
	        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
	    }
	    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

	    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
	    var content = '<ul class="dotOverlay distanceInfo">';
	    content += '    <li>';
	    content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">도보</span>' + walkHour + walkMin;
	    content += '    </li>';
	    content += '    <li>';
	    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
	    content += '    </li>';
	    content += '</ul>'
	    
	
		const f = document.boardForm;
		console.log(distanceAll[distanceAll.length-1]);
		let distanceLast = distanceAll[distanceAll.length-1];
	   	console.log(distanceLast);
	  	/*   
    	if(distance.length >= 0){
	    	consoel.log(distance);
	  		f.distance.value = distance;
    	} */
	    f.distance.value = distanceLast;
	 
	    
	    
	    let las,mas;
	  
	   
	    for(item of allCoordinates){
	    	 las = item.La;
	    	 mas = item.Ma;
		     
		     var inputLa = document.createElement("input");
		        inputLa.type = "hidden";
		        inputLa.name = "las"
		        inputLa.value = las;
		        f.appendChild(inputLa);
		
		        var inputMa = document.createElement("input");
		        inputMa.type = "hidden";
		        inputMa.name = "mas" 
		        inputMa.value = mas;
		        f.appendChild(inputMa);
	    	 
	    }
	   
	    
	    allCoordinates = [];
	    
	    return content;
	}
	
	// 클릭한 좌표를 저장하는 함수
	function saveCoordinate(position) {
	    allCoordinates.push(position);
	    console.log('저장된 좌표:', allCoordinates);
	    // 여기에 좌표를 저장하는 로직을 추가하면 됩니다.
	    // 예: savedCoordinates.push(position);
	    
	    
	}
}
</script>
