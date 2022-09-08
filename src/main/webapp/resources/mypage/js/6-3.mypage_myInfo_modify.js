/**
 * @desc 초기 수행
 */
$(function(){
	console.log("6-3.mypage_myInfo_modify.js invoked.");

    $("#form").submit(function(e){
        e.preventDefault();
    });

    modal();        // 모달창
});

/**
 * @desc 모달창 관련
 */
function modal(){
    $("#updateBtn").click(function(){
		// $("#updateSucceedModal").css({display: "block"});
        // $("#requestDoubleCheckModal").css({display: "block"});   // 닉네임 중복 확인 요청
        // $("#pwdMismatchModal").css({display: "block"});   // 비밀번호 불일치
        $("#pwdFormCheckModal").css({display: "block"});   // 비밀번호 양식 틀림
	}); // 수정 확인 버튼 클릭

    $(".completed").click(function(){
		$(".modal").css({display: "none"});
        location.href="/mypage/main";
	}); // 수정완료

    $(".continue").click(function(){
		$(".modal").css({display: "none"});
	}); // 모달창 내 확인버튼 공통

    $("#doubleCheckBtn").click(function(){
		$("#doubleCheckSucceedModal").css({display: "block"});
        // $("#doubleCheckFailedModal").css({display: "block"});
	}); // 닉네임 중복 확인 버튼 클릭

    $("#phoneValidationBtn").click(function(){
        $(" #phoneModal").css({display: "block"});
    }); // 폰 인증 버튼 클릭

    $("#phoneValidationNumBtn").click(function(){
        $(" #phoneValidationSucceedModal").css({display: "block"});
        // $(" #phoneValidationFailedModal").css({display: "block"});
    }); // 폰 인증 확인 버튼 클릭
} // modal


//     window.onclick = function(event) {
//         if(event.target == emailModal || event.target == phoneModal) {
//             $("#emailModal").css({display: "none"});
//             $("#phoneModal").css({display: "none"});
//             $("#doubleCheckSucceedModal").css({display: "none"});
//         }// if
//     } // 배경 누르면 취소되는 경우 구현
