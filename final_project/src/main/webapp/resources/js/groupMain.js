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


