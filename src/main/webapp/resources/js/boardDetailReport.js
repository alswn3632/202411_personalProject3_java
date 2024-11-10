
console.log("boardDetailReport.js in!!");

document.addEventListener('click', (e) => {
    if (e.target.classList.contains('reportBtn')) {
        if(buno == uno){
            // 신고하는 사람과 글쓴이가 같을 때
            alert("자신의 글에는 신고할 수 없습니다.");
            return;
        }

        if(uno == -1){
            alert("로그인 후 이용 가능합니다.")
            return;
        }

        let reason = prompt("신고 사유를 입력해주세요.");

        if(reason === null){
            // 취소 눌렀을 때
        }else{
            let repData = {
                boardId : bno,
                userId : uno,
                reason : reason
            }
    
            reportToServer(repData).then(result =>{
                if(result == '1'){
                    alert("신고 접수 완료");
                }else if(result == '0'){
                    alert("신고 접수 실패");
                }else if(result == '-1'){
                    alert("게시물 신고는 계정당 1회 가능합니다.")
                }
            })
        }
    }

});

async function reportToServer(repData) {
    try {
        const url = "/report/register";
        const config = {
            method : "post",
            headers : {        
                'Content-Type' : 'application/json; charset=utf-8'
            },
            body : JSON.stringify(repData)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}