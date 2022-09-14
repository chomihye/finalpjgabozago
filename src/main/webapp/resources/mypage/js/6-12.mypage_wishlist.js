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

    getAccomWishlist('1');     // 숙소 위시리스트 불러오는 ajax
    // getPageForAccomWishlist(); // 숙소 위시리스트 페이징 관련
    // clickPageBtn();             // 페이지 버튼 클릭시

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
            // getAccomWishlist();
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
function getAccomWishlist(currPage){
	debugger;
    $.ajax({
        type: "POST",
        url: "wishlist/accom",
        data:{
            "currPage" : currPage
        },
        cache : false,
        error : function(error) {
            console.log("error");
        },
        success : function(resp) {
            console.log("success");

            const map = JSON.parse(resp);
            const list = map.list;
            const pageDTO = map.pageDTO;

            $("#accom_list").empty();

            for(var i = 0 ; i < list.length ; i++){
                console.log(list[i]);

                file_name = list[i].FILE_NAME;
                accom_name = list[i].ACCOM_NAME;
                large_area_name = list[i].LARGE_AREA_NAME;

                let num = i + 1;

                let particleStr = "";
                particleStr += '<li id="item' + num + '">';
                particleStr += '<input type="checkbox" id="select' + num + '" name="selectParticle">';
                particleStr += '<label for="select' + num + '"></label>';
                particleStr += '<a href="/reservation/datail" class="accomBox">';
                particleStr += '<img src="/resources/acco/img/himg/' + file_name + '" alt="accom image">';
                particleStr += '<div class="accom_info">';
                particleStr += '<h3>' + accom_name + '</h3>';
                particleStr += '<p><i class="fas fa-location-dot"></i>&nbsp;' + large_area_name + '</p>';
                particleStr += '</div>';
                particleStr += '<button type="button" class="payment">결제하기</button>';
                particleStr += '</a>';
                particleStr += '</li>';

                $("#accom_list").append(particleStr);
            } // for

            cnt = $("#accom_list li").length;           // 숙소의 체크박스 갯수
            console.log("cnt : " + cnt);

            $(".yesPrev > a").off().on('click', function(){
                getAccomWishlist(pageDTO.startPage - 1);
            });            

            $(".pageNumber").empty();

            for(let i = pageDTO.startPage ; i <= pageDTO.endPage ; i++){
                let pageStr = "";

                if (pageDTO.cri.currPage == i) {
                    pageStr += '<li class="currPage" onclick="getAccomWishlist(' + i + ')">';
                } else{
                    pageStr += '<li class="" onclick="getAccomWishlist(' + i + ')">';
                } // if-else

                pageStr += '<a href="javascript:void(0);">';
                pageStr += '<strong>' + i + '</strong>';
                pageStr += '</a>';
                pageStr += '</li>';

                $(".pageNumber").append(pageStr);
            } // for
            
            $(".yesNext > a").off().on('click', function(){
                getAccomWishlist(pageDTO.endPage + 1);
            });     

            $(".backPage > a").off().on('click', function(){
                getAccomWishlist(pageDTO.realEndPage);
            });     

        } // success
    }); // ajax
} // end function

// /**
//  * @desc 숙소 위시리스트 페이징 처리 관련 ajax
//  */
// function getPageForAccomWishlist(){
//     $.ajax({
//         type: "POST",
//         url: "wishlist/accom/page",
//         cache : false,
//         error : function(error) {
//             console.log("error");
//         },
//         success : function(resp) {
//             console.log("success");

//             var pageDTO = JSON.parse(resp);
//             console.log(pageDTO);

//             var cri = pageDTO.cri;
//             console.log(cri);

//             // 현재 Pagination 범위에 속한 페이지 번호 목록 출력
//             for(let i = pageDTO.startPage ; i <= pageDTO.endPage ; i++){
//                 let num = 3;

//                 if(i == pageDTO.startPage){
//                     let testStr = "";
//                     testStr += '<li class="pageNumber">';
//                     testStr += '<a href="/mypage/wishlist?currPage=' + i + '">';
//                     testStr += '<strong>' + i + '</strong>';
                    

//                     $("#pageNumber").replaceWith('<li class="pageNumber"><a href="/mypage/wishlist?currPage=' + i + '"><strong>' + i + '</strong></a></li>');
//                 } else{
//                     $("#pagination ul li:nth-child(" + num + ")").after('<li class="pageNumber"><a href="/mypage/wishlist?currPage=' + i + '"><strong>' + i + '</strong></a></li>');
//                 }// if-else
                
//                 num++;
//             } // for
//         } // success
//     }); // ajax
// } // end function

// /**
//  * @desc 페이지 버튼 클릭시
//  */
// function clickPageBtn(){
//     $(".pageNumber").on("click", function(){
//         console.log(this);
//         $(this).attr('class', 'currPage');
//     });
// } // end function