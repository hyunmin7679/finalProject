<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.product-item {
	cursor: pointer;
	overflow: hidden;
}

.thumbnail-img {
	width: 100%;
	min-height: 210px;
	max-height: 210px;
	vertical-align: top;
	object-fit: cover;
}

.abc {
	width: 100%;
	border: 1px solid;
	text-align: left;
	border-radius: 20px;
	padding-left: 30px;
	font-weight: bold;
	font-size: 25px;
	background-color: rgb(0, 74, 153);
	height: 100px;
	border-color: rgb(204, 204, 0);
}
</style>

<script type="text/javascript">
	$(function() {
		$(".product-item").mouseenter(function(e) {
			$(this).find("img").css("transform", "scale(1.05)");
			$(this).find("img").css("overflow", "hidden");
			$(this).find("img").css("transition", "all 0.5s");
		});

		$(".product-item").mouseleave(function(e) {
			$(this).find("img").css("transform", "scale(1)");
			$(this).find("img").css("transition", "all 0.5s");
		});
	});

	$(function() {
		$(".product-item").click(
				function() {
					let productNum = $(this).attr("data-productNum");
					let url = "${pageContext.request.contextPath}/product/buy/"
							+ productNum;
					location.href = url;
				});
	});
</script>

<div class="container body-container">
	<div class=abc>
		<div class="mb-1 mt-2">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
				viewBox="0 0 24 24"
				style="fill: rgb(153, 202, 255); transform:; msFilter:;">
				<path
					d="M20 7h-1.209A4.92 4.92 0 0 0 19 5.5C19 3.57 17.43 2 15.5 2c-1.622 0-2.705 1.482-3.404 3.085C11.407 3.57 10.269 2 8.5 2 6.57 2 5 3.57 5 5.5c0 .596.079 1.089.209 1.5H4c-1.103 0-2 .897-2 2v2c0 1.103.897 2 2 2v7c0 1.103.897 2 2 2h12c1.103 0 2-.897 2-2v-7c1.103 0 2-.897 2-2V9c0-1.103-.897-2-2-2zm-4.5-3c.827 0 1.5.673 1.5 1.5C17 7 16.374 7 16 7h-2.478c.511-1.576 1.253-3 1.978-3zM7 5.5C7 4.673 7.673 4 8.5 4c.888 0 1.714 1.525 2.198 3H8c-.374 0-1 0-1-1.5zM4 9h7v2H4V9zm2 11v-7h5v7H6zm12 0h-5v-7h5v7zm-5-9V9.085L13.017 9H20l.001 2H13z"></path></svg>
		</div>
		<c:if test="${not empty friendname}">
			<span style="color: rgb(255, 255, 255)">${friendname}의</span>
		</c:if>
		<span style="color: rgb(255, 255, 255)">위시리스트</span>
	</div>
	<div class="row mt-1 wish-list"></div>
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
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}


(function() {
    wishlist(1);
})();

function wishlist(page) {
	let friendname = '${friendname}';
    let url = "${pageContext.request.contextPath}/wishlist/wishlist";
    let query = "page=" + page + '&friendname=' + friendname;
    let selector = ".wish-list";

    const fn = function(data) {
        $(selector).html(data);
    };

    ajaxFun(url, 'get', query, 'html', fn);
}


	


function addwish(pnum){
	
	const fn = function(data) {
    };
	let open = 0;
    url = "${pageContext.request.contextPath}/myPage/wishlist";
    query = "open=" + open + "&pnum=" + pnum;
    ajaxFun(url, 'post', query, 'json', fn);
	
}

function removewish(pnum){
	
	const fn = function(data) {
    };

    let url = "${pageContext.request.contextPath}/myPage/deletewish";
    let query = "pnum=" + pnum;
    ajaxFun(url, 'post', query, 'json', fn);
	
}


function addorremove(pnum) {
	
	const fn = function(data) {
    };
    
    
    console.log('Product ' + pnum + ' is checked.');
    let url = "${pageContext.request.contextPath}/wishlist/changeit"
    query = "pnum="+pnum;
    ajaxFun(url, 'post', query, 'json', fn);
    
}


</script>
