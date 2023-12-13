<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

 .main .container {
 	max-width: 1000px; 
 }
 
 .main {margin-top: 100px;}


body {
   font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
   background: #fff7f6;
   
}

	h1 { font-size : 70px; text-align: center;}
	h2 { font-size : 60px; text-align: center;}
	h3 { font-size : 50px; text-align: center;}
	
	.main{display: flex; margin-top: 100px;}
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
	.container3{display: flex; justify-content: center; margin-top: 50px;}
	
	.item2{align-items: center;}
	.item22{align-self: flex-end; }
	.item33{text-align: right; }
	
	.item2 > p {text-align: center; vertical-align: middle; }
	
	.img {margin-top: 100px; width : 150px;}
	img {margin: 10px;}
	.footer {margin: 100px 0;}
	
	/* 구름움직이기 */
	.jb {
                width: 100px;
                height: 100px;
                margin: 60px auto;
                transition: all ease 1s;
            }
            .jb:hover {
                transform: rotate( 45deg );
            }

            .jb:hover {
    transform: rotate( -45deg );
                }
  
  
</style>

<div class="main">
	<div class="container">
	    <div class="inner-page">
	    	<div class="container1">
		    	<div class="item1 jb">
					<img src="${pageContext.request.contextPath}/resources/images/star.jpg" width="100px;" class="img1">
				</div>
				<div class="item11">
							
					<h1>EVERY PET</h1>
					<h2>DESERVES</h2>
					<h3>THE BEST</h3>
				</div>
				
					
				
				
				<div class="item111 img jb">
	                <img src="${pageContext.request.contextPath}/resources/images/cloud.png">
	            
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
			
			<div>
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/1.jpg" style="margin-right: 30%; margin-left :10%;">
					<img src="${pageContext.request.contextPath}/resources/images/2.jpg">
				</div>
	
			</div>
			
			<div class="container2">
				<div class="item2" >
					<p style="padding-top: 30%;"><strong>멋쟁이 정장 </strong></p>
					
					<p> 트루사루디의 멋쟁이 정장은 우리아이의</p>
					<p> 개구지고 귀여운 모습을 선보여주고 있습니다 </p>
					<img class="item111" src="${pageContext.request.contextPath}/resources/images/6.png" style=" width: 100px; text-align: right;">
				</div>
				
				<div class="item22">
				</div>
				
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/main_photo.jpg">
				</div>
			</div>
	
				<div class="item33">		
					<img src="${pageContext.request.contextPath}/resources/images/5.png">
				</div>	
			    <div class="item2">
					<img src="${pageContext.request.contextPath}/resources/images/3.png">
				</div>
			
				<div class="container3">
					<div>
						<img src="${pageContext.request.contextPath}/resources/images/cat.png">
					</div>
					<div class="item2" >
						<p style="padding-top: 30%;"><strong>우아한 목걸이 </strong></p>
						
						<p> 세련되고 독창적이며, 계절마다 제안하는 </p>
		
						<p> 상상력과 영감은 최적의 스타일리쉬를 제공합니다.</p>
						<img src="${pageContext.request.contextPath}/resources/images/7.png" style=" width: 100px; text-align: right;">
				</div>
				
				<div class="item22">
				</div>	
			</div>

	    </div>
	</div>
</div>