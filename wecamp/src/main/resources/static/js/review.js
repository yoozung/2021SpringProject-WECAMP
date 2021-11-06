/**
 * review.js
 */

window.addEventListener("load",function(){
   console.log(document.location.href);
   localStorage.setItem('back',(String)(document.location.href));
})

/* ============== */

/* 유효성 검사 alert창 출력 */
window.onload =function(){
     document.getElementById("Send").onclick = chkData;
}

function chkData(){
   
   if(document.frm.content.value === "" ){
        frm.content.focus();
        alert("내용을 입력해주세요.");
        return;
   }
    
    alert("후기등록이 완료되었습니다.");          
     //frm.action = "join";
     //frm.method = "post";
     frm.submit();
     }