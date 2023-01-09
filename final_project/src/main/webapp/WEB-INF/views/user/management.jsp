<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
		<ul class="nav nav-tabs" style="margin: 30px auto">
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
		<div class="row">
		  <div class="col-sm-6">
		    <div class="card">
		      <div class="card-body">
				<img src="https://m.colettemung.com/web/product/big/202009/5b2194624e6fbe01f2bf3541b4935dd4.jpg" class="rounded-circle mx-auto d-block" alt="..." style="width: 140px;">		        
		        <div class="text-center">
		        	<span>윤승희</span>
		        	<span>님</span>
		        </div>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-6">
		    <div class="card">
		      <div class="card-body text-center">
		        <h3>내 소모임 관리</h3>
		        <a href="/user/management"> 개</a>
		      </div>
		    </div>
		    <div class="card">
		      <div class="card-body text-center">
		      	<h3>내가 찜한 소모임</h3>
		        <a href="/user/like"> 개</a>
		      </div>
		    </div>
		  </div>
		</div>
		<h4 style="margin-top: 30px">내 소모임 관리</h4>
		<table class="table caption-top text-center" style="margin: 30px auto">
		<caption>가입 대기명단</caption>
		<colgroup>
			<col width="30%" />
			<col width="30%" />
			<col width="10%" />
			<col width="30%" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">프로필</th>
				<th scope="col">이름</th>
				<th scope="col">지역</th>
				<th scope="col">나이</th>
				<th scope="col">성별</th>
				<th scope="col">가입승인</th>
			</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${list1}" var="user">
				<tr>
					
					<td>비공개</td>
					<td>${user.name }</td>
					<td>${user.area }</td>
					<td>${user.age }</td>
					<c:if test="${user.gender =='0'}">
					<td>남자</td>
					</c:if>
					<c:if test="${user.gender =='1'}">
					<td>여자</td>
					</c:if>
					<td><button class="btn btn-sm btn-outline-success admit" type="button">승인</button><button class="btn btn-sm btn-outline-danger deny" type="button">거절</button></td>					
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<table class="table caption-top text-center" style="margin: 30px auto">
		<caption>소모임 멤버</caption>
		<colgroup>
			<col width="30%" />
			<col width="30%" />
			<col width="10%" />
			<col width="30%" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">프로필</th>
				<th scope="col">이름</th>
				<th scope="col">지역</th>
				<th scope="col">나이</th>
				<th scope="col">성별</th>
				<th scope="col">운영진임명</th>
			</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${list2}" var="user">
				<tr>
					<td>비공개</td>
					<td>${user.name }</td>
					<td>${user.area }</td>
					<td>${user.age }</td>
					<c:if test="${user.gender =='0'}">
					<td>남자</td>
					</c:if>
					<c:if test="${user.gender =='1'}">
					<td>여자</td>
					</c:if>
					<td><button class="btn btn-sm btn-outline-success special" type="button">임명</button><button class="btn btn-sm btn-outline-danger normal" type="button">해제</button></td>					
				</tr>
			</c:forEach>
			</tbody>
		</table>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>