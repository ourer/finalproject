<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="./layout/header.jsp"></jsp:include>
<section>
	<h1>
		Hello world!  ㅁㄴㅇㄹㅁㄴㄹㅇㅁㄴㄹtest
	</h1>
	
	<P>  The time on the server is ${serverTime}. ㅁㄴㅇㄹ</P>
	<a href="/group/register">소모임 생성</a>
	<a href="/group/main?grno=1">소모임 메인</a>
</section>
<jsp:include page="./layout/footer.jsp"></jsp:include>
