let cnt = 0;
let optionValue = null;
let wishlistAccom;
let wishlistPlan;

/**
 * @desc 초기 수행
 */
$(function(){
	$("#wishlist").css("font-weight", "bold");
	
    wishlistAccom = $(".wishlist_accom").clone();
    wishlistPlan = $(".wishlist_plan").clone();     // 우선 바뀔 html 요소 복사

   	$(".wishlist_plan").remove();   // 초기 실행시 일정부분 삭제

    getAccomWishlist();     // 숙소 위시리스트 불러오는 ajax
    getPageForAccomWishlist();

    selectAllCheckBox();    // 체크박스 관련 메소드
    changeOption();     // 옵션 선택시 메소드 호출
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
    $("select[name=wishlist_type]").on("change", function(){
        console.log($(this).val());
        optionValue = $(this).val(); //value값 가져오기

        if(optionValue == "accom"){
            $(".wishlist_plan").replaceWith(wishlistAccom);
            getAccomWishlist();
            selectAllCheckBox();
        }else if(optionValue == "plan"){
            $(".wishlist_accom").replaceWith(wishlistPlan);
            cnt = 4;           // 일정 위시리스트 체크박스 갯수
            selectAllCheckBox();
        } // if-else
    });
} // changeOption

/**
 * @desc 숙소 위시리스트 불러오기
 */
 function getAccomWishlist(){
    $.ajax({
        type: "POST",
        url: "wishlist/accom",
        cache : false,
        error : function(error) {
            console.log("error");
        },
        success : function(resp) {
            console.log("success");

            var list = JSON.parse(resp);
            // console.log(list);

            let itemCount = list.length;
            $("#item" + itemCount).nextAll().remove();

            for(var i = 0 ; i < list.length ; i++){
                console.log(list[i]);

                file_name = list[i].FILE_NAME;
                // console.log(file_name);
                accom_name = list[i].ACCOM_NAME;
                // console.log(accom_name);
                large_area_name = list[i].LARGE_AREA_NAME;
                // console.log(large_area_name);

                let num = i + 1;
                $("#item" + num + " img").attr('src', '/resources/acco/img/himg/' + file_name);
                $("#item" + num + " .accom_info h3").text(accom_name);
                $("#item" + num + " .accom_info p span").text(large_area_name);
            }

            cnt = $("#accom_list li").length;           // 숙소의 체크박스 갯수
            console.log("cnt : " + cnt);
        }
    });
 }

 /**
 * @desc 숙소 위시리스트 페이징 처리 관련 ajax
 */
  function getPageForAccomWishlist(){
    $.ajax({
        type: "POST",
        url: "wishlist/accom/page",
        cache : false,
        error : function(error) {
            console.log("error");
        },
        success : function(resp) {
            console.log("success");

            var pageDTO = JSON.parse(resp);
            console.log(pageDTO);

            var cri = pageDTO.cri;
            console.log(cri);

            for(var i = pageDTO.startPage ; i <= pageDTO.endPage ; i++){
                $("#item" + num + " img").attr('src', '/resources/acco/img/himg/' + file_name);
            } // if

            // let itemCount = pageDTO.length;
            // $("#item" + itemCount).nextAll().remove();

            // for(var i = 0 ; i < list.length ; i++){
            //     console.log(list[i]);

            //     file_name = list[i].FILE_NAME;
            //     console.log(file_name);
            //     accom_name = list[i].ACCOM_NAME;
            //     console.log(accom_name);
            //     large_area_name = list[i].LARGE_AREA_NAME;
            //     console.log(large_area_name);

            //     let num = i + 1;
            //     $("#item" + num + " img").attr('src', '/resources/acco/img/himg/' + file_name);
            //     $("#item" + num + " .accom_info h3").text(accom_name);
            //     $("#item" + num + " .accom_info p span").text(large_area_name);
            // }

            // cnt = $("#accom_list li").length;           // 숙소의 체크박스 갯수
            // console.log("cnt : " + cnt);
        }
    });
 }