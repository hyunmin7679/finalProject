<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="content-wrapper">

	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="py-3 mb-4">
			<span class="text-muted fw-light">관리자 마이페이지 /</span> 관리자이름
		</h4>
		<div class="row">
			<div class="col-md-12">
				<div class="nav-align-top mb-4">
					<ul class="nav nav-pills mb-3" role="tablist">
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link active" role="tab"
								data-bs-toggle="tab" data-bs-target="#navs-pills-top-home"
								aria-controls="navs-pills-top-home" aria-selected="true">
								<i class="bx bx-user me-1"></i> 계정
							</button>
						</li>
						<li class="nav-item" role="presentation">
							<button type="button" class="nav-link" role="tab"
								data-bs-toggle="tab" data-bs-target="#navs-pills-top-profile"
								aria-controls="navs-pills-top-profile" aria-selected="false"
								tabindex="-1">
								<i class="bx bx-lock-alt me-1"></i> 보안
							</button>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade active show" id="navs-pills-top-home"
							role="tabpanel">
							<h5 class="card-header">계정 상세</h5>
							<div class="card-body">
								<div
									class="d-flex align-items-start align-items-sm-center gap-4">
									<img src="../../bootstrapTemp/assets/img/avatars/robot.jpg"
										alt="user-avatar" class="d-block rounded" height="100"
										width="100" id="uploadedAvatar" />
									<div class="button-wrapper">
										<label for="upload" class="btn btn-primary me-2 mb-4"
											tabindex="0"> <span class="d-none d-sm-block">프로필
												사진 변경</span> <i class="bx bx-upload d-block d-sm-none"></i> <input
											type="file" id="upload" class="account-file-input" hidden
											accept="image/png, image/jpeg" />
										</label>

										<p class="text-muted mb-0">JPG, GIF or PNG 형식만 가능합니다.</p>
									</div>
								</div>
							</div>
							<hr class="my-0">
							<div class="card-body">
								<form id="formAccountSettings" method="POST"
									onsubmit="return false">
									<div class="row">
										<div class="mb-3 col-md-6">
											<label for="firstName" class="form-label">이름</label> <input
												class="form-control" type="text" id="firstName"
												name="firstName" value="도훈" autofocus />
										</div>
										<div class="mb-3 col-md-6">
											<label for="email" class="form-label">E-mail</label> <input
												class="form-control" type="text" id="email" name="email"
												value="김도훈@example.com" placeholder="이메일을 입력하세요" />
										</div>
										<div class="mb-3 col-md-6">
											<label for="organization" class="form-label">부서</label> <select
												id="team" class="select2 form-select">
												<option value="Australia">홍보부</option>
												<option value="Bangladesh" selected>개발부</option>
												<option value="Belarus">영업부</option>
											</select>
										</div>
										<div class="mb-3 col-md-6">
											<label class="form-label" for="phoneNumber">전화번호</label>
											<div class="input-group input-group-merge">
												<span class="input-group-text">KR (+82)</span> <input
													type="text" id="phoneNumber" name="phoneNumber"
													class="form-control" value="010-1234-1234"
													placeholder="전화번호를 입력하세요" />
											</div>
										</div>
										<div class="mb-3 col-md-6">
											<label for="zipCode" class="form-label">우편번호</label> <input
												type="text" name="zip" id="zip" class="form-control"
												placeholder="우편번호" value="${dto.zip}" readonly>
											<button class="btn btn-secondary mt-4" type="button"
												style="margin-left: 3px; float: right;"
												onclick="daumPostcode();">우편번호 검색</button>
										</div>
										<div class="mb-3 col-md-6">
											<label for="addr1" class="form-label">주소</label> <input
												type="text" name="addr1" id="addr1" class="form-control"
												placeholder="기본주소" value="${dto.addr1}" readonly> <label
												for="addr1" class="form-label"></label> <input type="text"
												name="addr2" id="addr2" class="form-control"
												placeholder="상세주소" value="${dto.addr2}">
										</div>

										<button type="submit" class="btn btn-danger mb-2 mt-2 "
											style="width: 10%; margin-left: 90%;">수정 완료</button>
									</div>
								</form>
							</div>
						</div>
						<div class="tab-pane fade" id="navs-pills-top-profile"
							role="tabpanel">
							<h5 class="card-header">비밀번호 변경</h5>
							<div class="card-body">
								<form id="formAccountSettings" method="POST"
									onsubmit="return false"
									class="fv-plugins-bootstrap5 fv-plugins-framework"
									novalidate="novalidate">
									<div class="row">
										<div
											class="mb-3 col-md-6 form-password-toggle fv-plugins-icon-container">
											<label class="form-label" for="currentPassword">현재 비밀번호</label>
											<div class="input-group input-group-merge has-validation">
												<input class="form-control" type="password" value="asd123+"
													name="currentPassword" id="currentPassword"
													placeholder="············"> <span
													class="input-group-text cursor-pointer"><i
													class="bx bx-hide"></i></span>
											</div>
											<div
												class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
										</div>
									</div>
									<div class="row">
										<div
											class="mb-3 col-md-6 form-password-toggle fv-plugins-icon-container">
											<label class="form-label" for="newPassword">새로운 비밀번호</label>
											<div class="input-group input-group-merge has-validation">
												<input class="form-control" type="password" id="newPassword"
												
													name="newPassword" placeholder="············"> <span
													class="input-group-text cursor-pointer"><i
													class="bx bx-hide"></i></span>
											</div>
											<div
												class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
										</div>

										<div
											class="mb-3 col-md-6 form-password-toggle fv-plugins-icon-container">
											<label class="form-label" for="confirmPassword">비밀번호 확인</label>
											<div class="input-group input-group-merge has-validation">
												<input class="form-control" type="password"
													name="confirmPassword" id="confirmPassword"
													placeholder="············"> <span
													class="input-group-text cursor-pointer"><i
													class="bx bx-hide"></i></span>
											</div>
											<div
												class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback"></div>
										</div>
										<div class="col-12 mb-4">
											<p class="fw-medium mt-2">비밀번호 양식:</p>
											<ul class="ps-3 mb-0">
												<li class="mb-1">패스워드는 5~10자</li>
												<li class="mb-1">하나 이상의 숫자가 포함되어야 합니다.</li>
												<li class="mb-1">하나 이상의 특수문자가 포함되어야 합니다.</li>
											</ul>
										</div>
										<div class="col-12 mt-1">
											<button type="submit" class="btn btn-secondary me-2">비밀번호 변경</button>
											<button type="reset" class="btn btn-label-secondary">취소</button>
										</div>
									</div>
									<input type="hidden">
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>