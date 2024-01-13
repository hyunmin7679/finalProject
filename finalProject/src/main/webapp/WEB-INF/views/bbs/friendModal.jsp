<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row justify-content-center">
	<div>
		<div class="fw-semibold pt-2 fs-5" style="text-align: center;">${dto.userName}</div>
	</div>
	<div class="mt-3 p-2 border-bottom">
		<div>
			<img class="border rounded md-img mx-auto" width="250px;" style="display: flex;" src="${pageContext.request.contextPath}/uploads/photo/${dto.iconImage}">
		</div>
		
		<div class="d-grid gap-5 m-3">
  			<button type="button" class="btn btn-dark friend-add"> 친구추가 <i class="fa-solid fa-star"></i></button>
		</div>
	</div>		
</div>				