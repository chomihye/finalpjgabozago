/**
 * @desc 초기 수행
 */
$(function(){
	console.log("6-13.mypage_point.js invoked.");
	$("#point").css("font-weight", "bold");

	checkIsPlus();
});

/**
 * @desc 적립인지 사용인지에 따라 달라지는 화면
 */
function checkIsPlus(){

	$('td:contains("Y")').each(function() {
		var text = $(this).text();
		$(this).text(text.replace('Y', '적립'));
		$(this).css('color', '#68AE6D');
		$(this).siblings().css('color', '#68AE6D');
	});

	$('td:contains("N")').each(function() {
		var text = $(this).text();
		$(this).text(text.replace('N', '사용'));
		$(this).css('color', 'red');
		$(this).siblings().css('color', 'red');
	});

} // checkIsPlus