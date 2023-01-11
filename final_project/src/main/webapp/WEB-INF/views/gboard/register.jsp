<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<form action="/gboard/register" method="post" style="margin:30px auto" enctype="multipart/form-data">
		<div class="form-check form-check-inline">
		   <select name="cate">
		   		<option value="공지">공지</option>
		   		<option value="가입인사">가입인사</option>
		   		<option value="후기">후기</option>
		   		<option value="자유">자유</option>
		   </select>
		</div>
		<div class="form">
		    <label for="title" class="col-sm-1 col-form-label">제목</label>
		    <input type="text" class="form-control" name="title" id="title">
		 </div>
		<div class="form">
		    <label for="writer" class="col-sm-1 col-form-label">작성자</label>
		    <input type="text" class="form-control" id="writer" name="writer" value="${ses.nickname }" readonly>
		  </div>
		<div class="form">
		    <label for="content" class="col-sm-1 col-form-label">내용</label>
		    <textarea class="summernote" id="content" name="content"></textarea>
		    <!-- <textarea rows="10" cols="100" class="form-control" id="content" name="content"></textarea> -->
		</div>
		<div class="col-12 d-grid">
			<input class="form-control" type="file" style="display: none;" id="files" name="files" multiple>
			<button type="button" id="trigger" class="btn btn-outline-primary btn-block d-block">Files Upload</button>
		</div>		
		<div class="col-12" id="fileZone">
				<!--파일이 첨부되면 해당 파일에 대한 정보가 표시됨-->
		</div>
		 <div class="d-grid gap-2 d-md-block text-end">
		  <button class="btn btn-outline-warning" id="registerBtn" type="submit">등록</button>
		  <a href="/gboard/list?grno=${gbvo.grno }" class="btn btn-outline-warning">목록</a>
		 </div>
		 <input type="hidden" name="grno" value="${grno }">
	</form>
</section>
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
<jsp:include page="../layout/footer.jsp"></jsp:include>