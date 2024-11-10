
console.log("userAlert.js in!!")

document.addEventListener('click', (e)=>{
    if(e.target.classList.contains('delBtn')){
        bno = e.target.dataset.bno;
        id = e.target.dataset.id;
        adminDelBoard(bno, id).then(result =>{
            if(result == '1'){
                alert("삭제 작업 완료");
            }else if(result == '0'){
                alert("작업 실패");
            }
        });
    }
    
    if(e.target.classList.contains('hodBtn')){
        bno = e.target.dataset.bno;
        id = e.target.dataset.id;
        adminHodBoard(bno, id).then(result =>{
            if(result == '1'){
                alert("보류 작업 완료");
            }else if(result == '0'){
                alert("작업 실패");
            }
        });
    }
});

async function adminDelBoard(bno, id) {
    try {
        const url = "/report/adminDel/" + bno + "/" + id;
        const resp = await fetch(url);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error)
    }
}

async function adminHodBoard(bno, id) {
    try {
        const url = "/report/adminHod/" + bno + "/" + id;
        const resp = await fetch(url);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error)
    }
}