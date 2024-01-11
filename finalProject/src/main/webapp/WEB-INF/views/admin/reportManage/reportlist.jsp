<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="card">
	<div class="card-title m-0 pb-3">
		<h5 class="m-0 me-2">검색결과(1)</h5>
	</div>

	<div class="card" style="border: 1px solid lightgray;">

		<div class="card-datatable">
			<div id="DataTables_Table_0_wrapper"
				class="dataTables_wrapper dt-bootstrap5 no-footer">
				<div class="">
					<table
						class="dt-route-vehicles table dataTable no-footer dtr-column"
						id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info"
						style="width: 100%;">
						<thead class="border-top">
							<tr>
								<th class="control sorting_disabled dtr-hidden" rowspan="1"
									colspan="1" style="width: 0px; display: none;" aria-label=""></th>

								<th class="sorting sorting_asc" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 60px;"
									aria-label="location: activate to sort column descending"
									aria-sort="ascending">게시글등록일</th>
								<th class="sorting sorting_asc" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 80px;"
									aria-label="location: activate to sort column descending"
									aria-sort="ascending">게시글작성자</th>
								<th class="sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 300px;"
									aria-label="starting route: activate to sort column ascending">게시글제목
								</th>
								<th class="w-20 sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 100px;"
									aria-label="progress: activate to sort column ascending">상태</th>
								<th class="w-20 sorting" tabindex="0"
									aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
									style="width: 100px;"
									aria-label="progress: activate to sort column ascending">자세히보기</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr class="odd">
								<td class="  control" tabindex="0" style="display: none;"></td>

								<td><div class="text-body">${dto.preg_date }</div></td>
								<td><div class="text-body">${dto.postName }</div></td>
								<td>
        						
								<div class="text-body article" 
								data-communityNum = "${dto.communityNum }"
								data-categoryNum ="${dto.categoryNum}">
									${dto.subject }
								</div>
								
								</td>
								<td><div class="text-body">
								<c:if test="${dto.showNo == 1 }">
									표시
								</c:if>
								<c:if test="${dto.showNo ==0 }">
									숨김
								</c:if>
								</div></td>
								<td><div class="text-body">
								
										<button type="button" style="font-size: 13px; width: 50px;"
											class="btn btn-primary m-0 p-0 modalOn" 
											data-bs-toggle="modal"
											data-communityNum = "${dto.communityNum }"
											data-showNo = "${dto.showNo}"
											>
											보기<i class='bx bx-right-arrow-alt'></i>
										</button>
									
									</div></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="row d-flex align-items-center">

					<div class="col-sm-12 col-md-6"
						style="padding-left: 500px; padding-top: 10px;">
						<div class="dataTables_paginate paging_simple_numbers"
							id="DataTables_Table_0_paginate">
							${paging}
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</div>



<script>
$(function() {
    // 글 제목을 클릭할 때의 동작
    $('.article').on('click', function() {
        let communityNum = $(this).data("communitynum");
        let categoryNum = $(this).data("categorynum");

        // 이동할 URL 생성
        let url = "${pageContext.request.contextPath}/bbs/main?communityNum=" + communityNum + "&categoryNum=" + categoryNum;
        
        // 페이지 이동
        window.location.href = url;
    });
});
</script>







