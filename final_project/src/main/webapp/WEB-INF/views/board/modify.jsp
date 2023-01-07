<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<form action="/board/modify" method="post" style="margin:30px auto">
		<div class="form-check form-check-inline">
		   <input class="form-check-input" type="checkbox" id="pin" name="pin" value='1' checked="checked">
		   <label class="form-check-label" for="pin">메인공지</label>
		</div>
		<div class="form">
		    <label for="bno class="col-sm-1 col-form-label">번호</label>
		    <input type="" class="form-control" name="bno" id="bno" value="${bvo.bno }" readonly="readonly">
		 </div>
		<div class="form">
		    <label for="title" class="col-sm-1 col-form-label">제목</label>
		    <input type="text" class="form-control" name="title" id="title" value="${bvo.title }">
		 </div>
		<div class="form">
		    <label for="writer" class="col-sm-1 col-form-label">작성자</label>
		    <input type="text" class="form-control" id="writer" name="writer" value="${bvo.writer }" readonly="readonly">
		  </div>
		<div class="form">
		    <label for="content" class="col-sm-1 col-form-label">내용</label>
		    <textarea class="summernote" id="content" name="content">${bvo.content }</textarea>
		</div>
		<div class="form">
		    <label for="regdate" class="col-sm-1 col-form-label">작성일</label>
		    <input type="text" class="form-control" id="regdate" name="regdate" value="${bvo.regdate }" readonly="readonly">
		</div>
		<div class="form">
		    <label for="view" class="col-sm-1 col-form-label">조회수</label>
		    <input type="text" class="form-control" id="view" name="view" value="${bvo.view }" readonly="readonly">
		</div>
		<div class="text-end">
			<a href="/board/list"><button type="submit" class="btn btn-outline-warning">등록</button></a>
			<a href="/board/list" class="btn btn-outline-warning" >목록</a>
		</div>
	</form>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/boardpin.js"></script>
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