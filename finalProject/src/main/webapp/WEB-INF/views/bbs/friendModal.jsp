<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row justify-content-center">
	<form name="friendForm" method="post">
	<div>
		<div class="fw-semibold pt-2 fs-5" style="text-align: center;">${dto.userName}</div>
	</div>
	<div class="mt-3 p-2 border-bottom">
		<div>
			<img class="border rounded md-img mx-auto" width="250px;" style="display: flex;" src="${pageContext.request.contextPath}/uploads/photo/${dto.iconImage}">
		</div>
		
		<!-- 친구신청도x, 친구도x 때 -->
		<c:if test="${friend.friendCount == 0 }">
		<div class="d-grid gap-5 m-3">
  			<button type="button" class="btn btn-dark friend-add" data-userName="${dto.userName }"> 친구추가 <i class="fa-solid fa-star"></i></button>
			<input type="hidden" name = "userName" value="${dto.userName}">
		</div>
		</c:if>
		
		<!-- 친구신청 중일 때 -->
		<c:if test="${friend.friendCount > 0 && friend.is_friend != 2 }">
		<div class="d-grid gap-5 m-3">
  			<button type="button" class="btn btn-dark friend-add" data-userName="${dto.userName }" disabled='disabled'> 친구수락 대기중.. <i class="fa-solid fa-star"></i></button>
		</div>
		</c:if>
		
		<!-- 이미 친구일 때 -->
		<c:if test="${friend.friendCount > 0 && friend.is_friend == 2 }">
		<div class="d-grid gap-5 m-3">
  			<button type="button" class="btn btn-dark friend-add" data-userName="${dto.userName }" disabled='disabled'> 이미 친구입니다! <i class="fa-solid fa-star"></i></button>
		</div>
		</c:if>
	</div>	
	</form>	
</div>				