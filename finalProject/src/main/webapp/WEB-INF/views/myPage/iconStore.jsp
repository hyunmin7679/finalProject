<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
@import url('http://fonts.googleapis.com/earlyaccess/notosanskr.css');

ul, li, p { list-style:none; padding:0; margin:0; }
.fa-regular {text-align: center;}

.nav-tabs .nav-link {
	min-width: 170px;
	background: #f3f5f7;
	border-radius: 0;
	border-right: 1px solid #dbdddf;
	color: #333;
	font-weight: 600;
}

.nav-tabs .nav-link.active {
	background: #003166;
	color: #fff;
	border-radius: 0 60px 60px 0;
}

.tab-pane { min-height: 300px; }

.md-img { width: 100px; height: 100px; object-fit: cover; }



i { width: 25px;}
a { color:#003166; font-size: 15px;}
a:hover {color: black; text-decoration: none;}
.category-bar { margin-top: 40px; margin-bottom:20px; display: flex;
				align-items: center; border:1px solid #D8D8D8; border-radius: 30px; 
				background: #ffc303; position: relative;}
				
.bar-item{ width:150px; height:auto; text-align:center;}
.title {display: flex; justify-content: center; }
h3{font-weight: 900;}

.icombox {padding: 30px;}
.icon { width: 70px; height:auto; margin: 12px; border-radius: 22px; padding: 5px;}

.itembox {display: flex; justify-content: center; width: 65%;} 
.point-item{height:auto; text-align:center; margin: 10px; display: flex; align-items: center;}

.category-bar .mem_info { float: left; width: 50%; height: 100%;
  							  background:#ffffff; border-radius: 0 141px 141px 0;}


.img-wrap {
	width: ;
	position: relative;
}
.img-wrap img {
	width: 100%;
	height: 72px;
	vertical-align: middle;
}

</style>

<script>

</script>

<div class="container">
	<div class="category-bar">
		<div class="mem_info">
			<div style="display: flex; justify-content: center;">
				<a href="${pageContext.request.contextPath}/member/pwd"><img class="icon" 
					src="${pageContext.request.contextPath}/uploads/photo/${vo.iconImage}"></a>
				<div style="align-items: center; display: flex;">
					<p><strong>${sessionScope.member.userName} </strong>님&nbsp;|&nbsp;</p>
					<fmt:formatNumber value="${point}"/> P
				</div>
			</div>
		</div>

		<div class="itembox">
			<div class="bar-item p-3">
				<a href="${pageContext.request.contextPath}/wishlist/"><i class="fa-solid fa-heart"></i><br>위시리스트</a>
			</div>
			<div class="point-item">
				<i class="fa-solid fa-angle-right"></i>
			</div>
			<div class="bar-item p-3">
				<a href="${pageContext.request.contextPath}/friend/list"><i
					class="fa-solid fa-user-group"></i><br>친구목록</a>
			</div>
			<div class="point-item">
				<i class="fa-solid fa-angle-right"></i>
			</div>
			<div class="bar-item p-3">
				<a href="${pageContext.request.contextPath}/iconStore/list"><i
					class="fa-brands fa-shopify"></i><br>아이콘 상점</a>
			</div>
		</div>
	</div>



	<div class="row" style="height: 50px; ">
		<div class="d-flex justify-content-start mx-auto gap-3 float-end">
			<div class="col" style="font-size: 19px;">
					<input type="checkbox" name="except" value="1" id="except">
					<label for="except">
						<span>보유아이콘 제외</span>
					</label>
			</div>
			<div class="col text-end">
				<p style="padding-left: 15px; font-size: 19px;">보유 포인트 : ${point} 점 </p>
			</div>
		</div>
	</div>
	
	<div class="card " style="background-color: white;">
		<div class="card-datable ">
			<div class="tab-pane fade active show" id="navs-top-home"
				role="tabpanel">
				<!-- iconlist -->
				<c:forEach var="dto" items="${list}" varStatus="status">
					
					<c:if test="${dto.iconUse == 0}">
						<div class="d-flex flex-wrap mt-4 ms-3 me-2 " id="icons-container"
							style="border: none; float: left;">
							<div
								class="card icon-card cursor-pointer text-center mb-4 mx-2 pe-3 p-3"
								style="background-color: white; border: 0;">
								<button type="button" data-bs-toggle="modal"
									data-bs-target="#modalCenter" 
									data-icon-name="${dto.iconName}"
									data-icon-price="${dto.iconPrice}"
									data-icon-category="${dto.iconCategory}"
									data-icon-num="${dto.iconNum}"
									data-icon-iconimage="${dto.iconImage}">
		
		
									<img style="border: none; width: 70px; height: 70px;"
										src="${pageContext.request.contextPath}/uploads/photo/${dto.iconImage}">
		
									<div id="iconName" style="display: none;">${dto.iconName}</div>
									<div id="iconPrice" style="display: none;">${dto.iconPrice}</div>
									<div id="iconCategory" style="display: none;">${dto.iconCategory}</div>
		
								</button>
								<input type="hidden" style="padding-bottom: 0; margin-bottom: 0;" value="${dto.iconUse}"/>
							</div>
						</div>
					</c:if>
					<c:if test="${dto.iconUse == 1 || dto.iconUse == 2}">
						<div class="d-flex flex-wrap mt-4 ms-3 me-2 " id="icons-container"
							style="border: none; float: left;">
							<div
								class="card icon-card cursor-pointer text-center mb-4 mx-2 pe-3 p-3"
								style="background-color: white; border: 0;">
								<button type="button" data-bs-toggle="modal">
									
								<div class="img-wrap">
										<img style="border: none; width: 70px; height: 70px;"
										src="${pageContext.request.contextPath}/uploads/photo/${dto.iconImage}">	
									
									    <div style="position: absolute; top: 0px; ;opacity: 0.7; ">
									    	<img src="${pageContext.request.contextPath}/resources/images/iconcover.png"/>
									    </div>

								</div>
								<div id="iconName" style="display: none;">${dto.iconName}</div>
								<div id="iconPrice" style="display: none;">${dto.iconPrice}</div>
								<div id="iconCategory" style="display: none;">${dto.iconCategory}</div>
			
								</button>
								<input type="hidden" style="padding-bottom: 0; margin-bottom: 0;" value="${dto.iconUse}"/>							</div>
						</div>
					</c:if>
				</c:forEach>	
			</div>
		</div>
	</div>
</div>

<!-- modal -->
<div class="modal fade" id="modalCenter" tabindex="-1"
	style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modalCenterTitle">아이콘 자세히 보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body img-icon row justify-content-center"></div>

		</div>
	</div>
</div>

<script type="text/javascript">

    
function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	}
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false; 
		settings.contentType = false; 
	}
	
	$.ajax(url, settings);
}


