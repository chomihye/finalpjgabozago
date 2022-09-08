/**
 * @desc 초기 수행
 */
$(function(){
	console.log("6-1.mypage_main.js invoked.");

	// 메인 개별 숙소예약내역 클릭시, reserStatus-reserved 값 전달
	$('a.accomInfoBox').on("click", function(){     
        localStorage.setItem("reserStatus", "reserved");
    });
});