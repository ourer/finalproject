<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	<table class="table caption-top text-center" style="margin: 30px auto">
		<caption>우리 소모임 멤버~</caption>
		<colgroup>
			<col width="20%" />
			<col width="15%" />
			<col width="10%" />
			<col width="15%" />
			<col width="10%" />
			<col width="20%" />
			</colgroup>
			<thead>
			<tr>
				<th scope="col">프로필</th>
				<th scope="col">닉네임(이름)</th>
				<th scope="col">나이</th>
				<th scope="col">전화번호</th>
				<th scope="col">성별</th>
				<th scope="col">지역</th>
			</tr>
			</thead>
			<tbody class="table-group-divider">
			
				<tr>
					<td>
						<c:choose>
							<c:when test="${capPvo ne null }">
								<img src="/upload/${fn:replace(capPvo.dir, '\\', '/')}/${capPvo.uuid}_${capPvo.name}" class="rounded-circle mx-auto d-block" alt="..." style="width: 140px;">
							</c:when>
							<c:otherwise>
								<img alt="" src="/upload/blank-profile.png" class="rounded-circle mx-auto d-block" alt="..." style="width: 140px; height: 140px;">
							</c:otherwise>
						</c:choose>	
					</td>
					<td>${capUvo.nickname }(${capUvo.name })</td>
					<td>${capUvo.age }</td>
					<td>${capUvo.phone }</td>
					<c:if test="${capUvo.gender =='0'}">
					<td>남자</td>
					</c:if>
					<c:if test="${capUvo.gender =='1'}">
					<td>여자</td>
					</c:if>
					<td>
						${capUvo.area }
					</td>					
				</tr>
				<c:forEach items="${uList }" var="uvo" varStatus="status">
				<tr>
					<td>
						<c:set value="${pList[status.index] }" var="pvo"/>
						<c:choose>
						<c:when test="${pvo ne null }">
							<img src="/upload/${fn:replace(pvo.dir, '\\', '/')}/${pvo.uuid}_${pvo.name}" class="rounded-circle mx-auto d-block" alt="..." style="width: 140px;">
						</c:when>
						<c:otherwise>
							<img src="/upload/blank-profile.png" class="rounded-circle mx-auto d-block" alt="..." style="width: 140px; height: 140px;">
						</c:otherwise>
						</c:choose>
					</td>
					<td>${uvo.nickname }(${uvo.name })</td>
					<td>${uvo.age }</td>
					<td>${uvo.phone }</td>
					<c:if test="${uvo.gender =='0'}">
					<td>남자</td>
					</c:if>
					<c:if test="${uvo.gender =='1'}">
					<td>여자</td>
					</c:if>
					<td>
						${uvo.area }
					</td>
				</tr>
				</c:forEach>
			
			</tbody>
		</table>
</section>
<jsp:include page="../layout/footer.jsp"></jsp:include>