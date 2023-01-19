<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<jsp:include page="../layout/header.jsp"></jsp:include>
<style>
.firstBox{
	margin-top: 30px;
}

.grpName{
	font-weight: bold;
	text-shadow: #FFD34A 2px 2px 5px;
	
}

.nav-item > .groupNav{
	margin-left: 50px;
}
</style>
<section>
<div class="firstBox">
    	<ul class="nav nav-tab">
            	<li class="grpNavLi nav-item"><h1 class="grpName">${gvo.name }</h1></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/group/main?grno=${gvo.grno }">소모임 홈</a></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/gboard/list?grno=${gvo.grno }">게시판</a></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/group/memberList?grno=${gvo.grno }">멤버(${fn:length(uList)+1} / ${gvo.max_member })</a></li>
                <c:if test="${ses.email eq gvo.email }">
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/schedule/register?grno=${gvo.grno }">스케줄 생성</a></li>
                </c:if>
            </ul>
        </div>
    <div class="outerBox">
        <form action="/group/join" method="post" id="joinForm">
            <div class="innerGroup">
                <div class="innerFirst">
                    <h3>닉네임</h3>
                </div>
                <div class="innerSecond">
                    <input type="text" name="nickname" value="${ses.nickname}" readonly>
                </div>
            </div>
            <div class="innerGroup">
                <div class="innerFirst">
                    <h3>이름</h3>
                </div>
                <div class="innerSecond">
                    <input type="text" name="name" value="${ses.name}" readonly>
                </div>
            </div>
            <div class="innerGroup">
                <div class="innerFirst">
                    <h3>나이</h3>
                </div>
                <div class="innerSecond">
                    <input type="text" name="age" value="${ses.age}" readonly>
                </div>
            </div>
            <div class="innerGroup">
                <div class="innerFirst">
                    <h3>성별</h3>
                </div>
                <div class="innerSecond">
                <c:choose>
                	<c:when test="${ses.gender eq 0 }">
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
                    <input type="text" name="phone" value="${ses.phone}">
                </div>
            </div>
            <div class="innerGroup">
                <div class="innerFirst">
                    <h3>유의사항</h3>
                </div>
                <div class="innerSecond">
                	<label for="check1">
	                    <input type="checkbox" class="check" id="check1">아울러 공지사항을 확인했습니다.
                	</label>
                	<br>
                	<label for="check2">
                    	<input type="checkbox" class="check" id="check2">다른 회원들로부터 신고가 3회누적되면 활동에 제한이 생길 수 있습니다.
	                 </label>
	                 <br>
                	<label for="check3">
                    	<input type="checkbox" class="check" id="check3">적극적으로 모임 활동에 참여해주세요.
                    </label>
                    <br>
                	<label for="check4">
	                    <input type="checkbox" class="check" id="check4">영리목적의 모임이라면 관리자에게 신고해주세요.
                    </label>
                    <br>
                </div>
            </div>
            <button type="button" id="grpJoinBtn">가입</button>
            <input type="hidden" name="email" value="${ses.email }">
            <input type="hidden" name="grno" value="${grno}" id="grno">
        </form>
</div>
</section>
<script type="text/javascript" src="/resources/js/groupJoin.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>