<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<jsp:include page="../layout/header.jsp"></jsp:include>
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
		  
	<!-- 카테고리 name -->
	<div class="d-grid gap-2 d-md-block">
		<c:forEach items="${cList }" var="cvo" begin="0">
  			<button class="btn btn-outline-warning" type="button" onclick="location.href='/category/categoryName?name=${cvo.name }'">${cvo.name }</button>
		</c:forEach>
	</div>
	
	<br>
	
	<div class="row row-cols-1 row-cols-md-4 g-4" style="margin-bottom: 100px">
	<c:forEach items="${cateList }" var="cavo" begin="0" varStatus="status">
		<div class="col">
			<div class="card h-100">
				<c:if test="${cavo.uuid == null}">
					<img alt="sgMain" src="/resources/img/monkey.jpg">
				</c:if>
				<c:if test="${cavo.uuid != null}">
					<img alt="sgMain" src="/upload/sgMainUpload/${fn:replace(cavo.dir,'\\','/')}/${cavo.uuid}_${cavo.sm_name}" class="card-img-top">
				</c:if>
				<div class="card-body">
					<h5 class="card-title">${cavo.sg_name }</h5>
					<p class="card-text">${cavo.detail }</p>
					<p class="card-text">${cavo.city}  ${cavo.county }</p>
					<a href="/group/main?grno=${cavo.grno}" class="btn btn-warning">구경하기</a>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>