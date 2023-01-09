<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		 <form action="/user/myinfo" style="margin: 30px auto">
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
			    <input type="text" class="form-control" id="area" name="area" value="${ses.area }" readonly="readonly">
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
			    <input type="text" class="form-control" id="gender" name="gender" value="${ses.gender == 0? "남자":"여자" }" readonly="readonly">
		    </div>
			<div class="form">
			    <label for="phone" class="col-sm-1 col-form-label">연락처</label>
			    <input type="text" class="form-control" id="phone" name="phone" value="${ses.phone.substring(0,3)}-${ses.phone.substring(3,7)}-${ses.phone.substring(7)}" readonly="readonly">
		    </div>
			<div class="row g-3">
				<div class="col-auto">
				    <label for="ctno_1" class="col-form-label">관심사1</label>
				    <input type="text" class="form-control" id="ctno_1" name="ctno_1" value="${ses.ctno_1 }" readonly="readonly">
				</div>
				<div class="col-auto">
				    <label for="ctno_2" class="col-form-label">관심사2</label>
				    <input type="text" class="form-control" id="ctno_2" name="ctno_2" value="${ses.ctno_2 }" readonly="readonly">
				</div>
				<div class="col-auto">
				    <label for="ctno_3" class="col-form-label">관심사3</label>
				    <input type="text" class="form-control" id="ctno_3" name="ctno_3" value="${ses.ctno_3 }" readonly="readonly">
			    </div>
		    </div>
		    <div class="d-grid gap-2 d-md-block text-end">
		    	<a href="/user/modifymyinfo" class="btn btn-outline-warning">수정하기</a>
		    </div>
		    </form>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>
