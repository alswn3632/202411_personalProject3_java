
console.log("userModify.js in!!");

document.addEventListener('click', (e)=>{
    if(e.target.classList.contains('idcheck')){
        let username = document.getElementById('u')
        console.log(username.value);
        document.getElementById('modBtn').disabled = false;
        if(username.value == "" || username.value == null){
            document.getElementById('modBtn').disabled = true;
            alert("아이디를 입력해주세요.");
            username.focus();
            return;
        }
        idCheckToServer(username.value).then(result =>{
            if(result == '1'){
                // 아이디가 있다면(중복)
                // 알림
                document.getElementById('statusMessage').innerText = "아이디 사용 불가능";
                username.value = "";
                username.focus();
                // 버튼 비활성화
                document.getElementById('modBtn').disabled = true;
            }else{
                document.getElementById('modBtn').disabled = false;
                document.getElementById('statusMessage').innerText = "아이디 사용 가능";
                document.getElementById('statusMessage').dataset.ok = "1";
            }
        });

    }
});

async function idCheckToServer(username) {
    try {
        const url = "/user/check/" + username;
        const resp = await fetch(url);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error)
    }
}