
console.log("boardDetailLike.js in!!")

// 버튼 출력 함수 (출력 여부에 따라 다름)
function printLikeBox(bno, uno) {
    let buData = {
        boardId: bno,
        userId: uno
    };
    if (uno == -1) {
        let isLike = -1; // 로그인되지 않은 상태는 무조건 -1
        updateLikeBtn(isLike);  // 버튼 상태 바로 업데이트
    } else {
        isLikeFromServer(buData).then(result => {
            let isLike = parseInt(result);
            console.log(isLike);
            updateLikeBtn(isLike);  // 비동기 요청이 끝난 후 버튼 상태 업데이트
        });
    }
}

// 버튼 출력 함수(2)
function updateLikeBtn(isLike) {
    const likeBtn = document.getElementById('likeBtn');
    if (isLike == -1 || isLike == 0) {
        likeBtn.className = "btn btn-outline-danger likeBtn";
    } else if (isLike == 1) {
        likeBtn.className = "btn btn-danger likeBtn";
    }
}

// 비동기 요청 : 좋아요 상태 가져오기
async function isLikeFromServer(buData) {
    try {
        const url = "/board/isLike/" + bno + "/" + uno;
        const resp = await fetch(url);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error)
    }
}

// board_id와 user_id를 가지고 추천 여부 확인하는 비동기 요청 함수
document.addEventListener('click', (e) => {
    // 좋아요 버튼 눌렀을 때 처리
    if (e.target.classList.contains('likeBtn')) {
        let buData = {boardId: bno, userId: uno};
        
        if (uno == -1) {
            alert("로그인 후 이용 가능합니다.");
        } else {
            isLikeFromServer(buData).then(result => {
                let isLiked = parseInt(result); // 추천 여부 값 (1: 추천, 0: 추천 안함)
                console.log(isLiked);
                if (isLiked === 1) {
                    // 추천 O => 추천 취소
                    delLikeToServer(buData).then(result => {
                        if (result === "1") {
                            alert("추천 취소 성공!");
                            printLikeBox(bno, uno); // 추천 취소 후 버튼 상태 업데이트
                        } else {
                            alert("추천 취소 실패!");
                        }
                    });
                } else if (isLiked === 0) {
                    // 추천 X => 추천 등록
                    regLikeToServer(buData).then(result => {
                        if (result === "1") {
                            alert("추천 등록 성공!");
                            printLikeBox(bno, uno); // 추천 등록 후 버튼 상태 업데이트
                        } else {
                            alert("추천 등록 실패!");
                        }
                    });
                }
            }).catch(error => {
                console.error("추천 여부 확인 실패:", error);
                alert("추천 여부 확인 중 문제가 발생했습니다.");
            });
        }
    }
});

// 추천 등록
async function regLikeToServer() {
    try {
        const url = "/board/regLike/" + bno + "/" + uno;
        const resp = await fetch(url);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error)
    }
}

// 추천 취소
async function delLikeToServer() {
    try {
        const url = "/board/delLike/" + bno + "/" + uno;
        const resp = await fetch(url);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error)
    }
}