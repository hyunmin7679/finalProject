<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style> 
* { padding: 0; margin: 0; }

.boay-container {
	margin-top: 200px;
	padding: 70px;
	background: #fff;
	height: 350px;
	background-color: #003166;
}

.img {float: left; width: 300px; padding-left: 20px; margin: 0}
.pre  {color: white; text-align: left; font-size: 12px;}
.a {margin: 30px; color: white;}
.color {color: white; text-align: center}
</style>

<div class="boay-container">
  	<div>
  		<img class="img"  src="${pageContext.request.contextPath}/resources/images/logo.png">
  	</div>
  	<div>
	<div>
		<pre class="pre">
       	디디피(DDP Co., Ltd.)
       	주소 : 서울특별시 마포구 테OO로44길 8, 2층
       	사업자등록번호 : 304-81-00000
       	통신판매업 신고번호 : 2020-서울강남-01687
       	대표 : 김도훈ㅣ개인정보보호책임자 : 김현민
       	이메일 : ddppet@gmail.com
       	고객센터 번호 : 1644-0000
       	월-금 | 9:30-17:00(점심시간 | 12:30-13:30)
       	</pre> 
   </div> 
   	<div class="color">
   		<a class="a" href="#">NOTICE</a>
   		<a class="a" href="#">Q & A</a>
   		<a class="a" href="#">F & A</a>
   		<a class="a" href="#">EVENT</a>
   		<a class="a" href="#">이용약관</a>
   		<a class="a" href="#">제휴제안</a>
   		<a class="a" href="#">개인정보취급방침</a>
   		<a class="a" href="#">고객센터</a>
   	</div>
   	</div>
</div>