$('#modalCenter').on( 'show.bs.modal',
	function(event) {
		// 모달을 트리거한 버튼을 가져오기
		let button = $(event.relatedTarget);

		let iconName = button.data('icon-name');
		let iconPrice = button.data('icon-price');
		let iconCategory = button.data('icon-category');
		let iconNum = button.data('icon-num');
		let iconImage = button.data('icon-iconimage');
		

		// 버튼의 데이터 속성에서 이미지 소스 가져오기
		let imageSrc = button.find('img').attr('src');

		let result = '<img style="max-width: 100px;" src="'
				+ imageSrc + '">';

		result += '<div class="text-center">'
		result += '<div> 이름 : ' + iconName + '</div>';
		result += '<div> 가격 : ' + iconPrice + '</div>';
		if (iconCategory === 1) {
			result += '<div> 카테고리 : 강아지 </div>';
		} else if (iconCategory === 2) {
			result += '<div> 카테고리 : 고양이 </div>';
		} else {
			result += '<div> 카테고리 : 기타 </div>';
		}
		result += '<button class="btn btn-danger buyIcon" data-num="'+ iconNum +'" data-iconPrice="'+ iconPrice +'" >아이콘 구매</button>'

		result += '<div>'
		// modal-body 내의 img의 src 속성 업데이트
		$('#modalCenter .img-icon').html(result);
});


$(function(){
	$('main').on('click', '.buyIcon', function() {
		//  아이콘 구매
		let iconNum = $(this).attr('data-num');
		let iconPrice = $(this).attr('data-iconPrice');
		
		let url = '${pageContext.request.contextPath}/iconStore/buy';
		let query = 'iconNum=' + iconNum + '&iconPrice=' + iconPrice;
		
		if(! confirm("아이콘을 구매하시겠습니까 ? ")) {
			  return;
		}
		
		const fn = function(data){
			if (data.state === 'false') {
				alert("포인트가 부족합니다!!")
				$('#modalCenter').modal('hide');
				return false;
            } else if(data.state ==='true'){
                alert("구매 완료되었습니다!!");
                location.reload();
                $('#modalCenter').modal('hide');
            }
			
			
		};
		
		
		ajaxFun(url, 'post', query, 'json', fn);
	});
});


document.addEventListener('DOMContentLoaded', function() {
    // DOM이 로드된 후 실행되는 코드

    // 체크박스의 변화에 따라 filterIcons 함수 호출
	var exceptCheckbox = document.querySelector('input[name="except"]');
    if (exceptCheckbox) {
        exceptCheckbox.addEventListener('change', filterIcons);
    }

    // 초기 상태에서 한 번 호출하여 초기 필터링
    filterIcons();

    // filterIcons 함수 정의
    function filterIcons() {
        var excludeOwned = exceptCheckbox.checked;

        var icons = document.querySelectorAll('.icon-card');
        
        icons.forEach(function(icon) {
            var iconUse = icon.querySelector('input').value;

            if (excludeOwned && (iconUse === '1' || iconUse === '2')) {
                icon.style.display = 'none';  // 보유아이콘 제외 체크되었고, 아이콘이 보유 중인 경우 숨김
            } else {
                icon.style.display = 'block';  // 그 외의 경우 보임
            }
        });
    }
});

</script>
