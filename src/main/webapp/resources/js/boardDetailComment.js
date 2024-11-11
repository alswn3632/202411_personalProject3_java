// Detail 페이지 
console.log("boardDetailComment.js in!!");
console.log("boardId:" + bno + ", userId:" + uno);

// JSP 댓글 출력 함수
function spreadCommentList(bno, page=1){
    getCommentListFromServer(bno, page).then(result =>{
        console.log(result);
        // result는 ph값
        // result 안의 cmtList가 있으면된다. 
        const ul = document.getElementById('cmtListArea');
        if(result.cmtList.length > 0){
            if(page == 1){
                ul.innerHTML = ""; // 반복 전 기존 샘플 버리기 (더보기 버튼에 의한 누적 불가능)
            }
            for(let cvo of result.cmtList){
                let li = `<li class="list-group-item" data-id=${cvo.id}>`;
                li += `<div class="ms-2 me-auto">`;
                li += `<div class="fw-bold"><span class="cmtWriterMod">${cvo.writer}</span>`;
                li += `</div>${cvo.content}</div>`;
                li += `<div class="button-container"><button type="button" class="btn btn-outline-secondary btn-sm ans" data-id=${cvo.id}>답글</button>`;
                if (cvo.userId == uno) {
                    li += `<button type="button" class="btn btn-outline-secondary btn-sm mod" data-id=${cvo.id} data-bs-toggle="modal" data-bs-target="#myModal">수정</button>`;
                    li += `<button type="button" class="btn btn-outline-secondary btn-sm del" data-id=${cvo.id}>삭제</button>`;
                }     
                li += `</div>`       
                // 답글 출력
                li += `<li class="list-group-item printArea" id="printArea${cvo.id}" data-id=${cvo.id}></li>`;
                // 답글용 input창
                li += `<div class="input-group mb-3" id="inputArea${cvo.id}" data-id=${cvo.id}></div>`;

                li += `</li>`;
                ul.innerHTML += li; 
                spreadCommentListAns(cvo.id);
            }
            // 더보기 버튼의 숨김 여부 체크 코드
            let moreBtn = document.getElementById('moreBtn');
            // 더보기 버튼이 표시되는 조건 
            // 현재 페이지가 전체 페이지보다 작으면 표시
            if(result.pgvo.pageNo < result.realEndPage){
                // style.visibility = "hidden" : 숨김 / "visible" : 표시
                moreBtn.style.visibility = 'visible'; // 버튼 표시
                moreBtn.dataset.page = page + 1; // 1 페이지 증가   
            }else{
                // 현재 페이지가 전체보다 작지 않다면
                moreBtn.style.visibility = 'hidden'; // 다시 숨김 처리
            }
        }else{
            ul.innerHTML = `<li class="list-group-item">댓글이 없습니다. 첫 댓글을 써보세요!!</li>`;
        }
    });
}

// 답글 출력 함수
function spreadCommentListAns(cno){
    getCommentListFromServer2(cno).then(result =>{
        if(result.length > 0){
            let div = document.getElementById(`printArea${cno}`)
            div.innerHTML = "";
            for(let cvo of result){
                console.log(cvo);
                let str = `<div class="ms-2 me-auto">`;
                str += `<div class="fw-bold"><span class="cmtWriterMod">${cvo.writer}</span>`;
                str += `</div>${cvo.content}</div>`;
                str += `<div class="button-container">`
                if (cvo.userId == uno) {
                    str += `<button type="button" class="btn btn-outline-secondary btn-sm mod" data-id=${cvo.id} data-isParent=${cvo.parentId} data-bs-toggle="modal" data-bs-target="#myModal">수정</button>`;
                    str += `<button type="button" class="btn btn-outline-secondary btn-sm del" data-id=${cvo.id}>삭제</button>`;
                }
                str += `</div>`
                div.innerHTML += str;
            }
        }else if(result.length == 0){
            document.getElementById(`printArea${cno}`).remove();
        }
    });
}

