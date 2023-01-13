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
	<div style="margin:30px auto">
		<div class="form">
		    <label for="gbno class="col-sm-1 col-form-label">번호</label>
		    <input type="" class="form-control" name="gbno" id="gbno" value="${gbvo.gbno }" readonly="readonly">
		 </div>
		<div class="form">
		    <label for="title" class="col-sm-1 col-form-label">제목</label>
		    <input type="text" class="form-control" name="title" id="title" value="[${gbvo.cate }]${gbvo.title }" readonly="readonly">
		 </div>
		<div class="form">
		    <label for="writer" class="col-sm-1 col-form-label">작성자</label>
		    <input type="text" class="form-control" id="writer" name="writer" value="${gbvo.writer }" readonly="readonly">
		  </div>
		<div class="form">
		    <label for="content" class="col-sm-1 col-form-label">내용</label>
		    <textarea class="summernote" id="content" name="content" readonly="readonly">${gbvo.content }</textarea>
		</div>
		<div class="form">
		    <label for="regdate" class="col-sm-1 col-form-label">작성일</label>
		    <input type="text" class="form-control" id="regdate" name="regdate" value="${gbvo.regdate }" readonly="readonly">
		</div>
		<c:if test="${gfvo ne null }">
		<div class="img">
			<img alt="" src="/upload/GbrdFileUpload/${fn:replace(gfvo.dir, '\\', '/')}/${gfvo.uuid}_${gfvo.name}">
		</div>
		</c:if>
		<div class="form">
		    <label for="view" class="col-sm-1 col-form-label">조회수</label>
		    <input type="text" class="form-control" id="view" name="view" value="${gbvo.view }" readonly="readonly">
		</div>
	</div>
		<div class="text-end">
			<a href="/gboard/modify?gbno=${gbvo.gbno}" class="btn btn-outline-warning">수정</a>
			<a href="/gboard/delete?gbno=${gbvo.gbno}" class="btn btn-outline-warning">삭제</a>
			<a href="/gboard/list?grno=${gbvo.grno }" class="btn btn-outline-warning" >목록</a>
		</div>
		<div class="container">
		<div class="input-group my-3">
			<span class="input-group-text" id="cmtWriter">${ses.email }</span>
			<input type="text" class="form-control" id="cmtText" placeholder="댓글을 남겨보세요!">
			<button class="btn btn-warning" id="cmtPostBtn" type="button">등록</button>
		</div>
		<ul class="list-group list-group-flush" id="cmtListArea">
		  
		</ul>
	</div>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>
<script type="text/javascript">
	const gbnoVal='<c:out value="${gbvo.gbno}"/>';
</script>
<script type="text/javascript" src="/resources/js/gboardComment.js"></script>
<script type="text/javascript">
	getCommentList(gbnoVal);
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('.summernote').summernote({
		height: 300,
		focus: true,
		lang: "ko-KR",
		placeholder: '최대 2048자까지 쓸 수 있습니다.'
	});
	$('.summernote').attr('readonly', true);
	
});
</script>