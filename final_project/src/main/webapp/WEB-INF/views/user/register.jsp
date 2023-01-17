<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-2.2.4.js" integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<style>
	.email_OK{
		color:#008000;
		display: none;
	}
	.email_NO{
		color:#6A82FB; 
		display: none;
	}
	.nickName_OK{
		color:#008000;
		display: none;
	}
	.nickName_NO{
		color:#6A82FB; 
		display: none;
	}
</style>
<section>
<h2>회원가입</h2>
	<form action="/user/register" method="post" enctype="multipart/form-data" onsubmit="return joinCheck(this)">		
		<div class="input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default">email</span>
  			<input type="email" class="form-control" id="email" placeholder="email@ourer.com" name="email">
  			<button type="button" class="btn btn-outline-warning" onclick="emailCheck()">이메일 중복확인</button><br>
		</div>
 		<span class="email_OK">사용 가능한 아이디입니다.</span>
		<span class="email_NO">이미 사용중인 아이디입니다.</span><br>
		
		<!-- 원래 파일 올리는부분 -->
   		<div class="col-12 d-grid input-group mb-3">
			<span class="input-group-text" id="inputGroup-sizing-default" style="width: 100px;">프로필사진</span>
			<input class="form-control" type="file" style="display: none;" id="files" name="files">
			<button type="button" id="trigger" class="btn btn-outline-primary btn-block d-block" style="width: 600px; ">Files Upload</button>
		</div>
		<div class="col-12" id="fileZone">
			<!-- 파일이 첨부되면 해당 파일에 대한 정보가 표시됨  -->
		</div>
		
		
		<!-- 부트스트랩에서 훔쳤다.. -->
		<div class="col-12 input-group">
  			<input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload" id="files" name="files">
 			<button class="btn btn-outline-secondary btn-block d-block" type="button" id="trigger">Files Upload</button>
		</div>
		
		
		
		
		
		이름:<input type="text" class="form-control" id="name" placeholder="이름" name="name">
		비밀번호:<input type="password" class="form-control pw" id="pw" name="pw">
		<!-- 비밀번호 체크 -->
		비밀번호 확인:<input type="password" class="form-control pw" id="pw2" name="pw2">
		<font id = "checkPw" size = "3"></font> <br>
		
 		지역:<input type="text" class="form-control" id="area" name="area">

		닉네임:<input type="text" class="form-control" id="nickname" name="nickname">
		<!-- 닉네임 체크 -->
 		<button class="nameChk" type="button" id="nameChk" onclick="checkNickName();">닉네임 중복확인</button> <br>
		<!-- id ajax 중복체크 -->
		<span class="nickName_OK">사용 가능한 닉네임입니다.</span>
		<span class="nickName_NO">누군가 이 닉네임을 사용하고 있어요.</span><br>
		
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

<script type="text/javascript" src="/resources/js/UserRegister.js?version=4"></script>
<script type="text/javascript">
const hypenTel = (target) => {
    target.value = target.value
      .replace(/[^0-9]/g, '')
      .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>