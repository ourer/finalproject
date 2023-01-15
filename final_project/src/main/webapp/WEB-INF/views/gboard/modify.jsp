<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<form action="/gboard/modify" method="post" style="margin:30px auto" enctype="multipart/form-data">
		<div class="form-check form-check-inline">
		   <select name="cate" >
		   		<option value="${gbvo.cate }" selected hidden>${gbvo.cate }</option>
		   		<option value="공지">공지</option>
		   		<option value="가입인사">가입인사</option>
		   		<option value="후기">후기</option>
		   		<option value="자유">자유</option>
		   </select>
		</div>
		<div class="form">
		    <label for="gbno class="col-sm-1 col-form-label">번호</label>
		    <input type="" class="form-control" name="gbno" id="gbno" value="${gbvo.gbno }" readonly="readonly">
		 </div>
		<div class="form">
		    <label for="title" class="col-sm-1 col-form-label">제목</label>
		    <input type="text" class="form-control" name="title" id="title" value="${gbvo.title }">
		 </div>
		<div class="form">
		    <label for="writer" class="col-sm-1 col-form-label">작성자</label>
		    <input type="text" class="form-control" id="writer" name="writer" value="${gbvo.writer }" readonly="readonly">
		  </div>
		<div class="form">
		    <label for="content" class="col-sm-1 col-form-label">내용</label>
		    <textarea class="summernote" id="content" name="content">${gbvo.content }</textarea>
		</div>
		<div class="form">
		    <label for="regdate" class="col-sm-1 col-form-label">작성일</label>
		    <input type="text" class="form-control" id="regdate" name="regdate" value="${gbvo.regdate }" readonly="readonly">
		</div>
		<div class="imgBox" id="imgBox">
			<c:choose>
			<c:when test="${gfvo ne null }">
				<div class='imgInner'>
				<img alt="" src="/upload/GbrdFileUpload/${fn:replace(gfvo.dir, '\\', '/')}/${gfvo.uuid}_${gfvo.name}">
				<button type="button" data-uuid=${gfvo.uuid } class="btn btn-sm btn-danger py-0 file-x">X</button>
				</div>
			</c:when>
			<c:otherwise>
				<input class="form-control" type="file" style="display: none;" id="files" name="files">
			    <button type="button" id="trigger" class="btn btn-outline-primary btn-block d-block">Files Upload</button>
				<div class="col-12" id="fileZone">
				</div>
			</c:otherwise>
			</c:choose>
		</div>
		<div class="form">
		    <label for="view" class="col-sm-1 col-form-label">조회수</label>
		    <input type="text" class="form-control" id="view" name="view" value="${gbvo.view }" readonly="readonly">
		</div>
		<div class="text-end">
			<button type="submit" class="btn btn-outline-warning">등록</button>
			<a href="/gboard/list?grno=${gbvo.grno }" class="btn btn-outline-warning" >목록</a>
		</div>
	</form>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/gboardRegister.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.summernote').summernote({
		height: 300,
		focus: true,
		lang: "ko-KR",
		placeholder: '최대 2048자까지 쓸 수 있습니다.'
	});
	
});
</script>