<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<form action="/board/register" method="post" style="margin:30px auto">
		<div class="form">
		    <label for="title" class="col-sm-1 col-form-label">제목</label>
		    <input type="text" class="form-control" name="title" id="title">
		 </div>
		<div class="form">
		    <label for="writer" class="col-sm-1 col-form-label">작성자</label>
		    <input type="text" class="form-control" id="writer" name="writer">
		  </div>
		<div class="form">
		    <label for="content" class="col-sm-1 col-form-label">내용</label>
		    <textarea rows="10" cols="100" class="form-control" id="content" name="content"></textarea>
		</div>
		 <div class="d-grid gap-2 d-md-block">
		  <button class="btn btn-outline-warning" id="registerBtn" type="submit">등록</button>
		 </div>
	</form>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>