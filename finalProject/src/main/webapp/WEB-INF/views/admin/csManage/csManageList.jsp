<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<!-- Content wrapper -->
<div class="content-wrapper containercs">

	<!-- Content -->

	<div class="container-xxl flex-grow-1 container-p-y">

		<h4 class="py-3 mb-4 ">
			<span>&nbsp;&nbsp;</span>CS 관리
		</h4>

		<div class="row mt-4">
			<!-- Navigation -->
			<div class="col-lg-3 col-md-4 col-12 mb-md-0 mb-3">
				<div class="d-flex justify-content-between flex-column mb-2 mb-md-0">
					<ul class="nav nav-align-left nav-pills flex-column">
						<li class="nav-item">
							<button class="nav-link active" data-bs-toggle="tab"
								data-bs-target="#payment">
								<i class='bx bxs-bell-ring faq-nav-icon me-1'></i> <span
									class="align-middle">공지사항</span>
							</button>
						</li>
						<li class="nav-item">
							<button class="nav-link" data-bs-toggle="tab"
								data-bs-target="#delivery">
								<i class='bx bx-question-mark faq-nav-icon me-1'></i> <span
									class="align-middle">FAQ</span>
							</button>
						</li>
						<li class="nav-item">
							<button class="nav-link" data-bs-toggle="tab"
								data-bs-target="#cancellation">
								<i class='bx bx-message-error faq-nav-icon me-1'></i> <span
									class="align-middle">문의사항</span>
							</button>
						</li>
						<li class="nav-item">
							<button class="nav-link" data-bs-toggle="tab"
								data-bs-target="#orders">
								<i class='bx bx-bulb faq-nav-icon me-1'></i> <span
									class="align-middle">이벤트</span>
							</button>
						</li>
					</ul>


				</div>
			</div>
			<!-- /Navigation -->

			<div class="col-lg-9 col-md-8 col-12">
				<div class="tab-content py-0">
					<div class="tab-pane fade show active" id="payment" role="tabpanel">
						<div class="d-flex mb-3 gap-3">
							<div>
								<span class="badge bg-label-primary rounded-2"> <i
									class="bx bxs-bell-ring bx-md"></i>
								</span>
							</div>
							<div>
								<h4 class="mt-2">
									<span class="align-middle">공지사항</span>
								</h4>
							</div>
						</div>

						<div id="accordionPayment" class="accordion">

							<!-- --------------------------------------반복------------------------------------------------------------- -->
							<c:forEach var="vo" items="${listnotice}" varStatus="status">
								<div class="card accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button collapsed" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#accordionPayment-${status.index}"
											aria-controls="accordionPayment-${status.index}">${vo.nsubject }</button>
									</h2>
									<div id="accordionPayment-${status.index}"
										class="accordion-collapse collapse">
										<div class="dtr-hidden"
											style="float: right; padding-right: 15px;">
											<div class="text-xxl-center">
												<div class="dropdown">
													<a href="javascript:;"
														class="btn dropdown-toggle hide-arrow text-body p-0"
														data-bs-toggle="dropdown"> <i
														class="bx bx-dots-vertical-rounded"></i>
													</a>
													<div class="dropdown-menu dropdown-menu-end">
														<a href="javascript:;"
															class="dropdown-item delete-record text">수정</a> <a
															href="javascript:;"
															class="dropdown-item delete-record text-danger">삭제</a>
													</div>
													<a
														href="${pageContext.request.contextPath}/notice/zipdownload?num=${vo.nnum}"
														style="align-self: flex-end;"><i class='bx bx-file'></i></a>
												</div>
											</div>
										</div>
										<div class="accordion-body" style="margin-right: 7%;">${vo.ncontent }</div>
									</div>
								</div>
							</c:forEach>
							<!-- --------------------------------------반복------------------------------------------------------------- -->

						</div>
					</div>

					<!-- FAQ -->
					<div class="tab-pane fade" id="delivery" role="tabpanel">
						<div class="mb-3">
							<h4>
								<span class="badge bg-label-primary rounded-2"> <i
									class="bx bx-question-mark bx-md"></i>
								</span> <span class="align-middle">&nbsp; FAQ</span>
							</h4>
						</div>
						<div class="col-xl-6" style="width: 100%;">
							<div class="nav-align-top mb-4">
								<ul class="nav nav-pills mb-3" role="tablist">
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link active" role="tab"
											data-bs-toggle="tab" data-bs-target="#navs-pills-top-home"
											aria-controls="navs-pills-top-home" aria-selected="true">모두</button>
									</li>
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link" role="tab"
											data-bs-toggle="tab" data-bs-target="#navs-pills-top-profile"
											aria-controls="navs-pills-top-profile" aria-selected="false"
											tabindex="-1">회원</button>
									</li>
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link" role="tab"
											data-bs-toggle="tab"
											data-bs-target="#navs-pills-top-messages"
											aria-controls="navs-pills-top-messages" aria-selected="false"
											tabindex="-1">주문</button>
									</li>
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link" role="tab"
											data-bs-toggle="tab" data-bs-target="#navs-pills-top-ship"
											aria-controls="navs-pills-top-ship" aria-selected="false"
											tabindex="-1">배송</button>
									</li>
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link" role="tab"
											data-bs-toggle="tab" data-bs-target="#navs-pills-top-etc"
											aria-controls="navs-pills-top-etc" aria-selected="false"
											tabindex="-1">기타</button>
									</li>
								</ul>

								<div class="tab-content">
									<div class="tab-pane fade active show mt-4"
										id="navs-pills-top-home" role="tabpanel">
										<c:forEach var="dto" items="${listfaq}" varStatus="status">
											<div class="card accordion-item active mt-4"
												id="navs-pills-top-all">
												<h2 class="accordion-header">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse" aria-expanded="true"
														data-bs-target="#accordionDelivery-${status.index}"
														aria-controls="accordionDelivery-${status.index}">${dto.fsubject }</button>
												</h2>
												<div id="accordionDelivery-${status.index}"
													class="accordion-collapse collapse">
													<div class="dtr-hidden"
														style="float: right; padding-right: 15px;">
														<div class="text-xxl-center">
															<div class="dropdown">
																<a href="javascript:;"
																	class="btn dropdown-toggle hide-arrow text-body p-0"
																	data-bs-toggle="dropdown"> <i
																	class="bx bx-dots-vertical-rounded"></i>
																</a>
																<div class="dropdown-menu dropdown-menu-end">
																	<a href="javascript:;"
																		class="dropdown-item delete-record text">수정</a> <a
																		href="javascript:;"
																		class="dropdown-item delete-record text-danger">삭제</a>
																</div>
															</div>
														</div>
													</div>
													<div class="accordion-body">${dto.fcontent }</div>
												</div>
											</div>
										</c:forEach>
									</div>


									<div class="tab-pane fade" id="navs-pills-top-profile"
										role="tabpanel">
										<c:forEach var="dto" items="${listfaq}" varStatus="status">
											<c:if test="${1 eq dto.fcategorynum }">
												<div class="card accordion-item active mb-4"
													id="navs-pills-top-all">
													<h2 class="accordion-header">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse" aria-expanded="true"
															data-bs-target="#accordionDelivery-${status.index}"
															aria-controls="accordionDelivery-${status.index}">${dto.fsubject }</button>
													</h2>
													<div id="accordionDelivery-${status.index}"
														class="accordion-collapse collapse">
														<div class="dtr-hidden"
															style="float: right; padding-right: 15px;">
															<div class="text-xxl-center">
																<div class="dropdown">
																	<a href="javascript:;"
																		class="btn dropdown-toggle hide-arrow text-body p-0"
																		data-bs-toggle="dropdown"> <i
																		class="bx bx-dots-vertical-rounded"></i>
																	</a>
																	<div class="dropdown-menu dropdown-menu-end">
																		<a href="javascript:;"
																			class="dropdown-item delete-record text">수정</a> <a
																			href="javascript:;"
																			class="dropdown-item delete-record text-danger">삭제</a>
																	</div>
																</div>
															</div>
														</div>
														<div class="accordion-body">${dto.fcontent }</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>


									<div class="tab-pane fade" id="navs-pills-top-messages"
										role="tabpanel">
										<c:forEach var="dto" items="${listfaq}" varStatus="status">
											<c:if test="${2 eq dto.fcategorynum }">
												<div class="card accordion-item active mb-4"
													id="navs-pills-top-all">
													<h2 class="accordion-header">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse" aria-expanded="true"
															data-bs-target="#accordionDelivery-${status.index}"
															aria-controls="accordionDelivery-${status.index}">${dto.fsubject }</button>
													</h2>
													<div id="accordionDelivery-${status.index}"
														class="accordion-collapse collapse">
														<div class="dtr-hidden"
															style="float: right; padding-right: 15px;">
															<div class="text-xxl-center">
																<div class="dropdown">
																	<a href="javascript:;"
																		class="btn dropdown-toggle hide-arrow text-body p-0"
																		data-bs-toggle="dropdown"> <i
																		class="bx bx-dots-vertical-rounded"></i>
																	</a>
																	<div class="dropdown-menu dropdown-menu-end">
																		<a href="javascript:;"
																			class="dropdown-item delete-record text">수정</a> <a
																			href="javascript:;"
																			class="dropdown-item delete-record text-danger">삭제</a>
																	</div>
																</div>
															</div>
														</div>
														<div class="accordion-body">${dto.fcontent }</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>


									<div class="tab-pane fade" id="navs-pills-top-ship"
										role="tabpanel">
										<c:forEach var="dto" items="${listfaq}" varStatus="status">
											<c:if test="${3 eq dto.fcategorynum }">
												<div class="card accordion-item active mb-4"
													id="navs-pills-top-all">
													<h2 class="accordion-header">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse" aria-expanded="true"
															data-bs-target="#accordionDelivery-${status.index}"
															aria-controls="accordionDelivery-${status.index}">${dto.fsubject }</button>
													</h2>
													<div id="accordionDelivery-${status.index}"
														class="accordion-collapse collapse">
														<div class="dtr-hidden"
															style="float: right; padding-right: 15px;">
															<div class="text-xxl-center">
																<div class="dropdown">
																	<a href="javascript:;"
																		class="btn dropdown-toggle hide-arrow text-body p-0"
																		data-bs-toggle="dropdown"> <i
																		class="bx bx-dots-vertical-rounded"></i>
																	</a>
																	<div class="dropdown-menu dropdown-menu-end">
																		<a href="javascript:;"
																			class="dropdown-item delete-record text">수정</a> <a
																			href="javascript:;"
																			class="dropdown-item delete-record text-danger">삭제</a>
																	</div>
																</div>
															</div>
														</div>
														<div class="accordion-body">${dto.fcontent }</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>

									<div class="tab-pane fade" id="navs-pills-top-etc"
										role="tabpanel">
										<c:forEach var="dto" items="${listfaq}" varStatus="status">
											<c:if test="${4 eq dto.fcategorynum }">
												<div class="card accordion-item active mb-4"
													id="navs-pills-top-all">
													<h2 class="accordion-header">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse" aria-expanded="true"
															data-bs-target="#accordionDelivery-${status.index}"
															aria-controls="accordionDelivery-${status.index}">${dto.fsubject}</button>
													</h2>
													<div id="accordionDelivery-${status.index}"
														class="accordion-collapse collapse">
														<div class="dtr-hidden"
															style="float: right; padding-right: 15px;">
															<div class="text-xxl-center">
																<div class="dropdown">
																	<a href="javascript:;"
																		class="btn dropdown-toggle hide-arrow text-body p-0"
																		data-bs-toggle="dropdown"> <i
																		class="bx bx-dots-vertical-rounded"></i>
																	</a>
																	<div class="dropdown-menu dropdown-menu-end">
																		<a href="javascript:;"
																			class="dropdown-item delete-record text">수정</a> <a
																			href="javascript:;"
																			class="dropdown-item delete-record text-danger">삭제</a>
																	</div>
																</div>
															</div>
														</div>
														<div class="accordion-body">${dto.fcontent}</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>



					<!-- 문의사항 -->

					<div class="tab-pane fade" id="cancellation" role="tabpanel">
						<div class="mb-3">
							<h4>
								<span class="badge bg-label-primary rounded-2"> <i
									class="bx bx-message-error bx-md"></i></span> <span
									class="align-middle">문의사항</span>
							</h4>
						</div>
						<div class="col-xl-6" style="width: 100%;">
							<div class="nav-align-top mb-4">
								<ul class="nav nav-pills mb-3" role="tablist">
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link active" role="tab"
											data-bs-toggle="tab" data-bs-target="#navs-pills-top-every"
											aria-controls="navs-pills-top-every" aria-selected="true">전체</button>
									</li>
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link" role="tab"
											data-bs-toggle="tab" data-bs-target="#navs-pills-top-answer"
											aria-controls="navs-pills-top-answer" aria-selected="false"
											tabindex="-1">답변완료</button>
									</li>
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link" role="tab"
											data-bs-toggle="tab" data-bs-target="#navs-pills-top-yet"
											aria-controls="navs-pills-top-yet" aria-selected="false"
											tabindex="-1">답변대기</button>
									</li>
								</ul>
								<div class="tab-content">


									<div class="tab-pane fade active show"
										id="navs-pills-top-every" role="tabpanel">
										<div id="accordionCancellation" class="accordion">
											<c:forEach var="qo" items="${listqna}" varStatus="status">
												<div class="card accordion-item active">
													<h2 class="accordion-header">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse"
															data-bs-target="#accordionCancellation-${status.index}"
															aria-controls="accordionCancellation-${status.index}">${qo.q_subject}</button>
													</h2>

													<div id="accordionCancellation-${status.index}"
														class="accordion-collapse collapse">
														<div class="accordion-body">
															<p>${qo.question }</p>
														</div>
														<div class="dtr-hidden"
															style="float: right; padding-top: 15px; padding-right: 15px;">
															<div class="text-xxl-center">
																<div class="dropdown">
																	<a href="javascript:;"
																		class="btn dropdown-toggle hide-arrow text-body p-0"
																		data-bs-toggle="dropdown"> <i
																		class="bx bx-dots-vertical-rounded"></i>
																	</a>
																	<div class="dropdown-menu dropdown-menu-end">
																		<a href="javascript:;"
																			class="dropdown-item delete-record text">수정</a> <a
																			href="javascript:;"
																			class="dropdown-item delete-record text-danger">삭제</a>
																	</div>
																</div>
															</div>
														</div>
														<div class="accordion-body" style="padding-top: 15px;">
															문의사항 답변<br> <br> ${qo.answer}
														</div>
														<c:if test="${empty qo.answer_date }">
															<div class="reply">
																<form name="answerForm" method="post">

																	<table class="table reply-form">
																		<tbody>
																			<tr>
																				<td align="right">
																					<button type="button"
																						class="btn btn-secondary answer"
																						onclick="sendAnswerOk()">답변 등록</button> <input
																					type="hidden" name="num" value="1"> <input
																					type="hidden" name="page" value="1"> <input
																					type="hidden" name="schType" value="all"> <input
																					type="hidden" name="kwd" value="">
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</form>
															</div>
														</c:if>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>




									<div class="tab-pane fade" id="navs-pills-top-answer"
										role="tabpanel">
										<c:forEach var="qo" items="${listqna}" varStatus="status">
											<c:if test="${not empty qo.answer_date }">
												<div id="accordionCancellation" class="accordion mb-2">
													<div class="card accordion-item active">
														<h2 class="accordion-header">
															<button class="accordion-button collapsed" type="button"
																data-bs-toggle="collapse"
																data-bs-target="#accordionCancellation-${status.index}"
																aria-controls="accordionCancellation-${status.index}">${qo.q_subject}</button>
														</h2>

														<div id="accordionCancellation-${status.index}"
															class="accordion-collapse collapse">
															<div class="accordion-body">
																<p>${qo.question }</p>
															</div>
															<div class="dtr-hidden"
																style="float: right; padding-top: 15px; padding-right: 15px;">
																<div class="text-xxl-center">
																	<div class="dropdown">
																		<a href="javascript:;"
																			class="btn dropdown-toggle hide-arrow text-body p-0"
																			data-bs-toggle="dropdown"> <i
																			class="bx bx-dots-vertical-rounded"></i>
																		</a>
																		<div class="dropdown-menu dropdown-menu-end">
																			<a href="javascript:;"
																				class="dropdown-item delete-record text">수정</a> <a
																				href="javascript:;"
																				class="dropdown-item delete-record text-danger">삭제</a>
																		</div>
																	</div>
																</div>
															</div>
															<div class="accordion-body" style="padding-top: 15px;">
																문의사항 답변<br> <br> ${qo.answer}
															</div>

														</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>


									<div class="tab-pane fade mb-4 mt-4" id="navs-pills-top-yet"
										role="tabpanel">
										<c:forEach var="qo" items="${listqna}" varStatus="status">
											<c:if test="${empty qo.answer_date }">
												<div class="card accordion-item mb-2">
													<h2 class="accordion-header">
														<button class="accordion-button collapsed " type="button"
															data-bs-toggle="collapse"
															data-bs-target="#accordionCancellation-${status.index}"
															aria-controls="accordionCancellation-${status.index}">${qo.q_subject}</button>
													</h2>
													<div id="accordionCancellation-${status.index}"
														class="accordion-collapse collapse ">
														<div class="accordion-body">
															<p>${qo.question }</p>
														</div>
														<div class="dtr-hidden"
															style="float: right; padding-top: 15px; padding-right: 15px;">
															<div class="text-xxl-center">
																<div class="dropdown">
																	<a href="javascript:;"
																		class="btn dropdown-toggle hide-arrow text-body p-0"
																		data-bs-toggle="dropdown"> <i
																		class="bx bx-dots-vertical-rounded"></i>
																	</a>
																	<div class="dropdown-menu dropdown-menu-end">
																		<a href="javascript:;"
																			class="dropdown-item delete-record text">수정</a> <a
																			href="javascript:;"
																			class="dropdown-item delete-record text-danger">삭제</a>
																	</div>
																</div>
															</div>
														</div>
														<div class="accordion-body"
															style="padding-top: 15px; display: hidden;">
															문의사항 답변<br> <br> ${qo.answer}
														</div>
														<c:if test="${empty qo.answer_date }">
															<div class="reply">
																<form name="answerForm${status.index}" method="post">
																	<table class="table reply-form">
																		<tbody>
																			<tr>
																				<td align="right">
																					<button type="button"
																						class="btn btn-secondary qanswer"
																						data-qnum="${qo.qnum}" data-bs-toggle="modal"
																						data-bs-target="#qna">답변
																						등록</button> <input type="hidden" name="qnum"
																					value="${qo.qnum}">
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</form>
															</div>
														</c:if>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="orders" role="tabpanel">
						<div class="mb-3">
							<h4>
								<span class="badge bg-label-primary rounded-2"> <i
									class="bx bx-question-mark bx-md"></i>
								</span> <span class="align-middle">&nbsp; 이벤트</span>
							</h4>
						</div>
						<div class="col-xl-6" style="width: 100%;">
							<div class="nav-align-top mb-4">
								<ul class="nav nav-pills mb-3" role="tablist">
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link active" role="tab"
											data-bs-toggle="tab" data-bs-target="#navs-pills-top-whole"
											aria-controls="navs-pills-top-whole" aria-selected="true">전체
											이벤트</button>
									</li>
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link" role="tab"
											data-bs-toggle="tab" data-bs-target="#navs-pills-top-ing"
											aria-controls="navs-pills-top-ing" aria-selected="false"
											tabindex="-1">진행중</button>
									</li>
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link" role="tab"
											data-bs-toggle="tab" data-bs-target="#navs-pills-top-reserve"
											aria-controls="navs-pills-top-reserve" aria-selected="false"
											tabindex="-1">예정</button>
									</li>
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link" role="tab"
											data-bs-toggle="tab" data-bs-target="#navs-pills-top-end"
											aria-controls="navs-pills-top-end" aria-selected="false"
											tabindex="-1">종료</button>
									</li>
									<li class="nav-item" role="presentation">
										<button type="button" class="nav-link" role="tab"
											data-bs-toggle="tab" data-bs-target="#navs-pills-top-win"
											aria-controls="navs-pills-top-win" aria-selected="false"
											tabindex="-1">당첨자 발표</button>
									</li>
								</ul>

								<div class="tab-content">
									<div class="tab-pane fade active show"
										id="navs-pills-top-whole" role="tabpanel">
										<div class="card accordion-item active"
											id="navs-pills-top-all">
											<h2 class="accordion-header">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse" aria-expanded="true"
													data-bs-target="#accordionDelivery-1"
													aria-controls="accordionDelivery-1">이벤트</button>
											</h2>
											<div id="accordionDelivery-1"
												class="accordion-collapse collapse">
												<div class="dtr-hidden"
													style="float: right; padding-right: 15px;">
													<div class="text-xxl-center">
														<div class="dropdown">
															<a href="javascript:;"
																class="btn dropdown-toggle hide-arrow text-body p-0"
																data-bs-toggle="dropdown"> <i
																class="bx bx-dots-vertical-rounded"></i>
															</a>
															<div class="dropdown-menu dropdown-menu-end">
																<a href="javascript:;"
																	class="dropdown-item delete-record text">수정</a> <a
																	href="javascript:;"
																	class="dropdown-item delete-record text-danger">삭제</a>
															</div>
														</div>
													</div>
												</div>
												<div class="accordion-body">FAQ 모두
													모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두
													모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두
													모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두
													모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두모두

												</div>
											</div>

										</div>
									</div>


									<div class="tab-pane fade" id="navs-pills-top-ing"
										role="tabpanel">
										<div class="card accordion-item active"
											id="navs-pills-top-all">
											<h2 class="accordion-header">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse" aria-expanded="true"
													data-bs-target="#accordionDelivery-1"
													aria-controls="accordionDelivery-1">진행중</button>
											</h2>
											<div id="accordionDelivery-1"
												class="accordion-collapse collapse">
												<div class="dtr-hidden"
													style="float: right; padding-right: 15px;">
													<div class="text-xxl-center">
														<div class="dropdown">
															<a href="javascript:;"
																class="btn dropdown-toggle hide-arrow text-body p-0"
																data-bs-toggle="dropdown"> <i
																class="bx bx-dots-vertical-rounded"></i>
															</a>
															<div class="dropdown-menu dropdown-menu-end">
																<a href="javascript:;"
																	class="dropdown-item delete-record text">수정</a> <a
																	href="javascript:;"
																	class="dropdown-item delete-record text-danger">삭제</a>
															</div>
														</div>
													</div>
												</div>
												<div class="accordion-body">FAQ
													회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원
													회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원
													회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원
													회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원
													회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원회원</div>
											</div>
										</div>
									</div>


									<div class="tab-pane fade" id="navs-pills-top-reserve"
										role="tabpanel">
										<div class="card accordion-item active"
											id="navs-pills-top-all">
											<h2 class="accordion-header">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse" aria-expanded="true"
													data-bs-target="#accordionDelivery-1"
													aria-controls="accordionDelivery-1">예정이벤트</button>
											</h2>
											<div id="accordionDelivery-1"
												class="accordion-collapse collapse">
												<div class="dtr-hidden"
													style="float: right; padding-right: 15px;">
													<div class="text-xxl-center">
														<div class="dropdown">
															<a href="javascript:;"
																class="btn dropdown-toggle hide-arrow text-body p-0"
																data-bs-toggle="dropdown"> <i
																class="bx bx-dots-vertical-rounded"></i>
															</a>
															<div class="dropdown-menu dropdown-menu-end">
																<a href="javascript:;"
																	class="dropdown-item delete-record text">수정</a> <a
																	href="javascript:;"
																	class="dropdown-item delete-record text-danger">삭제</a>
															</div>
														</div>
													</div>
												</div>
												<div class="accordion-body">FAQ
													결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제
													결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결
													결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제
													결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제
													결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제결제</div>
											</div>
										</div>
									</div>


									<div class="tab-pane fade" id="navs-pills-top-end"
										role="tabpanel">
										<div class="card accordion-item active"
											id="navs-pills-top-all">
											<h2 class="accordion-header">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse" aria-expanded="true"
													data-bs-target="#accordionDelivery-1"
													aria-controls="accordionDelivery-1">종료 이벤트</button>
											</h2>
											<div id="accordionDelivery-1"
												class="accordion-collapse collapse">
												<div class="dtr-hidden"
													style="float: right; padding-right: 15px;">
													<div class="text-xxl-center">
														<div class="dropdown">
															<a href="javascript:;"
																class="btn dropdown-toggle hide-arrow text-body p-0"
																data-bs-toggle="dropdown"> <i
																class="bx bx-dots-vertical-rounded"></i>
															</a>
															<div class="dropdown-menu dropdown-menu-end">
																<a href="javascript:;"
																	class="dropdown-item delete-record text">수정</a> <a
																	href="javascript:;"
																	class="dropdown-item delete-record text-danger">삭제</a>
															</div>
														</div>
													</div>
												</div>
												<div class="accordion-body">FAQ배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송
													배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송
													배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송
													배송배송배송배송배송배송배송배송배송배송배송배송배송배송배송</div>
											</div>
										</div>
									</div>


									<div class="tab-pane fade" id="navs-pills-top-win"
										role="tabpanel">
										<div class="card accordion-item active mb-2"
											id="navs-pills-top-all">
											<h2 class="accordion-header">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse" aria-expanded="true"
													data-bs-target="#accordionDelivery-1"
													aria-controls="accordionDelivery-1">당첨자발표</button>
											</h2>
											<div id="accordionDelivery-1"
												class="accordion-collapse collapse">
												<div class="dtr-hidden"
													style="float: right; padding-right: 15px;">
													<div class="text-xxl-center">
														<div class="dropdown">
															<a href="javascript:;"
																class="btn dropdown-toggle hide-arrow text-body p-0"
																data-bs-toggle="dropdown"> <i
																class="bx bx-dots-vertical-rounded"></i>
															</a>
															<div class="dropdown-menu dropdown-menu-end">
																<a href="javascript:;"
																	class="dropdown-item delete-record text">수정</a> <a
																	href="javascript:;"
																	class="dropdown-item delete-record text-danger">삭제</a>
															</div>
														</div>
													</div>
												</div>
												<div class="accordion-body">FAQ
													기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타
													기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타
													기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타ㅍ</div>
											</div>
										</div>

										<!------------------------------------------------ 반복 구간 ------------------------------------------------------ -->
										<div class="card accordion-item active mb-2"
											id="navs-pills-top-all">
											<h2 class="accordion-header">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse" aria-expanded="true"
													data-bs-target="#accordionDelivery-2"
													aria-controls="accordionDelivery-2">발표2</button>
											</h2>
											<div id="accordionDelivery-2"
												class="accordion-collapse collapse">
												<div class="dtr-hidden"
													style="float: right; padding-right: 15px;">
													<div class="text-xxl-center">
														<div class="dropdown">
															<a href="javascript:;"
																class="btn dropdown-toggle hide-arrow text-body p-0"
																data-bs-toggle="dropdown"> <i
																class="bx bx-dots-vertical-rounded"></i>
															</a>
															<div class="dropdown-menu dropdown-menu-end">
																<a href="javascript:;"
																	class="dropdown-item delete-record text">수정</a> <a
																	href="javascript:;"
																	class="dropdown-item delete-record text-danger">삭제</a>
															</div>
														</div>
													</div>
												</div>
												<div class="accordion-body">FAQ
													기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타
													기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타
													기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타기타ㅍ</div>
											</div>
										</div>
										<!------------------------------------------------ 반복 구간 ------------------------------------------------------ -->
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- /FAQ's -->
		</div>

		<!-- Contact -->


	</div>
	<!-- / Content -->




	<!-- Footer -->
	<footer class="content-footer footer bg-footer-theme">
		<div
			class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
			<div class="mb-2 mb-md-0"></div>

			<button
				style="width: 100px; align-self: flex-end; padding-left: 60px; margin-bottom: 30px; background-color: rgb(245, 245, 249); border: none; color: rgb(105, 122, 141);"
				class=" mt-5 dropdown-toggle" data-bs-toggle="dropdown"
				data-bs-target="#editUser">
				<i class='bx bxs-pencil'></i>
			</button>
			<ul class="dropdown-menu"
				style="width: 38px; text-align: right; background-color: rgb(245, 245, 249); padding-right: 17px; box-shadow: none;">
				<li><a data-bs-toggle="modal" data-bs-target="#notice"
					style="cursor: pointer;"> <i
						class='bx bxs-bell-ring faq-nav-icon me-1  '></i></a></li>
				<li><a data-bs-toggle="modal" data-bs-target="#faq"
					style="cursor: pointer;"> <i
						class='bx bx-question-mark faq-nav-icon me-1'></i>

				</a></li>
				<li><a data-bs-toggle="modal" data-bs-target="#event"
					style="cursor: pointer;"> <i
						class='bx bx-bulb faq-nav-icon me-1'> </i></a></li>



			</ul>

			<div class="modal fade" id="notice" tabindex="-1"
				style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="body-main">

							<form name="noticeForm" method="post"
								enctype="multipart/form-data">
								<table class="table table-border border-top2 table-form">
									<tbody>
										<tr>
											<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
											<td><input type="text" name="nsubject" maxlength="100"
												class="form-control" value=""></td>
										</tr>

										<tr>
											<td>공지여부</td>
											<td><input type="checkbox" name="notice" id="notice"
												class="form-check-input" value="1"> <label
												for="notice" class="form-check-label">공지</label></td>
										</tr>

										<tr>
											<td>출력여부</td>
											<td><input type="checkbox" name="showNotice"
												id="showNotice" class="form-check-input" value="1"
												checked=""> <label for="showNotice"
												class="form-check-label">표시</label></td>
										</tr>

										<tr>
											<td>작성자</td>
											<td>
												<p class="form-control-plaintext">관리자</p>
											</td>
										</tr>

										<tr>
											<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
											<td valign="top"><textarea name="ncontent" id="ir1"
													class="form-control" style="max-width: 97%; height: 290px;"></textarea></td>
										</tr>

										<tr>
											<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
											<td><input type="file" name="selectFile"
												class="form-control" multiple=""></td>
										</tr>


									</tbody>
								</table>

								<table class="table">
									<tbody>
										<tr>
											<td align="center">
												<button type="button" class="btn btn-dark notice">등록하기</button>
												<button type="reset" class="btn">다시입력</button>
												<button type="button" class="btn"
													onclick="location.href='/pet/admin/csManage/';">등록취소</button>

											</td>
										</tr>
									</tbody>
								</table>
							</form>

						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="faq" tabindex="-1" style="display: none;"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="body-main">

							<form name="faqForm" method="post">
								<table class="table table-border border-top2 table-form">
									<tbody>
										<tr>
											<td>카테고리</td>
											<td><select name="fcategorynum" class="form-select">

													<option value="1">회원</option>

													<option value="2">결제</option>

													<option value="3">배송</option>

													<option value="4">기타</option>

											</select></td>
										</tr>

										<tr>
											<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
											<td><input type="text" name="fsubject" maxlength="100"
												class="form-control" value=""></td>
										</tr>

										<tr>
											<td>작성자</td>
											<td>관리자</td>
										</tr>

										<tr>
											<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
											<td valign="top"><textarea name="fcontent"
													class="form-control"></textarea></td>
										</tr>
									</tbody>
								</table>

								<table class="table">
									<tbody>
										<tr>
											<td align="center">
												<button type="button" class="btn btn-dark faq">등록하기</button>
												<button type="reset" class="btn">다시입력</button>
												<button type="button" class="btn"
													onclick="location.href='/pet/admin/csManage/';">등록취소</button>

											</td>
										</tr>
									</tbody>
								</table>
							</form>


						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="qna" tabindex="-1" style="display: none;"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="body-main">
							<form name="qnaForm" method="post" enctype="multipart/form-data">
							<input type="text" name="qnum" id="qnum" value=""
								style="display: none;" />
								<table class="table table-border border-top2 table-form">
									<tbody>
										<tr>
											<td>작성자</td>
											<td>
												<p class="form-control-plaintext">관리자</p>
											</td>
										</tr>

										<tr>
											<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
											<td valign="top"><textarea name="answer" id="ir1"
													class="form-control" style="max-width: 97%; height: 290px;"></textarea></td>
										</tr>
									</tbody>
								</table>

								<table class="table">
									<tbody>
										<tr>
											<td align="center">
												<button data-final="" type="button" class="btn btn-dark qna">등록하기</button>
												<button type="reset" class="btn">다시입력</button>
												<button type="button" class="btn"
													onclick="location.href='/pet/admin/csManage/';">등록취소</button>

											</td>
										</tr>
									</tbody>
								</table>
							</form>

						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="event" tabindex="-1"
				style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
							<form name="eventForm" method="post">
								<table class="table table-border border-top2 table-form">
									<tbody>
										<tr>
											<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
											<td><input type="text" name="title" maxlength="100"
												class="form-control" value=""></td>
										</tr>

										<tr>
											<td>시작일자</td>
											<td><input type="date" name="sday" class="form-control"
												value=""> <input type="time" name="stime"
												class="form-control" value=""></td>
										</tr>

										<tr>
											<td>종료일자</td>
											<td><input type="date" name="eday" class="form-control"
												value=""> <input type="time" name="etime"
												class="form-control" value=""></td>
										</tr>

										<tr>
											<td>당첨인원</td>
											<td>
												<p>
													<input type="text" name="winnerNumber" class="form-control"
														value="">
												</p>
												<p class="help-block">당첨 인원이 0이면 당첨자가 없습니다.</p>
											</td>
										</tr>
										<tr>
											<td>발표일자</td>
											<td>
												<p>
													<input type="date" name="wday" class="form-control"
														value=""> <input type="time" name="wtime"
														class="form-control" value="">
												</p>
												<p class="help-block">당첨 인원이 0이면 발표일자는 저장되지 않습니다.</p>
											</td>
										</tr>

										<tr>
											<td>출력여부</td>
											<td><input type="checkbox" name="showEvent"
												id="showEvent" class="form-check-input" value="1" checked="">
												<label for="showEvent" class="form-check-label">표시</label></td>
										</tr>

										<tr>
											<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
											<td valign="top"><textarea name="content" id="ir1"
													class="form-control"></textarea></td>
										</tr>

									</tbody>
								</table>

								<table class="table">
									<tbody>
										<tr>
											<td align="center">
												<button type="button" class="btn btn-dark">등록하기</button>
												<button type="reset" class="btn">다시입력</button>
												<button type="button" class="btn"
													onclick="location.href='/pet/admin/csManage/';">등록취소</button>

											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</footer>
	<!-- / Footer -->


	<div class="content-backdrop fade"></div>
