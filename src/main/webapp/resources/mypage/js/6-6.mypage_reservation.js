/**
 * @desc 초기 수행
 */
$(function(){
    $("#reservation").css("font-weight", "bold");
    
    changePersonIcon();         // 인원수에 따라 바뀌는 사람모양 아이콘
    changeReserStatusBtn();     // 예약상태에 따라 버튼 변경
});

/**
 * @desc 인원수에 따라 바뀌는 사람모양 아이콘
 */
function changePersonIcon(){
    $('.accom_num:contains("유아"), .accom_num:contains("성인 2"), .accom_num:contains("성인 3"), .accom_num:contains("성인 4")').each(function() {
		var html = $(this).html();
		$(this).html(html.replace('<i class="bi bi-person"></i>', '<i class="bi bi-people"></i>'));
	});
} // changePersonIcon

/**
 * @desc 예약상태에 따라 버튼 변경
 */
 function changeReserStatusBtn(){
    $(".btn").has('input[value="CA"]').each(function() {
        var html = $(this).html();
		$(this).html(html.replace('<input type="hidden" value="CA" class="status">', '<button type="button" id="btnCancel">예약취소</button>'));
    });

    $(".btn").has('input[value="CD"]').each(function() {
        var html = $(this).html();
		$(this).html(html.replace('<input type="hidden" value="CD" class="status">', '<div id="cancel_done">예약취소완료</div>'));
    });

    $(".btn").has('input[value="UCRN"]').each(function() {
        var html = $(this).html();
		$(this).html(html.replace('<input type="hidden" value="UCRN" class="status">', '<button type="submit" id="btnReser">후기작성</button>'));
    });

    $(".btn").has('input[value="UCRY"]').each(function() {
        var html = $(this).html();
		$(this).html(html.replace('<input type="hidden" value="UCRY" class="status">', '<button type="button" id="completed">이용완료</button>'));
    });
} // changeReserStatusBtn