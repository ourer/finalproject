<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
<h2>회원가입</h2>
	<form action="/user/register" method="post" enctype="multipart/form-data">
		이메일: <input type="text" class="form-control" id="email" placeholder="email" name="email">
		프로필사진:	
 		<div class="col-12 d-grid">
		<input class="form-control" type="file" style="display: none;" id="files" name="files">
		<button type="button" id="trigger" class="btn btn-outline-primary btn-block d-block">Files Upload</button>
		</div>
		<div class="col-12" id="fileZone">
			<!-- 파일이 첨부되면 해당 파일에 대한 정보가 표시됨  -->
		</div>
		이름:<input type="text" class="form-control" id="name" placeholder="이름" name="name">
		비밀번호:<input type="password" class="form-control" id="pw" name="pw">
		지역:<input type="text" class="form-control" id="area" name="area">
		닉네임:<input type="text" class="form-control" id="NickName" name="nickname">
		나이:<input type="text" class="form-control" id="age" name="age">
 		성별:
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault1" value="0" checked>
		  <label class="form-check-label" for="flexRadioDefault1" value ='0'>
		    남자
	  		</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault2" value="1">
		  <label class="form-check-label" for="flexRadioDefault2" value ='1'>
		    여자
		  </label>
		</div>
		전화번호:<input type="text" class="form-control" id="Phone" name="phone" oninput="hypenTel(this)" maxlength="13">
		
		관심사1: 
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
                   <select name="ctno_1" id="ctno" class="ctno_1">
                       <option value="0">중분류</option>
                   </select>
               </div>
	 		관심사2: 
			<div class="innerSecond2">
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
                   <select name="ctno_2" id="ctno" class="ctno_2">
                       <option value="0">중분류</option>
                   </select>
               </div>
			관심사3: 
			<div class="innerSecond3">
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
                  <select name="ctno_3" id="ctno" class="ctno_3">
                      <option value="0">중분류</option>
                  </select>
              </div>
		<button type="submit" id="userJoinBtn">가입하기</button>
	</form>
	
</section>

<script type="text/javascript" src="/resources/js/UserRegister.js"></script>
<script type="text/javascript">
const hypenTel = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>

