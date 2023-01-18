async function appointmentUserToServer(email){
    try {
        const url='/wait/appointment/'+email;
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
async function cancellationUserToServer(email){
    try {
        const url='/wait/cancellation/'+email;
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

document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('appointment')){
        let tr=e.target.closest('tr');
        let emailVal=tr.dataset.email;
        console.log(emailVal);
        appointmentUserToServer(emailVal).then(result=>{
            if(result>0){
                alert('운영진 임명 완료');
            }
            location.reload();
        });
    }
});

document.addEventListener('click',(e)=>{
    if(e.target.classList.contains('cancellation')){
        let tr=e.target.closest('tr');
        let emailVal=tr.dataset.email;
        console.log(emailVal);
        cancellationUserToServer(emailVal).then(result=>{
            if(result>0){
                alert('운영진 해제 완료');
            }
            location.reload();
        });
    }
});