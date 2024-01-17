<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
:not(header){
@import "compass";
@import url(https://fonts.googleapis.com/css?family=Dancing+Script|Roboto);

*,
*:after,
*:before {
box-sizing: border-box;
}	

bbody {
	 background: rgb(255, 255, 255);
	 text-align: center;
	 font-family: 'Roboto', sans-serif;
}
 .panda {
	 position: relative;
	 width: 200px;
	 margin: 50px auto;
}
 .bface {
	 width: 200px;
	 height: 200px;
	 background: #fff;
	 border-radius: 100%;
	 margin: 50px auto;
	 box-shadow: 0 10px 15px rgba(0, 0, 0, .15);
	 z-index: 50;
	 position: relative;
	 box-shadow: 0 5px 10px rgb(38, 38, 38);
}

.bear, .bear:after {
	 position: absolute;
	 width: 80px;
	 height: 80px;
	 border: 3px solid black;
	 background: white;
	 z-index: 5;
	 border: 10px solid #fff;
	 left: -30px;
	 top: 70px;
	 border-radius: 100%;
	 box-shadow: 0 5px 10px rgb(38, 38, 38);
}
 .bear:after {
	 content: '';
	 left: 170px;
	 top: -10px;
}

.beye-shade {
	 background: white;
	 border-color:black;
	 width: 40px;
	 height: 40px;
	 margin: 10px;
	 position: absolute;
	 top: 60px;
	 left: 35px;
	 border-radius: 100%;
}
 .beye-shade.rgt {
	 left: 105px;
}

.beye-white {
	 position: absolute;
	 width: 60px;
	 height: 60px;
	 border-radius: 100%;
	 background: #fff;
	 z-index: 500;
	 left: 40px;
	 top: 80px;
	 overflow: ;
}
 .beye-white.rgt {
	 right: 40px;
	 left: auto;
}
 .beye-ball {
	 position: absolute;
	 width: 20px;
	 height: 20px;
	 left: 35px;
	 top: 25px;
	 max-width: 10px;
	 max-height: 10px;
	 transition: 0.1s;
}
 .beye-ball:after {
	 content: '';
	 background: #000;
	 position: absolute;
	 border-radius: 100%;
	 right: 0;
	 bottom: 0px;
	 width: 22px;
	 height: 22px;
}

.bcheek{
 	  position: relative;
      width: 200px;
      height: 100px;
      background-color: none;
      border: 1px solid #d9d9d9;
      border-top-left-radius: 150px;
      border-top-right-radius: 150px;
      overflow: hidden;
      top:110px;
      z-index: 800;
      
          
}
.blush{
	position: absolute;
	height: 10px;
	width: 20px;
	background: pink;
	border-radius: 40%;
	top: 110px;
	left: 30px;
	z-index: 900;

}
.blushr{
	position: absolute;
	height: 10px;
	width: 20px;
	background: pink;
	border-radius: 40%;
	top: 110px;
	left: 150px;
	z-index: 900;
}

.bnose {
	 position: absolute;
	 height: 20px;
	 width: 35px;
	 bottom: 65px;
	 z-index:700;
	 left: 0;
	 right: 0;
	 margin: auto;
	 border-radius: 50px 20px/ 30px 15px;
	 transform: rotate(15deg);
	 background: #000;
}
.bbody {
	 background: #fff;
	 position: absolute;
	 top: 200px;
	 left: -20px;
	 border-radius: 100px 100px 100px 100px / 126px 126px 96px 96px;
	 width: 250px;
	 height: 282px;
	 box-shadow: 0 5px 10px rgb(38, 38, 38);
}

.bhand {
  width: 60px;
  height: 60px;
  border-radius: 50px;
  box-shadow: 0 2px 3px rgb(38, 38, 38);
  background: white;
  margin: 5px;
  position: absolute;
  top: 70px;
  left: -25px;
}



.bhand.rgt {
  left: auto;
  right: -25px;
}

.bhand.rgt:after,
.bhand.rgt:before {
  left: auto;
  right: -5px;
}


.bfoot {
  top: 400px;
  left: -60px;
  position: absolute;
  background: white;
  z-index: 1400;
  box-shadow: 0 5px 5px rgb(38, 38, 38);
  border-radius: 40px 40px 39px 40px / 26px 26px 63px 63px;
  width: 86px;
  height: 90px;
}

.bfoot:after {
  content: '';
  width: 40px;
  height: 40px;
  background: black;
  border-radius: 100%;
  position: absolute;
  bottom: 10px;
  left: 0;
  right: 0;
  margin: auto;
}

.bfinger {
  position: absolute;
  width: 25px;
  height: 25px;
  background: black;
  box-shadow: 0 5px 5px rgb(38, 38, 38);
  border-radius: 100%;
  top: 20px;
  right: 5px;
}

.bfinger:after,
.bfinger:before {
  content: '';
  position: absolute;
  width: 25px;
  height: 25px;
  background: #222;
  border-radius: 100%;
}

.bfinger:after {
  right: 28px;
  top: -5px;
  width: 25px;
}

.bfinger:before {
  right: 55px;
  top: 5px;
}

.bfoot.rgt {
  left: auto;
  right: -80px;
}

.bfoot.rgt .bfinger {
  left: 5px;
  right: auto;
}

.bfoot.rgt .bfinger:after {
  left: 30px;
  right: auto;
}

.bfoot.rgt .bfinger:before {
  left: 55px;
  right: auto;
}

form {
  display: none;
  max-width: 400px;
  padding: 20px 40px;
  background: #fff;
  height: 300px;
  margin: auto;
  display: block;
  box-shadow: 0 10px 15px rgb(38, 38, 38);
  transition: 0.3s;
  position: relative;
  transform: translateY(-100px);
  z-index: 500;
  border: 1px solid #eee;
}

form.up {
  transform: translateY(-180px);
}

h1 {
  color: $primary;
  font-family: 'Dancing Script', cursive;
}

.btn {
  background: black;
  padding: 5px;
  width: 150px;
  height: 35px;
  border: 1px solid $primary;
  margin-top: 25px;
  cursor: pointer;
  transition: 0.3s;
  box-shadow: 0 50px $primary inset;
  color: #fff;
}

.btn:hover {
  box-shadow: 0 3px 5px rgb(38, 38, 38);
  color: $primary;
}

.btn:focus {
  outline: none;
}

.form-group {
  position: relative;
  font-size: 15px;
  color: #666;
}

.form-group + .form-group {
  margin-top: 30px;
}

.form-group .form-label {
  position: absolute;
  z-index: 1;
  left: 0;
  top: 5px;
  transition: 0.3s;
}

.form-group .form-control {
  width: 100%;
  position: relative;
  z-index: 3;
  height: 35px;
  background: none;
  border: none;
  padding: 5px 0;
  transition: 0.3s;
  border-bottom: 1px solid #777;
  color: #555;
}

.form-group .form-control:invalid {
  outline: none;
}

.form-group .form-control:focus,
.form-group .form-control:valid {
  outline: none;
  box-shadow: 0 1px $primary;
  border-color: $primary;
}

.form-group .form-control:focus + .form-label,
.form-group .form-control:valid + .form-label {
  font-size: 12px;
  color: $primary;
  transform: translateY(-30px);
}

.alert {
  position: absolute;
  color: #f00;
  font-size: 16px;
  right: -200px;
  top: -300px;
  z-index: 200;
  padding: 30px 25px;
  background: #fff;
  box-shadow: 0 3px 5px rgb(38, 38, 38);
  border-radius: 50%;
  opacity: 0;
  transform: scale(0);
  transition: 0.4s 0.6s linear;
}

.alert:after,
.alert:before {
  content: '';
  position: absolute;
  width: 25px;
  height: 25px;
  background: #fff;
  box-shadow: 0 2px 5px rgb(38, 38, 38);
  border-radius: 50%;
}

.alert:before {
  width: 15px;
  height: 15px;
  left: 40px;
  bottom: -25px;
}

.wrong-entry {
  animation: wrong-log .3s;
}

.wrong-entry .alert {
  opacity: 1;
  transform: scale(1);
}

@keyframes eye-blink {
  to {
    height: 30px;
  }
}

@keyframes wrong-log {
  0%, 100% {
    left: 0px;
  }
  20%, 60% {
    left: 20px;
  }
  40%, 80% {
    left: -20px;
  }
}

.btail{
	position: absolute;
	width: 40px;
	height: 40px;
	border-radius: 100%;
	background: white;
	top: 470px;
	left:80px;
	box-shadow: 0 3px 5px rgb(38, 38, 38);
	

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

<div class="panda">
  <div class="bear"></div>
  <div class="bface">
    <div class="beye-shade"></div>
    <div class="beye-white">
      <div class="beye-ball"></div>
    </div>
    <div class="beye-shade rgt"></div>
    <div class="beye-white rgt">
      <div class="beye-ball"></div>
    </div>
    <div class="blush"></div>
    <div class="blushr"></div>
    <div class="bcheek"></div>
    <div class="bnose"></div>
    <div class="bmouth"></div>
  </div>
  <div class="bbody"> </div>
  <div class="btail"></div>
  <div class="bfoot">
    <div class="bfinger"></div>
  </div>
  <div class="bfoot rgt">
    <div class="bfinger"></div>
  </div>
</div>
<form style="background:rgb(230, 230, 230)"  name="loginForm" method="post" >
  <div class="bhand"></div>
  <div class="bhand rgt"></div>
  <h1>Login</h1>
  <div class="form-group">
    <input required="required" class="form-control" name="userId" />
    <label class="form-label">UserId</label>
  </div>
  <div class="form-group">
    <input id="password" type="password" required="required" class="form-control" name="userPwd"/>
    <label class="form-label">Password</label>
    <p class="alert">아이디, 비밀번호를 입력하세요!</p>
    <button class="btn" style="border: 1px solid;" onclick="sendLogin();">Login </button>
  </div>
</form>

<body>
		<div class="container">
			<div class="corgi">

				<div class="corgi-head">
					<div class="ear ear--r"></div>
					<div class="ear ear--l"></div>

					<div class="eye eye--left"></div>
					<div class="eye eye--right"></div>

					<div class="face">
						<div class="face__white">
							<div class=" face__orange face__orange--l"></div>
							<div class=" face__orange face__orange--r"></div>
						</div>
					</div>

					<div class="face__curve"></div>

					<div class="mouth">

						<div class="nose"></div>
						<div class="mouth__left">
							<div class="mouth__left--round"></div>
							<div class="mouth__left--sharp"></div>
						</div>
						
						<div class="lowerjaw">
							<div class="lips"></div>
							<div class="tongue test"></div>
						</div>

						<div class="snout"></div>
					</div>
				</div>
				
				<div class="neck__back"></div>
				<div class="neck__front"></div>

				<div class="body">
					<div class="body__chest"></div>
				</div>

				<div class="foot foot__left foot__front foot__1"></div>
				<div class="foot foot__right foot__front foot__2"></div>
				<div class="foot foot__left foot__back foot__3"></div>
				<div class="foot foot__right foot__back foot__4"></div>

				<div class="tail test"></div>
			</div>
		</div>
	</body>

<script type="text/javascript">
$('#password').focusin(function(){
	  $('form').addClass('up');
});

$('#password').focusout(function(){
	  $('form').removeClass('up');
});

	// Panda Eye move
$(document).on("mousemove", function( event ) {
	  var dw = $(document).width() / 15;
	  var dh = $(document).height() / 15;
	  var x = event.pageX/ dw;
	  var y = event.pageY/ dh;
	  $('.beye-ball').css({
	    width : x,
	    height : y
	});
});

	// Validation
$(document).ready(function() {
  $('.btn').click(function() {
    $('form').addClass('wrong-entry');
    setTimeout(function() {
      $('form').removeClass('wrong-entry');
    }, 3000);
  });
});

</script>