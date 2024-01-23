<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<div class="row search-form m-4 fs-5">
<c:choose>
	<c:when test="${empty dto.deliveryName}">
		 <p class="delivery-dox">배송정보가 없습니다.</p>
	</c:when>
	<c:otherwise>
		<div>
		<div style="display: flex; margin: 0 20px;"><img style="padding: 20px;"  src="${pageContext.request.contextPath}/resources/images/delivery.png">
		<div class="col-4 ps-4">
		    <p style="padding-top: 35px;">${dto.deliveryName}</p>
		    ${dto.invoiceNumber}
		 </div>
		</div>
		 <div class="col-auto ps-0 pe-2" style="text-align: right; font-size: 14px; color: #c2c2c2">
		    ${orderState[dto.orderState]}
		 </div>
		 </div>
	</c:otherwise>
</c:choose>
</div>