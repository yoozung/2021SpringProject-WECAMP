/**
 * 
 */
 let index = {
    init: function() {
       $("#btn-save").on("click", () => {
          this.save();
       });
       $("#btn-delete").on("click", () => {
          this.deleteById();
       });
 
       $("#btn-update").on("click", () => {
          this.update();
       });
 
       $("#btn-reply-save").on("click", () => {
          this.replySave();
       });
       
       $(document).ready(function(){
        $('#spreadBtn04').click(function(){
         if($("#hiddenList03").is(":visible")){
          $("#spreadBtn04").toggleClass("icon-commenting-o icon-commenting");
           $("#hiddenList03").slideUp(); }else{
            $("#spreadBtn04").toggleClass("icon-commenting icon-commenting-o"); 
            $("#hiddenList03").slideDown(); 
            } 
            }); 
        });

    },
 
    save: function() {
       let data = {
          title: $("#title").val(),
          content: $("#content").val()
       };
 
 
       $.ajax({
          type: "POST",
          url: "/api/board",
          data: JSON.stringify(data), //http body 데이터
          contentType: "application/json; charset=utf-8", //body 데이터 타입
          dataType: "json"
       }).done(function(resp) {
          console.log(resp);
          alert("글쓰기가 완료되었습니다.");
          location.href = "/board";
       }).fail(function(error) {
          alert(JSON.stringify(error));
       });
    },
 
 
 
    deleteById: function() {
       let id = $("#id").text();
 
       $.ajax({
          type: "DELETE",
          url: "/api/board/" + id,
          dataType: "json"
       }).done(function(resp) {
          alert("삭제가 완료되었습니다.");
          location.href = "/board";
       }).fail(function(error) {
          alert(JSON.stringify(error));
       });
    },
 
    update: function() {
       let id = $("#id").val();
 
       let data = {
          title: $("#title").val(),
          content: $("#content").val()
       };
 
       $.ajax({
          type: "PUT",
          url: "/api/board/" + id,
          data: JSON.stringify(data),
          contentType: "application/json; charset=utf-8",
          dataType: "json"
       }).done(function(resp) {
          alert("글수정이 완료되었습니다.");
          location.href = "/board";
       }).fail(function(error) {
          alert(JSON.stringify(error));
       });
    },
 
    replySave: function() {
       let data = {
          userId: $("#userId").val(),
          boardId: $("#boardId").val(),
          content: $("#reply-content").val()
       };
 
       console.log(data);
 
       $.ajax({
          type: "POST",
          url: `/api/board/${data.boardId}/reply`,
          data: JSON.stringify(data),
          contentType: "application/json; charset=utf-8",
          dataType: "json"
       }).done(function(resp) {
          alert("댓글작성이 완료되었습니다.");
          location.href = `/board/${data.boardId}`;
       }).fail(function(error) {
          alert(JSON.stringify(error));
       });
    },
 
    replyDelete: function(boardId, replyId) {
       $.ajax({
          type: "DELETE",
          url: `/api/board/${boardId}/reply/${replyId}`,
          dataType: "json"
       }).done(function(resp) {
          alert("댓글삭제 성공");
          location.href = `/board/${boardId}`;
       }).fail(function(error) {
          alert(JSON.stringify(error));
       });
    },
 
 
 }
 
 index.init();