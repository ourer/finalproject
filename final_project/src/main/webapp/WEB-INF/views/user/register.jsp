<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
<h2>회원가입</h2>
	<form action="/user/register" method="post">
		이메일: <input type="text" class="form-control" id="userID" placeholder="email" name="userID">
		<button id="overlappedID" type="button">중복확인</button><br>
		프로필사진: <div class="input-group mb-3">
				  <input type="file" class="form-control" id="inputGroupFile02">
				</div>
		이름:<input type="text" class="form-control" id="userName" placeholder="이름" name="userName">
		비밀번호:<input type="password" class="form-control" id="userPw" placeholder="특수문자포함 10~12자리" name="userPw">
		비밀번호 확인:<input type="password" class="form-control" id="userPw" placeholder="비밀번호 확인" name="userPwCheck">
		지역:<input type="text" class="form-control" id="userarea" name="userarea">
		닉네임:<input type="text" class="form-control" id="userNickName" name="userNickName">
		나이:<input type="text" class="form-control" id="userage" name="userage">
		성별:
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
		  <label class="form-check-label" for="flexRadioDefault1" value ='0'>
		    남자
	  		</label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
		  <label class="form-check-label" for="flexRadioDefault2" value ='1'>
		    여자
		  </label>
		</div>
		전화번호:<input type="text" class="form-control" id="userPhone" name="userPhone">
		관심사1: 
		<div>
			<div class="type_selectOne">
		           <select style="width: 285px; height: 50px;" name="userFav1" id="selectMenuF" onchange="selectMenu(this)">
		               <option value="" selected disabled> 문의유형을 선택해주세요</option>
		               <option value="1">운동</option>
		               <option value="2">아웃도어/여행</option>
		               <option value="3">독서</option>
		               <option value="4">언어/외국</option>
		               <option value="5">문화/공연/예술</option>
		               <option value="6">음악/악기</option>
		               <option value="7">공예/만들기</option>
		               <option value="8">봉사활동</option>
		               <option value="9">게임/오락</option>
		               <option value="10">사진/영상</option>
		               <option value="11">요리/제조</option>
		               <option value="12">반려동물</option>
		           </select>
		       </div>
		       <div class="type_selectTwo">
		           <select style="width: 285px; height: 50px;" name="userFavDesc1" id="selectMenuQ">
		               <option value="" selected> 상세유형을 선택해주세요</option>
		           </select>
		       </div>
		   </div>
		  </div>
	
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

<jsp:include page="../layout/footer.jsp"></jsp:include>


<script>
        function selectMenu(i){
            var AMenu = ["조깅","헬스","필라테스","수영","테니스","골프"];
            var BMenu = ["등산", "캠핑","낚시","국내여행","해외여행"];
            var CMenu = ["책/독서","인문학","심리학","철학","작문/글쓰기"];
            var DMenu = ["영어","일본어","중국어","프랑스어","스페인어"];
            var EMenu = ["뮤지컬/오페라","공연/연극","영화","전시회"];
            var FMenu = ["노래/보컬","기타/베이스","드럼","피아노","밴드/합주"];
            var GMenu = ["미술/그림","플라워아트","가죽공예","가구/목공예","도자/점토공예"];
            var HMenu = ["양로원","보육원","환경봉사","사회봉사","유기견보호"];
            var IMenu = ["다트","보드게임","온라인게임"];
            var JMenu = ["영상제작/편집","필름카메라","DSLR","디지털카메라"];
            var KMenu = ["한식","양식","디저트","제빵/제과"];
            var LMenu = ["강아지","고양이","물고기","소동물"];

            var target = document.getElementById("selectMenuQ");

            if(i.value == "1") var j = AMenu;
            else if(i.value == "2") var j = BMenu;
            else if(i.value == "3") var j = CMenu;
            else if(i.value == "4") var j = DMenu;
            else if(i.value == "5") var j = EMenu;
            else if(i.value == "6") var j = FMenu;
            else if(i.value == "7") var j = 7Menu;
            else if(i.value == "8") var j = 8Menu;
            else if(i.value == "9") var j = 9Menu;
            else if(i.value == "10") var j = 10Menu;
            else if(i.value == "11") var j = 11Menu;
            else if(i.value == "12") var j = 12Menu;

            target.options.length = 0;

            for(x in j){
                var opt = document.createElement("option");
                opt.value = j[x];
                opt.innerHTML = j[x];
                target.appendChild(opt);
            }
        }
</script>

