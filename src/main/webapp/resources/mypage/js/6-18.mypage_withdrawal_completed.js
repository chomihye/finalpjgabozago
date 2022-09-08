/**
 * @desc 초기 수행
 */
$(function(){
    console.log("6-18.mypage_withdrawal_completed.js invoked.");
    
    setTimeout('movePage()', 5000); // 5초 후에 movePage() 함수 실행
});

/**
 * @desc 페이지 이동
 */
function movePage(){
    location.href="/main";
} // movePage