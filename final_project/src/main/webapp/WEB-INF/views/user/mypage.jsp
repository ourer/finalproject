<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
		<ul class="nav nav-tabs">
		 <li class="nav-item dropdown"><h3>마이페이지</h3></li>
		  <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">나의 소모임</a>
		    <ul class="dropdown-menu">
				<li><a class="dropdown-item" href="/user/mypage/${ses.email }">목록</a></li>
		      <li><a class="dropdown-item" href="/user/management/${ses.email }" >관리</a></li>
		    </ul>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/favorite/mylike/${ses.email }">찜</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/user/myinfo">개인정보수정</a>
		  </li>
		</ul>
		<div class="row">
		  <div class="col-sm-6">
		    <div class="card">
		      <div class="card-body">
				<img src="/upload/${fn:replace(sespvo.dir,'\\','/')}/${sespvo.uuid}_${sespvo.name}" class="rounded-circle mx-auto d-block" alt="..." style="width: 140px;">		        
		        <div class="text-center">
		        	<span>${ses.name }</span>
		        	<span>님</span>
		        </div>
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-6">
		    <div class="card">
		      <div class="card-body text-center">
		        <h3>내 소모임 관리</h3>
		        <a href="/user/management/${ses.email }"> 개</a>
		      </div>
		    </div>
		    <div class="card">
		      <div class="card-body text-center">
		      	<h3>내가 찜한 소모임</h3>
		        <c:forEach items="${fList }" var="fvo">
		        <a href="/favorite/mylike/${ses.email }">${fvo.cntFav } 개</a>
		      	</c:forEach>
		      </div>
		    </div>
		  </div>
		</div>
		<h4 style="margin-top: 30px">내 소모임 리스트</h4>
		<table class="table text-center">
		<colgroup>
			<col width="30%" />
			<col width="60%" />
			<col width="10%" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">소모임 이름</th>
				<th scope="col">활동내용</th>
				<th scope="col">탈퇴</th>
			</tr>
			</thead>
			<tbody class="table-group-divider">
				<tr>
					<td></td>
					<td></td>
					<td>✖️</td>					
				</tr>
			</tbody>
		</table>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>