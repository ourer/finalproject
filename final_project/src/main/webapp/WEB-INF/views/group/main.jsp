<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="../layout/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/resources/css/grpMain.css">

<section>
    <div class="firstBox">
            <ul class="nav nav-tab">
               <li class="grpNavLi nav-item"><h1 class="grpName">${gvo.name }</h1></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/gboard/main?grno=${gvo.grno }">소모임 홈</a></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/gboard/list?grno=${gvo.grno }">게시판</a></li>
                <c:if test="${ses.email eq gvo.email }">
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/schedule/register?grno=${gvo.grno }">스케줄 생성</a></li>
                </c:if>
            </ul>
            </div>
     <div class="firstsBox">
            <ul class="nav justify-content-end">
                <li class="grpNavLi"><button id="shareBtn" onclick="copyUrl()"><i class="fa-solid fa-share-nodes"></i></button></li>
                <li class="grpNavLi"><button id="heartBtn"><i class="fa-regular fa-heart"></i>${favMsg }</button></li>
            </ul>
     </div>
        <div class="imgBox">
        <c:choose>
           <c:when test="${smvo ne null }">
               <img src="/upload/sgMainUpload/${fn:replace(smvo.dir, '\\', '/')}/${smvo.uuid}_${smvo.name}" alt="" style="width: 1050px; height: 500px">
               <form action="/group/image" method="post" enctype="multipart/form-data">
                  <input type="hidden" name="grno" value="${gvo.grno }">
                  <input class="form-control" type="file" style="display: none;" id="files" name="files">
                  <c:if test="${ses.email == gvo.email }">
                  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                  <button id="trigger" class="btn btn-outline-primary me-md-2" type="button">이미지 수정</button>
                  <a href="/group/image/delete?grno=${gvo.grno }"><button class="btn btn-outline-danger" type="button">이미지 삭제</button></a>
                  </div>
                  </c:if>
              <div class="col-12" id="fileZone">
               <!--파일이 첨부되면 해당 파일에 대한 정보가 표시됨-->
            </div>
            </form>
           
           </c:when>
           <c:otherwise>
               <form action="/group/image" method="post" enctype="multipart/form-data">
                  <input type="hidden" name="grno" value="${gvo.grno }">
                  <input class="form-control" type="file" style="display: none;" id="files" name="files">
                  <c:if test="${ses.email == gvo.email }">
                  <button id="trigger" class="btn btn-outline-primary btn-block d-block" type="button">이미지 등록</button>
                  </c:if>
              <div class="col-12" id="fileZone">
               <!--파일이 첨부되면 해당 파일에 대한 정보가 표시됨-->
            </div>
            </form>
           
           </c:otherwise>
        </c:choose>
        </div>
        <div class="descBox">
            <div class="detail">
            <h3>소모임 소개 >></h3>
             ${gvo.detail }
            </div>
        </div>
    <div class="secondBox">
        <div class="secondTitle">
            <h3>정모일정 >></h3>
        </div>
        <c:choose>
           <c:when test="${sList ne null }">
           <c:forEach items="${sList }" var="svo">
           <div class="scheBox">
               <div class="scheTitle">
               <h5 class="hightlight">${svo.title }</h5>
               <input type="hidden" id="sno" value="${svo.sno }">
               </div>
	            <div class="scheInner">
	                <img src="" alt="">
	                <ul class="scheInfo">
	                    <li class="scheInfoLi scheDate" data-sno="${svo.sno}">시간: ${svo.meetdate }</li>
	                    <li class="scheInfoLi">장소: ${svo.spot } </li>
	                    <li class="scheInfoLi">비용: ${svo.cost }</li>
	                    <li class="scheInfoLi">
	                        인원 수: <span class="joinMember" id="joinMember">${svo.joinmember }</span>/<span class="maxMember">${svo.max_member }</span>
	                       <button onclick="showJoinPeople(${svo.sno});"><i class="fa-solid fa-chevron-down"></i></button>
	                        <div class="joinPeople" id="joinPeople${svo.sno }" data-sno="${svo.sno}">
	                            
	                        </div>
	                    </li>
	                </ul>
	                <c:choose>
	                	<c:when test="${ses.email eq gvo.email }">
			                <a href="/schedule/delete?sno=${svo.sno }"><button class="delSchBtn">스케줄 삭제</button></a>
			               <button class="schJoinBtn" id="schJoinBtn${svo.sno }" disabled>참가</button>
	                	</c:when>
	                	<c:when test="${svo.joinmember eq svo.max_member }">
			               <button class="schJoinBtn" id="schJoinBtn${svo.sno }" disabled>마감</button>
	                	</c:when>
	                	<c:otherwise>
			               <button class="schJoinBtn" id="schJoinBtn${svo.sno }">참가</button>
	                	</c:otherwise>
	                </c:choose>
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
    <a href="/group/join?grno=${gvo.grno }"><button>가입</button></a>
</section>
<script type="text/javascript">
	const emailVal='<c:out value="${ses.email }"/>';
	const imgMsg='<c:out value="${imgMsg }"/>';
	if(imgMsg==="err"){
		alert("메인 이미지 등록에 실패했습니다.");
	}
</script>
<script type="text/javascript" src="/resources/js/groupMain.js"></script>
<script type="text/javascript">
	getJoinPersonList();
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>