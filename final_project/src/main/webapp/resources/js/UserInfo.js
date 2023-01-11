document.addEventListener('change',(e)=>{
    console.log(e.target.name);
    if(e.target.name=='code'){
        console.log(e.target.nextElementSibling);
        sel = e.target.nextElementSibling;
        index = e.target.selectedIndex;
        console.log(index);
        for (i=sel.length-1; i>=0; i--){
	        sel.options[i] = null
        }
        //console.log(ctnoList[index]);
	    for(let i=0; i<ctnoList[index].length;i++){
	        sel.options[i]=new Option(ctnoList[index][i], ctnoNum(ctnoList[index][i]));
	    }
    }
})



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


//ctno int로 변경하기
function ctnoNum(ctnoVal){
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


//카테고리 선택옵션 고정
let ctnoAllList = [
    ...ctnoList[0],
    ...ctnoList[1],
    ...ctnoList[2],
    ...ctnoList[3],
    ...ctnoList[4],
    ...ctnoList[5],
    ...ctnoList[6],
    ...ctnoList[7],
    ...ctnoList[8],
    ...ctnoList[9],
    ...ctnoList[10],
    ...ctnoList[11],
    ...ctnoList[12],
]

let ctno1 = '<c:out value="${ses.ctno_1 }"/>';
let ctno2 = '<c:out value="${ses.ctno_2 }"/>';
let ctno3 = '<c:out value="${ses.ctno_3 }"/>';
console.log(ctno1); //번호 22

let ctcode1 = '<c:out value="${ses.ctcode_1 }"/>';
let ctcode2 = '<c:out value="${ses.ctcode_2 }"/>';
let ctcode3 = '<c:out value="${ses.ctcode_3 }"/>';
console.log(ctcode1); //코드 E

ctnoAllList[ctno1];
console.log(ctnoAllList[ctno1]); //텍스트 뮤지컬/오페라

let option1 = document.getElementById('code1'); //<select>대분류
let option2 = document.getElementById('code2'); //<select>대분류
let option3 = document.getElementById('code3'); //<select>대분류
console.log(option1);
let options1 = document.getElementById('ctno1'); //<select>중분류
let options2 = document.getElementById('ctno2'); //<select>중분류
let options3 = document.getElementById('ctno3'); //<select>중분류
console.log(options1);

let ctno_1 = option1.options[option1.selectedIndex].value;
console.log(ctno_1); //현재 고정되어있는 옵션 >> 대분류
console.log(option1.length); //13

for(var i=0; i<option1.length; i++){
    //console.log(ctcode1);
    //console.log(option1[i]);
    if(option1[i].value == ctcode1){
        option1[i].selected = true;
    }
}

for(var i=0; i<option2.length; i++){
	if(option2[i].value == ctcode2){
		option2[i].selected = true;
	}
}

for(var i=0; i<option3.length; i++){
	if(option3[i].value == ctcode3){
		option3[i].selected = true;
	}
}

for(var i=0; i<options1.length; i++){
	console.log(options1[i].value);
	if(options1[i].value == ctno1){
		options1[i].selected = true;
	}
}