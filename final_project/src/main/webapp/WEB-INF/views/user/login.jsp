<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/login"  method="post">
		EMAIL: <input type="text" name="email"> <br>
		PASSWORD: <input type="text" name="pw"> <br>
		<button type="submit">로그인</button>
	</form>
</body>
</html>