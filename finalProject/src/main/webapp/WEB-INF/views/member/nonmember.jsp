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

 .main .container {
 	max-width: 1000px; 
 }

 
.body-container {
    width: 800px;
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
 input {border: none; margin: 30px auto; width: 100%}
 .table-center { margin: 20px auto;}

</style>


</head>
<body>

  <div>	
	<div class="container body-container">
		<div class="">
			<h2><img src="${pageContext.request.contextPath}/resources/images/pet.png"> 비회원 주문조회</h2>
			<p> 비회원의 경우, 주문번호로 주문조회가 가능합니다. </p>
		</div>
		
		<div class="table-center">
			<table class= "table table-sm">
				<tr>
					<td>
						<input placeholder="주문자명" type="text" name="orderName" class="inputTypeText">
					</td>
				</tr>
				<tr>
					<td>
						<input placeholder="주문번호" type="text" name="orderNum">
					</td>
				</tr>
				<tr>
					<td>
						<input placeholder="비밀번호" type="password" name="orderPwd">
					</td>
				</tr>
			</table>
			
			<div class="d-grid gap-2 col-6 mx-auto mt-5">
				<button class="btn btn-outline-dark" type="button" >비회원 주문조회</button>
			</div>
				
		</div>
		
	</div>
</div>	
	
	

</body>
</html>