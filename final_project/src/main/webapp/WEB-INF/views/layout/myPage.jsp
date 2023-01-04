<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>가입 대기명단</h1>
	<table>
		<tr>
			<th>프로필</th>
			<th>이름</th>
			<th>나이</th>
			<th>가입 인사</th>
		</tr>
	<c:forEach items="list" var="uvo">
		<tr>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>