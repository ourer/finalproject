<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
    <div class="firstBox">
        <div class="infoBox">
            <div class="grpNameBox">
                <span class="grpName">${gvo.name }</span>
                <button id="shareBtn" onclick="copyUrl()"><i class="fa-solid fa-share-nodes"></i></button>
                <button id="heartBtn"><i class="fa-regular fa-heart"></i>${favMsg }</button>
            </div>
            <ul class="grpNavUl">
                <li class="grpNavLi"><a href="#">정보</a></li>
                <li class="grpNavLi"><a href="#">게시판</a></li>
                <c:if test="${ses.email eq gvo.email }">
                <li class="grpNavLi"><a href="/schedule/register?grno=${gvo.grno }">스케줄 생성</a></li>
                </c:if>
                <li class="grpNavLi"><a href="/group/memberList?grno=${gvo.grno }">멤버</a></li>
            </ul>
        </div>
        <div class="imgBox">
            <img src="" alt="">
        </div>
        <div class="descBox">
            <div class="detail">
    			${gvo.detail }
            </div>
        </div>
    </div>
    <div class="secondBox">
        <div class="secondTitle">
            모임 정보
        </div>
        <c:choose>
        	<c:when test="${sList ne null }">
        	<c:forEach items="${sList }" var="svo">
	        <div class="scheBox">
	            <div class="scheTitle">
					${svo.title }
	            </div>
	            <div class="scheInner">
	                <img src="" alt="">
	                <ul class="scheInfo">
	                    <li class="scheInfoLi">시간: ${svo.meetdate }</li>
	                    <li class="scheInfoLi">장소: ${svo.spot } </li>
	                    <li class="scheInfoLi">비용: ${svo.cost }</li>
	                    <li class="scheInfoLi">
	                        인원 수: <span class="joinMember"></span>/<span class="maxMember">${svo.max_member }</span>
	                        <i class="fa-solid fa-chevron-down"></i>
	                        <div class="schePeople">
	                            
	                        </div>
	                    </li>
	                </ul>
	                <button>참가</button>
	                <a href="/schedule/delete?sno=${svo.sno }"><button class="delSchBtn">스케줄 삭제</button></a>
	            </div>
	        </div>
	        </c:forEach>
        	</c:when>
        	<c:otherwise>
        	<div class="scheBox">
        		스케줄 없어..
        	</div>
        	</c:otherwise>
        </c:choose>
    </div>
    <button>가입</button>
</section>
<script type="text/javascript">
	const emailVal='<c:out value="${ses.email }"/>';
</script>
<script type="text/javascript" src="/resources/js/groupMain.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>