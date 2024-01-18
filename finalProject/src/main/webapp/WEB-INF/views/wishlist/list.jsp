<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach var="dto" items="${wishlist}" varStatus="status">
<style>
.containers {
  background-color:rgb(0, 77, 102);
  display: flex;
  align-items: center;
  gap: 14px;
  padding: 10px 15px 10px 10px;
  cursor: pointer;
  user-select: none;
  border-radius: 10px;
  box-shadow: rgba(46, 46, 46, 0.2) 0px 8px 24px;
  color: rgb(255, 255, 255);
}
.border.rounded.product-item {
    position: relative;
}

#favorite-${dto.productNum} {
  display: none;
}

#favorite-${dto.productNum}:checked + .containers svg {
  fill: hsl(0deg 100% 50%);
  stroke: hsl(0deg 100% 50%);
  animation: heartButton 1s;
}

@keyframes heartButton {
  0% {
    transform: scale(1);
  }

  25% {
    transform: scale(1.3);
  }

  50% {
    transform: scale(1);
  }

  75% {
    transform: scale(1.3);
  }

  100% {
    transform: scale(1);
  }
}

#favorite-${dto.productNum} + .containers .action {
  position: relative;
  overflow: hidden;
  display: grid;
}

#favorite-${dto.productNum} + .containers .action span {
  grid-column-start: 1;
  grid-column-end: 1;
  grid-row-start: 1;
  grid-row-end: 1;
  transition: all 0.5s;
}

#favorite-${dto.productNum} + .containers .action span.option-1 {
  transform: translate(0px, 0%);
  opacity: 1;
}

#favorite-${dto.productNum}:checked + .containers .action span.option-1 {
  transform: translate(0px, -100%);
  opacity: 0;
}

#favorite-${dto.productNum} + .containers .action span.option-2 {
  transform: translate(0px, 100%);
  opacity: 0;
}

#favorite-${dto.productNum}:checked + .containers .action span.option-2 {
  transform: translate(0px, 0%);
  opacity: 1;
}

#lock-${dto.productNum} {
  display: none;
}
.lock-label {
    position: absolute;
    top: 10px; /* Adjust the top position as needed */
    right: 10px; /* Adjust the right position as needed */
    width: 45px;
    height: 45px;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: 	rgb(0, 102, 102);
    border-radius: 15px;
    cursor: pointer;
    transition: all 0.3s;
}
.lock-wrapper {
  width: fit-content;
  height: fit-content;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  transform: rotate(-10deg);
}
.shackle {
  background-color: transparent;
  height: 9px;
  width: 14px;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
  border-top: 3px solid white;
  border-left: 3px solid white;
  border-right: 3px solid white;
  transition: all 0.3s;
}
.lock-body {
  width: 15px;
}
#lock-${dto.productNum}:checked + .lock-label .lock-wrapper .shackle {
  transform: rotateY(150deg) translateX(3px);
  transform-origin: right;
}
#lock-${dto.productNum}:checked + .lock-label {
  background-color: rgb(128, 255, 128);
}

#lock-${dto.productNum} + .lock-label:active {
  transform: scale(0.9);
}


</style>
</c:forEach>

<c:forEach var="dto" items="${wishlist}" varStatus="status">
	<div class="col-md-4 col-lg-3 mt-4">
	<input
  value="favorite-button"
  name="favorite-checkbox"
  id="favorite-${dto.productNum}"
  checked="checked"
  type="checkbox"
/>
<label class="containers" for="favorite-${dto.productNum}">
  <svg
    class="feather feather-heart"
    stroke-linejoin="round"
    stroke-linecap="round"
    stroke-width="2"
    stroke="currentColor"
    fill="none"
    viewBox="0 0 24 24"
    height="24"
    width="24"
    xmlns="http://www.w3.org/2000/svg"
  >
    <path
      d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"
    ></path>
  </svg>
  
  <div class="action">
    <span class="option-1 wish-action" onclick="addwish(${dto.productNum})"  >위시리스트 담기</span>
    <span class="option-2 wish-action" onclick="removewish(${dto.productNum})">위시리스트 취소</span>
  </div>
</label>

<div class="border rounded product-item" data-productNum="${dto.productNum}">
    <!-- Lock checkbox and label inside the product item -->
    <input name="openorclose" type="checkbox" id="lock-${dto.productNum}" ${dto.secret == 1 ? 'checked="checked"' : ''}/>
    <label for="lock-${dto.productNum}" class="lock-label" data-secret="${dto.secret }" onclick="addorremove(${dto.productNum})">
        <span class="lock-wrapper">
            <span class="shackle"></span>
            <svg
                class="lock-body"
                width="20"
                height="20"
                viewBox="0 0 28 28"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
            >
                <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M0 5C0 2.23858 2.23858 0 5 0H23C25.7614 0 28 2.23858 28 5V23C28 25.7614 25.7614 28 23 28H5C2.23858 28 0 25.7614 0 23V5ZM16 13.2361C16.6137 12.6868 17 11.8885 17 11C17 9.34315 15.6569 8 14 8C12.3431 8 11 9.34315 11 11C11 11.8885 11.3863 12.6868 12 13.2361V18C12 19.1046 12.8954 20 14 20C15.1046 20 16 19.1046 16 18V13.2361Z"
                    fill="white"></path>
            </svg>
        </span>
    </label>

    <img class="thumbnail-img"
        src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}">
    <div class="p-2">
        <div class="text-truncate fw-semibold pb-1">
            <a href="${pageContext.request.contextPath}/product/buy/${dto.productNum}">${dto.productName}</a>
        </div>
        <div class="pb-1">${dto.price}원</div>
    </div>
    <c:if test="${not empty friendname}">
	    <div>
	    	<a href="${pageContext.request.contextPath}/product/buy/${dto.productNum}?friendname=${friendname}">선물하기</a>
	    	<input type="hidden" name="friendname" value="${friendname}">
	    </div>
    </c:if>
</div>
	</div>
</c:forEach>