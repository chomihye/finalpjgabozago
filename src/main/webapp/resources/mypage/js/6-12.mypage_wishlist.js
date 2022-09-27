let cnt = 0;
let optionValue = null;

/**
 * @desc 초기 수행
 */
$(function(){ 
	$("#wishlist").css("font-weight", "bold");
    $(".simpleTextSpaceAdd").css('margin', '68px 0');       // 로딩 모달

    getAccomWishlist('1');     // 숙소 위시리스트 불러오는 ajax(default)

    changeOption();     // 옵션 선택시 메소드 호출    
}); // 초기함수


/**
 * @desc 위시리스트 체크박스 전체 선택 관련 로직
 */
function selectAllCheckBox(cnt){
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

        $(".wishlist_item").empty();
        $(".pageBtn").empty();

        if(optionValue == "accom"){
            getAccomWishlist('1');
        }else if(optionValue == "plan"){
            getPlanWishlist('1');
        } // if-else
    });
} // changeOption


/**
 * @desc 숙소 위시리스트 불러오기
 */
function getAccomWishlist(currPage){

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

            $(".wishlist_item").empty();
            $(".pageBtn").empty();

            let particleStr = "";

            // 아무것도 없는 회원 처리
            if(pageDTO.totalAmount == 0){       // 레코드가 아무것도 없다면,
                particleStr = '<div id="no_get">숙소 위시리스트가 없습니다.</div>';
                $(".wishlist_item").append(particleStr);
                return;
            }else{                              // 레코드가 1개 이상이면,
                // checkbox load
                particleStr = "";
                particleStr += '<div class="select">';
                particleStr += '<input type="checkbox" id="selectAll" name="selectAll">';
                particleStr += '<label for="selectAll"></label>';
                particleStr += '<label for="selectAll" class="selectAll">전체선택</label>';
                particleStr += '<a href="javascript:void(0);" class="selectDelete" onclick="deleteItems()">선택삭제</a>';
                particleStr += '</div>';
                particleStr += '<ul id="accom_list"></ul>';

                $(".wishlist_item").append(particleStr);

                for(var i = 0 ; i < list.length ; i++){
                    wishAccomIdx = list[i].IDX;
                    file_name = list[i].FILE_NAME;
                    accom_idx = list[i].ACCOM_IDX;
                    accom_name = list[i].ACCOM_NAME;
                    large_area_name = list[i].LARGE_AREA_NAME;

                    let num = i + 1;

                    particleStr = "";
                    particleStr += '<li id="item' + num + '">';
                    particleStr += '<input type="checkbox" id="select' + num + '" name="selectParticle" idx="' + wishAccomIdx + '">';
                    particleStr += '<label for="select' + num + '"></label>';
                    particleStr += '<a href="/reservation/datail?accom_idx=' + accom_idx + '" class="accomBox">';
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
                selectAllCheckBox(cnt);

                // ================================================================

                let initialPageStr = "";
                initialPageStr += '<form action="#" id="paginationForm">';
                initialPageStr += '<input type="hidden" name="currPage">';
                initialPageStr += '<ul id="pagingBtn">';
                initialPageStr += '<li class="frontPage"><a href="javascript:void(0);" onclick="getAccomWishlist(' + 1 + ')"><i class="bi bi-chevron-double-left"></i></a></li>';
                initialPageStr += '<li class="prev yesPrev"><a href="javascript:void(0);"><i class="bi bi-chevron-left"></i></a></li>';
                initialPageStr += '<li class="pageNumber"></li>';
                initialPageStr += '<li class="next yesNext"><a href="javascript:void(0);"><i class="bi bi-chevron-right"></i></a></li>';
                initialPageStr += '<li class="backPage"><a href="javascript:void(0);"><i class="bi bi-chevron-double-right"></i></a></li>';
                initialPageStr += '</ul>';
                initialPageStr += '</form>';

                $(".pageBtn").append(initialPageStr);

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
                
                $(".yesPrev > a").off().on('click', function(){
                    if(pageDTO.startPage - 1 < 1){ getAccomWishlist(pageDTO.startPage); }
                    else{ getAccomWishlist(pageDTO.startPage - 1); }
                });   

                $(".yesNext > a").off().on('click', function(){
                    if(pageDTO.endPage + 1 > pageDTO.realEndPage){ getAccomWishlist(pageDTO.endPage); }
                    else{ getAccomWishlist(pageDTO.endPage + 1); }
                });     

                $(".backPage > a").off().on('click', function(){
                    getAccomWishlist(pageDTO.realEndPage);
                });     
            } // outer if-else
        } // success
    }); // ajax
} // getAccomWishlist


/**
 * @desc 일정 위시리스트 불러오기
 */
