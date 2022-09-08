/**
 * @desc 초기 수행 (**모달만을 위한 곳이다.)
 * 연결된 페이지
 * plan.jsp
 * reservation/detail.jsp
 * reservation/review.jsp
 */
$(function(){
    $(".btnCancel").click(function(){
		$(".modal").css({display: "block"});
	}); // 버튼 클릭시 모달창 켜짐
	
	$(".cancelBtn").click(function(){
		$(".modal").css({display: "none"});
	}); // 취소 버튼 클릭

	$(".okBtn").click(function(){
		$(".modal").css({display: "none"});
	}); // 확인 버튼 클릭

	window.onclick = function(event) {
		if(event.target == ReserCancelModal) {
			$(".modal").css({display: "none"});
		}// if
	} // 배경 누르면 취소되는 경우 구현

	window.onclick = function(event) {
		if(event.target == PlanRemoveModal) {
			$(".modal").css({display: "none"});
		}// if
	} // 배경 누르면 취소되는 경우 구현
});