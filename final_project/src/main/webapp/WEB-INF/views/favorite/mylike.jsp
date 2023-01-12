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
		      <li><a class="dropdown-item" href="/user/mypage">목록</a></li>
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
				<c:if test="${pvo.uuid == null}">
					<img src="/resources/img/blank-profile.png" class="rounded-circle mx-auto d-block" alt="..." style="width: 140px;">
				</c:if>
				<c:if test="${pvo.uuid != null}">
					<img src="/upload/${fn:replace(pvo.dir,'\\','/')}/${pvo.uuid}_th_${pvo.name}" class="rounded-circle mx-auto d-block" alt="..." style="width: 140px;"> 
				</c:if>
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
		        <a href="/favorite/mylike/${ses.email }"> 개</a>
		      </div>
		    </div>
		  </div>
		</div>
		<h4 style="margin-top: 30px">내가 찜한 소모임</h4>
		<table class="table text-center">
		<colgroup>
			<col width="10%" />
			<col width="30%" />
			<col width="50%" />
			<col width="10%" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">카테고리</th>
				<th scope="col">소모임 이름</th>
				<th scope="col">활동내용</th>
				<th scope="col">삭제</th>
			</tr>
			</thead>
			<tbody class="table-group-divider">
			<c:forEach items="${gList }" var="gvo">
				<tr>
					<td id="ctno">${gvo.ctno }</td>
					<td>${gvo.name }</td>
					<td>${gvo.detail }</td>					
					<td>✖️</td>					
				</tr>
			</c:forEach>
			</tbody>
		</table>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script type="text/javascript">
let ctnoList=new Array();
ctnoList[0]=new Array("중분류");
ctnoList[1]=new Array("조깅", "헬스", "필라테스", "수영", "테니스", "골프");
ctnoList[2]=new Array("등산", "캠핑", "낚시", "국내여행", "해외여행");
ctnoList[3]=new Array("책/독서", "인문학", "심리학", "철학", "작문/글쓰기");
ctnoList[4]=new Array("영어", "일본어", "중국어", "프랑스어", "스페인어");
ctnoList[5]=new Array("뮤지컬/오페라", "공연/연극", "영화", "전시회");
ctnoList[6]=new Array("노래/보컬", "기타/베이스", "드럼", "피아노", "밴드/합주");
ctnoList[7]=new Array("미술/그림", "플라워아트", "가죽공예", "가구/목공예", "도자/점토공예");
ctnoList[8]=new Array("양로원", "보육원", "환경봉사", "사회봉사", "유기견보호");
ctnoList[9]=new Array("다트", "보드게임", "온라인게임");
ctnoList[10]=new Array("영상제작/편집", "필름카메라", "DSLR", "디지털카메라");
ctnoList[11]=new Array("한식", "양식", "디저트", "제과/제빵");
ctnoList[12]=new Array("강아지", "고양이", "물고기", "소동물");

let ctnoAllList = [
    ...ctnoList[0],
    ...ctnoList[1],
    ...ctnoList[2],
    ...ctnoList[3],
    ...ctnoList[4],
    ...ctnoList[5],
    ...ctnoList[6],
    ...ctnoList[7],
    ...ctnoList[8],
    ...ctnoList[9],
    ...ctnoList[10],
    ...ctnoList[11],
    ...ctnoList[12],
]

console.log(ctnoAllList);

let ctnonum = '<c:out value="${gvo.ctno }"/>';
console.log(ctnonum);

let ctno = document.getElementById('ctno');
console.log(ctno);

console.log(ctnoAllList[ctno]);
</script>