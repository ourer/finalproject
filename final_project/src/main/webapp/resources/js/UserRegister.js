//파일 업로드 버튼을 누르면 파일 첨부 창이 나타나도록
document.getElementById('trigger').addEventListener('click',()=>{
    document.getElementById('files').click();
});

//파일에 대한 정규 표현식을 이용한 생성자 함수 만들기 
//fileupload시 형식을 제한하는 함수
//실행파일 금지, 이미지 파일만 가능하도록

const regExp=new RegExp("\.(exe|sh|bat|msi|dll|js)$"); //해당 형식의 확장자는 금지
const regExpImg=new RegExp("\.(jpg|jpeg|png|gif)$"); //이미지 파일만 가능
const maxsize=1024*1024*20;  //20MB보다 큰지 체크

function fileSizeValidation(Name, Size){
    if(regExp.test(Name)){
        return 0;
    }else if(!regExpImg.test(Name)){
        return 0;
    }else if(Size>maxsize){
        return 0;
    }else{
        return 1;
    }
}

document.addEventListener('change',(e)=>{
    if(e.target.id=="files"){
        //비활성화 -> 첨부되면 안 되는 파일이 들어왔을때 클릭되는 것을 방지하기 위해서
        document.getElementById('regBtn').disabled=false;
        //input type="file"로 가지고 오는 element: fileObject 객체로 리턴
        const fileObject=document.getElementById('files').files;
        console.log(fileObject);

        let div=document.getElementById('fileZone');
        div.innerHTML='';
        let ul='<ul class="list-group list-group-flush">';
        let isOK=1; //처음부터 0으로 들어가면 모든 값이 0이 되므로 곱하기 위해서 1로 설정
        for(let profile of fileObject){
            let validResult=fileSizeValidation(profile.name, profile.size);
            isOK*=validResult; //0의 값이 1개라도 들어오면 0이 되도록 -> 모든 첨부파일의 결과가 1이어야 통과 
            ul+=`<li class="list-group-item d-flex justify-content-between align-items-start">`;
            //업로드 가능 여부 표시
            ul+=`${validResult?'<div class="fw-bold">업로드 가능':'<div class="fw-bold text-danger">업로드 불가'}</div>`;
            ul+=`${profile.name}`;
            ul+=`<span class="badge bg-${validResult?'success':'danger'} rounded-pill">${profile.size} Bytes</span>`;
        }
        ul+=`</ul>`;
        div.innerHTML=ul;

        if(isOK==0){
            document.getElementById('regBtn').disabled=true;
        }
    }
})