// 전체 이벤트 리스너 - 댓글 수정, 삭제
document.addEventListener('click', (e)=>{
    // 수정 버튼을 클릭하였을 때 모달 창 출력
    // 모달창 출력을 위한 데이터 조작
    if(e.target.classList.contains('mod')){
        // 클릭한 버튼이 포함된 <li>
        // closest : (나를 포함한) 가장 가까운 (부모)태그
        let box = e.target.closest('li');
        // console.log(li);
        let cmtText = box.querySelector('.fw-bold').nextSibling;
        console.log(cmtText);
        document.getElementById('cmtTextMod').value = cmtText.nodeValue;
        let cmtWriter = box.querySelector('.cmtWriterMod').innerText;
        console.log(cmtWriter);
        document.getElementById('exampleModalLabel').innerText = cmtWriter;
        let id = e.target.dataset.id;

        // cmtModBtn => id 값을 dataset으로 닫기
        document.getElementById('cmtModBtn').setAttribute("data-id", id);
    }
    
    // 댓글 수정 '등록' 버튼을 눌렀을 때 동작
    if(e.target.id == 'cmtModBtn'){
        let cmtData = {
            id : e.target.dataset.id,
            content : document.getElementById('cmtTextMod').value
        }
        console.log(cmtData);

        updateCommentToServer(cmtData).then(result =>{
            if(result == '1'){
                alert("댓글 수정 성공");
            }else{
                alert("댓글 수정 실패!");
            }
            // 모달 창 닫기 : btn-close 라는 객체를 클릭
            document.querySelector('.btn-close').click();
            // 수정한 댓글 출력
            spreadCommentList(bno);
        });
    }

    // 댓글 삭제 버튼을 눌렀을 때 동작
    if(e.target.classList.contains('del')){
        let id = e.target.dataset.id

        removeCommentToServer(id).then(result =>{
            if(result == '1'){
                alert("댓글 삭제 성공");
            }else{
                alert("댓글 삭제ㄴ 실패!");
            }
            // 삭제 후 댓글 출력
            spreadCommentList(bno);
        });
    }

    if(e.target.id == 'moreBtn'){
        let page = parseInt(e.target.dataset.page);
        spreadCommentList(bno, page);
    }

    // 답글 버튼 활성/비활성
    if(e.target.classList.contains('ans')){
        let id = e.target.dataset.id;
        let div = document.getElementById(`inputArea${id}`)
        if (div.innerHTML.trim() !== "") {
            div.innerHTML = "";  // 내용이 있으면 지우고
        } else {
            let str = "";
            str += `<span class="input-group-text" id="cmtWriter2">${nickname}</span>`;
            str += `<input type="text" class="form-control" id="cmtText2" placeholder="Add Comment..." aria-label="Username" aria-describedby="basic-addon1">`;
            str += `<button class="btn btn-outline-secondary addBtn2" type="button" data-id=${id}>등록</button>`; 
            div.innerHTML = str;
        }
    }
    // 댓글 등록 버튼
    if(e.target.classList.contains('addBtn1')){
        const cmtText = document.getElementById('cmtText');
        const cmtWriter = document.getElementById('cmtWriter');
        if(cmtText.value == null || cmtText.value == ''){
            alert('댓글을 입력해주세요!');
            cmtText.focus();
            return false;
        }
        let cmtData = {
            boardId : bno,
            userId : uno,
            writer : cmtWriter.innerText,
            content : cmtText.value
        }
        postCommentToServer(cmtData).then(result =>{
            if(result == '1'){
                alert("댓글 등록 성공");
                cmtText.value = "";
                // 댓글 출력
                spreadCommentList(bno)
            }
        });
    }
    // 답글 버튼 등록
    if(e.target.classList.contains('addBtn2')){
        const cmtText = document.getElementById('cmtText2');
        const cmtWriter = document.getElementById('cmtWriter2');
        const cmtParent = parseInt(e.target.dataset.id);
        if(cmtText.value == null || cmtText.value == ''){
            alert('댓글을 입력해주세요!');
            cmtText.focus();
            return false;
        }
        let cmtData = {
            boardId : bno,
            userId : uno,
            writer : cmtWriter.innerText,
            content : cmtText.value,
            parentId : cmtParent
        }
        console.log(cmtData);
        postCommentToServer(cmtData).then(result =>{
            if(result == '1'){
                alert("댓글 등록 성공");
                let div = e.target.closest('div');
                div.innerHTML = "";
                // 댓글 출력
                spreadCommentList(bno)
            }
        })
    }
});

// 비동기 요청 : 댓글 등록
async function postCommentToServer(cmtData) {
    console.log(cmtData);
    try {
        const url = "/comment/post";
        const config = {
            method : "post",
            headers : {        
                'Content-Type' : 'application/json; charset=utf-8'
            },
            body : JSON.stringify(cmtData)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();

        return result;
    } catch (error) {
        console.log(error);
    }
}

// 비동기 요청 : 댓글 출력
async function getCommentListFromServer(bno, page) {
    try {
        const resp = await fetch("/comment/" + bno + "/" + page);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

// 비동기 요청 : 댓글 출력(답글)
async function getCommentListFromServer2(cno) {
    try {
        const resp = await fetch("/comment/listAns?cno=" + cno);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

// 비동기 요청 : 댓글 수정
async function updateCommentToServer(cmtData) {
    try {
        const url = "/comment/modify";
        const config = {
            method : 'put',
            headers : {
                'Content-Type' : 'application/json; charset=utf-8'
            },
            body : JSON.stringify(cmtData)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error)
    }
}

// 비동기 요청 : 댓글 삭제
async function removeCommentToServer(id) {
    try {
        const url = "/comment/" + id + "/" + bno;
        const config = {
            method : 'delete'
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error)
    }
}