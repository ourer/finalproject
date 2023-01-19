async function removeUserAtServer(deleteData){
    try {
        const url='/wait/remove/'+deleteData.email;
        const config={
            method: 'delete',
            headers:{
            	'content-type': 'application/json; charset=utf-8'
            },
        	body: JSON.stringify(deleteData)
        };
        const resp=await fetch(url,config);
        const result=await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
};

document.addEventListener('click', (e)=>{
    if(e.target.classList.contains('del')){
        let tr=e.target.closest('tr');
        let emailVal=tr.dataset.email;
        console.log(emailVal);
        let deleteData={
            email: emailVal,
            grno: grnoVal
            };
        removeUserAtServer(deleteData).then(result=>{
            if(result>0){
                alert('강퇴 완료');
            }
                location.reload();
            
        });

    }
});