<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:forEach var="dto" items="${list}" varStatus="status">
	<tr class="odd">
		<td class="" style="width: 20px; max-width: 30px;"><c:if
				test="${dto.showreview==0}">
				<button id="showtrigger" data-bs-target="#uneditUser"
					data-bs-toggle="modal" data-num="${dto.num}"
					class="dropdown-item delete-record "
					style="background: none; border: none; width: 20px;">
					<i class='bx bxs-hide'></i>
				</button>
			</c:if> <c:if test="${dto.showreview==1 }">
				<button id="hidetrigger" data-bs-target="#editUser"
					data-bs-toggle="modal" data-num="${dto.num}"
					class="dropdown-item delete-record "
					style="background: none; border: none; width: 20px;">
					<i class='bx bxs-show'></i>
				</button>
			</c:if></td>
			
		<td class="sorting_1" width="300px">
			<div
				class="d-flex justify-content-start align-items-center customer-name">
				<div class="avatar-wrapper">
					<div class="avatar me-2 rounded-2 bg-label-secondary">
						<img
							src="${pageContext.request.contextPath}/uploads/product/${dto.thumbnail}"
							alt="Product-9" class="rounded-2">
					</div>
				</div>
				<div class="d-flex flex-column">
					<span class="fw-medium text-nowrap">${dto.productName}</span> <small
						class="text-${empty dto.answer ? '' : 'success' }">${empty dto.answer ? '답변대기' : '답변완료'}&nbsp;
						${empty dto.answer_date ? '' : dto.answer_date }</small>
				</div>
			</div>
		</td>
		<td>
			<div
				class="d-flex justify-content-start align-items-center customer-name">
				<div class="avatar-wrapper">
					<div class="avatar me-2">
						<img src="../../bootstrapTemp/assets/img/avatars/robot.jpg"
							alt="Avatar" class="rounded-circle">
					</div>
				</div>
				<div class="d-flex flex-column">
					<a href="${pageContext.request.contextPath}/admin/userManage/userinfo?memberIdx=${dto.memberIdx}"> <span
						class="fw-medium">${dto.userName}</span>
					</a> <small class="text-muted text-nowrap">${dto.userId}</small>
				</div>
			</div>
		</td>
		<td style="">

			<div>
				<span class="text-warning-emphasis"> <c:if
						test="${dto.score==5}">
						<c:forEach var="i" begin="1" end="${dto.score }" step="1"
							varStatus="status">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24"
								style="fill: rgb(0, 153, 255); transform:; msFilter:;">
								<path
									d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4 4.536-4.082c.297-.268.406-.686.278-1.065z"></path></svg>
						</c:forEach>
					</c:if> <c:if test="${dto.score==4 }">
						<c:forEach var="i" begin="1" end="${dto.score }" step="1"
							varStatus="status">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24"
								style="fill: rgb(0, 153, 255); transform:; msFilter:;">
								<path
									d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4 4.536-4.082c.297-.268.406-.686.278-1.065z"></path></svg>
						</c:forEach>
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24"
							style="fill: rgb(0, 153, 255); transform:; msFilter:;">
							<path
								d="m6.516 14.323-1.49 6.452a.998.998 0 0 0 1.529 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4 4.536-4.082a1 1 0 0 0-.59-1.74l-5.701-.454-2.467-5.461a.998.998 0 0 0-1.822 0L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.214 4.107zm2.853-4.326a.998.998 0 0 0 .832-.586L12 5.43l1.799 3.981a.998.998 0 0 0 .832.586l3.972.315-3.271 2.944c-.284.256-.397.65-.293 1.018l1.253 4.385-3.736-2.491a.995.995 0 0 0-1.109 0l-3.904 2.603 1.05-4.546a1 1 0 0 0-.276-.94l-3.038-2.962 4.09-.326z"></path></svg>
					</c:if> <c:if test="${dto.score==3 }">
						<c:forEach var="i" begin="1" end="${dto.score }" step="1"
							varStatus="status">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24"
								style="fill: rgb(0, 153, 255); transform:; msFilter:;">
								<path
									d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4 4.536-4.082c.297-.268.406-.686.278-1.065z"></path></svg>
						</c:forEach>
						<c:forEach var="i" begin="1" end="2" step="1" varStatus="status">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24"
								style="fill: rgb(0, 153, 255); transform:; msFilter:;">
								<path
									d="m6.516 14.323-1.49 6.452a.998.998 0 0 0 1.529 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4 4.536-4.082a1 1 0 0 0-.59-1.74l-5.701-.454-2.467-5.461a.998.998 0 0 0-1.822 0L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.214 4.107zm2.853-4.326a.998.998 0 0 0 .832-.586L12 5.43l1.799 3.981a.998.998 0 0 0 .832.586l3.972.315-3.271 2.944c-.284.256-.397.65-.293 1.018l1.253 4.385-3.736-2.491a.995.995 0 0 0-1.109 0l-3.904 2.603 1.05-4.546a1 1 0 0 0-.276-.94l-3.038-2.962 4.09-.326z"></path></svg>
						</c:forEach>
					</c:if> <c:if test="${dto.score==2 }">
						<c:forEach var="i" begin="1" end="${dto.score }" step="1"
							varStatus="status">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24"
								style="fill: rgb(0, 153, 255); transform:; msFilter:;">
								<path
									d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4 4.536-4.082c.297-.268.406-.686.278-1.065z"></path></svg>
						</c:forEach>
						<c:forEach var="i" begin="1" end="3" step="1" varStatus="status">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24"
								style="fill: rgb(0, 153, 255); transform:; msFilter:;">
								<path
									d="m6.516 14.323-1.49 6.452a.998.998 0 0 0 1.529 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4 4.536-4.082a1 1 0 0 0-.59-1.74l-5.701-.454-2.467-5.461a.998.998 0 0 0-1.822 0L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.214 4.107zm2.853-4.326a.998.998 0 0 0 .832-.586L12 5.43l1.799 3.981a.998.998 0 0 0 .832.586l3.972.315-3.271 2.944c-.284.256-.397.65-.293 1.018l1.253 4.385-3.736-2.491a.995.995 0 0 0-1.109 0l-3.904 2.603 1.05-4.546a1 1 0 0 0-.276-.94l-3.038-2.962 4.09-.326z"></path></svg>
						</c:forEach>
					</c:if> <c:if test="${dto.score==1 }">
						<c:forEach var="i" begin="1" end="${dto.score }" step="1"
							varStatus="status">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24"
								style="fill: rgb(0, 153, 255); transform:; msFilter:;">
								<path
									d="M21.947 9.179a1.001 1.001 0 0 0-.868-.676l-5.701-.453-2.467-5.461a.998.998 0 0 0-1.822-.001L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.213 4.107-1.49 6.452a1 1 0 0 0 1.53 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4 4.536-4.082c.297-.268.406-.686.278-1.065z"></path></svg>
						</c:forEach>
						<c:forEach var="i" begin="1" end="4" step="1" varStatus="status">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24"
								style="fill: rgb(0, 153, 255); transform:; msFilter:;">
								<path
									d="m6.516 14.323-1.49 6.452a.998.998 0 0 0 1.529 1.057L12 18.202l5.445 3.63a1.001 1.001 0 0 0 1.517-1.106l-1.829-6.4 4.536-4.082a1 1 0 0 0-.59-1.74l-5.701-.454-2.467-5.461a.998.998 0 0 0-1.822 0L8.622 8.05l-5.701.453a1 1 0 0 0-.619 1.713l4.214 4.107zm2.853-4.326a.998.998 0 0 0 .832-.586L12 5.43l1.799 3.981a.998.998 0 0 0 .832.586l3.972.315-3.271 2.944c-.284.256-.397.65-.293 1.018l1.253 4.385-3.736-2.491a.995.995 0 0 0-1.109 0l-3.904 2.603 1.05-4.546a1 1 0 0 0-.276-.94l-3.038-2.962 4.09-.326z"></path></svg>
						</c:forEach>
					</c:if>

				</span>
			</div>
			<p class="fw-medium mb-1 text-truncate text-capitalize">${dto.review}</p>

		</td>
		<td><span class="text-nowrap">${dto.review_date}</span></td>
		<td class="dtr-hidden">
			<div class="text-xxl-center">
				<div class="dropdown">
					<a href="javascript:;"
						class="btn dropdown-toggle hide-arrow text-body p-0"
						data-bs-toggle="dropdown"> <i
						class="bx bx-dots-vertical-rounded"></i>
					</a>
					<div class="dropdown-menu dropdown-menu-end hidetrigger">
						<c:if test="${empty dto.answer}">
							<button id="answertrigger" data-bs-target="#answerReview"
								data-bs-toggle="modal" data-num="${dto.num}"
								class="dropdown-item delete-record ">답변</button>
						</c:if>
						<c:if test="${not empty dto.answer }">
							<div style="margin: 15px; text-align: center;">답변 완료된 리뷰</div>
						</c:if>
					</div>
				</div>
			</div>
		</td>
	</tr>
</c:forEach>
<tr>
<td>
<div class="row mx-2">
    <div class="page-navigation">
        ${paging}
    </div>
    ${dataCount}개(${page}/${total_page}페이지)
</div>
</td>
</tr>