</div>
<!-- Content wrapper -->

<script type="text/javascript">

function ajaxFun(url, method, formData, dataType, fn, file = false) {
	const settings = {
			type: method, 
			data: formData,
			success:function(data) {
				fn(data);
			},
			beforeSend: function(jqXHR) {
				jqXHR.setRequestHeader('AJAX', true);
			},
			complete: function () {
			},
			error: function(jqXHR) {
				if(jqXHR.status === 403) {
					login();
					return false;
		    	} else if(jqXHR.status === 402) {
		    		alert('권한이 없습니다.');
		    		return false;
				} else if(jqXHR.status === 400) {
					alert('요청 처리가 실패 했습니다.');
					return false;
		    	} else if(jqXHR.status === 410) {
		    		alert('삭제된 게시물입니다.');
		    		return false;
		    	}
		    	
				console.log(jqXHR.responseText);
			}
	};
	
	if(file) {
		settings.processData = false;  // file 전송시 필수. 서버로전송할 데이터를 쿼리문자열로 변환여부
		settings.contentType = false;  // file 전송시 필수. 서버에전송할 데이터의 Content-Type. 기본:application/x-www-urlencoded
	}
	
	$.ajax(url, settings);
}


$(function(){
	$('.containercs').on('click','.notice', function(){
		
		const f  = document.noticeForm;
		
		let str;
		
		str = f.nsubject.value.trim();
		if(!str) {
			alert('제목을 입력해주세요. ');
			f.iconName.focus();
			return false;
		}

		str = f.ncontent.value.trim();
	    if(!str) {
	        alert('내용을 입력하세요. ');
	        f.iconPrice.focus();
	        return;
	    }
	    
	    
	    let url = "${pageContext.request.contextPath}/admin/csManage/writenotice";
		
		let formData = new FormData(f);
		
		const fn = function(data){
			let state = data.state;
			if(state=="false"){
				alert("공지사항 등록에 실패했습니다.");
				return false;
			}
			
			$('#notice').modal('hide');
		};
		ajaxFun(url,'post',formData, 'json', fn,true);
		
	});
	
});

