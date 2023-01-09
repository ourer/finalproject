<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<!-- waiting 가져오기 -->
<section>
	<h1>가입 대기명단</h1>
	<table>
		<tr>
			<th>이름</th>
			<th>지역</th>
			<th>나이</th>
			<th>성별</th>
			<th>가입 대기</th>
		</tr>
			<c:forEach items="${list1}" var="user">
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
				</tr>
			</c:forEach>
	</table>

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
			<th>멤버 관리</th>
			<th>운영진 임명 · 해제</th>
		</tr>
			<c:forEach items="${list2}" var="uvo" >
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
					<td>
						<button type="button">강퇴</button>
					</td>
					<td>
						<button type="button">임명</button>
						<button type="button">해제</button>
					</td>
				</tr>
			</c:forEach>
	</table>

	</section>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
