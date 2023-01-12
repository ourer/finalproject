async function acceptUserToServer(email){
    try {
        const url='/wait/accept/'+email;
        const config={
            method: 'put',
            headers:{
            	'content-type': 'application/json; charset=utf-8'
            },
        	body: JSON.stringify(email)
        }
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
};

async function refuseUserToServer(email){
    try {
        const url='/wait/refuse/'+email;
        const config={
            method: 'delete'
        };
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
};

document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('accept')){
        let tr=e.target.closest('tr');
        let emailVal=tr.dataset.email;
        console.log(emailVal);
        acceptUserToServer(emailVal).then(result=>{
            if(result>0){
                alert('승인 완료');
            }
            location.href="/user/management/"+sesemailVal;
        });
    }
});

document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('refuse')){
        let tr=e.target.closest('tr');
        let emailVal=tr.dataset.email;
        console.log(emailVal);
        refuseUserToServer(emailVal).then(result=>{
            if(result>0){
                alert('거절 완료');
            }
            location.href="/user/management/"+sesemailVal;
        });
    }
});