<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<style>
.row{
	margin-top: 10px;
}
</style>
<section>
		<ul class="nav nav-tabs">
		 <li class="nav-item dropdown"><h3>마이페이지</h3></li>
		  <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">나의 소모임</a>
		    <ul class="dropdown-menu">
		      <li><a class="dropdown-item" href="/user/mypage">목록</a></li>
		      <li><a class="dropdown-item" href="/user/management">관리</a></li>
		    </ul>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/user/like">찜</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/user/myinfo">개인정보수정</a>
		  </li>
		</ul>
		 <form action="/user/modify" style="margin: 30px auto" method="post">
		  <h4>개인정보수정</h4>
			<div class="form">
			    <label for="email" class="col-sm-1 col-form-label">아이디</label>
			    <input type="text" class="form-control" id="email" name="email" value="${ses.email }" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="name" class="col-sm-1 col-form-label">이름</label>
			    <input type="text" class="form-control" id="name" name="name" value="${ses.name }" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="area" class="col-sm-1 col-form-label">지역</label>
			    <input type="text" class="form-control" id="area" name="area" value="${ses.area }">
		    </div>
			<div class="form">
			    <label for="nickname" class="col-sm-1 col-form-label">닉네임</label>
			    <input type="text" class="form-control" id="nickname" name="nickname" value="${ses.nickname }" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="age" class="col-sm-1 col-form-label">나이</label>
			    <input type="text" class="form-control" id="age" name="age" value="${ses.age }" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="gender" class="col-sm-1 col-form-label">성별</label>
			    <input type="text" class="form-control" id="gender" name="gender" value="${ses.gender }" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="phone" class="col-sm-1 col-form-label">연락처</label>
			    <input type="text" class="form-control" id="phone" name="phone" value="${ses.phone }">
		    </div>
		    <div class="row g-3">
				<div class="innerSecond col-auto">관심사1:
                   <select class="form-select" name="code" id="code" onchange="spreadCtno(this.selectedIndex)">
                       <option value="대분류">대분류</option>
                       <option value="A">운동</option>
                       <option value="B">아웃도어/여행</option>
                       <option value="C">독서</option>
                       <option value="D">언어/외국</option>
                       <option value="E">문화/공연/예술</option>
                       <option value="F">음악/악기</option>
                       <option value="G">공예/만들기</option>
                       <option value="H">봉사활동</option>
                       <option value="I">게임/오락</option>
                       <option value="J">사진/영상</option>
                       <option value="K">요리/제조</option>
                       <option value="L">반려동물</option>
                   </select>
                   <select class="form-select" name="ctno_1" id="ctno" class="ctno_1">
                       <option value="0">중분류</option>
                   </select>
                   </div>
			<div class="innerSecond2 col-auto">관심사2:
                   <select class="form-select" name="code" id="code" onchange="spreadCtno(this.selectedIndex)">
                      <option value="대분류">대분류</option>
                      <option value="A">운동</option>
                      <option value="B">아웃도어/여행</option>
                      <option value="C">독서</option>
                      <option value="D">언어/외국</option>
                      <option value="E">문화/공연/예술</option>
                      <option value="F">음악/악기</option>
                      <option value="G">공예/만들기</option>
                      <option value="H">봉사활동</option>
                      <option value="I">게임/오락</option>
                      <option value="J">사진/영상</option>
                      <option value="K">요리/제조</option>
                      <option value="L">반려동물</option>
                   </select>
                   <select class="form-select" name="ctno_2" id="ctno" class="ctno_2">
                       <option value="0">중분류</option>
                   </select>
               </div>
			<div class="innerSecond3 col-auto">관심사3: 
                 <select class="form-select" name="code" id="code" onchange="spreadCtno(this.selectedIndex)">
                      <option value="대분류">대분류</option>
                      <option value="A">운동</option>
                      <option value="B">아웃도어/여행</option>
                      <option value="C">독서</option>
                      <option value="D">언어/외국</option>
                      <option value="E">문화/공연/예술</option>
                      <option value="F">음악/악기</option>
                      <option value="G">공예/만들기</option>
                      <option value="H">봉사활동</option>
                      <option value="I">게임/오락</option>
                      <option value="J">사진/영상</option>
                      <option value="K">요리/제조</option>
                      <option value="L">반려동물</option>
                  </select>
                  <select class="form-select" name="ctno_3" id="ctno" class="ctno_3">
                      <option value="0">중분류</option>
                  </select>
              </div>
              </div>
		    <div class="d-grid gap-2 d-md-block text-end">
		    	<button class="btn btn-outline-warning" id="myinfoBtn" type="submit">수정</button>
		    </div>
		    </form>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/UserRegister.js"></script>