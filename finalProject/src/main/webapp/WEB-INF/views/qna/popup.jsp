<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boot-board.css" type="text/css">

<div>
	<h3>상품검색</h3>
</div>

	<div>
	   <form name="schForm" action="${pageContext.request.contextPath}/qna/popup" method="post">
	         <select name="schType" class="form-select">
	            <option value="productName" ${schType=="productName"?"selected":""}>상품명</option>
	            <option value="all" ${schType=="all"?"selected":""}>코드+상품명</option>
	         </select>
	      
	         <input type="text" name="kwd" value="${kwd}" class="form-control">
	      
	         <button type="button" class="btn btn-light" onclick="searchList()"> 검색<i class="bi bi-search"></i> </button>
	      
	   </form>
	</div>


<div class="page-navigation">
   ${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
</div>

<table class="table table-hover board-list">
   <thead class="table-light">
      <tr>
         <th width="200">상품이미지</th>                  
         <th>상품정보</th>
         <th width="200">선택</th>
      </tr>
   </thead>
   
   <tbody>
      <c:forEach var="dto" items="${list}" varStatus="status">
         <tr>
            <td>
               <img src="${pageContext.request.contextPath}/resources/images/${dto.thumbnail}" alt="" width="80px;" height="80px;"  onerror="this.style.display='none'">
            </td>
            <td>
               ${dto.productName}
            </td>
            <td>
               <a href="javascript:select(${dto.productNum});">선택</a>
            </td>
         </tr>
      </c:forEach>
   </tbody>
</table>	  

<script>
	
function select(productNum){
	var productNum = String(productNum);
	var postData = {
		productNum : productNum
	};
	
	$.ajax({
	   url: "${pageContext.request.contextPath}/qna/popup", 
	   type: "POST",
	   data: postData,
	   success: function(response) {
	      alert("상품 선택 완료!");
	      opener.location.reload();
	      window.close();
	   },
	   error: function(error) {
	      alert("데이터 전송 중 오류가 발생했습니다.");
	   }
	});
}

</script> 