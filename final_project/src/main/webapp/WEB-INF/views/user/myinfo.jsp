<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
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
		 <form action="" style="margin: 30px auto">
		  <h4>개인정보수정</h4>
			<div class="form">
			    <label for="email" class="col-sm-1 col-form-label">아이디</label>
			    <input type="text" class="form-control" id="email" name="email" value="" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="name" class="col-sm-1 col-form-label">이름</label>
			    <input type="text" class="form-control" id="name" name="name" value="" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="pw" class="col-sm-1 col-form-label">비밀번호</label>
			    <input type="text" class="form-control" id="pw" name="pw" value="">
		    </div>
			<div class="form">
			    <label for="area" class="col-sm-1 col-form-label">지역</label>
			    <input type="text" class="form-control" id="area" name="area" value="">
		    </div>
			<div class="form">
			    <label for="nickname" class="col-sm-1 col-form-label">닉네임</label>
			    <input type="text" class="form-control" id="nickname" name="nickname" value="">
		    </div>
			<div class="form">
			    <label for="age" class="col-sm-1 col-form-label">나이</label>
			    <input type="text" class="form-control" id="age" name="age" value="" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="gender" class="col-sm-1 col-form-label">성별</label>
			    <input type="text" class="form-control" id="gender" name="gender" value="" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="phone" class="col-sm-1 col-form-label">연락처</label>
			    <input type="text" class="form-control" id="phone" name="phone" value="">
		    </div>
			<div class="row g-3">
				<div class="col-auto">
				    <label for="ctno_1" class="col-form-label">관심사1</label>
				    <input type="text" class="form-control" id="ctno_1" name="ctno_1" value="">
				</div>
				<div class="col-auto">
				    <label for="ctno_2" class="col-form-label">관심사2</label>
				    <input type="text" class="form-control" id="ctno_2" name="ctno_2" value="">
				</div>
				<div class="col-auto">
				    <label for="ctno_3" class="col-form-label">관심사3</label>
				    <input type="text" class="form-control" id="ctno_3" name="ctno_3" value="">
			    </div>
		    </div>
		    <div class="d-grid gap-2 d-md-block text-end">
		    	<button class="btn btn-outline-warning" id="myinfoBtn" type="submit">수정</button>
		    </div>
		    </form>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>