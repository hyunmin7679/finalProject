<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 800px;
}
</style>

<div class="container">
	<div class="body-container">
		<div class="boay-title">
			<h3><i class="bi bi-app"></i> 게시판 </h3>
		</div>
		
		<div class="body-main">
		
			<div class="row board-list-header">
				<div class="col-auto me-auto dataCount"></div>
				<div class="col-auto">&nbsp;</div>
			</div>
			
			<table class="table table-hover board-list">
				<thead class = "table-light">
					<tr>
						<th width="60">번호</th>
						<th>제목</th>
						<th width="100">작성자</th>
						<th width="100">작성일</th>
						<th width="70">조회수</th>
						<th width="50">파일</th>
					</tr>
				</thead>
			
			
			<tbody>
				<tr>
					<td>123</td>
					<td class="left">제목입니다.</td>
					<td>이김자바</td>
					<td>20/20/20</td>
					<td>3</td>
					<td><i class="bi bi-file-arrow-down"></i></td>
				</tr>
				<tr>
					<td>123</td>
					<td class="left">제목입니다.</td>
					<td>이김자바</td>
					<td>20/20/20</td>
					<td>3</td>
					<td><i class="bi bi-file-arrow-down"></i></td>
				</tr>
				<tr>
					<td>123</td>
					<td class="left">제목입니다.</td>
					<td>이김자바</td>
					<td>20/20/20</td>
					<td>3</td>
					<td><i class="bi bi-file-arrow-down"></i></td>
				</tr>
				
			</tbody>
		</table>
		</div>
	</div>
	
</div>




















