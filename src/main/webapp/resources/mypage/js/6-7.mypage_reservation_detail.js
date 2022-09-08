let cancelBtn;
let refundInfo;
let reserStatus;

/**
 * @desc 초기 수행
 */
$(function(){
	console.log("6-7.mypage_reservation_detail.js invoked.");
	
	$("#reservation").css("font-weight", "bold");

	// cancelBtn = $(".cancel").clone();
    // refundInfo = $(".refund_info").clone();     // 우선 바뀔 html 요소 복사

	// $(".cancel").remove();
   	// $(".refund_info").remove();   // 초기 실행시 삭제

	// // reservation.jsp에서 전달한 값에 따라 페이지 변경
	// reserStatus = localStorage.getItem("reserStatus");
	// console.log(reserStatus);	// 확인용
	// changePage();

	// showAfterCancel();     // 예약 취소 후
});







// /**
//  * @desc reservation.jsp에서 전달한 값에 따라 페이지 변경
//  */
// function changePage(){
//     if(reserStatus == "reserved"){
// 		$(".reserStatus").replaceWith(cancelBtn);
// 	}else if(reserStatus == "cancelDone"){
// 		$(".reserStatus").replaceWith(refundInfo);
// 	} // if-else
// } // showAfterCancel

// /**
//  * @desc 예약 취소 후 html 변경
//  */
//  function showAfterCancel(){
//     $(".okBtn").click(function(){
//         $(".cancel").replaceWith(refundInfo);
//     });
// } // showAfterCancel