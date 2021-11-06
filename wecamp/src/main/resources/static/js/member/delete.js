/**
 * 
 유효성 검사 alert창 출력 */
window.onload =function(){
     document.getElementById("Send").onclick = chkData;
}

function chkData(){
     
     if(document.frm.memberPw.value === ""){
         frm.memberPw.focus();
         alert("비밀번호를 입력해주세요.");
         return;
    }
    
    alert("회원탈퇴가 완료되었습니다. 그동안 wecamp를 사랑해주셔서 감사합니다.");          
     frm.submit();
     }