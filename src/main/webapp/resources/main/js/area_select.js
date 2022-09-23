$(function() {
    $('.areainfoWrapper div').click(function(){
		var select_id = $(this).attr('data-area');

		$('.areainfoWrapper div').removeClass('current');
		$('.recommendContents').removeClass('current');

		$(this).addClass('current');
		$("#"+select_id).addClass('current');
	});

})