<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
#kakaoLogin .btnKakao {
    margin-top: 10px;
    height: 40px;
    line-height: 30px;
    background-color: #fee500;
    background-size: 18px;
    background-position: 15px;
    color: #111;
    font-size: 15px;
    border-radius: 5px;
    width: 100%;
    display: block;
}
.btnlogin {
    margin-top: 10px;
    height: 40px;
    background-color: #113f89;
    background-size: 18px;
    background-position: 15px;
    color: #fff;
    font-size: 15px;
    border-radius: 5px;
    width: 100%;
    display: block;
}
</style>

<script type="text/javascript">
function sendLogin() {
    const f = document.loginForm;
	let str;
	
	str = f.userId.value.trim();
    if(!str) {
        f.userId.focus();
        return;
    }

    str = f.userPwd.value.trim();
    if(!str) {
        f.userPwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/member/login";
    f.submit();
}
</script>

<div class="container">
	<div class="body-container">	

        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="mt-5 p-4">
                    <form name="loginForm" action="" method="post" class="row g-3">
                        <img alt="My Image" src="${pageContext.request.contextPath}/resources/images/logo.png">
                        <div id="kakaoLogin" class="contents ">
						      <h2 class="title">로그인</h2>
						      <p class="text">카카오로 간편하게 로그인하세요.</p>
						      <div id="kakaoLogin" class="contents">
						     	 <a class="btn btnKakao" href="#none" 
						     	 onclick="#">
						     	 <img src=""> 카카오로 시작하기</a>
						     </div>
						</div>
						<div class="line_txt"><span class>OR</span></div>
                        <div class="col-12">
                            <label class="mb-1">아이디</label>
                            <input type="text" name="userId" class="form-control" placeholder="아이디">
                        </div>
                        <div class="col-12">
                            <label class="mb-1">패스워드</label>
                            <input type="password" name="userPwd" class="form-control" autocomplete="off" 
                            	placeholder="패스워드">
                        </div>
                        <div class="col-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMe">
                                <label class="form-check-label" for="rememberMe"> 아이디 저장</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="button" class="btn btnlogin float-end" onclick="sendLogin();">&nbsp;로그인&nbsp;<i class="bi bi-check2"></i></button>
                        </div>
                        <br>
                        <div class="col-12">
                            <button type="button" class="btn float-end" onclick="sendLogin();">&nbsp;비회원 주문조회&nbsp;</button>
                        </div>
                    </form>
                    <hr class="mt-4">
                    <div class="col-12">
                        <p class="text-center mb-0">
                        	<a href="#" class="text-decoration-none me-2">아이디 찾기</a>
                        	<a href="${pageContext.request.contextPath}/member/pwdFind" class="text-decoration-none me-2">패스워드 찾기</a>
                        	<a href="${pageContext.request.contextPath}/member/member" class="text-decoration-none">회원가입</a>
                        </p>
                    </div>
                </div>

                <div class="d-grid">
						<p class="form-control-plaintext text-center text-primary">${message}</p>
                </div>

            </div>
        </div>

	</div>
</div>