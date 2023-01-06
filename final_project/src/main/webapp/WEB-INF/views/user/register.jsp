<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
<h2>회원가입</h2>
	<form action="/user/register" method="post" enctype="multipart/form-data">
		이메일: <input type="text" class="form-control" id="userID" placeholder="email" name="userID">
<!-- 		<button id="overlappedID" type="button">중복확인</button><br> -->
		<!-- 프로필사진:	
 		 		<div class="col-12 d-grid">
					<input class="form-control" type="file" style="display: none;" id="files" name="files" multiple>
					<button type="button" id="trigger" class="btn btn-outline-primary btn-block d-block">Files Upload</button>
				</div>
				<div class="col-12" id="fileZone">
					파일이 첨부되면 해당 파일에 대한 정보가 표시됨
				</div> -->
		이름:<input type="text" class="form-control" id="userName" placeholder="이름" name="userName">
		비밀번호:<input type="password" class="form-control" id="userPw" placeholder="특수문자포함 10~12자리" name="userPw">
<!-- 	 	비밀번호 확인:<input type="password" class="form-control" id="userPw" placeholder="비밀번호 확인" name="userPwCheck"> -->
		지역:<input type="text" class="form-control" id="userarea" name="userarea">
		닉네임:<input type="text" class="form-control" id="userNickName" name="userNickName">
		나이:<input type="text" class="form-control" id="userage" name="userage">
 		성별:
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="0" checked>
		  <label class="form-check-label" for="flexRadioDefault1" value ='0'>
		    남자
	  		</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="1">
		  <label class="form-check-label" for="flexRadioDefault2" value ='1'>
		    여자
		  </label>
		</div>
		전화번호:<input type="text" class="form-control" id="userPhone" name="userPhone">
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
                   <select name="ctno" id="ctno" class="ctno">
                       <option value="">중분류</option>
                   </select>
               </div>
<!-- 		관심사2: 
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
                   <select name="ctno" id="ctno" class="ctno">
                       <option value="">중분류</option>
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
                   <select name="ctno" id="ctno" class="ctno">
                       <option value="">중분류</option>
                   </select>
               </div> -->
		<button type="submit" id="userJoinBtn">가입하기</button>
	</form>
	
</section>

<script type="text/javascript">
	const msg='<c:out value="${msg}"/>';
	if(msg==='0'){
		alert("회원가입에 실패했습니다.");
	}else if(msg == '1'){
		alert("회원가입에 성공했습니다.");		
	}
	</script>
	
	<script type="text/javascript" src="/resources/js/UserRegister.js"></script>

<jsp:include page="../layout/footer.jsp"></jsp:include>


<script>
//카테고리 중분류 
let ctnoList=new Array();
ctnoList[0]=new Array("중분류");
ctnoList[1]=new Array("조깅", "헬스", "필라테스", "수영", "테니스", "골프");
ctnoList[2]=new Array("등산", "캠핑", "낚시", "국내여행", "해외여행");
ctnoList[3]=new Array("책/독서", "인문학", "심리학", "철학", "작문/글쓰기");
ctnoList[4]=new Array("영어", "일본어", "중국어", "프랑스어", "스페인어");
ctnoList[5]=new Array("뮤지컬/오페라", "공연/연극", "영화", "전시회");
ctnoList[6]=new Array("노래/보컬", "기타/베이스", "드럼", "피아노", "밴드/합주");
ctnoList[7]=new Array("미술/그림", "플라워아트", "가죽공예", "가구/목공예", "도자/점토공예");
ctnoList[8]=new Array("양로원", "보육원", "환경봉사", "사회봉사", "유기견보호");
ctnoList[9]=new Array("다트", "보드게임", "온라인게임");
ctnoList[10]=new Array("영상제작/편집", "필름카메라", "DSLR", "디지털카메라");
ctnoList[11]=new Array("한식", "양식", "디저트", "제과/제빵");
ctnoList[12]=new Array("강아지", "고양이", "물고기", "소동물");

//카테고리 중분류 펼치기
function spreadCtno(code){
    sel=document.getElementById('ctno');
    for (i=sel.length-1; i>=0; i--){
        sel.options[i] = null
        }
    for(let i=0; i<ctnoList[code].length;i++){
        sel.options[i]=new Option(ctnoList[code][i], ctnoList[code][i]);
    }
}

//ctno int로 변경하기
function ctnoNum(ctnoVal){
    let ctno=0;
    switch (ctnoVal) {
        case "조깅": ctno=1; break;
        case "헬스": ctno=2; break;
        case "필라테스": ctno=3; break;
        case "수영": ctno=4; break;
        case "테니스": ctno=5; break;
        case "골프": ctno=6; break;
        case "등산": ctno=7; break;
        case "캠핑": ctno=8; break;
        case "낚시": ctno=9; break;
        case "국내여행": ctno=10; break;
        case "해외여행": ctno=11; break;
        case "책/독서": ctno=12; break;
        case "인문학": ctno=13; break;
        case "심리학": ctno=14; break;
        case "철학": ctno=15; break;
        case "작문/글쓰기": ctno=16; break;
        case "영어": ctno=17; break;
        case "일본어": ctno=18; break;
        case "중국어": ctno=19; break;
        case "프랑스어": ctno=20; break;
        case "스페인어": ctno=21; break;
        case "뮤지컬/오페라": ctno=22; break;
        case "공연/연극": ctno=23; break;
        case "영화": ctno=24; break;
        case "전시회": ctno=25; break;
        case "노래/보컬": ctno=26; break;
        case "기타/베이스": ctno=27; break;
        case "드럼": ctno=28; break;
        case "피아노": ctno=29; break;
        case "밴드/합주": ctno=30; break;
        case "미술/그림": ctno=31; break;
        case "플라워아트": ctno=32; break;
        case "가죽공예": ctno=33; break;
        case "가구/목공예": ctno=34; break;
        case "도자/점토공예": ctno=35; break;
        case "양로원": ctno=36; break;
        case "보육원": ctno=37; break;
        case "환경봉사": ctno=38; break;
        case "사회봉사": ctno=39; break;
        case "유기견보호": ctno=40; break;
        case "다트": ctno=41; break;
        case "보드게임": ctno=42; break;
        case "온라인게임": ctno=43; break;
        case "영상제작/편집": ctno=44; break;
        case "필름카메라": ctno=45; break;
        case "DSLR": ctno=46; break;
        case "디지털카메라": ctno=47; break;
        case "한식": ctno=48; break;
        case "양식": ctno=49; break;
        case "디저트": ctno=50; break;
        case "제과/제빵": ctno=51; break;
        case "강아지": ctno=52; break;
        case "고양이": ctno=53; break;
        case "물고기": ctno=54; break;
        case "소동물": ctno=55; break;
    }
    return ctno;
}
</script>

