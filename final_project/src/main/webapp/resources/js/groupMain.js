let nowUrl=window.location.href;
function copyUrl(){
    console.log(nowUrl);
    navigator.clipboard.writeText(nowUrl).then(res=>{
        alert("소모임 링크가 복사되었습니다!");
    })
}

document.getElementById('heartBtn').addEventListener('click', ()=>{
    console.log(nowUrl);
    let grno=nowUrl.substring(nowUrl.lastIndexOf('=')+1);
    console.log(grno);
    if(emailVal==null||grno==""||grno==null){
        alert("찜하기 오류");
        console.log("찜 기능 실패");
        return false;
    }else{
        favData={
            email: emailVal,
            grno: grno
        }
    }
    console.log(favData);
    const heartBtnTag=document.getElementById('heartBtn');
    likeFavorite(favData).then(result=>{
    	console.log(result)
        if(result==1){
            alert("찜 삭제");
	    heartBtnTag.innerHTML=`<i class="fa-regular fa-heart"></i>`;
        }else if(result==2){
        	alert("찜 추가");
	    heartBtnTag.innerHTML=`<i class="fa-solid fa-heart"></i>`;   
        }
    })
})


async function likeFavorite(favData){
    try {
        const url="/favorite/like";
        const config={
            method: 'post',
            headers:{
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(favData)
        }
        const resp=await fetch(url, config);
        const result=resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}


function showJoinPeople(){
	const joinPeople=document.getElementById('joinPeople');
    console.log(joinPeople.style.display);
    if(joinPeople.style.display=='block'){
        joinPeople.style.display='none';
    } else{
     joinPeople.style.display='block';
    }
    console.log(joinPeople.style.display);
}

const schJoinBtn=document.getElementById('schJoinBtn');
if(schJoinBtn!=null){
schJoinBtn.addEventListener('click', ()=>{
    console.log(nowUrl);
    let grno=nowUrl.substring(nowUrl.lastIndexOf('=')+1);
    console.log(grno);
    let sno=document.getElementById("sno").value;
    console.log(sno);
    if(grno!=null||sno!=null){
        joinData={
            sno: sno,
            grno: grno
        }
    }
    console.log(joinData);
    addJoinPerson(joinData).then(result=>{
        console.log(result);
        if(result=="1"){
            alert("스케줄 참가 성공!");
            //프로필 뿌리기
            location.href="/group/main?grno="+grno;
        }else if(result=="2"){
            alert("스케줄 참가 실패");
            location.href="/group/main?grno="+grno;
        }
    })
})
}

async function addJoinPerson(joinData){
    try {
        const url="/schedule/join";
        const config={
            method: 'post',
            headers:{
                'content-type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(joinData)
        }
        const resp=await fetch(url, config);
        const result=resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}


document.getElementById('trigger').addEventListener('click',()=>{
    document.getElementById('files').click();
})

const regExp=new RegExp("\.(exe|sh|bat|msi|dll|js)$");
const regExpImg=new RegExp("\.(jpg|png|jpeg|gif)$");
const maxsize=1024*1024*20;

function fileSizeValidation(fileName, fileSize){
    if(regExp.test(fileName)){
        return 0;
    }else if(!regExpImg.test(fileName)){
        return 0;
    }else if(fileSize>maxsize){
        return 0;
    }else{
        return 1;
    }
}

document.addEventListener('change',(e)=>{
    if(e.target.id=='files'){
        const files=document.getElementById('files').files;
        console.log(files);

        let div=document.getElementById('fileZone');
        div.innerHTML='';
        let ul='<ul class="list-group list-group-flush">';
        let isOk=1; //처음부터 0으로 들어가면 모든 값이 0이 되므로 곱하기 위해서 1로 설정
        for(let file of files){
            let validResult=fileSizeValidation(file.name, file.size);
            isOk*=validResult; //0의 값이 1개라도 들어오면 0이 되도록 -> 모든 첨부파일의 결과가 1이어야 통과 
            ul+=`<li class="list-group-item d-flex justify-content-between align-items-start">`;
            //업로드 가능 여부 표시
            ul+=`${validResult?'<div class="fw-bold">업로드 가능':'<div class="fw-bold text-danger">업로드 불가'}</div>`;
            ul+=`${file.name}`;
            ul+=`<span class="badge bg-${validResult?'success':'danger'} rounded-pill">${file.size} Bytes</span>`;
            ul+=`<button type="submit">등록</button>`;
        }
        ul+=`</ul>`;
        div.innerHTML=ul;

        if(isOk==0){
            document.getElementById('grpRegBtn').disabled=true;
        }
    }
})