<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<h1>list</h1>
		<table>
		<tr>
			<th>이름</th>
			<th>지역</th>
			<th>나이</th>
			<th>성별</th>
			<th>가입 대기</th>
		</tr>
			<c:forEach items="${list}" var="user">
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
<jsp:include page="../layout/footer.jsp"></jsp:include>