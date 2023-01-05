<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
    <div class="firstBox">
        <div class="infoBox">
            <div class="grpName">
                
            </div>
            <ul class="grpNavUl">
                <li class="grpNavLi"><a href="#">정보</a></li>
                <li class="grpNavLi"><a href="#">게시판</a></li>
                <li class="grpNavLi"><a href="#">스케줄</a></li>
                <li class="grpNavLi"><a href="#">멤버</a></li>
            </ul>
        </div>
        <div class="imgBox">
            <img src="" alt="">
        </div>
        <div class="descBox">
            <div class="detail">
    
            </div>
        </div>
    </div>
    <div class="secondBox">
        <div class="secondTitle">
            모임 정보
        </div>
        <div class="scheBox">
            <div class="scheTitle">

            </div>
            <div class="scheInner">
                <img src="" alt="">
                <ul class="scheInfo">
                    <li class="scheInfoLi">시간: </li>
                    <li class="scheInfoLi">장소: </li>
                    <li class="scheInfoLi">비용: </li>
                    <li class="scheInfoLi">
                        인원 수:
                        <i class="fa-solid fa-chevron-down"></i>
                        <div class="schePeople">
                            
                        </div>
                    </li>
                </ul>
                <button>참가</button>
            </div>
        </div>
    </div>
    <button>가입</button>
</section>
<script type="text/javascript" src="/resources/js/groupRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>