/**
 * @desc 초기 수행
 */
$(function(){
	console.log("6-5.mypage_plan.js invoked.");
	$("#plan").css("font-weight", "bold");

	// 삭제 버튼 클릭시
	$(".modifyBtn1 .btnCancel").click(function(){
		let idx = $(".modifyBtn1 #tempIdx").val();
		$("#finalIdx").attr('value', idx);
	});

	$(".modifyBtn2 .btnCancel").click(function(){
		let idx = $(".modifyBtn2 #tempIdx").val();
		$("#finalIdx").attr('value', idx);
	});

	$(".modifyBtn3 .btnCancel").click(function(){
		let idx = $(".modifyBtn3 #tempIdx").val();
		$("#finalIdx").attr('value', idx);
	});

	$(".modifyBtn4 .btnCancel").click(function(){
		let idx = $(".modifyBtn4 #tempIdx").val();
		$("#finalIdx").attr('value', idx);
	});
});