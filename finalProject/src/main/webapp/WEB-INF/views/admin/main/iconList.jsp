<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="card h-100">
					<div
						class="card-header d-flex align-items-center justify-content-between">
						<h5 class="card-title m-0 me-2 mb-5">인기 아이콘 순위</h5>
						<div class="dropdown">
							<button class="btn p-0" type="button" id="transactionID"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
							</button>
							<div class="dropdown-menu dropdown-menu-end mt-2"
								aria-labelledby="transactionID">
								<a class="dropdown-item" href="javascript:void(0);">주간 </a> <a
									class="dropdown-item" href="javascript:void(0);">월간 </a> <a
									class="dropdown-item" href="javascript:void(0);">연간</a>
							</div>
						</div>
					</div>
					<div class="card-body">
						<ul class="p-0 m-0">
						<c:forEach var="dto" items="${list}" varStatus="status">
							<li class="d-flex mb-4 pb-1">
								<div class="avatar flex-shrink-0 me-3">
									<img
										src="${pageContext.request.contextPath}/uploads/photo/${dto.iconImage}"
										alt="icon" class="rounded">
								</div>
								<div
									class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
									<div class="me-2">
										<h6 class="mb-0">${dto.iconName}</h6>
									</div>
									<div class="user-progress d-flex align-items-center gap-1">
										<h6 class="mb-0">${dto.iconCount}개</h6>
									</div>
								</div>
							</li>
						</c:forEach>

						</ul>
					</div>
				</div>