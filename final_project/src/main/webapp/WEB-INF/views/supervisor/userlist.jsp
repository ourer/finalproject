<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<h3>가입한 모든 회원</h3>
<table class="table caption-top text-center" style="margin: 30px auto">
			<colgroup>
			<col width="25%" />
         	<col width="25%" />
         	<col width="25%" />
			<col width="25%" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">이름</th>
				<th scope="col">이메일</th>
				<th scope="col">속한 소모임</th>
				<th scope="col">강퇴 기능</th>
			</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${uList }" var="uvo">
					<tr>
						<td>${uvo.name }</td>
						<td>${uvo.email }</td>
						<td></td>
						<td><button class="btn btn-sm btn-outline-success special del" type="button">강퇴</button></td>
					</tr>
				</c:forEach>
				
			
			</tbody>
		</table>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>