function getPlanWishlist(currPage){

    showLoadingImg();

    $.ajax({
        type: "POST",
        url: "wishlist/plan",
        data:{
            "currPage" : currPage
        },
        cache : false,
        error : function(error) {
            console.log("error");
            hideLoadingImg();
        },
        success : function(resp) {
            console.log("success");

            const map = JSON.parse(resp);
            const list = map.list;
            const pageDTO = map.pageDTO;

            $(".wishlist_item").empty();
            $(".pageBtn").empty();

            let particleStr = "";

            // 아무것도 없는 회원 처리
            if(pageDTO.totalAmount == 0){       // 레코드가 아무것도 없다면,
                particleStr = '<div id="no_get">일정 위시리스트가 없습니다.</div>';
                $(".wishlist_item").append(particleStr);
                hideLoadingImg();
                return;
            }else{                              // 레코드가 1개 이상이면,
                // checkbox load
                particleStr = "";
                particleStr += '<div class="select">';
                particleStr += '<input type="checkbox" id="selectAll" name="selectAll">';
                particleStr += '<label for="selectAll"></label>';
                particleStr += '<label for="selectAll" class="selectAll">전체선택</label>';
                particleStr += '<a href="javascript:void(0);" class="selectDelete" onclick="deleteItems()">선택삭제</a>';
                particleStr += '</div>';
                particleStr += '<ul id="plan_list"></ul>';

                $(".wishlist_item").append(particleStr);

                particleStr = "";
                particleStr += '<div class="planBoxWrap">';

                for(var i = 0 ; i < list.length ; i++){
                    wishPlanIdx = list[i].travelPlan.IDX;
                    travelPlanIdx = list[i].travelPlan.TRAVEL_PLAN_IDX;
                    largeAreaName = list[i].travelPlan.LARGE_AREA_NAME;
                    nickname = list[i].travelPlan.NICKNAME;
                    likes = list[i].travelPlan.LIKES;
                    totalDays = list[i].travelPlan.TOTAL_DAYS;
                    travelPlanDetail = list[i].travelPlanDetail;

                    let num = i + 1;
                    
                    particleStr += '<div class="planBox">';
                    particleStr += '<input type="checkbox" id="select' + num + '" name="selectParticle" idx="' + wishPlanIdx + '">';
                    particleStr += '<label for="select' + num + '"></label>';
                    particleStr += '<div class="slideContainer">';
                    particleStr += '<div id="plan' + num + '" class="carousel slide" data-touch="false" data-interval="false">';
                    particleStr += '<div class="userInfo">';
                    particleStr += '<ul>';
                    particleStr += '<li class="title">' + largeAreaName + '여행</li>';
                    particleStr += '<li class="username">' + nickname + '</li>';
                    particleStr += '</ul>';
                    particleStr += '<p><i class="bi bi-suit-heart-fill"></i> ' + likes + '</p>';
                    particleStr += '</div>';
                    particleStr += '<div class="carousel-inner">';

                    for(var j = 1 ; j <= totalDays ; j++){      // day
                        particleStr += '<div class="carousel-item">';
                        particleStr += '<div class="dayList">';
                        particleStr += '<h1>DAY' + j + '</h1>';
                        particleStr += '<div class="areaList">';
                        particleStr += '<img src="/resources/common/img/list.png" width="">';
                        particleStr += '<ul>';

                        for(var k = 0 ; k < travelPlanDetail.length ; k++){

                            if(travelPlanDetail[k].DAY == j){  // 데이터가 j와 같은 날짜면,

                                if(travelPlanDetail[k].PLACE_TYPE == 'T'){
                                    particleStr += '<li>' + travelPlanDetail[k].PLACE_NAME + '</li>';
                                }else if(travelPlanDetail[k].PLACE_TYPE == 'A'){
                                    particleStr += '<li>' + travelPlanDetail[k].ACCOM_NAME + '</li>';
                                } // if-else
    
                            } // if

                        } // for
                        
                        particleStr += '</ul>';
                        particleStr += '</div>';
                        particleStr += '</div>';
                        particleStr += '</div>';     
                    } // inner-for
                    
                    particleStr += '</div>';
                    particleStr += '<button id="leftArrow" class="carousel-control-prev arrows" type="button"';
                    particleStr += 'data-target="#plan' + num + '" data-slide="prev">';
                    particleStr += '<span class="bi bi-arrow-left-circle-fill" aria-hidden="true"></span>';
                    particleStr += '</button>';
                    particleStr += '<button id="rightArrow" class="carousel-control-next arrows" type="button"';
                    particleStr += 'data-target="#plan' + num + '" data-slide="next">';
                    particleStr += '<span class="bi bi-arrow-right-circle-fill" aria-hidden="true"></span>';
                    particleStr += '</button>';
                    // particleStr += '<button class="planAdd" onclick="">일정에 추가</button>';
                    particleStr += '</div>';
                    particleStr += '</div>';
                    particleStr += '</div>';
                } // for

                particleStr += '</div>';
                $("#plan_list").append(particleStr);
                $("#plan1 .carousel-inner").children().first().addClass('active');
                $("#plan2 .carousel-inner").children().first().addClass('active');
                $("#plan3 .carousel-inner").children().first().addClass('active');
                $("#plan4 .carousel-inner").children().first().addClass('active');

                cnt = $("#plan_list .planBoxWrap > div").length;           // 일정의 체크박스 갯수
                console.log("cnt : " + cnt);
                selectAllCheckBox(cnt);

                // ================================================================

                $(".pageBtn").empty();

                let initialPageStr = "";
                initialPageStr += '<form action="#" id="paginationForm">';
                initialPageStr += '<input type="hidden" name="currPage">';
                initialPageStr += '<ul id="pagingBtn">';
                initialPageStr += '<li class="frontPage"><a href="javascript:void(0);" onclick="getPlanWishlist(' + 1 + ')"><i class="bi bi-chevron-double-left"></i></a></li>';
                initialPageStr += '<li class="prev yesPrev"><a href="javascript:void(0);"><i class="bi bi-chevron-left"></i></a></li>';
                initialPageStr += '<li class="pageNumber"></li>';
                initialPageStr += '<li class="next yesNext"><a href="javascript:void(0);"><i class="bi bi-chevron-right"></i></a></li>';
                initialPageStr += '<li class="backPage"><a href="javascript:void(0);"><i class="bi bi-chevron-double-right"></i></a></li>';
                initialPageStr += '</ul>';
                initialPageStr += '</form>';

                $(".pageBtn").append(initialPageStr);

                for(let i = pageDTO.startPage ; i <= pageDTO.endPage ; i++){
                    let pageStr = "";

                    if (pageDTO.cri.currPage == i) {
                        pageStr += '<li class="currPage" onclick="getPlanWishlist(' + i + ')">';
                    } else{
                        pageStr += '<li class="" onclick="getPlanWishlist(' + i + ')">';
                    } // if-else

                    pageStr += '<a href="javascript:void(0);">';
                    pageStr += '<strong>' + i + '</strong>';
                    pageStr += '</a>';
                    pageStr += '</li>';

                    $(".pageNumber").append(pageStr);
                } // for
                
                $(".yesPrev > a").off().on('click', function(){
                    if(pageDTO.startPage - 1 < 1){ getPlanWishlist(pageDTO.startPage); }
                    else{ getPlanWishlist(pageDTO.startPage - 1); }
                });   

                $(".yesNext > a").off().on('click', function(){
                    if(pageDTO.endPage + 1 > pageDTO.realEndPage){ getPlanWishlist(pageDTO.endPage); }
                    else{ getPlanWishlist(pageDTO.endPage + 1); }
                });     

                $(".backPage > a").off().on('click', function(){
                    getPlanWishlist(pageDTO.realEndPage);
                }); 

                hideLoadingImg();
            } // outer if-else
        } // success
    }); // ajax
} // getPlanWishlist


