<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<h3 style="margin-top: 30px">공지사항</h3>
		<table class="table table-hover text-center">
			<colgroup>
			<col width="10%" />
			<col width="50%" />
			<col width="15%" />
			<col width="15%" />
			<col width="10%" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
			</thead>
			<tbody class="table-group-divider">
			<c:forEach items="${list }" var="bvo">
			<tr>
				<td>${bvo.bno }</td>
				<td><a href="/board/detail?bno=${bvo.bno }">${bvo.title }</a></td>
				<td>${bvo.writer }</td>
				<td>${bvo.regdate.substring(0,10) }</td>
				<td>${bvo.view }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
			<div class="text-end">
				<a href="/board/register"><button class="btn btn-outline-warning" type="button">작성</button></a>
			</div>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>