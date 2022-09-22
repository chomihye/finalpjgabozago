
$(function () {
  $("button.accordion_title").click(function () {
    $(this).next(".answer_box_wrap").slideToggle();
    $(this).toggleClass('active').siblings().removeClass('active');
    $(this).parent(".accordion_item").siblings(".accordion_item").children(".answer_box_wrap").slideUp();
	// $('img').parent().attr('src', './arrow up.png');
  });
  // let num = 0;
	// $("button.accordion_title").click(function () {
	// 	if(num == 0) {
	// 		$("img").attr("src", "./arrow up.png");
	// 		num = 1;
	// 	}else {
	// 		$("img").attr("src", "./arrow down (1).png");
	// 		num = 0;
	// 	} 
	// });

});