/**
 * @desc 선택삭제 버튼 클릭시
 */
function deleteItems(){
    // 현재 페이지 값 가져오기
    let currPage = $(".currPage strong").text();

    // idx 값 담을 배열 선언
    let itemIdxArray = new Array();

    optionValue = $("select[name=wishlist_type]").val();
    let checkItems = $("input[name='selectParticle']:checked"); 

    if(optionValue == "accom"){           // 숙소라면,

        $.each(checkItems, function(index, value) {       
            let idx = $(value).attr("idx");
            itemIdxArray.push(idx);
        }); // each

        deleteAccomWishlist(itemIdxArray, currPage);

    }else if(optionValue == "plan"){     // 일정이라면,

        $.each(checkItems, function(index, value) {       
            let idx = $(value).attr("idx");
            itemIdxArray.push(idx);
        }); // each

        deletePlanWishlist(itemIdxArray, currPage);

    } // if-else
} // deleteItems


/**
 * @desc 숙소 위시리스트 삭제
 */
function deleteAccomWishlist(itemIdxArray, currPage){

    $.ajax({
        type: "POST",
        url: "wishlist/accom/delete",
        data: { "itemIdxArray" : itemIdxArray },
        traditional: true,
        cache : false,
        error : function(error) {
            console.log("error");
        },
        success : function(resp) {
            console.log("success");
            getAccomWishlist(currPage);
        } // success
    }); // ajax
    
} // getAccomWishlist


/**
 * @desc 일정 위시리스트 삭제
 */
 function deletePlanWishlist(itemIdxArray, currPage){

    $.ajax({
        type: "POST",
        url: "wishlist/plan/delete",
        data: { "itemIdxArray" : itemIdxArray },
        traditional: true,
        cache : false,
        error : function(error) {
            console.log("error");
        },
        success : function(resp) {
            console.log("success");
            getPlanWishlist(currPage);
        } // success
    }); // ajax
    
} // getAccomWishlist


/**
 * @desc 로딩 화면
 */
function showLoadingImg() {
    $('#wrap-loading').show();
}
    
function hideLoadingImg() {
    $('#wrap-loading').hide();
}