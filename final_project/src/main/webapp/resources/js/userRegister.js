async function postUserToServer(userData){
    try {
        const url='/user/post';
        const config={
            method: 'post',
            headers: {
                'content-type':'application/json; charset=utf-8'
            },
            body: JSON.stringify(userData)
        };
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch {
        console.log(error);
    }
}

document.getElementById('userPostBtn').addEventListener('click',()=>{
    const userText=document.getElementById('userText').value;
    console.log(userText);
    if(userText==null || userText==''){
        alert('주어진 항목을 입력하시오');
        userText.focus();
        return false;
    }else{
        let userData={
            
            
        }
    }
})