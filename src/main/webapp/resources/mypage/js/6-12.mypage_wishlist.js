let cnt = 0;
let optionValue = null;
let wishlistAccom;
let wishlistPlan;

/**
 * @desc 초기 수행
 */
$(function(){
	console.log("6-12.mypage_wishlist.js invoked.");
	
	$("#wishlist").css("font-weight", "bold");
	
    wishlistAccom = $(".wishlist_accom").clone();
    wishlistPlan = $(".wishlist_plan").clone();     // 우선 바뀔 html 요소 복사

   	$(".wishlist_plan").remove();   // 초기 실행시 일정부분 삭제

    changeOption();     // 옵션 선택시 메소드 호출

    cnt = 10;           // default로 숙소의 체크박스 갯수
    selectAllCheckBox();
});

/**
 * @desc 위시리스트 체크박스 전체 선택 관련 로직
 */
function selectAllCheckBox(){
    $("input[type='checkbox']").off().on("click", function(){
        if ($("input[name='selectParticle']:checked").length == cnt) {
            $("#selectAll").prop("checked", true);
        } else {
            $("#selectAll").prop("checked", false);  
        }
    });

    $("#selectAll").off().on("click", function(){
        let checkYn = $("#selectAll").is(":checked");
        if (checkYn == true) {
            $("input[type='checkbox']").prop("checked", true);
        } else {
            $("input[type='checkbox']").prop("checked", false); 
        }
    });
} // selectAllCheckBox

/**
 * @desc Select Option 선택시 변경
 */
 function changeOption(){
    $("select[name=wishlist_type]").change(function(){
        console.log($(this).val());
        optionValue = $(this).val(); //value값 가져오기

        if(optionValue == "accom"){
            $(".wishlist_plan").replaceWith(wishlistAccom);
            cnt = 10;           // 위시리스트 체크박스 갯수
            selectAllCheckBox();
        }else if(optionValue == "plan"){
            $(".wishlist_accom").replaceWith(wishlistPlan);
            cnt = 4;           // 위시리스트 체크박스 갯수
            selectAllCheckBox();
        } // if-else
    });
} // changeOption