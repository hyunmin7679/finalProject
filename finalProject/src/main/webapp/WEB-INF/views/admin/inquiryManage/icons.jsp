<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

      

      <!-- Content wrapper -->
      <div class="content-wrapper">

        <!-- Content -->
        
          <div class="container-xxl flex-grow-1 container-p-y">
            
            
<h4 class="py-3 mb-4">
  &nbsp;&nbsp;아이콘 관리
</h4>


<div style="height: 50px;">
	<div class="d-flex justify-content-center mx-auto gap-3 float-end">
	<button class="btn btn-danger">아이콘 삭제</button>
  <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#editUser"> + 아이콘 추가</button>
</div>
</div>
<!-- Icon container -->
<div class="card" style="margin-top: 30px; background-color: white;">
	<div class=" card-datable">
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/cat.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/rdog.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/bulldog.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/wcat.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/hdog.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/bcat.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/rundog.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/fcat.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/sdog.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
   <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/cat.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/rdog.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/bulldog.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/wcat.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/hdog.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/bcat.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/rundog.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/fcat.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
  <div class="d-flex flex-wrap mt-4 ms-3 me-2" id="icons-container" style="border: none; float: left;">
   <div class="card icon-card cursor-pointer text-center  mb-4 mx-2" style="background-color: white; border: 0;">
  	<input type="checkbox" style="align-self: flex-end;">
    <img style="border: none; width: 50px; height: 50px;" src="../../bootstrapTemp/assets/img/avatars/sdog.gif" class="img-fluid" alt="FAQ Image" data-app-light-img="illustrations/sitting-girl-with-laptop-light.png" data-app-dark-img="illustrations/sitting-girl-with-laptop-dark.png">
    <p style="padding-bottom: 0; margin-bottom: 0;"></p>
    </div>
  </div>
 </div>
 </div>
  <div class="modal fade" id="editUser" tabindex="-1" aria-hidden="true" style="display: none;">
  <div class="modal-dialog modal-lg modal-simple modal-edit-user">
    <div class="modal-content p-3 p-md-5">
      <div class="modal-body">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        <div class="text-center mb-4">
          <h3>아이콘 추가</h3>
          <p>유저를 위한 아이콘을 추가하세요</p>
        </div>
        <form id="editUserForm" class="row g-3" onsubmit="return false">
          <div class="col-12  mt-3" style="margin: auto;">
            <input style="text-align: center;" type="text" id="modalEditUserFirstName" name="modalEditUserFirstName" class="form-control" placeholder="아이콘 이름">
          </div>
          <div class="col-12  mt-3">
            <input style="text-align: center;" type="text" id="modalEditUserName" name="modalEditUserName" class="form-control" placeholder="가격">
          </div>
          <div class="col-12 mt-3">
            <select id="modalEditUserStatus" name="modalEditUserStatus" class="form-select" aria-label="Default select example">
              <option selected="" style="text-align: center;">카테고리</option>
              <option value="1">강아지</option>
              <option value="2">고양이</option>
              <option value="3">기타</option>
            </select>
          </div>
          <div class="col-12 mt-3" style="text-align: center;">
          <img alt="이미지" src="../../bootstrapTemp/assets/img/avatars/blank.png" style="width: 100px; height: 100px;">
          </div>

          <div class="col-12 text-center">
            <button type="submit" class="btn btn-secondary me-sm-3 me-1">확인</button>
            <button type="reset" class="btn btn-label-secondary" data-bs-dismiss="modal" aria-label="Close">Cancel</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
  


<!-- Buttons -->


          </div>
          <!-- / Content -->

          
          

<!-- Footer -->
<footer class="content-footer footer bg-footer-theme">

</footer>
<!-- / Footer -->

          
          <div class="content-backdrop fade"></div>
        </div>
