<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
    <div class="outerBox">
        <form action="/group/join" method="post" id="joinForm">
            <div class="innerGroup">
                <div class="innerFirst">
                    <h3>닉네임</h3>
                </div>
                <div class="innerSecond">
                    <input type="text" name="nickname" value="${uvo.nickname}" readonly>
                </div>
            </div>
            <div class="innerGroup">
                <div class="innerFirst">
                    <h3>이름</h3>
                </div>
                <div class="innerSecond">
                    <input type="text" name="name" value="${uvo.name}" readonly>
                </div>
            </div>
            <div class="innerGroup">
                <div class="innerFirst">
                    <h3>나이</h3>
                </div>
                <div class="innerSecond">
                    <input type="text" name="age" value="${uvo.age}" readonly>
                </div>
            </div>
            <div class="innerGroup">
                <div class="innerFirst">
                    <h3>성별</h3>
                </div>
                <div class="innerSecond">
                <c:choose>
                	<c:when test="${uvo.gender eq 0 }">
	                    <input type="text" name="gender" value="남자" readonly>
                	</c:when>
                	<c:otherwise>
	                    <input type="text" name="gender" value="여자" readonly>
                	</c:otherwise>
                </c:choose>
                </div>
            </div>
            <div class="innerGroup">
                <div class="innerFirst">
                    <h3>전화번호</h3>
                </div>
                <div class="innerSecond">
                    <input type="text" name="phone" value="${uvo.phone}">
                </div>
            </div>
            <div class="innerGroup">
                <div class="innerFirst">
                    <h3>유의사항</h3>
                </div>
                <div class="innerSecond">
                    <input type="checkbox" class="check">아울러 공지사항을 확인했습니다.<br>
                    <input type="checkbox" class="check">다른 회원들로부터 신고가 3회누적되면 활동에 제한이 생길 수 있습니다.<br>
                    <input type="checkbox" class="check">적극적으로 모임 활동에 참여해주세요.<br>
                    <input type="checkbox" class="check">영리목적의 모임이라면 관리자에게 신고해주세요..<br>
                </div>
            </div>
            <button type="button" id="grpJoinBtn">가입</button>
            <input type="hidden" name="email" value="${uvo.email }">
            <input type="hidden" name="grno" value="${grno}" id="grno">
        </form>
</div>
</section>
<script type="text/javascript" src="/resources/js/groupJoin.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>