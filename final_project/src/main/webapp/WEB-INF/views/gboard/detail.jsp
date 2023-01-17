<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" type="text/css" href="/resources/css/gbrdDetail.css">
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<div class="firstBox">
    	<ul class="nav nav-tab">
            	<li class="grpNavLi nav-item"><h1 class="grpName">${gvo.name }</h1></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/group/main?grno=${gvo.grno }">소모임 홈</a></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/gboard/list?grno=${gvo.grno }">게시판</a></li>
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/group/memberList?grno=${gvo.grno }">멤버</a></li>
                <c:if test="${ses.email eq gvo.email }">
                <li class="grpNavLi nav-item"><a class="nav-link groupNav" href="/schedule/register?grno=${gvo.grno }">스케줄 생성</a></li>
                </c:if>
            </ul>
        </div>
	<div style="margin:30px auto">
		<div class="mb-3 row">
		    <input type="hidden" class="form-control form-control-plaintext" name="gbno" id="gbno" value="${gbvo.gbno }" readonly>
		 </div>
		<div class="mb-3 row">
		    <label for="title" class="col-sm-2 col-form-label fw-bold fs-5">제목</label>
		    <div class="col-sm-10">
		    <input type="text" class="form-control form-control-plaintext" name="title" id="title" value="[${gbvo.cate }] ${gbvo.title }" readonly="readonly">
		 	</div>
		 </div>
		<div class="mb-3 row">
		    <label for="writer" class="col-sm-2 col-form-label fw-bold fs-5">작성자</label>
		    <div class="col-sm-10">
		    <input type="text" class="form-control form-control-plaintext" id="writer" name="writer" value="${gbvo.writer }" readonly="readonly">
		  	</div>
		  </div>
	<div class="d-flex justify-content-between">
		  <div class="mb-3 row just">
		    <label for="regdate" class="col-sm-2 col-form-label fw-bold fs-5">작성일</label>
		    <div class="col-sm-10 regdate">
		    <input type="text" class="form-control form-control-plaintext" id="regdate" name="regdate" value="${gbvo.regdate }" readonly="readonly">
			</div>
			</div>
		  <div class="mb-3 row just">
		    <label for="view" class="col-sm-2 col-form-label fw-bold fs-5">조회수</label>
		    <div class="col-sm-10">
		    <input type="text" class="form-control form-control-plaintext" id="view" name="view" value="${gbvo.view }" readonly="readonly">
			</div>
		</div>
	</div>
		<div class="mb-3 row">
		    <label for="content" class="col-sm-2 col-form-label fw-bold fs-5">내용</label>
		    <div class="col-sm-10">
		    <textarea class="form-control form-control-plaintext" id="content" name="content" readonly="readonly" style="height: 100px">${gbvo.content }</textarea>
			</div>
		</div>
		
		<c:if test="${gfvo ne null }">
		<div class="img">
			<img alt="" src="/upload/GbrdFileUpload/${fn:replace(gfvo.dir, '\\', '/')}/${gfvo.uuid}_${gfvo.name}">
		</div>
		</c:if>
	</div>
	</div>
		<div class="text-end">
			<c:if test="${ses.email eq gbvo.writer }">
			<a href="/gboard/modify?gbno=${gbvo.gbno}" class="btn btn-outline-warning">수정</a>
			<a href="/gboard/delete?gbno=${gbvo.gbno}" class="btn btn-outline-warning">삭제</a>
			</c:if>
			<a href="/gboard/list?grno=${gbvo.grno }" class="btn btn-outline-warning" >목록</a>
		</div>
		<div class="container">
		<div class="input-group my-3 form-floating">
			<span class="input-group-text" id="cmtWriter">${ses.email }</span>
			<input type="text" class="form-control" id="cmtText" placeholder="comment">
			<button class="btn btn-warning" id="cmtPostBtn" type="button">등록</button>
		</div>
		<ul class="list-group list-group-flush" id="cmtListArea">
		  
		</ul>
	</div>
	
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script type="text/javascript">
	const gbnoVal='<c:out value="${gbvo.gbno}"/>';
	const emailVal='<c:out value="${ses.email }"/>';
</script>
<script type="text/javascript" src="/resources/js/gboardComment.js"></script>
<script type="text/javascript">
	getCommentList(gbnoVal);
</script>
