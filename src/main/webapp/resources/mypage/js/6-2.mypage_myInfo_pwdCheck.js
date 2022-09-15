/**
 * @desc 초기 수행
 */
$(function(){
	console.log("6-2.mypage_myInfo_pwdCheck.js invoked.");
});


// $(function(){
//     const emailModal = document.querySelector('#emailModal');
//     const phoneModal = document.querySelector('#phoneModal');
    
//     $("#phoneValidationBtn").click(function(){
//         $("#phoneModal").css({display: "block"});
//     }); // 폰 인증 버튼 클릭
   
//     $("#updateBtn").click(function(){
//         $("#updateFailedModal").css({display: "block"}); // 실패한 경우
//     }); // 회원수정 버튼 클릭
    
//     $("#doubleCheckBtn").click(function(){
//         $("#doubleCheckSucceedModal").css({display: "block"}); // 성공한 경우
//     }); // 중복확인 버튼 클릭
    
//     $(".okBtn").click(function(){
//         $("#emailModal").css({display: "none"});
//         $("#phoneModal").css({display: "none"});
//         $("#updateFailedModal").css({display: "none"});
//         $("#doubleCheckSucceedModal").css({display: "none"});
//     }); // 확인 혹은 취소 버튼 클릭

//     window.onclick = function(event) {
//         if(event.target == emailModal || event.target == phoneModal) {
//             $("#emailModal").css({display: "none"});
//             $("#phoneModal").css({display: "none"});
//             $("#doubleCheckSucceedModal").css({display: "none"});
//         }// if
//     } // 배경 누르면 취소되는 경우 구현
// });