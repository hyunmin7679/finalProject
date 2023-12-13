<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

<style type="text/css">

* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

 .container {
 	max-width: 800px; 
 }
 
.body-container {
    width: 1000px;
    height: 100%;
    position: center;
    padding: 70px 50px 50px 70px;
    border-radius: 40px 80px;
    background: #ffffff;
}

body {
   font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
   background: #fff7f6;
}

 p {padding-top: 20px;}
 img {width: 50px;}
 th td {margin: 30px;}
 input {border: none; margin: 20px auto; width: 100%}

</style>


</head>
<body>

	<div class="container body-container">
		<div>
			<h2><img src="${pageContext.request.contextPath}/resources/images/pet.png"> 비회원 주문조회</h2>
			<p> 비회원의 경우, 주문번호로 주문조회가 가능합니다. </p>
		</div>
		
		<div>
			<table class= "table table-sm">
				<tr>
					<td>
						<input name="order_name" class="inputTypeText" placeholder="주문자명" type="text">
					</td>
				</tr>
				<tr>
					<th>주문번호</th>
					<td>
						<input type="text" name="orderNum">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="pwd">
					</td>
				</tr>
			</table>
		</div>
		
	</div>
	
	

</body>
</html>