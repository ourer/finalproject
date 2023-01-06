<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<jsp:include page="./layout/header.jsp"></jsp:include>
<section>
	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel" style="margin: 30px auto">
		  <div class="carousel-inner">
		    <div class="carousel-item active" data-bs-interval="5000">
		      <img src="/resources/img/mainjava.gif" class="d-block w-100" height="500px">
		    </div>
		    <div class="carousel-item" data-bs-interval="5000">
		      <img src="/resources/img/maineat.gif" class="d-block w-100" height="500px">
		    </div>
		    <div class="carousel-item" data-bs-interval="5000">
		      <img src="/resources/img/mainphoto.jpg" class="d-block w-100" height="500px">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		 </div>
		  
		  <h3 style="margin: 30px auto">관심사</h3>
		  <div class="row row-cols-1 row-cols-md-6 g-6" style="margin-bottom: 50px">
		  <div class="col">
		  		<a href=""><span class="material-symbols-outlined">fitness_center</span>운동</a>
			</div>
		  
		 </div>
		 
		 <h3 style="margin: 30px auto">오늘의 추천 소모임</h3>
		 <div class="row row-cols-1 row-cols-md-4 g-4" style="margin-bottom: 50px">
		  <div class="col">
		    <div class="card h-100">
		  		<img src="/resources/img/java.jpg" class="card-img-top">
		  <div class="card-body">
		    <h5 class="card-title">개하싶</h5>
		    <p class="card-text">자바 웹 개발을 공부하는 사람들 모두 모여라!!<br>비전공자, 전공자 상관없어요~</p>
		    <a href="#" class="btn btn-warning">구경하기</a>
		   </div>
		  </div>
		 </div>
		  <div class="col">
		    <div class="card h-100">
		  		<img src="/resources/img/museum.jpg" class="card-img-top">
		  <div class="card-body">
		    <h5 class="card-title">아울러</h5>
		    <p class="card-text">아울러 많이 이용해주시고 관심가져주세요~</p>
		    <a href="#" class="btn btn-warning">구경하기</a>
		   </div>
		  </div>
		 </div>
		  <div class="col">
		    <div class="card h-100">
		  		<img src="/resources/img/drink.jpg" class="card-img-top">
		  <div class="card-body">
		    <h5 class="card-title">먹고마셔</h5>
		    <p class="card-text">다양한 주종을 즐겨보는 모임..!<br>이 지역의 핫플은 우리가 선도한다!</p>
		    <a href="#" class="btn btn-warning">구경하기</a>
		   </div>
		  </div>
		 </div>
		  <div class="col">
		    <div class="card h-100">
		  		<img src="/resources/img/ppo.jpg" class="card-img-top">
		  <div class="card-body">
		    <h5 class="card-title">뽀또</h5>
		    <p class="card-text">사진찍는거 좋아하는 사람 모두 모여라~<br>DSLR, 디지털, 핸드폰 도구는 상관이 없어요^^</p>
		    <a href="#" class="btn btn-warning">구경하기</a>
		   </div>
		  </div>
		 </div>
		</div>
</section>
<jsp:include page="./layout/footer.jsp"></jsp:include>
