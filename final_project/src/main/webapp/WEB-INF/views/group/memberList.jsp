<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
    <div class="outerBox">
    	<div class="capBox">
    		<div class="capProfile"></div>
            <div class="capInfo">
                <span class="capName">${capUvo.name }</span> (<span class="capNickname">${capUvo.nickname }</span>)
                <span class="capAge">${capUvo.age }</span> / <span class="capGender">${capUvo.gender }</span>
                <span class="capPhone">${capUvo.phone }</span>
                <span class="capArea">${capUvo.area }</span>
            </div>
    	</div>
    	<c:forEach items="${uList }" var="uvo">
        <div class="memberBox">
            <div class="memProfile"></div>
            <div class="memInfo">
                <span class="memName">${uvo.name }</span> (<span class="memNickname">${uvo.nickname }</span>)
                <span class="memAge">${uvo.age }</span> / <span class="memGender">${uvo.gender }</span>
                <span class="memPhone">${uvo.phone }</span>
                <span class="memArea">${uvo.area }</span>
            </div>
        </div>
        </c:forEach>
    </div>

</section>
<script type="text/javascript" src="/resources/js/groupRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>