$(function(){
	$('.containercs').on('click','.faq', function(){
		
		const f  = document.faqForm;
		
		let str;
		
		str = f.fsubject.value.trim();
		if(!str) {
			alert('제목을 입력해주세요. ');
			f.iconName.focus();
			return false;
		}

		str = f.fcontent.value.trim();
	    if(!str) {
	        alert('내용을 입력하세요. ');
	        f.iconPrice.focus();
	        return;
	    }
	    
	    
	    let url = "${pageContext.request.contextPath}/admin/csManage/writefaq";
		
		let formData = new FormData(f);
		
		const fn = function(data){
			let state = data.state;
			if(state=="false"){
				alert("공지사항 등록에 실패했습니다.");
				return false;
			}
			
			$('#faq').modal('hide');
		};
		ajaxFun(url,'post',formData, 'json', fn,true);
		
	});
	
});

$(function(){
	$('.tab-pane').on('click','.qanswer', function(){
		
		var qnum = $(this).data('qnum');
		$('.body-main #qnum').val(qnum);
		console.log(qnum);
	})
	
	
	
	
	$('.containercs').on('click','.qna', function(){
		var qnumfinal = $('#qna #qnum').val();
		$(this).data('final' ,qnumfinal);
		
		const f  = document.qnaForm;
		
		let str;
		
		str = f.answer.value.trim();
		if(!str) {
			alert('답변을 입력해주세요. ');
			f.iconName.focus();
			return false;
		}
	    
	    
	    let url = "${pageContext.request.contextPath}/admin/csManage/updateqna";
		
		let formData = new FormData(f);
		
		const fn = function(data){
			let state = data.state;
			if(state=="false"){
				alert("공지사항 등록에 실패했습니다.");
				return false;
			}
			
			$('#qna').modal('hide');
			location.reload();
		};
		ajaxFun(url,'post',formData, 'json', fn,true);
		
	});
	
});




</script>