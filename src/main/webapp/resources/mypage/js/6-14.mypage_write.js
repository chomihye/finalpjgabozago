let optionValue = null;
let writeBoard;
let writeComment;

/**
 * @desc 초기 수행
 */
$(function(){
	console.log("6-14.mypage_write.js invoked.");
	$("#write").css("font-weight", "bold");
	
    writeBoard = $("#write_board").clone();
    writeComment = $("#write_comment").clone();     // 우선 바뀔 html 요소 복사

   	$("#write_comment").remove();   // 초기 실행시 일정부분 삭제

    changeOption();     // 옵션 선택시 메소드 호출
});

/**
 * @desc Select Option 선택시 변경
 */
 function changeOption(){
    $("select[name=write_type]").change(function(){
        console.log($(this).val());
        optionValue = $(this).val(); //value값 가져오기

        if(optionValue == "board"){
            $("#write_comment").replaceWith(writeBoard);
        }else if(optionValue == "comment"){
            $("#write_board").replaceWith(writeComment);
        } // if-else
    });
} // changeOption