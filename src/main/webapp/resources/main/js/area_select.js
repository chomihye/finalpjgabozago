$(function() {
    $('.swiper-wrapper div').click(function(){
		var select_id = $(this).attr('data-area');

		$('.swiper-wrapper div').removeClass('current');
		$('.recommendContents').removeClass('current');

		$(this).addClass('current');
		$("#"+select_id).addClass('current');
	});

})