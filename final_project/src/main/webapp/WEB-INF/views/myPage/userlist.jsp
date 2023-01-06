<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>

<section>
	<h1>가입 대기명단</h1>
	<table>
		<tr>
			<th>이름</th>
			<th>지역</th>
			<th>나이</th>
			<th>성별</th>
			<th>가입 대기</th>
			<th>소모임 번호</th>
		</tr>
			<c:forEach items="${list}" var="user">
			<c:if test="${ses.grno!=user.grno }">
				<tr>
					<td>${user.name }</td>
					<td>${user.area }</td>
					<td>${user.age }</td>
					<c:if test="${user.gender =='0'}">
					<td>남자</td>
					</c:if>
					<c:if test="${user.gender =='1'}">
					<td>여자</td>
					</c:if>
					<td>
					<button type="button">승인</button>
					<button type="button">거절</button>
					</td>
					<td>${user.grno }</td>
				</tr>
			</c:if>
			</c:forEach>
	</table>
	<div>
	<c:if test="${pgh1.prev }">
		<a href="/user/userlist?pageNo1=${pgh1.startPage-1 }&pageNo2=${pgh2.pgvo.pageNo } ">◀</a>
	</c:if>
	<c:forEach begin="${pgh1.startPage }" end="${pgh1.endPage }" var="i">
		<a href="/user/userlist?pageNo1=${i }&pageNo2=${pgh2.pgvo.pageNo }">${i } ｜</a>
	</c:forEach>
	<c:if test="${pgh1.next }">
		<a href="/user/userlist?pageNo1=${pgh1.endPage+1 }&pageNo2=${pgh2.pgvo.pageNo } ">▶</a>
	</c:if>
</div>
</section>
	<br>
	<br>
	<hr>
	<section>
	<h1>소모임 멤버</h1>
		<table>
		<tr>
			<th>이름</th>
			<th>지역</th>
			<th>나이</th>
			<th>성별</th>
			<th>소모임 번호</th>
			<th>멤버 관리</th>
			<th>운영진 임명 · 해제</th>
		</tr>
			<c:forEach items="${list}" var="uvo" >
			<c:if test="${ses.grno==uvo.grno }">
				<tr>
					<td>${uvo.name }</td>
					<td>${uvo.area }</td>
					<td>${uvo.age }</td>
					<c:if test="${uvo.gender =='0'}">
					<td>남자</td>
					</c:if>
					<c:if test="${uvo.gender =='1'}">
					<td>여자</td>
					</c:if>
					<td>${uvo.grno }</td>
					<td>
						<button type="button">강퇴</button>
					</td>
					<td>
						<button type="button">임명</button>
						<button type="button">해제</button>
					</td>
				</tr>
			</c:if>
			</c:forEach>
	</table>
	<div>
	<c:if test="${pgh2.prev }">
		<a href="/user/userlist?pageNo2=${pgh2.startPage-1 }&pageNo1=${pgh1.pgvo.pageNo } ">◀</a>
	</c:if>
	<c:forEach begin="${pgh2.startPage }" end="${pgh2.endPage }" var="j">
		<a href="/user/userlist?pageNo2=${j }&pageNo1=${pgh1.pgvo.pageNo }">${j } ｜</a>
	</c:forEach>
	<c:if test="${pgh2.next }">
		<a href="/user/userlist?pageNo2=${pgh2.endPage+1 }&pageNo1=${pgh1.pgvo.pageNo } ">▶</a>
	</c:if>
</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	</section>
