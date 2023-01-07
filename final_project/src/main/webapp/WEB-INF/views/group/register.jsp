<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
	
		<div class="outerBox">
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>카테고리를 선택하세요.</h3>
	            </div>
	            <div class="innerSecond">
	                <select name="code" id="code" onchange="spreadCtno(this.selectedIndex)">
	                    <option value="대분류">대분류</option>
	                    <option value="A">운동</option>
	                    <option value="B">아웃도어/여행</option>
	                    <option value="C">독서</option>
	                    <option value="D">언어/외국</option>
	                    <option value="E">문화/공연/예술</option>
	                    <option value="F">음악/악기</option>
	                    <option value="G">공예/만들기</option>
	                    <option value="H">봉사활동</option>
	                    <option value="I">게임/오락</option>
	                    <option value="J">사진/영상</option>
	                    <option value="K">요리/제조</option>
	                    <option value="L">반려동물</option>
	                </select>
	                <select name="ctno" id="ctno">
	                    <option value="">중분류</option>
	                </select>
	            </div>
	        </div>
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>소모임 이름</h3>
	            </div>
	            <div class="innerSecond">
	                <input type="text" name="name" id="grpName" placeholder="소모임 이름을 입력해주세요.">
	            </div>
	        </div>
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>지역</h3>
	            </div>
	            <div class="innerSecond">
	                <select name="city" id="city" onchange="spreadCounty(this.selectedIndex)">
	                    <option value="전체">전체</option>
	                    <option value="서울">서울특별시</option>
	                    <option value="부산">부산광역시</option>
	                    <option value="대구">대구광역시</option>
	                    <option value="인천">인천광역시</option>
	                    <option value="광주">광주광역시</option>
	                    <option value="대전">대전광역시</option>
	                    <option value="울산">울산광역시</option>
	                    <option value="세종">세종특별자치시</option>
	                    <option value="경기">경기도</option>
	                    <option value="강원">강원도</option>
	                    <option value="충북">충청북도</option>
	                    <option value="충남">충청남도</option>
	                    <option value="전북">전라북도</option>
	                    <option value="전남">전라남도</option>
	                    <option value="경북">경상북도</option>
	                    <option value="경남">경상남도</option>
	                    <option value="제주">제주특별자치도</option>
	                    
	                </select>
	                <select name="county" id="county">
	                    <option value="">시/군/구</option>
	                </select>
	            </div>
	        </div>
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>소모임 최대 멤버 수</h3>
	            </div>
	            <div class="innerSecond">
	                <input type="number" name="max_member" id="max_member" value="4" min="4">
	            </div>
	        </div>
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>소모임 특징?</h3>
	            </div>
	            <div class="innerSecond">
	            	<div class="checkBox freeCheck">
		                <label for="free">
		                    <input type="checkbox" name="isFree" id="free" value=0 onclick="checkOnlyOne(this)">무료
		                </label>
		                <label for="nfree">
		                    <input type="checkbox" name="isFree" id="nfree" value=1 onclick="checkOnlyOne(this)">유료
		                </label>
	            	</div>
	            	<div class="checkBox faceCheck">
		                <label for="face">
		                    <input type="checkbox" name="isFace" id="face" value=1 onclick="checkOnlyOne(this)">대면
		                </label>
		                <label for="nface">
		                    <input type="checkbox" name="isFace" id="nface" value=0 onclick="checkOnlyOne(this)">비대면
		                </label>
	            	</div>
	            </div>
	        </div>
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>소모임 소개</h3>
	            </div>
	            <div class="innerSecond">
	                <textarea name="detail" id="detail" cols="30" rows="10"></textarea>
	            </div>
	        </div>
	        <div class="innerGroup">
	            <div class="innerFirst">
	                <h3>소모임 대표 이미지 등록</h3>
	            </div>
	            <div class="innerSecond">
	                <input type="file" name="file_name" id="file_name">
	            </div>
	            <div class="innerThird">
	                <input type="file" name="file_name" id="file_name">
	            </div>
	        </div>
			<div class="innerGroup">
				<button type="button" id="grpRegBtn">소모임 생성</button>
			</div>
	    </div>
	    <input type="hidden" name="email" id="email" value="${ses.email }">

</section>
<script type="text/javascript" src="/resources/js/groupRegister.js"></script>
<jsp:include page="../layout/footer.jsp"></jsp:include>