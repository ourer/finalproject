<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<jsp:include page="./layout/header.jsp"></jsp:include>
<style>
.likecategory{
	width:90%;
	margin: 0 auto 100px auto;
}
.icon{
	width: 130px;
	height: 130px;
	margin:10px;
	background: #f2f2e1;
	border: none;
	border-radius: 20px;
}
.fa-solid{
	font-size: 2em;
	margin: 10px auto;
}
.icontext{
	font-weight: bold;
	width: 100%;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}
.icon{
	transition: all 0.2s ease-in-out;
}
.icon:hover {
	transform: scale(1.07);
}
</style>
<section>
	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel" style="margin-top: 50px; margin-bottom: 100px">
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
        <div class="likecategory">
           <button type="button" class="icon" id="category_A" onclick="location.href='/category/categoryDetail?code=A'">
              <i class="fa-solid fa-person-running"></i>
              <span class="icontext">운동</span>
           </button>
           <button type="button" class="icon" id="category_B" onclick="location.href='/category/categoryDetail?code=B'">
              <i class="fa-solid fa-mountain-sun"></i>
              <span class="icontext">아웃도어/여행</span>
           </button>
           <button type="button" class="icon" id="category_C" onclick="location.href='/category/categoryDetail?code=C'">
              <i class="fa-solid fa-book"></i>
              <span class="icontext">독서</span>
           </button>
           <button type="button" class="icon" id="category_D" onclick="location.href='/category/categoryDetail?code=D'">
              <i class="fa-solid fa-language"></i>
              <span class="icontext">언어/외국</span>
           </button>
           <button type="button" class="icon" id="category_E" onclick="location.href='/category/categoryDetail?code=E'">
              <i class="fa-solid fa-building-columns"></i>
              <span class="icontext">문화/공연/예술</span>
           </button>
           <button type="button" class="icon" id="category_F" onclick="location.href='/category/categoryDetail?code=F'">
              <i class="fa-solid fa-music"></i>
              <span class="icontext">음악/악기</span>
           </button>
           <button type="button" class="icon" id="category_G" onclick="location.href='/category/categoryDetail?code=G'">
              <i class="fa-solid fa-palette"></i>
              <span class="icontext">공예/만들기</span>
           </button>
           <button type="button" class="icon" id="category_H" onclick="location.href='/category/categoryDetail?code=H'">
              <i class="fa-solid fa-handshake-angle"></i>
              <span class="icontext">봉사활동</span>
           </button>
           <button type="button" class="icon" id="category_I" onclick="location.href='/category/categoryDetail?code=I'">
              <i class="fa-solid fa-gamepad"></i>
              <span class="icontext">게임/오락</span>
           </button>
           <button type="button" class="icon" id="category_J" onclick="location.href='/category/categoryDetail?code=J'">
              <i class="fa-solid fa-camera"></i>
              <span class="icontext">사진/영상</span>
           </button>
           <button type="button" class="icon" id="category_K" onclick="location.href='/category/categoryDetail?code=K'">
              <i class="fa-solid fa-kitchen-set"></i>
              <span class="icontext">요리/제조</span>
           </button>
           <button type="button" class="icon" id="category_L" onclick="location.href='/category/categoryDetail?code=L'">
              <i class="fa-solid fa-dog"></i>
              <span class="icontext">반려동물</span>
           </button>
        </div>
		 
		 <h3 style="margin: 30px auto">오늘의 추천 소모임</h3>
		 <div class="row row-cols-1 row-cols-md-4 g-4" style="margin-bottom: 100px">
		  <div class="col">
		    <div class="card h-100">
		  		<img src="/resources/img/java.jpg" class="card-img-top">
		  <div class="card-body">
		    <h5 class="card-title">개발자</h5>
		    <p class="card-text">자바 웹 개발을 공부하는 사람들 모두 모여라!!<br>비전공자, 전공자 상관없어요~</p>
		    <a href="#" class="btn btn-warning">구경하기</a>
		   </div>
		  </div>
		 </div>
		  <div class="col">
		    <div class="card h-100">
		  		<img src="/resources/img/museum.jpg" class="card-img-top">
		  <div class="card-body">
		    <h5 class="card-title">전시회</h5>
		    <p class="card-text">우리나라 곳곳에 숨어있는 전시회를 찾아다니자~</p>
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
		  		<img src="/resources/img/ball.jpg" class="card-img-top">
		  <div class="card-body">
		    <h5 class="card-title">야유회</h5>
		    <p class="card-text">주말에 모여서 운동할 사람 모여라!<br>간단한 조깅부터 축구, 발야구, 배드민턴 등</p>
		    <a href="#" class="btn btn-warning">구경하기</a>
		   </div>
		  </div>
		 </div>
		</div>
</section>
<jsp:include page="./layout/footer.jsp"></jsp:include>