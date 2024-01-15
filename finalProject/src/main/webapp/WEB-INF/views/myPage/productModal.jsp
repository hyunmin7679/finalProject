<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="qna-form p-2">
					<form name="questionForm">
						<div class="row">
							<div class="col">
								<span class="fw-bold">문의사항 쓰기</span><span> - 상품 및 상품 구매 과정과 관련없는 글은 삭제 될 수 있습니다.</span>
							</div>
							<div class="col-3 text-end">
								<input type="checkbox" name="secret" id="secret1" class="form-check-input" 
									value="1">
								<label class="form-check-label" for="secret1">비공개</label>
							</div>
						</div>
						<div class="p-1">
							<input type="hidden" name="productNum" value="${qna.productNum}">
							<input type="hidden" name="q_subject" value="[상품] 상품관련 문의">
							<textarea name="question" id="question" class="form-control"></textarea>
						</div>
						<div class="p-1">
							<div class="img-grid">
								<img class="item img-add" src="${pageContext.request.contextPath}/resources/images/add_photo.png">
							</div>
							<input type="file" name="selectFile" accept="image/*" multiple class="form-control" style="display: none;">
						</div>							
					</form>
				</div>
		