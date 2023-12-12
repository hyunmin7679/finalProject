<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

body {
   font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
   background: #fff7f6;
   
}

	h1 { font-size : 70px; text-align: center;}
	h2 { font-size : 60px; text-align: center;}
	h3 { font-size : 50px; text-align: center;}
	
	.main{display: flex;}
	.main-title { flex:right; }
	.img1 { flex: left; margin-right: 400px;}
	
	
	.main-subtitle { font-size: "30px"; font-weight: bold;}
	pre{font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;  font-size: 15px;}
	.p1{font-size: 20px; margin-left: 40px; margin-top: 20px;}
	
	
	.container1{display: flex; justify-content: center;}
	.item1{width: 15%;}
	.item11{width: 70%; justify-content: center; }
	.item111{width: 15%; }
	
	.container2{display: flex; justify-content: center;}
	.item2{align-items: center;}
	.item22{align-self: flex-end; }
	
.item2 > p{text-align: center; vertical-align: middle; }
  
</style>

<div class="body-container">
    <div class="inner-page">
    	<div class="container1">
	    	<div class="item1">
				<img src="${pageContext.request.contextPath}/resources/images/star.jpg" width="100px;" class="img1">
			</div>
			<div class="item11">
						
				<h1>EVERY PET</h1>
				<h2>DESERVES</h2>
				<h3>THE BEST</h3>
				
			</div>
			<div class="item111">
			</div>
		</div>
		
		<div class="main-subtitle">
			<p class="p1" >두다뽀코별은...</p>
		</div>
		
		<div>
			<pre><strong>
			반려동물과 함께 살아가고 있는 4인 외 1명이 함께 우리 가족을 위해 최고의 것들을 
				선물하기 위해 반려동물의 이름에서 한글자씩 따서 이름을 짓고 힘을 합쳐 만들게 된 쇼핑몰입니다.
			</strong></pre>
		</div>
		
		<div class="container2">
			<div class="item2" >
				<p> <strong>멋쟁이 정장 </strong></p>
				<p> 트루사루디의 멋쟁이 정장은 우리아이의</p>
				<p> 개구지고 귀여운 모습을 선보여주고 있습니다 </p>
			</div>
			<div class="item22">
				<img src="${pageContext.request.contextPath}/resources/images/main_photo.jpg">
			</div>
		</div>
		
		
		
		
		
		
    </div>
</div>