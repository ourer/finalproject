//등록
async function postBoardToServer(boardData){
    try {
        const url='/board/post';
        const config={
            method: 'post',
            headers: {
                'content-type': 'application/json; charset:utf-8'
            },
            body: JSON.stringify(boardData)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}
document.getElementById('postBtn').addEventListener('click', ()=>{
    const cmtText=document.getElementById('board').value;
    console.log(board);

    if(form-control==null || form-control==''){
        alert("게시글을 작성해주세요");
        return false;
    }else{
        let boardData={
            title, content: board,
            writer: document.getElementById('writer').innerText
        };
        console.log(boardData);
        postBoardToServer(boardData).then(result=>{
            if(result>0){
                alert("공지사항이 등록되었습니다.");
            }
        });
    }
});