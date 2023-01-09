<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<form action="/user/login" method="post">
	ID: <input type="text" name="email"> <br>
	PASSWORD: <input type="password" name="pw"> <br>
	<button type="submit">LOGIN</button>
	</form>
</section>

<script type="text/javascript">
	const msglogin = '<c:out value="${msglogin}"/>';
	if(msglogin==='0'){
		console.log(msglogin);
		alert("로그인에 실패했습니다.");
	}else(msglogin=='1') {
		console.log(msglogin);
		alert("로그인에 성공했습니다.");
	}
	</script>

<jsp:include page="../layout/footer.jsp"></jsp:include>